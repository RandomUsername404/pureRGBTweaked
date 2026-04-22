# FULL LIST OF FEATURES

Here is a comprehensive list of all new features in RGB Tweaked compared to the original Pokémon Red/Blue.

(If you're coming from PureRGB and only want to know what's different between these two hacks, [check this link.](/documentation/tweaked_features_only.md))

---

## Options Menu (expanded from 1 page to 5 pages)

Press SELECT on any option to get an explanation of it.

**Page 1 — Original Options (enhanced)**

![Options First Page](/screenshots/options_page_1.png?raw=true)
- "Instant" text speed added; "Slow" is now the original "Medium"; default is "Fast"

**Page 2 — General Gameplay**

![Options Second Page](/screenshots/options_page_2.png?raw=true)
- `COLORS` — cycle between color palette modes (Default: SGB1):
  - `OG`: Uses whatever colors the system would originally display. On GBC/GBA, this is a hardcoded limited dual-color palette. On SGB, this is the default SGB color palettes.

    ![Blue Title GBC Default](/screenshots/blue_title_default_gbc_color.png?raw=true) ![Red Title GBC Default](/screenshots/red_title_default_gbc_color.png?raw=true) ![Green Title GBC Default](/screenshots/green_title_default_gbc_color.png?raw=true)
  - `SGB1`: Forces SGB color palettes. On GBC or GBA, switches the game to use SGB palettes and enables full color mode, including colored attack animations.

    ![Blue Title SGB](/screenshots/blue_title_sgb_colors_on_gbc.png?raw=true) ![Red Title SGB](/screenshots/red_title_sgb_colors_on_gbc.png?raw=true) ![Green Title SGB](/screenshots/green_title_sgb_colors_on_gbc.png?raw=true)

    ![Attack Color Fire Blast SGB](/screenshots/attack_color_fire_blast.png?raw=true) ![Attack Color Ice Beam SGB](/screenshots/attack_color_ice_beam.png?raw=true) ![Attack Color Solar Beam SGB](/screenshots/attack_color_solarbeam.png?raw=true) ![Attack Color Surf SGB](/screenshots/attack_color_surf.png?raw=true)
  - `SGB2`: Alternate SGB color palettes based on Japanese Pokémon Green — a slightly more greenish-white tint throughout, with minor color differences in Pallet Town, Pewter City, Lavender Town, Celadon City, Saffron City, and Indigo Plateau. Otherwise identical to SGB1 in features. On SGB, saving and restarting is required to apply the change.

    ![Blue Title SGB2](/screenshots/blue_title_sgb2_colors_on_gbc.png?raw=true) ![Red Title SGB2](/screenshots/red_title_sgb2_colors_on_gbc.png?raw=true) ![Green Title SGB2](/screenshots/green_title_sgb2_colors_on_gbc.png?raw=true)

    Pictured below — Left: SGB1, Right: SGB2

    ![sgb1 sgb2 comparison 1](/screenshots/sgb1_sgb2_comparison_pallet.png?raw=true) ![sgb1 sgb2 comparison 2](/screenshots/sgb1_sgb2_comparison_pewter.png?raw=true) ![sgb1 sgb2 comparison 3](/screenshots/sgb1_sgb2_comparison_lavender.png?raw=true) ![sgb1 sgb2 comparison 4](/screenshots/sgb1_sgb2_comparison_saffron.png?raw=true) ![sgb1 sgb2 comparison 5](/screenshots/sgb1_sgb2_comparison_indigo.png?raw=true)
  - `Y1` / `Y2`: Forces Pokémon Yellow's GBC color palettes. Y1 uses the original Yellow palettes; Y2 uses the same colors with reduced intensity to simulate how they look on an original GBC screen.

    ![Blue Title GBC](/screenshots/blue_title_gbc_colors_on_gbc.png?raw=true) ![Red Title GBC](/screenshots/red_title_gbc_colors_on_gbc.png?raw=true) ![Green Title GBC](/screenshots/green_title_gbc_colors_on_gbc.png?raw=true)

    ![Blue Title GBC2](/screenshots/blue_title_y2_colors_on_gbc.png?raw=true) ![Red Title GBC2](/screenshots/red_title_y2_colors_on_gbc.png?raw=true) ![Green Title GBC2](/screenshots/green_title_y2_colors_on_gbc.png?raw=true)

- `ALT PKMN COLORS` — enables regional color variants for certain Pokémon (e.g., blue Nidorinos, purple Nidorinas) (Default: ON)

  ![Alt Colors Off](/screenshots/alt_pokemon_colors_off.png?raw=true) ![Alt Colors On](/screenshots/alt_pokemon_colors_on.png?raw=true)
