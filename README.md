# Pokémon RGB Tweaked (Red Tweaked, Green Tweaked, Blue Tweaked)

![Red Tweaked Title](./screenshots/tweaked_pokered_titlescreen.png?raw=true) ![Green Tweaked Title](./screenshots/tweaked_pokegreen_titlescreen.png?raw=true) ![Blue Tweaked Title](./screenshots/tweaked_pokeblue_titlescreen.png?raw=true)

A hack of Pokémon Red/Green/Blue built on top of Vortyne's PureRGB v2.7.2, based on the pokered disassembly.

For the full list of features, bugfixes, and everything else, see [**FEATURES.md**](FEATURES.md).
Or jump directly to:
- [Pokémon stats](/documentation/pokemon_stats.md)
- [Pokémon locations](/documentation/pokemon_locations.md)
- [Full moves breakdown](/documentation/moves.md) (many were modified)
- [TM availability](/documentation/moves.md)

---

📥 **Download link: ["RELEASES"](/releases)**

---

RGB Tweaked is an expansion of PureRGB. All 151 Pokémon are obtainable in every version without trading, with completely revamped base stats, learnsets, and wild encounter locations. The only differences between the three versions are graphical. Most moves in the game have been rebalanced or reworked, with an emphasis on making the weaker ones genuinely useful. Several Pokémon have new dual typings, all of which can be toggled individually via an NPC on Route 23.

### Some highlights of what this hack offers

**New areas.** Cinnabar Volcano (based on unused beta map data), a Diamond Mine on Route 8, an abandoned building in Saffron City, an underwater adventure starting on Route 19, and more. Several of these contain Pokémon upgrade quests and new trainers.

**Starter Pokémon gifts.** All three starters can be obtained early, like in Pokémon Yellow: Bulbasaur in Cerulean, Charmander on Route 24, Squirtle in Vermilion.

![Bulbasaur NPC](./screenshots/starter_npc_bulbasaur.png?raw=true) ![Charmander NPC](./screenshots/starter_npc_charmander.png?raw=true) ![Squirtle NPC](./screenshots/starter_npc_squirtle.png?raw=true)

**Expanded Pokédex.** Three new Pokédex modes were added: the Movedex (tracks every move seen in battle with full data), a Learnset Viewer (level-up learnsets, TM compatibility, evolution chains), and a Wild Distribution Map (find where Pokémon appear on the Town Map, down to individual dungeon floors). Each is unlocked progressively through gameplay.

**Poké Ball Designer.** In Cerulean City, a photograph sidequest unlocks a fully custom Poké Ball creation system: name, throw animation, poof animation, color palette, sound effect, and particle effects, across 16 slots.

![ball designer 1](./screenshots/ball_designer1.png?raw=true) ![ball designer 2](./screenshots/ball_designer2.png?raw=true) ![ball designer 3](./screenshots/ball_designer3.png?raw=true) ![ball designer 4](./screenshots/ball_designer4.png?raw=true)

**Unique overworld and party sprites.** Every Pokémon has a unique overworld sprite and a unique party menu sprite.

![unique pokemon overworld sprites 1](./screenshots/unique_overworld_sprites_1.png?raw=true) ![unique pokemon overworld sprites 2](./screenshots/unique_overworld_sprites_2.png?raw=true) ![151 unique party sprites](./screenshots/unique_party_mon_sprites.png?raw=true)

**Champ Arena.** Post-game rematches against all Gym Leaders and the Elite Four, with perfect-DV teams, custom movesets, and max AI. The teams used there were inspired by Pokémon Stadium. Beating the Champ Arena will lead to a secret endgame boss fight.

**Coin Grandpa.** Lives in the Celadon Hotel and gives out free casino coins in exchange for showing him specific Pokémon.

**TM Pirate.** Sells TMs in most PokéMarts, making TMs more easily accessible.

**Harder AI.** By disabling Badge Boosts and the 25% miss rate for NPCs using stat down moves, the game is now a tiny bit harder.

**Quality-of-life and options.** GBC color support with switchable palettes (original, SGB, or Pokémon Yellow colors), optional Spaceworld 1997 back sprites, customizable front sprites, stereo audio panning, per-type colored move animations on GBC, and much more. Most of these can be toggled in a five-page options menu. HMs are deletable at any time, with softlock prevention built in.

![blue gb](/screenshots/blue_title_gb_no_color.png?raw=true) ![blue gbc default](/screenshots/blue_title_default_gbc_color.png?raw=true) ![blue sgb colors](/screenshots/blue_title_sgb_colors_on_gbc.png?raw=true) ![blue sgb2 colors](/screenshots/blue_title_sgb2_colors_on_gbc.png?raw=true) ![blue gbc colors](/screenshots/blue_title_gbc_colors_on_gbc.png?raw=true)

![red gb](/screenshots/red_title_gb_no_color.png?raw=true) ![red gbc default](/screenshots/red_title_default_gbc_color.png?raw=true) ![red sgb colors](/screenshots/red_title_sgb_colors_on_gbc.png?raw=true) ![red sgb2 colors](/screenshots/red_title_sgb2_colors_on_gbc.png?raw=true) ![red gbc colors](/screenshots/red_title_gbc_colors_on_gbc.png?raw=true)

![green gb](/screenshots/green_title_gb_no_color.png?raw=true) ![green gbc default](/screenshots/green_title_default_gbc_color.png?raw=true) ![green sgb colors](/screenshots/green_title_sgb_colors_on_gbc.png?raw=true) ![green sgb2 colors](/screenshots/green_title_sgb2_colors_on_gbc.png?raw=true) ![green gbc colors](/screenshots/green_title_gbc_colors_on_gbc.png?raw=true)

Pictured: GB Monochrome, Original GBC color, SGB Colors, Alternate SGB Colors, GBC Colors (selectable in-game)

---

## Credits

### Projects & people

This project would not have been possible without the work of:

- Vortyne - PureRGB v2.7.2, the base this hack is built on
- The Pret team for their original disassembly work on Red / Blue
- Jojobear13 - Shin PokéRed
- cRz-Shadows & members of his team - Yellow Legacy
- CreamElDudJafar - Pokemon Celebrations
- JustRegularLuna - Red++
- Rangi42 - Pokemon Redstar/BlueStar
- PokeFanMarcel - Pokémon Yume
- Danny-E 33 - Larger back sprites code snippets, EXP Bar code snippets
- Mechanicalpen - Enhanced menu icons code


### Artists

Below, you'll find all the artists who unknowingly contributed to RGB Tweaked:

- LJSTAR & Vortyne - type icons used in the Movedex
- Mord & Vortyne - Lt. Surge and Erika overworld sprites
- Vortyne - Brock and Sabrina overworld sprites
- Blue Emerald, Chamber_, Soloo993, and others - 151 unique menu party sprites; used as a base for several overworld sprites
- Isona, Alakadoof and Karlos (Yellow Legacy) - several overworld sprites
- CreamElDudJafar (Pokémon Celebrations) - many overworld sprites, including Red's surfing sprite
- ZuperZACH - Nurse Joy battle sprite
- Karlos - Officer Jenny battle sprite

See the full breakdown [here.](gfx/sprites/extra_overworld/_sources.txt)
