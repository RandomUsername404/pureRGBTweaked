# RGB TWEAKED FEATURES ONLY

If you're coming from PureRGB and wondering what's new in Tweaked, read this page. If you want to see the complete list of features, [go here.](../FEATURES.md)

---

## Quality-of-Life Improvements

### Inventory & PC
- Menu descriptions so the player always knows how to store items and change BOX wirelessly.

  ![Deposit Item From Start Menu Description](../screenshots/deposit_item_from_menu_description.png?raw=true) ![Box change Description](../screenshots/change_box_from_start_menu_description.png?raw=true)

### Battle QoL
- Added "caught" icon to battle HUD

  ![HUD caught indicator](../screenshots/caught_indicator.png?raw=true)
- EXP bar now in color
- Pressing B in a battle moves the cursor to RUN
- Wild battle losses no longer halve the player's money

### Overworld & World
- Restored Japanese flowers

  ![Japanese flowers](../screenshots/japanese_flowers.png?raw=true)
- New FLY and DIG sprites (Pidgey & a different Diglett sprite)

  ![Pidgey FLY Town Map](../screenshots/pidgey_fly.png?raw=true) ![Diglett DIG](../screenshots/diglett_dig.png?raw=true)
- Unique sprites for all overworld Pokémon

  ![unique pokemon overworld sprites 1](../screenshots/unique_overworld_sprites_1.png?raw=true) ![unique pokemon overworld sprites 2](../screenshots/unique_overworld_sprites_2.png?raw=true)
- Use all HM moves from the overworld

  ![use HM overworld](../screenshots/use_cut_overworld.png?raw=true)

### Menus & Misc
- 151 unique party menu sprites

  ![151 unique party sprites](../screenshots/unique_party_mon_sprites.png?raw=true)
- Pokedex now remembers the user's position
  
---

## NPCs & Quests
- **Mew under the truck** — Is now E4-gated and lvl 65
- **NPCs gift the starter Pokémon** — Obtain all the starters early like in Pokémon Yellow; Bulbasaur in Cerulean; Charmander on Route 24; Squirtle in Vermilion

  ![Bulbasaur NPC](../screenshots/starter_npc_bulbasaur.png?raw=true) ![Charmander NPC](../screenshots/starter_npc_charmander.png?raw=true) ![Squirtle NPC](../screenshots/starter_npc_squirtle.png?raw=true)
- **Coin Grandpa** — lives in the Celadon Hotel and will give you free casino coins if you show him the Pokémon he requests (inspired by the Coin Gentleman from Jojobear13's Shin Pokéred)
- **Move Reminder & Move Deleter** — Added a Move Reminder and a Move Deleter to a house Route 19 (Fuchsia's beach)

    ![Move Reminder's house](../screenshots/move_reminder_house.png?raw=true)
- **Secret Dragon Rage & Fly Tutor** — teach Magikarp Dragon Rage or Pikachu Fly by talking to the Magikarp salesman (adapted from Jojobear13's Shin Pokéred)
- **Secret Surf Tutor** — teach Pikachu/Raichu Surf by talking to the Pikachu inside Vermilion's Fan Club (post E4 only)
- **Post E4 fights** — Two repeatable battles become available once you've become the Champion (from Yellow Legacy)

    ![Officer Jenny battle](/screenshots/fight_officer_jenny.png?raw=true) ![Nurse Joy battle](/screenshots/fight_nurse_joy.png?raw=true)
<details> 
  <summary><b>Secret endgame boss fight</b></summary>
   You need to defeat your rival twice in the Champ Arena, then he'll appear in Viridian Gym.
</details>
    
---

## Pokémon Changes
- Completely revamped Pokémon **base stats**, mixing PureRGB, Yellow Legacy and tweaks of my own (see [this link](../documentation/pokemon_stats.md))
- Completely revamped [**level-up learnsets**](../data/pokemon/evos_moves.asm) and [**TM/HM learnsets**](../data/pokemon/base_stats), mixing PureRGB, Yellow Legacy and tweaks of my own
- **Signature Moves** were tweaked a bit ([check them out](../documentation/moves.md#signature-moves))
- [Brand new Pokémon locations/wild encounters](../documentation/pokemon_locations.md) and lower encounter rates (based on Yellow Legacy).

**NEW Type change ON by default** (togglable via the Type Guy on Route 23):
- Porygon — Normal/Ghost

**PureRGB type changes now OFF by default** (togglable via the Type Guy on Route 23):
- Fearow — Fighting/Flying
- Victreebel — Grass/Dragon
- Marowak — Ground/Ghost
- Mr. Mime — Psychic/Ghost
- Pinsir — Bug/Fighting
- Kabuto — Rock/Bug


---

## Trainer changes
- The Gym teams used by Erika, Koga and Sabrina will scale depending on how many badges you own (inspired by Yellow Legacy)
- All the Gym Leaders get custom movesets and slightly revamped teams
- The rival gets brand new teams (less diverse and unpredictable than PureRGB's but with a clearer progression); gets custom movesets for all his teams post-Cerulean
- All the E4 members get custom movesets and tweaked teams (inspired by Yellow Legacy)
- Almost everyone in the Champ Arena now uses teams based on Pokémon Stadium

---

## Move Change
- Crabhammer is no longer a TM, replaced by Seismic Toss

---

## Bug Fix

- Can't Surf on Gym statues anymore 

---

## Tweaks
- Removed badge boosts
- Removed the 25% miss rate for NPCs using stat down moves
- Use an harder enemy AI a bit sooner (Post Cascade Badge vs Post Soul Badge in PureRGB)
- The E4 members will acknowledge the player's Champion status

## Removed Features from PureRGB
- Auto Surf
- Pocket Abra