- `MUSIC` — `OG+` mode enables restored/new music tracks (e.g., Giovanni's Theme, unused from Pokémon Yellow) (Default: OG+)
- `AUDIO PAN` — stereo audio panning ported from Pokémon Yellow; makes the music sound more dynamic by panning certain channels left or right (Default: OFF)
- `BIKE SONG` — toggles bicycle music; when off, the bike theme only plays on Cycling Road (Default: ON)
- `GBC FADE` — smoother fade transitions on GBC (e.g., entering buildings, flying to a town) (Default: OFF)

**Page 3 — Battle Settings**

![Options Third Page](/screenshots/options_page_3.png?raw=true)
- `GHST→PSY`, `ICE→FIRE`, `BUG→PSN`, `PSN→BUG` — toggle type matchups between their Gen 1 and Gen 2 values. `GHST→PSY` is set to Super Effective by default, since the original Psychic immunity to Ghost was a known bug.
- `EXP BAR` — experience bar in battles (Default: ON)

  ![Exp bar](screenshots/exp_bar.png?raw=true)
- `NPC EVs` — gives trainer Pokémon Stat EXP scaled to their level, so high-Stat-EXP player Pokémon don't completely outclass similar-level opponents (Default: ON)
- `NPC PP` — opponents track PP and can run out of moves (Default: ON)

**Page 4 — Sprite Options**

![Options Fourth Page](/screenshots/options_page_4.png?raw=true)
- `BACK` — toggle between back sprite sets (Default: SW97)
  - `OG`: Original blocky back sprites.

    ![Original back sprite venusaur](/gfx/pokemon/back/venusaurb.png?raw=true) ![Original back sprite blastoise](/gfx/pokemon/back/blastoiseb.png?raw=true) ![Original back sprite charizard](/gfx/pokemon/back/charizardb.png?raw=true)
  - `SW97`: Spaceworld 1997 back sprites — higher resolution while still matching the original game's style.

    ![Spaceworld back sprite venusaur](/gfx/pokemon/back_sw/venusaurb.png?raw=true) ![Spaceworld back sprite blastoise](/gfx/pokemon/back_sw/blastoiseb.png?raw=true) ![Spaceworld back sprite charizard](/gfx/pokemon/back_sw/charizardb.png?raw=true)
- `FRONT` — per-Pokémon front sprite customization across Red/Green/Blue/SW97 sources (5 sub-pages, press A or SELECT to preview each choice)

  ![Front Sprite Options 1](/screenshots/front_sprite_options1.png?raw=true)
  ![Front Sprite Options 2](/screenshots/front_sprite_options2.png?raw=true)
  ![Front Sprite Options 3](/screenshots/front_sprite_options3.png?raw=true)
  ![Front Sprite Options 4](/screenshots/front_sprite_options4.png?raw=true)
  ![Front Sprite Options 5](/screenshots/front_sprite_options5.png?raw=true)

  You can customize the following sprites:

  ![front_sprite_options](/gfx/pokemon/gallery/front_sprite_options.png?raw=true)

**Page 5 — Additional Options**

![Options Fifth Page](/screenshots/options_page_5.png?raw=true)
- Redo song — allow music to resume where it was before a battle was triggered (Default: ON)
- Learnset feature — unlock Pokémon learnsets in various ways throughout the game (Default: ON)
- Custom RGB Tweaked title screen — toggle off to display the original title screen (Default: ON)

  ![Red Tweaked Title](/screenshots/tweaked_pokered_titlescreen.png?raw=true) ![Green Tweaked Title](/screenshots/tweaked_pokegreen_titlescreen.png?raw=true) ![Blue Tweaked Title](/screenshots/tweaked_pokeblue_titlescreen.png?raw=true)
- Skip intro on boot — go straight to the title screen (Default: OFF)
- Reduced battle flash intensity (Default: OFF)
- Imperial/Metric unit toggle for Pokédex entries (Default: Metric)

---

## World Options (via Player's PC)

![world options](/screenshots/world_options.png?raw=true)

- Toggle Cinnabar Volcano area on/off
- Toggle Training Clubs on/off
- Toggle Poké Ball Designer on/off
- Toggle Signature Moves on/off

Everything here is set to ON by default.

---

## Quality-of-Life Improvements

### Inventory & PC
- Bag size: 20 → 30 slots; PC items: 50 → 60 slots
- Deposit items to PC directly from the bag (press START on an item)

  ![Deposit Item From Start Menu Description](/screenshots/deposit_item_from_menu_description.png?raw=true) ![Deposit Item From Start Menu](/screenshots/deposit_item_from_menu.png?raw=true)
- Change PC boxes from the Start Menu (scroll to SAVE, press SELECT); also shows the Pokémon count per box

  ![Box change Description](/screenshots/change_box_from_start_menu_description.png?raw=true) ![Box change](/screenshots/change_box_from_start_menu.png?raw=true)
- Bill's PC always shows the current box's Pokémon count
- Reports remaining box space after catching a Pokémon
- Bag/PC fullness indicator (e.g., `15/30`)
- Multiple items can be picked up in one action (e.g., "You found 5 Potions!")
- Buy/sell in tens (LEFT/RIGHT during quantity selection)
- Coin Case removed from bag (check at the Game Corner to see your coin count)
- Secret Key, Card Key, and Lift Key are consumed when no longer needed
- TMs — In the BAG/MARTS, a bottom textbox shows the move it teaches

  ![TM Text](/screenshots/tm_text_box_prompt.png?raw=true)
- Town Map removed from bag (press SELECT in the Pokédex — requires obtaining the Map in Pallet Town first)
- Reduced item swap delay
- View the contents of a BOX even with a full party (press SELECT on WITHDRAW)

### Navigation & Controls
- Running shoes (hold B); faster bicycle (hold B); animations scale to match
- Bicycle shortcut (press SELECT to mount/dismount); text skipped after first use
- Bicycle usable in Route gates
- Stop-and-turn (hold B+A to rotate in place without moving)
- Expanded Fly locations: Viridian Forest, Safari Zone, Celadon Mart roof, Celadon Mansion roof
- No FLY selection delay
- TELEPORT usable inside caves and buildings
- HMs deletable (with softlock prevention)
- Faster spin tiles
- List scroll wrap (press LEFT to jump between top and bottom)
- Playtime tracked up to 10,000+ hours (was 255)

### Battle QoL
- Added "caught" icon to battle HUD

  ![HUD caught indicator](/screenshots/caught_indicator.png?raw=true)
- Low health alarm plays 3 times then stops
- Correct effectiveness messages always displayed
- Reduced TM teaching dialogue
- "HIDE" option to permanently suppress the move-forget prompt
- Press START (not A) to confirm move forget and Pokémon release
- Stone/trade evolutions have full level-up learnsets
- Pressing B in a battle moves the cursor to RUN
- Wild battle losses no longer halve the player's money

### Overworld & World
- 60 FPS
- Shorter fishing animation; flat 75% catch rate
- Fishing rod position remembered in the bag
- Itemfinder rotates the player toward a detected item; also works in the Game Corner to detect hidden coins
- MAX REPEL fully disables wild encounters while active
- "Use another Repel?" prompt
- Fuchsia City layout slightly improved for easier navigation
- Daycare has a PC
- Route 23 grass patch (just past the north exit of Victory Road) gives full EXP for late-game training
- Buy drinks in bulk at Celadon Diner after giving one to a Saffron guard
- 500 coins purchasable for ₽8,000 at the Game Corner
- Slot machines no longer cheat; increased payouts and speed
- Elevators show the current floor
- Trade evolutions can also evolve by levelling up
- Unique sprites for all overworld Pokémon

  ![unique pokemon overworld sprites 1](/screenshots/unique_overworld_sprites_1.png?raw=true) ![unique pokemon overworld sprites 2](/screenshots/unique_overworld_sprites_2.png?raw=true)
- Use all HMs from the overworld directly (Strength persists between floors in Seafoam Islands and Victory Road)

  ![use HM overworld](/screenshots/use_cut_overworld.png?raw=true)
- Brought back the original Japanese flowers

### Menus & Misc
- 151 unique party menu sprites

  ![151 unique party sprites](/screenshots/unique_party_mon_sprites.png?raw=true)
- Name Rater will rename traded Pokémon
- Cinnabar Gym quiz doesn't re-explain the rules each time
- SS Anne re-entry permitted after helping the captain
- Channeler on Pokémon Tower 2F will hold the Silph Scope on request, freeing up bag/PC space
- Pokédex shows typing (if seen) and base stats (if caught)

  ![Pokedex Base Stats](/screenshots/pokedex_base_stats_typing.png?raw=true)
- Pokédex back sprite view (press SELECT)
- Pokedex now remembers the user's position
- Easily swap party Pokémon positions (press SELECT)
- Stat EXP view on the status screen (press SELECT)
- Faster/more responsive main menu and list menus
- Faster saving
- Can import original Red/Blue saves

---

## New Items
| Item | Effect |
|:------|--------|
| `BOOSTER CHIP` | Replaces EXP.ALL — all party members gain the traded-Pokémon EXP bonus. Obtained from Oak's aide in the Fuchsia-Route 15 Gate after catching 80 Pokémon |
| `APEX CHIP` | Maximizes DVs when installed; the Gym Guide gives 2 after each gym badge |
| `HYPER BALL` | Never fails to catch a Pokémon below 1/3 HP, including legendaries. For many non-legendary Pokémon it will never fail even at full HP |

---

## New Pokédex Modes
- **Movedex** — tracks every move seen in battle with full data; unlocked in the Viridian Schoolhouse basement

  ![movedex](/screenshots/movedex.png?raw=true) ![movedex thunderbolt](/screenshots/movedex_thunderbolt.png?raw=true) ![movedex flamethrower](/screenshots/movedex_flamethrower.png?raw=true) ![movedex surf](/screenshots/movedex_surf.png?raw=true) ![movedex eq](/screenshots/movedex_earthquake.png?raw=true)
- **Learnset Viewer** — shows level-up learnsets, TM compatibility, and evolution chains; unlocked progressively by talking to NPCs, reading in-game books, or levelling a Pokémon high enough

  ![learnset 1](/screenshots/learnset_1.png?raw=true) ![learnset_2](/screenshots/learnset_2.png?raw=true) ![learnset_3](/screenshots/learnset_3.png?raw=true)
- **Wild Distribution Map** — view wild Pokémon by area on the Town Map, including per-floor breakdowns for multi-floor dungeons; unlocked by catching 50 Pokémon and talking to Oak's aide in Fuchsia City's meeting room

  ![town map wild data](/screenshots/town_map_wild_data.png?raw=true)

---

## New Areas
| Area | Description |
|:------|-------------|
| **Cinnabar Volcano** | Based on an unused Moltres beta map; catch Moltres early; upgrade Magmar (becomes immune to Fire and Water damage) |
| **Viridian Schoolhouse Basement** | Early-game help area covering stats, type matchups, and STAB; unlocks the Movedex |
| **CHAMP ARENA** | Post-Champion rematches against all Gym Leaders and Elite Four with perfect-DV teams, custom movesets, and max AI. Choose from many audio tracks. Opponents get even stronger on subsequent runs. Teams inspired by Pokémon Stadium. |
| **Bill's Garden** | Post-Champion; content changes on repeat visits; A certain alternate-palette Pokémon can be caught there |
| **Pokémon Tower B1F** | Dark Channeler can curse a Gengar to look like a Haunter again (keeping Gengar's stats); Ghost Marowak burial event |
| **Power Plant (enhanced)** | SW97 beta tileset; button-puzzle electrical gates; roof area; Magneton upgrade (immune to Ground damage) |
| **Diamond Mine** (Route 8) | Prospector quest; Onix upgrade (better stats, reduced Water/Ice/Grass damage) |
| **Saffron Abandoned Building** | Team Rocket's secret infiltration route into the city; Weezing upgrade (immune to Ground damage) |
| **Erik and Sara's House** (Route 19) | Dragonair upgrade quest; based on a beta Route 21 house |
| **Secret Lab** | ???? |
| **Training Clubs** | Vermilion Fitness Club, Back Alley Battle Club (Celadon), Fighting Dojo (Saffron) — triple EXP battles with level caps |

![clubs 1](/screenshots/clubs1.png?raw=true) ![clubs 2](/screenshots/clubs2.png?raw=true) ![clubs 3](/screenshots/clubs3.png?raw=true) ![clubs 4](/screenshots/clubs4.png?raw=true)

---

## New NPCs & Quests
- **NPCs gift the starter Pokémon** — Obtain all the starters early like in Pokémon Yellow; Bulbasaur in Cerulean; Charmander on Route 24; Squirtle in Vermilion

  ![Bulbasaur NPC](/screenshots/starter_npc_bulbasaur.png?raw=true) ![Charmander NPC](/screenshots/starter_npc_charmander.png?raw=true) ![Squirtle NPC](/screenshots/starter_npc_squirtle.png?raw=true)
- **Poké Ball Designer** (Cerulean) — photo quest; unlock fully customizable balls (name, throw animation, poof animation, color palette, sound effect, particles; 16 slots)

  ![ball designer 1](/screenshots/ball_designer1.png?raw=true) ![ball designer 2](/screenshots/ball_designer2.png?raw=true) ![ball designer 3](/screenshots/ball_designer3.png?raw=true) ![ball designer 4](/screenshots/ball_designer4.png?raw=true)
- **Coin Grandpa** — lives in the Celadon Hotel and will give you free casino coins if you show him the Pokémon he requests.
- **Move Mystic** (Saffron) — explains the Signature Moves system

  ![move mystic](/screenshots/move_mystic.png?raw=true)
- **Fossil Guy** (Mt. Moon → Saffron) — offers to take your fossil right away at Mt. Moon; meet him at his house in Saffron City to receive the revived Pokémon; also accepts Old Amber

  ![Super Nerd House in Saffron](/screenshots/super_nerd_in_saffron_city.png?raw=true)
- **Second Fossil** — the fossil you didn't choose in Mt. Moon can be found hidden in Seafoam Islands
- **Tree Deleter** — permanently removes CUT trees for a fee (Fuchsia City, Route 9, and more)

  ![Tree Deleter](/screenshots/tree_deleter.png?raw=true)
- **Color Changer** (Cinnabar Lab) — swaps a Pokémon's palette to its alternate color (requires `ALT PKMN COLORS` ON; limited uses)

  ![Lab color changer NPC](/screenshots/color_changer_npc.png?raw=true)
- **Type Guy** (Route 23) — toggle individual Pokémon between new and original typing on a per-Pokémon basis

  ![Type Guys House](/screenshots/type_guys_house.png?raw=true)
- **Erik and Sara** quest — reunite the two NPCs in Fuchsia City; visit their house on Route 19 afterward; follow their scuba diving adventure for a Dragonair upgrade

  ![erik and sara](/screenshots/erik_and_sara.png?raw=true)
- **Early Lapras** (Celadon Hotel) — available after clearing Rocket Hideout; same NPC who gives it in Silph Co. (still obtainable the original way if missed)
- **TM Pirate** — sells TMs in most PokéMarts
- **Metronome Tutor** (Route 12) — a gambler who embraces chaos
- **Move Tutor (Gramps)** — tutors moves that were formerly TMs
- **Fighting Dojo Members** (Saffron) — tutor additional former-TM moves; one offers a one-time elemental punch for Alakazam (only after you beat Sabrina)
- **Secret Dragon Rage & Fly Tutor** — teach Magikarp Dragon Rage or Pikachu Fly by talking to the Magikarp salesman
- **Secret Surf Tutor** — teach Pikachu/Raichu Surf by talking to the Pikachu inside Vermilion's Fan Club (post E4 only)
- **Prof. Oak** (Cerulean Cave) — restored unused trainer class; repeatable battle after becoming Champion
- **Phone calls** (Celadon Dept. Store) — call home, Oak, or your rival; choices influence subsequent events in Pallet Town

  ![phone tree 1](/screenshots/phone1.png?raw=true) ![phone tree 2](/screenshots/phone2.png?raw=true)
- **Channeler** (Pokémon Tower 2F) — holds onto the Silph Scope for the player after saving Mr. Fuji
- **Rock Tunnel Nurse secret** — donate money to learn express healing (hold B before talking to a nurse)
- **Prospector** (Diamond Mine → Celadon) — after obtaining HM02, teaches DIG as a town-to-town travel method (cannot be used while Surfing or on a dock above water)

  ![prospectors house](/screenshots/prospector's_house.png?raw=true)
- **All TMs seller** — available post-Champion in the Indigo Plateau. Follow [this link](/documentation/move_availability.md) to know where and when you'll be able to acquire TMs.
- **Rare Candy source** — purchasable post-Champion; requires a bit of sleuthing to find
- **Two extra Viridian Forest trainers** from Pokémon Yellow were added to make the forest feel less empty
- **Ghost Marowak is catchable** — with `ALT PKMN COLORS` on, it has a special ghostly coloration. It wants revenge on Team Rocket, and Mr. Fuji will react differently to being saved if you caught it. After defeating Giovanni in Viridian Gym, you can return to Pokémon Tower's basement to lay it to rest in a touching reunion with Cubone

  ![ghost marowak area](/screenshots/ghost_marowak_area.png?raw=true)
- **Dark Channeler** (Pokémon Tower B1F) — if you show them a Gengar, they'll curse it to look like a Haunter again — stats unchanged

  ![dark channeler](/screenshots/dark_channeler.png?raw=true)
- **Fishing Gurus relocated** — Old Rod available earlier in Cerulean City; Good Rod now in the old Vermilion guru's house; whichever of the Route 12 or Fuchsia gurus you meet first gives you the Super Rod — the other gives you a Fishing Guide, unlocking fishing location data in the Pokédex

  ![Fishing locations good rod](/screenshots/pkmn_locations/pkmn_locations_148.png?raw=true) ![Fishing Locations old rod](/screenshots/pkmn_locations/pkmn_locations_147.png?raw=true) ![Fishing locations super rod](/screenshots/pkmn_locations/pkmn_locations_149.png?raw=true)
- **SS Anne healing** — you can eat food on the SS Anne to heal your Pokémon while aboard
- **Move Reminder & Move Deleter** — Added a Move Reminder and a Move Deleter to a house Route 19 (Fuchsia's beach)

    ![Move Reminder's house](/screenshots/move_reminder_house.png?raw=true)
- **Post E4 fights** — Two repeatable battles become available once you've become the Champion (from Yellow Legacy)

    ![Officer Jenny battle](/screenshots/fight_officer_jenny.png?raw=true) ![Nurse Joy battle](/screenshots/fight_nurse_joy.png?raw=true)
<details> 
  <summary><b>Secret endgame boss fight</b></summary>
   You need to defeat your rival twice in the Champ Arena, then he'll appear in Viridian Gym.
</details>

---

## Safari Zone Modes

![Safari Zone Modes](/screenshots/safari_zone_modes.png?raw=true) ![Safari Zone Trainers](/screenshots/safari_zone_ranger_hunt.png?raw=true)

- **CLASSIC** — original rules, 700 steps (was 500)
- **FREE ROAM** — use your own Pokémon, no step limit, trainers throughout (trainers reset on re-entry)
- **RANGER HUNT** — find and defeat 5 rangers before running out of 700 steps using your own Pokémon; all FREE ROAM trainers are also present; reward: HYPER BALL. Repeatable

---

## Mew & Missingno
- **Mew** is under the truck — use Strength on it from the right side. Only possible once you're Champion; before that, the Pokémon using Strength will refuse to push the truck.
- **Missingno** catchable without save corruption; randomly cycles sprites (glitch, Ghost, Fossil Kabutops/Aerodactyl)

  ![Missingno](/screenshots/missingno.png?raw=true)
- Item duplication glitch preserved

---

## Pokémon Changes
- Many Pokémon have improved **base stats** (view in the Pokédex after catching, or [visit this link](/documentation/pokemon_stats.md))
- All 151 have improved [**level-up learnsets**](/data/pokemon/evos_moves.asm) and [**TM/HM learnsets**](/data/pokemon/base_stats); all TMs are useful moves
- **Signature Moves** — certain Pokémon get power/accuracy bonuses [on specific moves](/documentation/moves.md#signature-moves) (can be disabled via World Options)
- **Ghost type** is now "dynamic" — uses Special or Attack for damage based on which base stat is higher for the user, letting Pokémon like Gengar benefit from Special damage while physical attackers can still use Ghost offensively
- All 151 Pokémon are obtainable in every version without trading. [Check this file to know where every Pokémon in this hack are located.](/documentation/pokemon_locations.md)

**Type changes ON by default** (togglable via the Type Guy on Route 23):
- Butterfree — Bug/Psychic
- Sandshrew/Sandslash — Ground/Normal
- Ninetales — Fire/Ghost
- Golduck — Water/Psychic
- Ponyta/Rapidash — Fire/Normal
- Doduo/Dodrio — Ground/Flying
- Kingler — Water/Ground
- Voltorb/Electrode — Electric/Fire
- Seadra — Water/Dragon
- Goldeen/Seaking — Water/Normal
- Electabuzz — Electric/Fighting
- Porygon — Normal/Ghost
- Kabutops — Rock/Bug

**Type changes OFF by default** (togglable via the Type Guy on Route 23):
- Fearow — Fighting/Flying
- Victreebel — Grass/Dragon
- Marowak — Ground/Ghost
- Mr. Mime — Psychic/Ghost
- Pinsir — Bug/Fighting
- Kabuto — Rock/Bug

---

## Move Changes (highlights)
- 7 moves renamed and reworked (mostly based on unused prototype moves):
  - CONSTRICT → **SIPHON SNAG** — 75 power, Electric, heals status on user (or one party member if user has none), 100% accuracy
  - TAKE DOWN → **HEAT RUSH** — 75 power, Fire, 30% burn chance, 100% accuracy; Fire-types also get a 40% chance to raise Special by one stage
  - KINESIS → **FIREWALL** — 20 power, Fire, causes burn, 90% accuracy; power increases to 40 after the target is burned, then up to 80 (or 80/140 at level 50+)
  - COUNTER → **DRAIN PUNCH** — 75 power, Fighting, drains HP, 100% accuracy
  - RAZOR WIND → **ROOST** — heals 1/2 max HP
  - SLAM → **FILTHY SLAM** — 80 power, Poison, 100% accuracy; power rises to 130 if the target is already poisoned
  - FURY SWIPES → **DUST CLAW** — 40 power, Ground, 100% accuracy (early-game Ground-type move)
- Moves were rebalanced such as: WHIRLWIND, WITHDRAW, GROWTH, CUT, FLASH, CONVERSION, BIDE, EXPLOSION, LEECH LIFE, MIRROR MOVE, TELEPORT, SONICBOOM, ACID ARMOR, SCREECH, and many more. Follow [this link](/documentation/moves.md) to see a list of all the moves and what they do.
- Trapping moves last 2–3 turns (2/3 chance of 2, 1/3 chance of 3) but deal more damage; you can switch out of them

---

## Trainer AI Improvements
- AI won't spam stat moves (e.g., Agility, Amnesia) just because your Pokémon is weak to that type — the super-effective move subroutine now ignores moves that deal no damage
- AI avoids OHKO moves unless they actually have a chance of connecting
- AI avoids useless moves: Dream Eater on awake targets, Leech Seed if already seeded, confusion moves if you're already confused, healing at full HP, etc.
- AI items and switches happen at the start of the turn, same as the player
- Smarter trainers favor priority moves when the player is faster, draining moves at low HP, and 4× super effective moves
- Smarter trainers use MIRROR MOVE when it would result in a super effective hit
- Expert trainers favor healing at low HP, Dream Eater on sleeping targets, and applying statuses when the player has none
- Trainers that can use boosting items (X Attack, etc.) will only do so when it appears safe

---

## Restored Cut Content
- Giovanni's Theme (unused data from Pokémon Yellow) — plays in OG+ Music mode
- Route 2 trade music — plays in OG+ Music mode
- Rival loss dialogue
- Prof. Oak trainer class
- Beta trainer classes: `ROOKIE`, `RANGER`, `FIREFIGHTER`, `COOL KID`, `SOLDIER`, `CHIEF`, `FIST FIGHTER`, `FITNESS PRO`, `SPRINTER` — placed in previously empty routes and areas

  ![Rookie](/gfx/unused_prototype_sprites/rookie.png?raw=true) ![Ranger](/gfx/unused_prototype_sprites/ranger.png?raw=true) ![Firefighter](/gfx/unused_prototype_sprites/firefighter.png?raw=true) ![Cool Kid](/gfx/unused_prototype_sprites/cool_kid.png?raw=true) ![Soldier](/gfx/unused_prototype_sprites/soldier.png?raw=true) ![Chief](/gfx/unused_prototype_sprites/chief.png?raw=true) ![Fist Fighter](/gfx/unused_prototype_sprites/fist_fighter.png?raw=true) ![Fitness Pro](/gfx/unused_prototype_sprites/fitness_girl.png?raw=true) ![Sprinter](/gfx/unused_prototype_sprites/sprinter.png?raw=true)
- Previously unused trainers from existing classes placed in empty routes
- Seafoam Islands icy tiles (were present in the Cave tileset but unused)

  ![seafoam cut tiles](/screenshots/seafoam_islands_cut_content_tiles.png?raw=true)
- Power Plant SW97 beta tileset
- Route 19 house (inspired by a house visible in beta Route 21 builds)
- Cinnabar Volcano (inspired by an unused map called MOLTRES in earlier builds)
- Celadon Rainbow Palette (toggleable by interacting with the "Celadon City — City of Rainbow Dreams" sign)
- Fighting Dojo unused tiles (used in the new Training Club area)

---

## Visual Changes
- Burn has a unique animation (no longer reuses the poison animation)
- Per-ball-type throw and poof animations; Master Ball is especially enhanced
- Colored move animations on GBC/GBA in SGB1, SGB2, or GBC color modes (type-appropriate colors)

  ![Attack Color Fire Blast SGB](/screenshots/attack_color_fire_blast.png?raw=true) ![Attack Color Ice Beam SGB](/screenshots/attack_color_ice_beam.png?raw=true) ![Attack Color Solar Beam SGB](/screenshots/attack_color_solarbeam.png?raw=true) ![Attack Color Surf SGB](/screenshots/attack_color_surf.png?raw=true)
- Colored Pokéballs per type on GBC/GBA hardware/emulator

  ![Pokeball Color](/screenshots/great_ball_color.png?raw=true)
- Enhanced move animations
- Higher-framerate FLY overworld animation
- New DIG overworld animation
- Smoother GBC fading (requires `GBC FADE` ON)
- Unique palette colors for Pewter City, Seafoam Islands, Power Plant, and Lorelei's room in various color modes
- Static Pokémon (Articuno, Moltres, Zapdos, Mewtwo, Snorlax) have special pre-battle animations
- Seafoam Islands visible water currents with proximity sound effects

  ![Seafoam Currents](/screenshots/seafoam_currents.png?raw=true)
- Elevator shake duration scales with distance traveled
- Boulder-on-switch and FLASH animations
- Digletts visually pop up in Diglett's Cave
- Poké Doll use animation in battle
- Building sides visible from Celadon Department Store and Mansion rooftops
- Pokémon Green-specific visuals in the Green version: slot machines, SGB borders, title screen

  ![Green Slots](/screenshots/green_slots.png?raw=true) ![Green SGB Border](/screenshots/green_title_sgb_border.png?raw=true)

---

## Audio Changes
- New 2-minute Safari Zone song (OG+ Music mode)
- Ghost encounter sound effect in Pokémon Tower
- TM/HM boot-up sound effect
- Boulder-down-hole and fall-down-hole sound effects in Seafoam Islands and Victory Road
- Giovanni's Theme, beta victory theme (female trainers), and beta healing theme (Pallet Town house) in OG+ Music mode
- Elite Four use the gym battle theme instead of the default battle music
- Various new small sound effects: toss item, bicycle mount/dismount, boulder on switch, FLASH, Elite Four doors opening, Bill's teleporter, PP Up
- 6 Pokémon (Poliwhirl, Vileplume, Goldeen, Rhyhorn, Omanyte, Ditto) get slightly different cries to avoid duplicates (OG+ Music mode)
- Music volume decreased on the nickname screen
- The game's unused fanfare sound effect repurposed for new events such as the Volcano area

---

## Bug Fixes
- High Jump Kick / Jump Kick crash damage fixed (1/4 of the intended damage instead of always 1)
- Focus Energy works correctly (multiplies critical hit rate by 4 instead of dividing it)
- Paralysis/Burn stat penalties no longer repeatedly applied; correctly reset on cure
- Nidorino's cry plays correctly in Oak's intro (was playing Nidorina's)
- Recover doesn't fail at exactly 255 HP
- Evolution stone item bypass glitch removed
- Skipping a level no longer skips learnable moves
- Post-evolution move learning works correctly
- Eevee always learns its type-specific move on evolution regardless of level
- Light Screen / Reflect capped at 999 to prevent overflow
- "Poof!" sound effect on move learning fixed
- No move swapping while Transformed (prevented a crash)
- NPCs obey facing assignments
- Double Edge animation fixed when the opponent uses it
- Safari Zone blackout no longer glitches the game
- Switching to the current or a fainted Pokémon visual glitch fixed
- Cerulean Cave collision detection fix
- Tile block replacement lag reduced
- Sound effects play properly with the Instant text setting
- No visible tile block replacement on map load
- Substitute at the exact HP threshold leaves 1 HP instead of fainting the Pokémon
- No white flash on entering a battle or building on original Game Boy or GBC
- Pokéflute correctly detects sleeping wild Pokémon
- Trainer silhouettes on original Game Boy during battle intro scroll (matching SGB/GBC behavior)
- Route 17 sign readable from below
- Can't get blocked by the burglar on Pokémon Mansion 3F
- SHIFT mode doesn't ask to switch when all other Pokémon are fainted
- Fuchsia Zoo Lapras can swim around its enclosure
- Trapping moves don't damage immune Pokémon (e.g., Wrap on a Ghost-type)
- Confusion/paralysis during Dig/Fly invulnerability fixed for link battles and enemy Pokémon (still affects the player as an intentional quirk)
- Substitute/Minimize sprite corruption on menu return fixed
- Ghost identity reveal on menu return fixed
- Rock Tunnel dark colors on Continue screen fixed
- Draining moves miss on substituted Pokémon as originally intended
- Can't Surf on Gym statues anymore

---

## Tweaks
- Trainers have more varied parties; gym leaders may use new Pokémon
- Gym Leaders get custom movesets; the rival gets custom movesets (post-Cerulean); the E4 all get custom movesets
- 1 of each elemental stone hidden before Rock Tunnel
- Potion heals 50 HP; Super Potion heals 100 HP
- HMs don't prevent Daycare deposit
- Saffron City fixed in Fly order (was incorrectly placed after Indigo Plateau)
- Vermilion Gym puzzle doesn't reset on the wrong second switch
- OLD ROD catches Goldeen in addition to Magikarp; GOOD ROD catches varied water Pokémon depending on sea vs. pond/lake; SUPER ROD catches higher-level Pokémon
- Vitamins approximately 3× more effective; PP Up maxes PP in one use
- Snorlax, Slowpoke, and Slowbro move slowly in the party menu regardless of HP
- Lance turns to face you before battle
- Coastal water tiles load water encounters (except Route 20, to preserve the original Missingno encounter method)
- Star-shaped grass loads encounters correctly
- Badge obedience scales by 10 per badge up to the Marsh Badge (instead of 20 every 2 badges), making in-game traded Pokémon easier to use
- Larger character set for nicknames
- Pokémon Center nurses recognize Champion status; E4 members will acknowledge the player's Champion status
- Post-defeat trainer dialogue updated for several gyms (Vermilion, Celadon, Fuchsia)
- Mr. Psychic requires defeating the Fighting Dojo before giving you the Psychic TM
- In-game trade Pokémon have unique OT names instead of all reading TRAINER
- Safari Zone warden dialogue updates based on HM03 status
- Removed badge boosts
- Removed the 25% miss rate for NPCs using stat down moves
- The Gym teams used by Erika, Koga and Sabrina will scale depending on how many badges you own (inspired by Yellow Legacy)
