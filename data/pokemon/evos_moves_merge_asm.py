#!/usr/bin/env python3
"""
evos_moves_merge_asm.py
Merges two Pokémon ASM learnset files:
  - evos_moves_yellow_legacy.asm  (YellowLegacy — takes precedence for moves/evos)
  - evos_moves_rgb.asm             (PureRGB — structural ground truth)
Produces: merged_evos_moves.asm

Rules:
  - RGB file structure is preserved verbatim EXCEPT learnset content and evo db lines.
  - YellowLegacy evo lines replace RGB evo lines (one-to-one, per label).
  - YL learnset is the base; RGB moves are added on top.
  - If a move appears in both, keep it once at the YL level.
  - Ignored YL moves (never included from YL side, but kept if from RGB):
      RAZOR_WIND, SLAM (exact), COUNTER, KINESIS, TAKE_DOWN, CONSTRICT, FURY_SWIPES
  - Level conflicts: shift the RGB move up by 1, recheck, repeat.
  - If shifting exceeds level 100: cap at 100 and push predecessor down.
  - Pointer table entries WITH an inline comment are copied verbatim (not merged).
  - Entries only in RGB: learnset moves tagged '; PureRGB' (existing comments preserved).
  - Embedded labels (label B appears inside label A's evo section in RGB):
      * RGB structure is kept (B's label stays mid-block inside A).
      * YL evo lines for each label replace the corresponding RGB evo db lines.
      * The shared learnset is merged against the COMBINED YL learnsets of all
        involved labels (deduplicated by move name, YL level kept).
      * The merged learnset is placed under the last embedded label.

run with python3 merge_asm.py
"""

import re
import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
YL_FILE  = "evos_moves_yellow_legacy.asm"
RGB_FILE = "evos_moves_rgb.asm"
OUT_FILE = "merged_evos_moves.asm"

IGNORED_YL_MOVES = frozenset({
    "RAZOR_WIND", "SLAM", "COUNTER", "KINESIS",
    "TAKE_DOWN", "CONSTRICT", "FURY_SWIPES",
})

# ---------------------------------------------------------------------------
# Regexes
# ---------------------------------------------------------------------------
RE_PTR_CLEAN = re.compile(r'^\s+dw\s+(\w+)\s*$')
RE_PTR_CMT   = re.compile(r'^\s+dw\s+(\w+)\s*;')
RE_LABEL     = re.compile(r'^(\w+EvosMoves)\s*(?::.*|:)')
RE_MOVE      = re.compile(r'^(\s+db\s+)(\d+)(\s*,\s*)(\w+)(.*)')
RE_EVO_DB    = re.compile(r'^\s+db\s+EVOLVE_')
RE_TERM      = re.compile(r'^\s+db\s+0\s*(?:;.*)?$')
RE_TABLE_W   = re.compile(r'^\s+table_width')

# ---------------------------------------------------------------------------
# Low-level helpers
# ---------------------------------------------------------------------------

def get_label(line):
    m = RE_LABEL.match(line)
    return m.group(1) if m else None

def is_terminator(line):
    return bool(RE_TERM.match(line.rstrip('\n')))

def is_evo_db(line):
    return bool(RE_EVO_DB.match(line))

def parse_move_line(line):
    """Returns (level:int, move:str, comment:str) or None."""
    if is_terminator(line):
        return None
    m = RE_MOVE.match(line.rstrip('\n'))
    if not m:
        return None
    level   = int(m.group(2))
    move    = m.group(4)
    rest    = m.group(5).strip()
    comment = rest.lstrip(';').strip() if rest.startswith(';') else ''
    return level, move, comment

# ---------------------------------------------------------------------------
# Parse pointer table
# ---------------------------------------------------------------------------

def parse_pointer_table(lines):
    result = []
    in_table = False
    for i, line in enumerate(lines):
        if 'EvosMovesPointerTable:' in line:
            in_table = True
            continue
        if not in_table:
            continue
        s = line.strip()
        if not s or s.startswith(';') or RE_TABLE_W.match(line):
            continue
        m = RE_PTR_CLEAN.match(line)
        if m:
            result.append({'name': m.group(1), 'has_comment': False, 'line_index': i})
            continue
        m = RE_PTR_CMT.match(line)
        if m:
            result.append({'name': m.group(1), 'has_comment': True, 'line_index': i})
            continue
        break  # non-dw line ends table
    return result

# ---------------------------------------------------------------------------
# Parse all EvosMoves blocks
# ---------------------------------------------------------------------------

