#!/bin/bash
# Run from project root

echo "=== Running optipng ==="
find . -name "*.png" -exec optipng -o7 {} \;

echo ""
echo "=== Running pngcrush ==="
find . -name "*.png" | while read -r f; do
    # Skip APNGs: they contain an acTL chunk that pngcrush destroys
    if strings "$f" | grep -q "acTL"; then
        echo "  Skipping APNG: $f"
        continue
    fi

    original_size=$(stat -c "%s" "$f")
    tmp=$(mktemp --suffix=.png)

    pngcrush -brute -q "$f" "$tmp" > /dev/null 2>&1

    if [ -f "$tmp" ]; then
        tmp_size=$(stat -c "%s" "$tmp")
        if [ "$tmp_size" -lt "$original_size" ]; then
            mv "$tmp" "$f"
            echo "  Improved: $f ($original_size -> $tmp_size bytes)"
        else
            rm "$tmp"
        fi
    fi
done

echo ""
echo "Done."
