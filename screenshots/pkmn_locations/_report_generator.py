#!/usr/bin/env python3
"""
Parses all pkmn_locations_*.png files in the script's directory,
reads the Pokémon species name from the top strip [0,0]-[160,8] via Tesseract,
fuzzy-matches the OCR result against the Gen 1 Pokédex,
and writes pokemon_locations.md with grouped, embedded image entries.
run with python3 _report_generator.py
"""

import os
import re
import subprocess
import tempfile
from difflib import get_close_matches
from pathlib import Path


SCRIPT_DIR = Path(__file__).parent.resolve()
IMG_STRIP_HEIGHT = 7   # crop: y from 0 to 7 (inclusive → 8px tall)
IMG_STRIP_WIDTH  = 160 # crop: x from 0 to 160

# Full Gen 1 Pokédex (uppercase). Used for fuzzy matching.
GEN1 = [
    "BULBASAUR", "IVYSAUR", "VENUSAUR", "CHARMANDER", "CHARMELEON",
    "CHARIZARD", "SQUIRTLE", "WARTORTLE", "BLASTOISE", "CATERPIE",
    "METAPOD", "BUTTERFREE", "WEEDLE", "KAKUNA", "BEEDRILL",
    "PIDGEY", "PIDGEOTTO", "PIDGEOT", "RATTATA", "RATICATE",
    "SPEAROW", "FEAROW", "EKANS", "ARBOK", "PIKACHU",
    "RAICHU", "SANDSHREW", "SANDSLASH", "NIDORAN F", "NIDORINA",
    "NIDOQUEEN", "NIDORAN M", "NIDORINO", "NIDOKING", "CLEFAIRY",
    "CLEFABLE", "VULPIX", "NINETALES", "JIGGLYPUFF", "WIGGLYTUFF",
    "ZUBAT", "GOLBAT", "ODDISH", "GLOOM", "VILEPLUME",
    "PARAS", "PARASECT", "VENONAT", "VENOMOTH", "DIGLETT",
    "DUGTRIO", "MEOWTH", "PERSIAN", "PSYDUCK", "GOLDUCK",
    "MANKEY", "PRIMEAPE", "GROWLITHE", "ARCANINE", "POLIWAG",
    "POLIWHIRL", "POLIWRATH", "ABRA", "KADABRA", "ALAKAZAM",
    "MACHOP", "MACHOKE", "MACHAMP", "BELLSPROUT", "WEEPINBELL",
    "VICTREEBEL", "TENTACOOL", "TENTACRUEL", "GEODUDE", "GRAVELER",
    "GOLEM", "PONYTA", "RAPIDASH", "SLOWPOKE", "SLOWBRO",
    "MAGNEMITE", "MAGNETON", "FARFETCH D", "DODUO", "DODRIO",
    "SEEL", "DEWGONG", "GRIMER", "MUK", "SHELLDER",
    "CLOYSTER", "GASTLY", "HAUNTER", "GENGAR", "ONIX",
    "DROWZEE", "HYPNO", "KRABBY", "KINGLER", "VOLTORB",
    "ELECTRODE", "EXEGGCUTE", "EXEGGUTOR", "CUBONE", "MAROWAK",
    "HITMONLEE", "HITMONCHAN", "LICKITUNG", "KOFFING", "WEEZING",
    "RHYHORN", "RHYDON", "CHANSEY", "TANGELA", "KANGASKHAN",
    "HORSEA", "SEADRA", "GOLDEEN", "SEAKING", "STARYU",
    "STARMIE", "MR MIME", "SCYTHER", "JYNX", "ELECTABUZZ",
    "MAGMAR", "PINSIR", "TAUROS", "MAGIKARP", "GYARADOS",
    "LAPRAS", "DITTO", "EEVEE", "VAPOREON", "JOLTEON",
    "FLAREON", "PORYGON", "OMANYTE", "OMASTAR", "KABUTO",
    "KABUTOPS", "AERODACTYL", "SNORLAX", "ARTICUNO", "ZAPDOS",
    "MOLTRES", "DRATINI", "DRAGONAIR", "DRAGONITE", "MEWTWO",
    "MEW",
]

# Pokédex order index — used to break ties and detect sequence jumps.
GEN1_INDEX = {name: i for i, name in enumerate(GEN1)}