def parse_blocks(lines):
    """
    Returns dict: label -> block dict
    {
      'label_line'      : int,
      'label_comment'   : str,
      'evo_lines'       : [(i, line), ...],   # up to and incl. first db 0
      'move_lines'      : [(i, line), ...],   # after first db 0 up to and incl. second db 0
      'after_index'     : int,
      'embedded'        : [label, ...],       # labels found inside our evo section
      '_is_embedded_in' : str or None,
    }
    Embedded label blocks are also registered under their own key.
    """
    blocks = {}
    i = 0
    n = len(lines)

    while i < n:
        line = lines[i]
        label = get_label(line)
        if label is None:
            i += 1
            continue

        lc_match = re.search(r';\s*(.*)', line)
        label_comment = lc_match.group(1).rstrip() if lc_match else ''

        block = {
            'label_line'      : i,
            'label_comment'   : label_comment,
            'evo_lines'       : [],
            'move_lines'      : [],
            'after_index'     : None,
            'embedded'        : [],
            '_is_embedded_in' : None,
        }

        j = i + 1
        found_first_term = False

        while j < n:
            l = lines[j]

            if not found_first_term:
                # Evo section
                emb = get_label(l)
                if emb and emb != label:
                    block['embedded'].append(emb)
                    block['evo_lines'].append((j, l))
                elif is_terminator(l):
                    found_first_term = True
                    block['evo_lines'].append((j, l))
                else:
                    block['evo_lines'].append((j, l))
            else:
                # Learnset section
                block['move_lines'].append((j, l))
                if is_terminator(l):
                    j += 1
                    break
            j += 1

        block['after_index'] = j
        blocks[label] = block
        i = j

    # Register embedded label blocks
    for parent_label, parent_block in list(blocks.items()):
        for emb_label in parent_block['embedded']:
            if emb_label in blocks:
                continue

            # Find where emb_label's line is in parent's evo_lines
            emb_line_pos = None
            for pos, (li, ll) in enumerate(parent_block['evo_lines']):
                if get_label(ll) == emb_label:
                    emb_line_pos = pos
                    break
            if emb_line_pos is None:
                continue

            ll_line = parent_block['evo_lines'][emb_line_pos][1]
            lc_match = re.search(r';\s*(.*)', ll_line)
            emb_comment = lc_match.group(1).rstrip() if lc_match else ''

            # Evo lines for embedded block: lines after its label within parent's evo section
            emb_evo = parent_block['evo_lines'][emb_line_pos + 1:]

            blocks[emb_label] = {
                'label_line'      : parent_block['evo_lines'][emb_line_pos][0],
                'label_comment'   : emb_comment,
                'evo_lines'       : emb_evo,
                'move_lines'      : parent_block['move_lines'],
                'after_index'     : parent_block['after_index'],
                'embedded'        : [],
                '_is_embedded_in' : parent_label,
            }

    return blocks

# ---------------------------------------------------------------------------
# Merge logic
# ---------------------------------------------------------------------------

def extract_move_entries(move_lines):
    result = []
    for _, line in move_lines:
        if is_terminator(line):
            result.append({'is_terminator': True, 'raw': line})
            continue
        parsed = parse_move_line(line)
        if parsed:
            level, move, comment = parsed
            result.append({'is_terminator': False, 'is_raw': False,
                           'level': level, 'move': move,
                           'comment': comment, 'raw': line})
        else:
            result.append({'is_raw': True, 'raw': line})
    return result


