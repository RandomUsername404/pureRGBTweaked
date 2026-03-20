#!/usr/bin/env bash
# Outputs a log file listing only the specified .asm files sorted by size (smallest -> biggest).
# Usage: ./sort_asm_by_size.sh [directory]   (defaults to current directory)

set -euo pipefail

# Directory to check (default: current directory)
DIR="${1:-.}"
LOGFILE="${DIR%/}/_sorted_asm_sizes.log"
TMPFILE="$(mktemp)"

# Explicit list of files to check (exact names only)
files=(
	"VermilionGym_2.asm"
	"VermilionPidgeyHouse.asm"
	"VermilionDock.asm"
	"VermilionOldRodHouse.asm"
	"CeladonMart1F.asm"
	"CeladonMart2F.asm"
	"CeladonMart3F.asm"
	"CeladonMart4F.asm"
	"CeladonMartRoof.asm"
	"CeladonMansion1F.asm"
	"CeladonMansion2F.asm"
	"CeladonMansion3F.asm"
	"CeladonMansionRoof.asm"
	"CeladonMansionRoofHouse.asm"
	"CeladonPokecenter.asm"
	"CeladonGym.asm"
	"GameCorner.asm"
	"CeladonMart5F.asm"
	"GameCornerPrizeRoom.asm"
	"CeladonDiner.asm"
	"CeladonHotel.asm"
	"FuchsiaMart.asm"
	"FuchsiaBillsGrandpasHouse.asm"
	"FuchsiaTreeDeleterHouse.asm"
	"FuchsiaPokecenter.asm"
	"WardensHouse.asm"
	"SafariZoneGate.asm"
	"FuchsiaGym.asm"
)

# Helper: get file size in bytes (tries stat, falls back to wc -c)
get_size() {
  local f="$1"
  if command -v stat >/dev/null 2>&1; then
    # GNU stat
    if stat --version >/dev/null 2>&1; then
      stat -c%s -- "$f" 2>/dev/null || echo "-1"
      return
    fi
  fi
  # fallback
  if [ -r "$f" ]; then
    wc -c < "$f" 2>/dev/null || echo "-1"
  else
    echo "-1"
  fi
}

# Start log
{
  printf "Sorted .asm files by size (smallest -> biggest)\n"
  printf "Directory: %s\n" "$DIR"
  printf "Generated: %s\n\n" "$(date --iso-8601=seconds 2>/dev/null || date)"
  printf "%-12s %s\n" "Size(bytes)" "Filename"
  printf "%-12s %s\n" "----------" "--------"
} > "$LOGFILE"

# Collect existing files with sizes
> "$TMPFILE"
missing=()
for name in "${files[@]}"; do
  path="$DIR/$name"
  if [ -f "$path" ]; then
    size="$(get_size "$path")"
    # If get_size failed, mark as -1
    size="${size:- -1}"
    # Only include numeric sizes >= 0
    if [[ "$size" =~ ^-?[0-9]+$ ]] && [ "$size" -ge 0 ]; then
      # Print size and filename (one-line, tab-separated) to tmp for sorting
      printf "%s\t%s\n" "$size" "$name" >> "$TMPFILE"
    else
      missing+=("$name")
    fi
  else
    missing+=("$name")
  fi
done

# Sort numeric ascending and append to log
if [ -s "$TMPFILE" ]; then
  sort -n -k1,1 "$TMPFILE" | while IFS=$'\t' read -r size fname; do
    printf "%-12s %s\n" "$size" "$fname" >> "$LOGFILE"
  done
else
  printf "(No listed .asm files found in directory)\n" >> "$LOGFILE"
fi

# Append missing files section (if any)
if [ "${#missing[@]}" -gt 0 ]; then
  {
    printf "\nMissing or unreadable files (these were NOT checked for size):\n"
    for m in "${missing[@]}"; do
      printf " - %s\n" "$m"
    done
  } >> "$LOGFILE"
fi

# Clean up
rm -f "$TMPFILE"

# Final message to stdout
printf "Log written to: %s\n" "$LOGFILE"
 
