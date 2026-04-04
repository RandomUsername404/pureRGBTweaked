#!/bin/bash

# Output file (as requested)
output_file="_parse_all_stats.txt"

# Clear or create the output file
> "$output_file"

# Enable nullglob so that *.asm expands to nothing if no files match
shopt -s nullglob
files=( *.asm )

# Check if any .asm files exist
if [ ${#files[@]} -eq 0 ]; then
    echo "No .asm files found in the current directory." >&2
    exit 0
fi

# Process each .asm file in alphabetical order
for file in "${files[@]}"; do
    awk '
    BEGIN { found_dex = 0; dex_line = ""; }

    # Match line containing "db DEX_..." (the Pokémon identifier)
    /^[[:space:]]*db[[:space:]]+DEX_/ {
        # Extract the "DEX_..." part, removing any trailing comment
        line = $0
        sub(/^[[:space:]]*db[[:space:]]+/, "", line)
        sub(/[[:space:]]*;.*$/, "", line)
        dex_line = "db " line
        found_dex = 1
        next
    }

    # After finding a dex line, look for the line with the five base stats
    found_dex && /^[[:space:]]*db[[:space:]]+[0-9]/ {
        # Extract the numbers, removing any trailing comment
        line = $0
        sub(/^[[:space:]]*db[[:space:]]+/, "", line)
        sub(/;.*$/, "", line)

        # Split on commas and spaces (handles various spacing)
        n = split(line, nums, /[ ,]+/)
        if (n >= 5) {
            hp  = nums[1]
            atk = nums[2]
            def = nums[3]
            spd = nums[4]   # original speed (fourth in file)
            spc = nums[5]   # original special (fifth in file)

            # Desired output order: hp, atk, def, spc, spd
            # So we output spc then spd
            sum = hp + atk + def + spc + spd

            # Output the transformed block
            print dex_line
            printf("db  %d, %d, %d, %d, %d = %d\n", hp, atk, def, spc, spd, sum)
            print ";   hp  atk  def  spc  spd"
            print ""   # blank line between entries
        }
        found_dex = 0   # reset for next file
        next
    }
    ' "$file" >> "$output_file"
done

echo "Parsing complete. Output written to $output_file"