def build_merged_learnset(yl_move_line_sets, rgb_move_lines, label):
    """
    yl_move_line_sets : list of move_lines lists (one per YL block being combined)
    rgb_move_lines    : move_lines from RGB block (the last/owning label)
    Returns list of text lines (strings with newline).
    """
    # Combine YL moves across all blocks; first occurrence of a move name wins
    yl_by_name = {}
    for ml in yl_move_line_sets:
        for e in extract_move_entries(ml):
            if e.get('is_terminator') or e.get('is_raw'):
                continue
            if e['move'] in IGNORED_YL_MOVES:
                continue
            if e['move'] not in yl_by_name:
                yl_by_name[e['move']] = {'level': e['level'], 'comment': e['comment']}

    yl_moves = [{'level': v['level'], 'move': k,
                 'comment': v['comment'], 'source': 'YellowLegacy'}
                for k, v in yl_by_name.items()]
    yl_move_names = set(yl_by_name.keys())

    # RGB moves not already in YL
    rgb_to_add = []
    for e in extract_move_entries(rgb_move_lines):
        if e.get('is_terminator') or e.get('is_raw'):
            continue
        if e['move'] in yl_move_names:
            continue
        rgb_to_add.append({'level': e['level'], 'move': e['move'],
                           'comment': e['comment'], 'source': 'PureRGB'})

    merged = yl_moves + rgb_to_add
    merged.sort(key=lambda e: e['level'])

    # Resolve level conflicts
    changed = True
    while changed:
        changed = False
        used = set()
        for entry in merged:
            if entry['level'] in used:
                entry['level'] += 1
                changed = True
                merged.sort(key=lambda e: e['level'])
                break
            used.add(entry['level'])

    # Cap at 100
    for i in range(len(merged) - 1, -1, -1):
        if merged[i]['level'] > 100:
            merged[i]['level'] = 100
            for j in range(i - 1, -1, -1):
                if merged[j]['level'] >= merged[j + 1]['level']:
                    merged[j]['level'] = merged[j + 1]['level'] - 1
                    if merged[j]['level'] < 1:
                        print(f"WARNING: {label}: cannot resolve level collision "
                              f"near 100 for {merged[j]['move']}", file=sys.stderr)
                        merged[j]['level'] = 1
                else:
                    break

    out = ['; Learnset\n']
    for entry in merged:
        tag = f'; {entry["source"]} {entry["comment"]}' if entry['comment'] else f'; {entry["source"]}'
        out.append(f'\tdb {entry["level"]}, {entry["move"]} {tag}\n')
    out.append('\tdb 0\n')
    return out

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    yl_lines  = Path(YL_FILE).read_text(encoding='utf-8').splitlines(keepends=True)
    rgb_lines = Path(RGB_FILE).read_text(encoding='utf-8').splitlines(keepends=True)

    yl_blocks  = parse_blocks(yl_lines)
    rgb_blocks = parse_blocks(rgb_lines)
    rgb_ptrs   = parse_pointer_table(rgb_lines)

    mergeable = {p['name'] for p in rgb_ptrs if not p['has_comment']}

    replacements = []  # (start, end, [new lines])
    handled = set()

    for label, rgb_block in rgb_blocks.items():
        # Skip embedded blocks — handled via parent
        if rgb_block['_is_embedded_in'] is not None:
            continue
        if label in handled:
            continue
        if label not in mergeable:
            continue

        start = rgb_block['label_line']
        end   = rgb_block['after_index']
        all_labels = [label] + rgb_block['embedded']
        yl_present = [l for l in all_labels if l in yl_blocks]

        new_lines = []

        if not yl_present:
            # RGB-only block: tag all learnset move lines with ; PureRGB
            for i in range(start, end):
                line = rgb_lines[i]
                parsed = parse_move_line(line)
                if parsed and not is_terminator(line):
                    level, move, comment = parsed
                    tag = f'; PureRGB {comment}' if comment else '; PureRGB'
                    new_lines.append(f'\tdb {level}, {move} {tag}\n')
                else:
                    new_lines.append(line)

        else:
            # Merged block
            def get_yl_evo_dbs(lbl):
                if lbl not in yl_blocks:
                    return []
                return [l for _, l in yl_blocks[lbl]['evo_lines'] if is_evo_db(l)]

            def get_yl_move_lines(lbl):
                if lbl not in yl_blocks:
                    return []
                return yl_blocks[lbl]['move_lines']

            # Build merged learnset from combined YL sources
            yl_move_sets = [get_yl_move_lines(l) for l in all_labels if l in yl_blocks]
            # The learnset owner in RGB is the last label (embedded or primary)
            learnset_owner = all_labels[-1]
            merged_learnset = build_merged_learnset(
                yl_move_sets,
                rgb_block['move_lines'],
                label,
            )

            # Build set of line indices that belong to the move section
            move_line_indices = {li for li, _ in rgb_block['move_lines']}
            # Build set of line indices that are the evo section terminator
            # (the db 0 that ends the evo section = last entry in evo_lines that is_terminator)
            evo_term_index = None
            for li, ll in reversed(rgb_block['evo_lines']):
                if is_terminator(ll):
                    evo_term_index = li
                    break

            # Track per-label evo db emission counts
            current_label_ctx = label
            evo_db_counts = {l: 0 for l in all_labels}
            learnset_emitted = False

            i = start
            while i < end:
                line = rgb_lines[i]

                # Label line (primary or embedded)
                lbl = get_label(line)
                if lbl and lbl in all_labels:
                    current_label_ctx = lbl
                    new_lines.append(line)
                    i += 1
                    continue

                # Evo db line → replace with YL version
                if is_evo_db(line):
                    yl_evos = get_yl_evo_dbs(current_label_ctx)
                    idx = evo_db_counts[current_label_ctx]
                    if idx < len(yl_evos):
                        new_lines.append(yl_evos[idx])
                        evo_db_counts[current_label_ctx] += 1
                    # else: YL had fewer evo lines — drop RGB line
                    i += 1
                    continue

                # Evo section terminator (db 0 ending evolutions)
                if i == evo_term_index:
                    new_lines.append(line)
                    i += 1
                    # Skip any '; Learnset' comment lines from RGB source
                    # (merged_learnset already starts with that comment)
                    while i < end and i not in move_line_indices:
                        l2 = rgb_lines[i]
                        if l2.strip().startswith('; Learnset'):
                            i += 1
                            continue
                        new_lines.append(l2)
                        i += 1
                    # Emit merged learnset and skip all original move lines
                    if not learnset_emitted:
                        new_lines.extend(merged_learnset)
                        learnset_emitted = True
                    i = end
                    continue

                new_lines.append(line)
                i += 1

        new_lines.append('\n')
        replacements.append((start, end, new_lines))
        handled.add(label)

    out_lines = list(rgb_lines)
    replacements.sort(key=lambda x: x[0], reverse=True)
    for start, end, new_lines in replacements:
        out_lines[start:end] = new_lines

    Path(OUT_FILE).write_text(''.join(out_lines), encoding='utf-8')
    print(f"Done! Written to {OUT_FILE}")


if __name__ == '__main__':
    main()
