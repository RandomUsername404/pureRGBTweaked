#!/usr/bin/env python3
"""
Compare Pokémon base stats between OG/ and stats/ folders.
Uses hardcoded dex numbers for the original 151 Pokémon.
run with compare_pokemon_stats.py
"""

from pathlib import Path
import re

# Folders (adjust if needed)
OG_DIR    = Path("OG")
STATS_DIR = Path("stats")
OUTPUT    = Path("pokemon_stats_comparison.md")

# Hardcoded filename (without .asm) → Pokédex number (all lowercase keys)
POKEDEX_MAP = {
    "bulbasaur": 1, "ivysaur": 2, "venusaur": 3,
    "charmander": 4, "charmeleon": 5, "charizard": 6,
    "squirtle": 7, "wartortle": 8, "blastoise": 9,
    "caterpie": 10, "metapod": 11, "butterfree": 12,
    "weedle": 13, "kakuna": 14, "beedrill": 15,
    "pidgey": 16, "pidgeotto": 17, "pidgeot": 18,
    "rattata": 19, "raticate": 20,
    "spearow": 21, "fearow": 22,
    "ekans": 23, "arbok": 24,
    "pikachu": 25, "raichu": 26,
    "sandshrew": 27, "sandslash": 28,
    "nidoranf": 29, "nidorina": 30, "nidoqueen": 31,
    "nidoranm": 32, "nidorino": 33, "nidoking": 34,
    "clefairy": 35, "clefable": 36,
    "vulpix": 37, "ninetales": 38,
    "jigglypuff": 39, "wigglytuff": 40,
    "zubat": 41, "golbat": 42,
    "oddish": 43, "gloom": 44, "vileplume": 45,
    "paras": 46, "parasect": 47,
    "venonat": 48, "venomoth": 49,
    "diglett": 50, "dugtrio": 51,
    "meowth": 52, "persian": 53,
    "psyduck": 54, "golduck": 55,
    "mankey": 56, "primeape": 57,
    "growlithe": 58, "arcanine": 59,
    "poliwag": 60, "poliwhirl": 61, "poliwrath": 62,
    "abra": 63, "kadabra": 64, "alakazam": 65,
    "machop": 66, "machoke": 67, "machamp": 68,
    "bellsprout": 69, "weepinbell": 70, "victreebel": 71,
    "tentacool": 72, "tentacruel": 73,
    "geodude": 74, "graveler": 75, "golem": 76,
    "ponyta": 77, "rapidash": 78,
    "slowpoke": 79, "slowbro": 80,
    "magnemite": 81, "magneton": 82,
    "farfetchd": 83,
    "doduo": 84, "dodrio": 85,
    "seel": 86, "dewgong": 87,
    "grimer": 88, "muk": 89,
    "shellder": 90, "cloyster": 91,
    "gastly": 92, "haunter": 93, "gengar": 94,
    "onix": 95,
    "drowzee": 96, "hypno": 97,
    "krabby": 98, "kingler": 99,
    "voltorb": 100, "electrode": 101,
    "exeggcute": 102, "exeggutor": 103,
    "cubone": 104, "marowak": 105,
    "hitmonlee": 106, "hitmonchan": 107,
    "lickitung": 108,
    "koffing": 109, "weezing": 110,
    "rhyhorn": 111, "rhydon": 112,
    "chansey": 113,
    "tangela": 114,
    "kangaskhan": 115,
    "horsea": 116, "seadra": 117,
    "goldeen": 118, "seaking": 119,
    "staryu": 120, "starmie": 121,
    "mrmime": 122,
    "scyther": 123,
    "jynx": 124,
    "electabuzz": 125,
    "magmar": 126,
    "pinsir": 127,
    "tauros": 128,
    "magikarp": 129, "gyarados": 130,
    "lapras": 131,
    "ditto": 132,
    "eevee": 133, "vaporeon": 134, "jolteon": 135, "flareon": 136,
    "porygon": 137,
    "omanyte": 138, "omastar": 139,
    "kabuto": 140, "kabutops": 141,
    "aerodactyl": 142,
    "snorlax": 143,
    "articuno": 144, "zapdos": 145, "moltres": 146,
    "dratini": 147, "dragonair": 148, "dragonite": 149,
    "mewtwo": 150,
    "mew": 151,
}

# Regex patterns (no DEX pattern anymore)
STATS_PATTERN = re.compile(r'db\s+(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)', re.IGNORECASE)
TYPE_PATTERN  = re.compile(r'db\s+([A-Z]+(?:_[A-Z]+)?)\s*,\s*([A-Z]+(?:_[A-Z]+)?)\s*;', re.IGNORECASE)

