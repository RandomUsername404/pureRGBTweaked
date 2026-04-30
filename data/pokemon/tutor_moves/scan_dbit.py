#!/usr/bin/env python3
"""
Scan a hardcoded assembly file for lines containing "dbit TRUE",
extract the name from the comment, normalize it (capitalized),
and write a single-line, alphabetically sorted, comma-separated
list to the log file named "_report.log".
"""

ASM_FILE = "screech.asm"
LOG_FILE = "_report.log"

def normalize_name(raw: str) -> str:
    # Trim and convert to Title case (first letter uppercase, rest lowercase)
    return raw.strip().title()

def extract_name_from_line(line: str):
    # Only consider lines that include the exact substring "dbit TRUE"
    if "dbit TRUE" not in line:
        return None
    # Expect the name to be in a comment between semicolons:  ; NAME ;
    parts = line.split(';')
    if len(parts) < 2:
        return None
    name_candidate = parts[1].strip()
    if not name_candidate:
        return None
    return normalize_name(name_candidate)

def main():
    names = set()
    try:
        with open(ASM_FILE, 'r', encoding='utf-8') as f:
            for line in f:
                name = extract_name_from_line(line)
                if name:
                    names.add(name)
    except FileNotFoundError:
        # If the ASM file doesn't exist, create/overwrite the log with an empty file
        with open(LOG_FILE, 'w', encoding='utf-8') as out:
            out.write("")
        return

    sorted_names = sorted(names, key=lambda s: s.lower())
    output_line = ", ".join(sorted_names)

    with open(LOG_FILE, 'w', encoding='utf-8') as out:
        out.write(output_line)

if __name__ == "__main__":
    main()
 