def crop_and_ocr(png_path: Path) -> str:
    """Crop the top strip of a PNG and return the raw OCR text (uppercase, stripped)."""
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as tmp:
        tmp_path = tmp.name

    try:
        crop_geom = f"{IMG_STRIP_WIDTH}x{IMG_STRIP_HEIGHT + 1}+0+0"
        # 3× upscale before OCR — dramatically improves accuracy on small text
        subprocess.run(
            [
                "convert", str(png_path),
                "-crop", crop_geom, "+repage",
                "-resize", "300%",
                "-filter", "Lanczos",
                tmp_path,
            ],
            check=True,
            capture_output=True,
        )

        result = subprocess.run(
            [
                "tesseract", tmp_path, "stdout",
                "--psm", "7",
                "-c", "tessedit_char_whitelist=ABCDEFGHIJKLMNOPQRSTUVWXYZ' ",
            ],
            check=True,
            capture_output=True,
            text=True,
        )
        return result.stdout.strip().upper()
    finally:
        os.unlink(tmp_path)


def strip_noise(ocr_text: str) -> str:
    """
    Remove the trailing "'S NEST" / "'S NES" / "S NEST" suffix and collapse
    internal whitespace, leaving only the (noisy) species portion.
    """
    # Drop everything from the possessive onward
    cleaned = re.sub(r"[' ]*S\s+NES.*$", "", ocr_text).strip()
    # Collapse runs of spaces
    cleaned = re.sub(r"\s+", " ", cleaned)
    return cleaned


def fuzzy_match(raw: str, cutoff: float = 0.5) -> str | None:
    """
    Fuzzy-match a noisy OCR string against the Gen 1 name list.
    Returns the best match or None if nothing is close enough.
    """
    candidates = get_close_matches(raw, GEN1, n=1, cutoff=cutoff)
    return candidates[0] if candidates else None


def file_number(png_path: Path) -> str:
    """Extract the numeric suffix from pkmn_locations_NNN.png → 'NNN'."""
    match = re.search(r"pkmn_locations_(\d+)\.png$", png_path.name, re.IGNORECASE)
    return match.group(1) if match else "000"


def display_name(species: str) -> str:
    """Convert internal uppercase name to display title-case, e.g. MR MIME → Mr. Mime."""
    special = {"MR MIME": "Mr. Mime", "FARFETCH D": "Farfetch'd", "NIDORAN F": "Nidoran♀", "NIDORAN M": "Nidoran♂"}
    if species in special:
        return special[species]
    return " ".join(w.capitalize() for w in species.split())


def main():
    png_files = sorted(
        SCRIPT_DIR.glob("pkmn_locations_*.png"),
        key=lambda p: p.name.lower(),
    )

    if not png_files:
        print("No pkmn_locations_*.png files found.")
        return

    entries: list[tuple[str, str, Path]] = []
    for png in png_files:
        ocr_raw = crop_and_ocr(png)
        stripped = strip_noise(ocr_raw)
        species = fuzzy_match(stripped)
        num = file_number(png)

        if species is None:
            print(f"  UNMATCHED  {png.name}  (OCR: {ocr_raw!r}  →  stripped: {stripped!r})")
        else:
            print(f"  {png.name} → {species} (#{num})  [OCR: {ocr_raw!r}]")
            entries.append((species, num, png))

    # Group into consecutive runs (same species back-to-back = one section)
    runs: list[tuple[str, list[tuple[str, Path]]]] = []
    for species, num, path in entries:
        if runs and runs[-1][0] == species:
            runs[-1][1].append((num, path))
        else:
            runs.append((species, [(num, path)]))

    # Write Markdown
    output_path = SCRIPT_DIR / "pokemon_locations.md"
    lines: list[str] = []

    for i, (species, images) in enumerate(runs):
        title = display_name(species)
        lines.append(f"**{title}:**")
        lines.append("")

        img_tags = []
        for num, path in images:
            alt_text = f"{species.lower().replace(' ', '_')}_{num}"
            img_path = f"../screenshots/pkmn_locations/{path.name}"
            img_tags.append(f"![{alt_text}]({img_path}?raw=true)")
        lines.append(" ".join(img_tags))

        if i < len(runs) - 1:
            lines.append("")
            lines.append("")

    output_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"\nWrote {output_path}")


if __name__ == "__main__":
    main()