def parse_pokemon_file(filepath: Path):
    """Parse base stats and types from a .asm file."""
    if not filepath.is_file() or not filepath.suffix.lower() == '.asm':
        return None

    try:
        content = filepath.read_text(encoding='utf-8', errors='replace')
    except Exception as e:
        print(f"Error reading {filepath.name}: {e}")
        return None

    stem = filepath.stem.lower()
    name_upper = filepath.stem.upper()

    # Get dex from hardcoded map only
    dex_num = POKEDEX_MAP.get(stem)
    if dex_num is None:
        dex_str = "???"
        sort_key = 9999
    else:
        dex_str = f"{dex_num:03d}"
        sort_key = dex_num

    data = {
        'dex_str': dex_str,
        'dex_num_for_sort': sort_key,
        'name': name_upper,
        'type1': None,
        'type2': None,
        'hp': None, 'atk': None, 'def': None, 'spc': None, 'spd': None,
        'filename': stem,
    }

    # Extract stats: hp, atk, def, spd, spc
    stats_match = STATS_PATTERN.search(content)
    if stats_match:
        nums = list(map(int, stats_match.groups()))
        if len(nums) == 5:
            data['hp'], data['atk'], data['def'], data['spd'], data['spc'] = nums

    # Extract types (strip _TYPE suffix for display)
    type_match = TYPE_PATTERN.search(content)
    if type_match:
        t1, t2 = type_match.groups()
        data['type1'] = t1.replace('_TYPE', '').upper()
        t2_clean = t2.replace('_TYPE', '').upper()
        data['type2'] = t2_clean if t2_clean != data['type1'] else None

    # Require all stats + type1
    required = ['hp', 'atk', 'def', 'spd', 'spc', 'type1']
    missing = [k for k in required if data[k] is None]
    if missing:
        print(f"Warning: Incomplete parse for {filepath.name} – missing: {', '.join(missing)}")
        return None

    return data


def main():
    print("Scanning stats/ folder...")

    pokemon_list = []
    for file in STATS_DIR.glob("*.asm"):
        data = parse_pokemon_file(file)
        if data:
            pokemon_list.append(data)

    print(f"Found {len(pokemon_list)} usable Pokémon in stats/")

    # OG lookup by lowercase stem
    og_cache = {f.stem.lower(): f for f in OG_DIR.glob("*.asm")}

    table_rows = []

    for p in pokemon_list:
        stem = p['filename']
        og_file = og_cache.get(stem)

        row = {
            'dex_str': p['dex_str'],
            'dex_num_for_sort': p['dex_num_for_sort'],
            'name': p['name'],
            'type1': p['type1'],
            'type2': p['type2'],
            'hp': str(p['hp']),
            'atk': str(p['atk']),
            'def': str(p['def']),
            'spc': str(p['spc']),
            'spd': str(p['spd']),
            'new_typing': "—",
            'changed': set(),
        }

        if og_file:
            og_data = parse_pokemon_file(og_file)
            if og_data:
                for stat in ['hp', 'atk', 'def', 'spc', 'spd']:
                    if str(og_data[stat]) != row[stat]:
                        row['changed'].add(stat)
                if og_data['type1'] != p['type1']:
                    row['changed'].add('type1')
                og_t2 = og_data['type2'] if og_data['type2'] else None
                new_t2 = p['type2'] if p['type2'] else None
                if og_t2 != new_t2:
                    row['changed'].add('type2')

        table_rows.append(row)

    # Sort: original 151 first (by dex), then extras by name
    table_rows.sort(key=lambda r: (r['dex_num_for_sort'], r['name']))

    # Build Markdown
    header = (
        "| DEX NUMBER |        NAME        | TYPE 1 | TYPE 2 | HP | ATTACK | DEFENSE | SPECIAL | SPEED | TOTAL | NEW TYPING? |"
    )
    separator = (
        "|:----------:|:------------------:|:------:|:------:|:--:|:------:|:-------:|:-------:|:-----:|:-----:|:-----------:|"
    )

    md_lines = [
        "# Pokémon Stats Comparison (stats/ vs OG/)\n",
        "**Bold** = changed from OG\n",
        header,
        separator,
    ]

    for row in table_rows:
        def b(key, value):
            return f"**{value}**" if key in row['changed'] else value

        type2_display = b('type2', row['type2'] if row['type2'] else "—")

        # Calculate total (use new stats)
        try:
            total = int(row['hp']) + int(row['atk']) + int(row['def']) + int(row['spc']) + int(row['spd'])
            total_str = str(total)
        except (ValueError, TypeError):
            total_str = "—"

        # Bold TOTAL if any stat changed ---------------> NEED TO DO THIS DIFFERENTLY
        if row['changed']:  # if any stat or type changed
            total_display = f"**{total_str}**"
        else:
            total_display = total_str

        line = (
            f"| {row['dex_str']} "
            f"| {row['name']} "
            f"| {b('type1', row['type1'])} "
            f"| {type2_display} "
            f"| {b('hp', row['hp'])} "
            f"| {b('atk', row['atk'])} "
            f"| {b('def', row['def'])} "
            f"| {b('spc', row['spc'])} "
            f"| {b('spd', row['spd'])} "
            f"| {total_display} "
            f"| {row['new_typing']} |"
        )
        md_lines.append(line)

    OUTPUT.write_text("\n".join(md_lines) + "\n", encoding="utf-8")
    print(f"Table written to: {OUTPUT.resolve()}")


if __name__ == "__main__":
    if not STATS_DIR.is_dir():
        print(f"Error: stats/ folder not found.")
    elif not OG_DIR.is_dir():
        print(f"Error: OG/ folder not found.")
    else:
        main()
