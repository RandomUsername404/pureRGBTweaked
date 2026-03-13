#!/bin/bash

# Script to check .asm files for specific SPRITE_ strings and generate a sorted report.
# (non-recursive).

patterns=(
"SPRITE_MONSTER2_STILL"
"SPRITE_MONSTER"
"SPRITE_FIGHTING"
"SPRITE_QUADRUPED2"
"SPRITE_PSYCHIC"
"SPRITE_CAT"
"SPRITE_CAT2"
"SPRITE_BIRD2"
"SPRITE_BIRD"
"SPRITE_QUADRUPED"
"SPRITE_SEEL"
"SPRITE_FAIRY"
)

logfile="_sprite_report.log"

# Clear or create the log file
> "$logfile"

# Enable nullglob so *.asm expands to nothing if no files
shopt -s nullglob

asm_files=(*.asm)

if [ ${#asm_files[@]} -eq 0 ]; then
  echo "No .asm files found in the current directory." | tee -a "$logfile"
  exit 0
fi

# Sort filenames alphabetically (handles spaces in names)
mapfile -t sorted_files < <(printf '%s\n' "${asm_files[@]}" | sort)

for file in "${sorted_files[@]}"; do
  matched=()
  for pat in "${patterns[@]}"; do
    if grep -q -- "$pat" "$file"; then
      matched+=("$pat")
    fi
  done

  if [ ${#matched[@]} -eq 0 ]; then
    line="$file: no match"
  else
    line="$file: matched"
    for m in "${matched[@]}"; do
      line="$line $m"
    done
  fi

  echo "$line" >> "$logfile"
done

echo "Report written to $logfile"
cat "$logfile" 
