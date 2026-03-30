#!/usr/bin/env python3

import os
import re

move_to_info = {
    "ice punch": ("TM01", 3000), "roost": ("TM02", 3000), "leech seed": ("TM03", 2000),
    "pin missile": ("TM04", 3000), "fire punch": ("TM05", 3000), "toxic": ("TM06", 1000),
    "horn drill": ("TM07", 5000), "body slam": ("TM08", 2000), "slash": ("TM09", 5000),
    "double edge": ("TM10", 5000), "bubblebeam": ("TM11", 2000), "aurora beam": ("TM12", 2000),
    "ice beam": ("TM13", 5000), "blizzard": ("TM14", 8000), "hyper beam": ("TM15", 8000),
    "amnesia": ("TM16", 3000), "hi jump kick": ("TM17", 8000), "thunderpunch": ("TM18", 3000),
    "rolling kick": ("TM19", 2000), "barrier": ("TM20", 2000), "razor leaf": ("TM21", 5000),
    "solar beam": ("TM22", 8000), "dragon rage": ("TM23", 4000), "thunderbolt": ("TM24", 5000),
    "thunder": ("TM25", 8000), "earthquake": ("TM26", 5000), "seismic toss": ("TM27", 5000),
    "dig": ("TM28", 4000), "psychic": ("TM29", 5000), "mega drain": ("TM30", 4000),
    "firewall": ("TM31", 1000), "swords dance": ("TM32", 6000), "reflect": ("TM33", 1000),
    "bide": ("TM34", 2000), "agility": ("TM35", 4000), "barrage": ("TM36", 3000),
    "flamethrower": ("TM37", 8000), "fire blast": ("TM38", 5000), "filthy slam": ("TM39", 4000),
    "karate chop": ("TM40", 3000), "meditate": ("TM41", 5000), "lovely kiss": ("TM42", 3000),
    "sky attack": ("TM43", 8000), "light screen": ("TM44", 1000), "thunder wave": ("TM45", 2000),
    "psybeam": ("TM46", 2000), "sludge": ("TM47", 5000), "rock slide": ("TM48", 5000),
    "glare": ("TM49", 3000), "substitute": ("TM50", 6000),
}

TM_ALIASES = {
    "TM_SLAM":       "TM_FILTHY_SLAM",
    "TM_RAZOR_WIND": "TM_ROOST",
    "TM_KINESIS":    "TM_FIREWALL",
    "TM_PSYCHIC_M":  "TM_PSYCHIC",
    "TM_SOLARBEAM":  "TM_SOLAR_BEAM",
}

FILES_ORDER = [
    "viridian.asm", "pewter.asm", "cerulean.asm", "vermilion.asm", "lavender.asm",
    "celadon2F.asm", "celadon4F.asm", "celadon5F.asm", "celadon_diner.asm",
    "saffron.asm", "fuchsia.asm", "cinnabar.asm", "indigo_plateau.asm"
]

def get_mart_header(filename):
    base = filename.replace(".asm", "").replace("_", " ").strip()
    if "celadon" in base.lower():
        if "2f" in base.lower(): return "Celadon 2F"
        if "4f" in base.lower(): return "Celadon 4F"
        if "5f" in base.lower(): return "Celadon 5F"
        if "diner" in base.lower(): return "Celadon Diner"
    return " ".join(word.capitalize() for word in base.split())

def get_shop_display(label):
    lower = label.lower()
    if "gymguidesonshop1" in lower: return "TM Kid (pre-E4)"
    if "gymguidesonshop2" in lower: return "TM Kid (post-E4)"
    if "gymguideshop" in lower: return "Gym Guide"
    if "clerk" in lower or "martclerk" in lower: return "Clerk"
    return "TM Kid"

def parse_shops(filepath):
    shops = {}
    current_label = None

    with open(filepath, encoding="utf-8", errors="ignore") as f:
        for line in f:
            # Label detection: must start at column 0 (no leading whitespace),
            # end with one or two colons, optional trailing comment.
            label_match = re.match(r'^([A-Za-z_][A-Za-z0-9_]*):{1,2}\s*(?:;.*)?$', line.rstrip())
            if label_match:
                current_label = label_match.group(1)
                shops[current_label] = {"items": []}
                continue

            if current_label and "TM_" in line:
                tm_match = re.search(r'\b(TM_[A-Z0-9_]+)\b', line)
                if tm_match:
                    tm_const = tm_match.group(1)

                    # Comment may be preceded by a backslash continuation:
                    # "TM_KINESIS, \    ; FIREWALL"  or  "TM_SLAM ; FILTHY SLAM"
                    comment_match = re.search(r'[\\,]\s*;\s*(.+)', line)
                    if not comment_match:
                        comment_match = re.search(r';\s*(.+)', line)
                    custom = comment_match.group(1).strip() if comment_match else None

                    shops[current_label]["items"].append((tm_const, custom))

    return shops

def main():
    with open("move_availability.md", "w", encoding="utf-8") as md:
        md.write("# Move availability\n\n")

        for asm_file in FILES_ORDER:
            if not os.path.exists(asm_file):
                md.write(f"### {get_mart_header(asm_file)} Mart\n\n> File not found.\n\n")
                continue

            shops = parse_shops(asm_file)
            md.write(f"### {get_mart_header(asm_file)} Mart\n\n")

            for label, data in shops.items():
                shop_name = get_shop_display(label)
                md.write(f"**{shop_name}:**\n\n")

                tms = []
                for tm_const, custom in data.get("items", []):
                    # Apply hardcoded aliases first; they override any inline comment
                    if tm_const in TM_ALIASES:
                        tm_const = TM_ALIASES[tm_const]
                        custom = None

                    if custom:
                        lookup = custom.lower().replace("_", " ").replace("-", " ").strip()
                        display = custom.upper().replace(" ", "_").replace("-", "_")
                    else:
                        lookup = tm_const[3:].lower().replace("_", " ").strip()
                        display = tm_const[3:].upper()

                    tm_num, price = move_to_info.get(lookup, ("??", 0))
                    tms.append((tm_num, display, price))

                if not tms:
                    md.write("No TM in store.\n\n")
                else:
                    tms.sort(key=lambda x: x[1])
                    md.write("| TM | MOVE | PRICE |\n")
                    md.write("| :--- | --- | --- |\n")
                    for tm_num, move_name, price in tms:
                        md.write(f"| {tm_num} | {move_name} | ₽{price:,} |\n")
                    md.write("\n")

    print("✅ move_availability.md generated")

if __name__ == "__main__":
    main()
