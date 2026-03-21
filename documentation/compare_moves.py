#!/usr/bin/env python3
"""
Compare movesOG.asm and moves.asm and generate a Markdown table highlighting changes.
Columns: MOVE | TYPE | POWER | ACCURACY | PP | EFFECT | COMMENT
Assumes moves are in the same order in both files.
Only processes lines that start with 'move ' up to line 178.
run with python3 compare_moves.py
"""

import re
from pathlib import Path

# Configuration
OLD_FILE = Path("movesOG.asm")
NEW_FILE = Path("moves.asm")
OUTPUT_FILE = Path("moves_comparison.md")
MAX_LINE = 178

# Column order as requested (after MOVE)
DISPLAY_HEADERS = ["TYPE", "POWER", "ACCURACY", "PP", "EFFECT", "COMMENT"]

def parse_move_line(line: str) -> tuple[str, dict, str]:
    """
    Parse a line like:
      move POUND, NO_ADDITIONAL_EFFECT, 40, NORMAL, 100, 35
    or with comment:
      move KARATE_CHOP, NO_ADDITIONAL_EFFECT, 40, FIGHTING, 95, 25 ; high crit ratio

    Returns: (move_name, field_dict, comment)
    """
    line = line.strip()
    if not line.startswith("move "):
        return None, None, None

    # Split off comment if present
    if ";" in line:
        code_part, comment = line.split(";", 1)
        comment = comment.strip()
    else:
        code_part = line
        comment = ""

    # Remove 'move ' prefix
    code_part = code_part.replace("move", "", 1).strip()

    # Split on comma, clean whitespace
    parts = [p.strip() for p in code_part.split(",") if p.strip()]

    if len(parts) < 6:
        print(f"Warning: skipping malformed line: {line}")
        return None, None, None

    move_name = parts[0]

    # Map to named fields (index 0 = animation/move id, we skip it for comparison)
    field_dict = {
        "TYPE":     parts[3],
        "POWER":    parts[2],
        "ACCURACY": parts[4],
        "PP":       parts[5],
        "EFFECT":   parts[1],
    }

    return move_name, field_dict, comment


def load_moves(filename: Path) -> list[tuple[str, dict, str]]:
    moves = []
    with open(filename, encoding="utf-8") as f:
        for i, line in enumerate(f, 1):
            if i > MAX_LINE:
                break
            name, fields, comment = parse_move_line(line)
            if name:
                moves.append((name, fields, comment))
    return moves


def bold(s: str) -> str:
    return f"**{s}**"


def compare_and_build_table(old_moves, new_moves):
    lines = []

    # Header
    header = "| MOVE | " + " | ".join(DISPLAY_HEADERS) + " |"
    separator = "|:---|" + "---|" * (len(DISPLAY_HEADERS)) 
    lines.extend([header, separator])

    if len(old_moves) != len(new_moves):
        print(f"Warning: different number of moves! Old: {len(old_moves)}, New: {len(new_moves)}")
        min_len = min(len(old_moves), len(new_moves))
    else:
        min_len = len(old_moves)

    for i in range(min_len):
        old_name, old_fields, old_comment = old_moves[i]
        new_name, new_fields, new_comment = new_moves[i]

        if old_name != new_name:
            print(f"Move mismatch at index {i}: {old_name} vs {new_name}")
            continue

        changed = False
        display_values = []

        # TYPE, POWER, ACCURACY, PP, EFFECT
        for col in ["TYPE", "POWER", "ACCURACY", "PP", "EFFECT"]:
            old_val = old_fields[col]
            new_val = new_fields[col]
            if old_val != new_val:
                display_values.append(bold(new_val))
                changed = True
            else:
                display_values.append(new_val)

        # COMMENT
        if old_comment != new_comment:
            comment_str = bold(new_comment) if new_comment else bold("(removed)")
            changed = True
        else:
            comment_str = new_comment if new_comment else "—"

        # MOVE name
        move_display = bold(new_name) if changed else new_name

        row = f"| {move_display} | " + " | ".join(display_values) + f" | {comment_str} |"
        lines.append(row)

    return lines


def main():
    print(f"Reading {OLD_FILE} ...")
    old_moves = load_moves(OLD_FILE)

    print(f"Reading {NEW_FILE} ...")
    new_moves = load_moves(NEW_FILE)

    print(f"Parsed {len(old_moves)} moves from old, {len(new_moves)} from new.")

    table_lines = compare_and_build_table(old_moves, new_moves)

    print(f"Writing table to {OUTPUT_FILE} ...")
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("# Moves Comparison (moves.asm vs movesOG.asm)\n\n")
        f.write("**Bold** = value changed from the original file\n\n")
        f.write("\n".join(table_lines))
        f.write("\n")

    print("Done. Open moves_comparison.md to see the result.")


if __name__ == "__main__":
    main()
