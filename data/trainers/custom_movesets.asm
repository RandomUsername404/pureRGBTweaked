; PureRGBnote: ADDED: trainers can have custom movesets by specifying that in their party data

	const_def 1
	const CHAMP_ARENA_ERIKA1_MOVESET
	const CHAMP_ARENA_ERIKA2_MOVESET
	const CHAMP_ARENA_BLAINE1_MOVESET
	const CHAMP_ARENA_BLAINE2_MOVESET
	const CHAMP_ARENA_SURGE1_MOVESET
	const CHAMP_ARENA_SURGE2_MOVESET
	const CHAMP_ARENA_SABRINA1_MOVESET
	const CHAMP_ARENA_SABRINA2_MOVESET
	const CHAMP_ARENA_BRUNO1_MOVESET
	const CHAMP_ARENA_BRUNO2_MOVESET
	const CHAMP_ARENA_MISTY1_MOVESET
	const CHAMP_ARENA_MISTY2_MOVESET
	const CHAMP_ARENA_LANCE1_MOVESET
	const CHAMP_ARENA_LANCE2_MOVESET
	const CHAMP_ARENA_KOGA1_MOVESET
	const CHAMP_ARENA_KOGA2_MOVESET
	const CHAMP_ARENA_LORELEI1_MOVESET
	const CHAMP_ARENA_LORELEI2_MOVESET
	const CHAMP_ARENA_BROCK1_MOVESET
	const CHAMP_ARENA_BROCK2_MOVESET
	const CHAMP_ARENA_AGATHA1_MOVESET
	const CHAMP_ARENA_AGATHA2_MOVESET
	const CHAMP_ARENA_GYM_GUIDE_MOVESET
	const CHAMP_ARENA1_RIVAL1_MOVESET
	const CHAMP_ARENA1_RIVAL2_MOVESET
	const CHAMP_ARENA1_RIVAL3_MOVESET
	const CHAMP_ARENA2_RIVAL1_MOVESET
	const CHAMP_ARENA2_RIVAL2_MOVESET
	const CHAMP_ARENA2_RIVAL3_MOVESET
	const ELITE_FOUR_AGATHA_MOVESET
	const ELITE_FOUR_BRUNO_MOVESET
	const ELITE_FOUR_LANCE_MOVESET
	const ELITE_FOUR_LORELEI_MOVESET
	const ELITE_FOUR_RIVAL1_MOVESET
	const ELITE_FOUR_RIVAL2_MOVESET
	const ELITE_FOUR_RIVAL3_MOVESET
	const GYM_LEADER_BLAINE_MOVESET
	const GYM_LEADER_BROCK_MOVESET
	const GYM_LEADER_ERIKA1_MOVESET
	const GYM_LEADER_ERIKA2_MOVESET
	const GYM_LEADER_ERIKA3_MOVESET
	const GYM_LEADER_GIOVANNI_MOVESET
	const GYM_LEADER_KOGA1_MOVESET
	const GYM_LEADER_KOGA2_MOVESET
	const GYM_LEADER_MISTY_MOVESET
	const GYM_LEADER_SABRINA1_MOVESET
	const GYM_LEADER_SABRINA2_MOVESET
	const GYM_LEADER_SURGE_MOVESET
	const METRONOME_GAMBLER_MOVESET
	const NURSE_JOY_MOVESET
	const OFFICER_JENNY_MOVESET
	const POKE_TOWER_RIVAL2_1_MOVESET
	const POKE_TOWER_RIVAL2_2_MOVESET
	const POKE_TOWER_RIVAL2_3_MOVESET
	const PRE_E4_RIVAL2_1_MOVESET
	const PRE_E4_RIVAL2_2_MOVESET
	const PRE_E4_RIVAL2_3_MOVESET
	const ROCKET_BOSS_GIOVANNI1_MOVESET
	const ROCKET_BOSS_GIOVANNI2_MOVESET
	const SILPH_CO_RIVAL2_1_MOVESET
	const SILPH_CO_RIVAL2_2_MOVESET
	const SILPH_CO_RIVAL2_3_MOVESET
	const SS_ANNE_RIVAL2_1_MOVESET
	const SS_ANNE_RIVAL2_2_MOVESET
	const SS_ANNE_RIVAL2_3_MOVESET

; input d = which moveset
LoadTrainerMoveSet:
	ld hl, MoveSetMappings
	dec d
	ld a, d
	call GetAddressFromPointerArray
	ld d, h
	ld e, l
	ld a, [wEnemyPartyCount]
	ld b, a
	ld hl, wEnemyMon1Moves
.pokemonLoop
	ld c, NUM_MOVES
	push hl
.moveLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .moveLoop
	pop hl
	dec b
	ret z
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	jr .pokemonLoop

MoveSetMappings:
	dw ChampArenaErikaMoveset1
	dw ChampArenaErikaMoveset2
	dw ChampArenaBlaineMoveset1
	dw ChampArenaBlaineMoveset2
	dw ChampArenaSurgeMoveset1
	dw ChampArenaSurgeMoveset2
	dw ChampArenaSabrinaMoveset1
	dw ChampArenaSabrinaMoveset2
	dw ChampArenaBrunoMoveset1
	dw ChampArenaBrunoMoveset2
	dw ChampArenaMistyMoveset1
	dw ChampArenaMistyMoveset2
	dw ChampArenaLanceMoveset1
	dw ChampArenaLanceMoveset2
	dw ChampArenaKogaMoveset1
	dw ChampArenaKogaMoveset2
	dw ChampArenaLoreleiMoveset1
	dw ChampArenaLoreleiMoveset2
	dw ChampArenaBrockMoveset1
	dw ChampArenaBrockMoveset2
	dw ChampArenaAgathaMoveset1
	dw ChampArenaAgathaMoveset2
	dw ChampArenaGymGuideMoveset
	dw ChampArena1RivalMoveset1
	dw ChampArena1RivalMoveset2
	dw ChampArena1RivalMoveset3
	dw ChampArena2RivalMoveset1
	dw ChampArena2RivalMoveset2
	dw ChampArena2RivalMoveset3
	dw EliteFourAgathaMoveset
	dw EliteFourBrunoMoveset
	dw EliteFourLanceMoveset
	dw EliteFourLoreleiMoveset
	dw EliteFourRivalMoveset1
	dw EliteFourRivalMoveset2
	dw EliteFourRivalMoveset3
	dw GymLeaderBlaineMoveset
	dw GymLeaderBrockMoveset
	dw GymLeaderErikaMoveset1
	dw GymLeaderErikaMoveset2
	dw GymLeaderErikaMoveset3
	dw GymLeaderGiovanniMoveset
	dw GymLeaderKogaMoveset1
	dw GymLeaderKogaMoveset2
	dw GymLeaderMistyMoveset
	dw GymLeaderSabrina1Moveset
	dw GymLeaderSabrina2Moveset
	dw GymLeaderSurgeMoveset
	dw MetronomeGamblerMoveset
	dw NurseJoyMoveset
	dw OfficerJennyMoveset
	dw PokeTowerRival2Moveset1
	dw PokeTowerRival2Moveset2
	dw PokeTowerRival2Moveset3
	dw PreE4Rival2Moveset1
	dw PreE4Rival2Moveset2
	dw PreE4Rival2Moveset3
	dw RocketBossGiovanniMoveset1
	dw RocketBossGiovanniMoveset2
	dw SilphRival2Moveset1
	dw SilphRival2Moveset2
	dw SilphRival2Moveset3
	dw SSAnneRival2Moveset1
	dw SSAnneRival2Moveset2
	dw SSAnneRival2Moveset3

ChampArenaErikaMoveset1:
	; gloom
	db ACID
	db SLEEP_POWDER
	db PETAL_DANCE
	db MEGA_DRAIN
	; victreebel
	db SLEEP_POWDER
	db ACID
	db RAZOR_LEAF
	db SLASH
	; tangela
	db BIND
	db STUN_SPORE
	db DOUBLE_EDGE
	db MEGA_DRAIN
	; vileplume
	db ACID
	db MEGA_DRAIN
	db SOLARBEAM
	db BODY_SLAM
	; weepinbell
	db WRAP
	db STUN_SPORE
	db MEGA_DRAIN
	db RAZOR_LEAF
	; exeggutor
	db SLEEP_POWDER
	db LEECH_SEED
	db TOXIC
	db PSYCHIC_M

ChampArenaErikaMoveset2:
	; vileplume
	db STUN_SPORE
	db PETAL_DANCE
	db BODY_SLAM
	db MEGA_DRAIN
	; clefable
	db THUNDERBOLT
	db PSYCHIC_M
	db ICE_BEAM
	db LEECH_SEED
	; tangela
	db BIND
	db TOXIC
	db DOUBLE_EDGE
	db MEGA_DRAIN
	; dewgong
	db BLIZZARD
	db WITHDRAW
	db BODY_SLAM
	db SURF
	; victreebel
	db WRAP
	db MEGA_DRAIN
	db RAZOR_LEAF
	db TOXIC
	; exeggutor
	db SLEEP_POWDER
	db EXPLOSION
	db PSYCHIC_M
	db MEGA_DRAIN

ChampArenaBlaineMoveset1:
	; charizard
	db SLASH
	db FLAMETHROWER
	db FLY
	db EARTHQUAKE
	; arcanine
	db FIRE_BLAST
	db BODY_SLAM
	db DRAGON_RAGE
	db BONEMERANG
	; rapidash
	db AGILITY
	db STOMP
	db FIRE_SPIN
	db HORN_DRILL
	; volcanic magmar
	db BODY_SLAM
	db PSYCHIC_M
	db FIRE_PUNCH
	db CONFUSE_RAY
	; clefable
	db FLAMETHROWER
	db ICE_BEAM
	db THUNDERBOLT
	db THUNDER_WAVE
	; kangaskhan
	db THUNDERBOLT
	db FIRE_BLAST
	db SURF
	db EARTHQUAKE

ChampArenaBlaineMoveset2:
	; moltres
	db SOLARBEAM
	db FLAMETHROWER
	db SKY_ATTACK
	db RAZOR_WIND ; ROOST
	; volcanic magmar
	db BODY_SLAM
	db PSYCHIC_M
	db FIRE_PUNCH
	db CONFUSE_RAY
	; rapidash
	db STOMP
	db FIRE_SPIN
	db TOXIC
	db HORN_DRILL
	; chansey
	db FIRE_BLAST
	db SOFTBOILED
	db MINIMIZE
	db ICE_BEAM
	; mr mime
	db FLASH
	db FIRE_PUNCH
	db SOLARBEAM
	db PSYCHIC_M
	; parasect
	db DOUBLE_TEAM
	db SLASH
	db SOLARBEAM
	db STUN_SPORE

ChampArenaSurgeMoveset1:
	; raichu
	db THUNDER
	db SURF ; RGB Tweaked: illegal move, I know. Surge doesn't play by the rules.
	db BODY_SLAM
	db THUNDER_WAVE
	; voltorb
	db THUNDER
	db SELFDESTRUCT
	db SONICBOOM
	db THUNDER_WAVE
	; electrode
	db SONICBOOM
	db EXPLOSION
	db SWIFT
	db THUNDER
	; pikachu
	db SEISMIC_TOSS
	db AGILITY
	db DOUBLE_TEAM
	db SURF ; RGB Tweaked: illegal move, I know. Surge doesn't play by the rules.
	; magnemite
	db SUPERSONIC
	db DOUBLE_EDGE
	db THUNDERBOLT
	db BIDE
	; floating magneton
	db THUNDERBOLT
	db TRI_ATTACK
	db REFLECT
	db HYPER_BEAM

ChampArenaSurgeMoveset2:
	; raichu
	db THUNDERBOLT
	db SURF ; RGB Tweaked: illegal move, I know. Surge doesn't play by the rules.
	db BODY_SLAM
	db THUNDER_WAVE
	; tangela
	db MEGA_DRAIN
	db STUN_SPORE
	db BIND
	db BODY_SLAM
	; poliwrath
	db AMNESIA
	db ICE_BEAM
	db PSYCHIC_M
	db SUBMISSION
	; lickitung
	db BLIZZARD
	db EARTHQUAKE
	db THUNDERBOLT
	db LICK
	; electabuzz
	db TOXIC
	db THUNDERPUNCH
	db SEISMIC_TOSS
	db PSYCHIC_M
	; electrode
	db SONICBOOM
	db EXPLOSION
	db SWIFT
	db THUNDER

ChampArenaSabrinaMoveset1:
	; alakazam
	db PSYBEAM
	db DISABLE
	db TOXIC
	db DIG
	; kadabra
	db DISABLE
	db PSYCHIC_M
	db REFLECT
	db SEISMIC_TOSS
	; golduck
	db BUBBLEBEAM
	db PSYBEAM
	db THUNDER_WAVE
	db MEGA_DRAIN
	; hypno
	db HYPNOSIS
	db DREAM_EATER
	db CONFUSION
	db MEGA_PUNCH
	; butterfree
	db LEECH_SEED
	db TOXIC
	db MEGA_DRAIN
	db PSYBEAM
	; jynx
	db LOVELY_KISS
	db ICE_PUNCH
	db PSYBEAM
	db BUBBLEBEAM

ChampArenaSabrinaMoveset2:
	; alakazam
	db PSYCHIC_M
	db RECOVER
	db REFLECT
	db DIG
	; snorlax
	db AMNESIA
	db ICE_BEAM
	db REST
	db THUNDERBOLT
	; mr mime
	db LIGHT_SCREEN
	db THUNDER_WAVE
	db PSYCHIC_M
	db SOLARBEAM
	; hypno
	db MEDITATE
	db HYPNOSIS
	db DREAM_EATER
	db MEGA_KICK
	; exeggutor
	db LEECH_SEED
	db MEGA_DRAIN
	db EXPLOSION
	db TOXIC
	; wigglytuff
	db SEISMIC_TOSS
	db BODY_SLAM
	db THUNDERBOLT
	db ICE_BEAM

ChampArenaBrunoMoveset1:
	; hardened onix
	db SCREECH
	db BIND
	db ROCK_SLIDE
	db EARTHQUAKE
	; hitmonchan
	db COUNTER ; DRAIN_PUNCH
	db THUNDERPUNCH
	db ICE_PUNCH
	db DOUBLE_TEAM
	; hitmonlee
	db HI_JUMP_KICK
	db MEDITATE
	db MEGA_KICK
	db DOUBLE_TEAM
	; machamp
	db DEFENSE_CURL
	db COMET_PUNCH
	db HYPER_BEAM
	db SEISMIC_TOSS
	; electabuzz
	db THUNDERPUNCH
	db COUNTER ; DRAIN PUNCH
	db DIG
	db TOXIC
	; rhydon
	db FURY_ATTACK
	db HORN_DRILL
	db BODY_SLAM
	db ROCK_SLIDE

ChampArenaBrunoMoveset2:
	; clefable
	db BODY_SLAM
	db THUNDERBOLT
	db ICE_BEAM
	db PSYCHIC_M
	; muk
	db MINIMIZE
	db SLUDGE
	db THUNDERBOLT
	db EXPLOSION
	; hitmonlee
	db AGILITY
	db EARTHQUAKE
	db SEISMIC_TOSS
	db DOUBLE_TEAM
	; machamp
	db EARTHQUAKE
	db DEFENSE_CURL
	db HYPER_BEAM
	db SEISMIC_TOSS
	; poliwrath
	db AMNESIA
	db PSYCHIC_M
	db SURF
	db THUNDERPUNCH
	; hardened onix
	db ROCK_SLIDE
	db SURF
	db BODY_SLAM
	db EARTHQUAKE

ChampArenaMistyMoveset1:
	; starmie
	db THUNDER
	db SWIFT
	db BUBBLEBEAM
	db THUNDER_WAVE
	; seadra
	db SMOKESCREEN
	db SURF
	db TOXIC
	db ICE_BEAM
	; golduck
	db DISABLE
	db PSYBEAM
	db SURF
	db BODY_SLAM
	; blastoise
	db HYDRO_PUMP
	db BITE
	db DIG
	db SEISMIC_TOSS
	; staryu
	db RECOVER
	db MINIMIZE
	db THUNDERBOLT
	db PSYCHIC_M
	; seel
	db BLIZZARD
	db WITHDRAW
	db SKULL_BASH
	db SURF

ChampArenaMistyMoveset2:
	; starmie
	db RECOVER
	db PSYCHIC_M
	db HYDRO_PUMP
	db THUNDER_WAVE
	; exeggutor
	db MEGA_DRAIN
	db PSYCHIC_M
	db SELFDESTRUCT
	db REFLECT
	; seadra
	db SMOKESCREEN
	db SURF
	db TOXIC
	db ICE_BEAM
	; dugtrio
	db EARTHQUAKE
	db SLAM ; FILTHY SLAM
	db FISSURE
	db ROCK_SLIDE
	; blastoise
	db HYDRO_PUMP
	db BITE
	db DIG
	db SEISMIC_TOSS
	; dewgong
	db AURORA_BEAM
	db WITHDRAW
	db SURF
	db SKULL_BASH

ChampArenaLanceMoveset1:
	; gyarados
	db DRAGON_RAGE
	db HYDRO_PUMP
	db BODY_SLAM
	db THUNDERBOLT
	; winter dragonair
	db THUNDER_WAVE
	db WRAP
	db ICE_BEAM
	db TOXIC
	; aerodactyl
	db SUPERSONIC
	db RAZOR_WIND ; ROOST
	db HYPER_BEAM
	db SKY_ATTACK
	; lapras
	db BLIZZARD
	db THUNDERBOLT
	db SURF
	db CONFUSE_RAY
	; charizard
	db SLASH
	db FLAMETHROWER
	db FIRE_SPIN
	db TOXIC
	; kangaskhan
	db STOMP
	db EARTHQUAKE
	db ROCK_SLIDE
	db SURF

ChampArenaLanceMoveset2:
	; arcanine
	db DRAGON_RAGE
	db FLAMETHROWER
	db HYPER_BEAM
	db BONEMERANG
	; snorlax
	db SELFDESTRUCT
	db DOUBLE_EDGE
	db EARTHQUAKE
	db AMNESIA
	; lapras
	db CONFUSE_RAY
	db ICE_BEAM
	db BODY_SLAM
	db PSYCHIC_M
	; electabuzz
	db THUNDERBOLT
	db THUNDER_WAVE
	db PSYCHIC_M
	db SEISMIC_TOSS
	; charizard
	db SLASH
	db FIRE_BLAST
	db SEISMIC_TOSS
	db EARTHQUAKE
	; kangaskhan
	db BODY_SLAM
	db EARTHQUAKE
	db ROCK_SLIDE
	db SURF

ChampArenaKogaMoveset1:
	; venomoth
	db MEGA_DRAIN
	db SLEEP_POWDER
	db PSYBEAM
	db DOUBLE_EDGE
	; muk
	db SLUDGE
	db MINIMIZE
	db COUNTER ; DRAIN_PUNCH
	db EXPLOSION
	; floating weezing
	db SLUDGE
	db SMOKESCREEN
	db THUNDERBOLT
	db FIRE_BLAST
	; tentacruel
	db GLARE
	db TOXIC
	db HYDRO_PUMP
	db MEGA_DRAIN
	; nidoqueen
	db DOUBLE_KICK
	db THUNDER
	db ICE_BEAM
	db TOXIC
	; nidoking
	db TOXIC
	db FURY_ATTACK
	db THUNDERBOLT
	db SURF

ChampArenaKogaMoveset2:
	; venomoth
	db MEGA_DRAIN
	db SLEEP_POWDER
	db PSYBEAM
	db DOUBLE_EDGE
	; muk
	db SLUDGE
	db MINIMIZE
	db COUNTER ; DRAIN_PUNCH
	db EXPLOSION
	; floating weezing
	db SLUDGE
	db SMOKESCREEN
	db THUNDERBOLT
	db FIRE_BLAST
	; hypno
	db HYPNOSIS
	db PSYCHIC_M
	db COUNTER ; DRAIN_PUNCH
	db SEISMIC_TOSS
	; tangela
	db STUN_SPORE
	db DOUBLE_TEAM
	db GROWTH
	db SOLARBEAM
	; parasect
	db SPORE
	db SLASH
	db MEGA_DRAIN
	db GROWTH

ChampArenaLoreleiMoveset1:
	; dewgong
	db ICE_BEAM
	db SURF
	db WITHDRAW
	db SKULL_BASH
	; cloyster
	db SUPERSONIC
	db CLAMP
	db SPIKE_CANNON
	db ICE_BEAM
	; slowbro
	db SURF
	db PSYCHIC_M
	db THUNDER_WAVE
	db TRI_ATTACK
	; jynx
	db ICE_PUNCH
	db REFLECT
	db LOVELY_KISS
	db THRASH
	; lapras
	db BODY_SLAM
	db CONFUSE_RAY
	db HYDRO_PUMP
	db BLIZZARD
	; winter dragonair
	db TOXIC
	db SURF
	db ICE_BEAM
	db DOUBLE_EDGE

ChampArenaLoreleiMoveset2:
	; wigglytuff
	db BLIZZARD
	db RECOVER
	db TOXIC
	db DOUBLE_EDGE
	; cloyster
	db TOXIC
	db CLAMP
	db ICE_BEAM
	db WITHDRAW
	; exeggutor
	db MEGA_DRAIN
	db PSYCHIC_M
	db EGG_BOMB
	db LEECH_SEED
	; starmie
	db SURF
	db BLIZZARD
	db PSYCHIC_M
	db THUNDER_WAVE
	; omastar
	db HYDRO_PUMP
	db BLIZZARD
	db EARTHQUAKE
	db SEISMIC_TOSS
	; articuno
	db TOXIC
	db ICE_BEAM
	db WHIRLWIND
	db RAZOR_WIND ; ROOST

ChampArenaBrockMoveset1:
	; hardened onix
	db BIND
	db TOXIC
	db EARTHQUAKE
	db ROCK_SLIDE
	; golem
	db ROCK_SLIDE
	db DIG
	db SELFDESTRUCT
	db SEISMIC_TOSS
	; marowak
	db BODY_SLAM
	db FISSURE
	db BONE_CLUB
	db SUBMISSION
	; ninetales
	db SWIFT
	db QUICK_ATTACK
	db FLAMETHROWER
	db FIRE_SPIN
	; omastar
	db HORN_ATTACK
	db SPIKE_CANNON
	db ICE_BEAM
	db SURF
	; kabutops
	db LEECH_LIFE
	db SLASH
	db HYDRO_PUMP
	db BLIZZARD

ChampArenaBrockMoveset2:
	; hardened onix
	db BIND
	db ROCK_SLIDE
	db EARTHQUAKE
	db SCREECH
	; golbat
	db CONFUSE_RAY
	db WING_ATTACK
	db BIDE
	db SKULL_BASH
	; golem
	db ROCK_SLIDE
	db DIG
	db EXPLOSION
	db SEISMIC_TOSS
	; ninetales
	db BIDE
	db CONFUSE_RAY
	db FLAMETHROWER
	db FIRE_SPIN
	; dugtrio
	db DIG
	db HYPER_BEAM
	db ROCK_SLIDE
	db SAND_ATTACK
	; omastar
	db SPIKE_CANNON
	db TOXIC
	db ICE_BEAM
	db SURF

ChampArenaAgathaMoveset1:
	; powered haunter
	db THUNDERBOLT
	db BARRAGE
	db LOVELY_KISS
	db DREAM_EATER
	; golbat
	db SUPERSONIC
	db MEGA_DRAIN
	db SWIFT
	db HAZE
	; arbok
	db ACID_ARMOR
	db WRAP
	db GLARE
	db SLUDGE
	; muk
	db MINIMIZE
	db BODY_SLAM
	db EXPLOSION
	db SLUDGE
	; venusaur
	db LEECH_SEED
	db SOLARBEAM
	db TOXIC
	db MEGA_DRAIN
	; gengar
	db CONFUSE_RAY
	db BIDE
	db EXPLOSION
	db PSYCHIC_M

ChampArenaAgathaMoveset2:
	; jynx
	db LOVELY_KISS
	db REFLECT
	db BLIZZARD
	db PSYCHIC_M
	; alakazam
	db PSYCHIC_M
	db SEISMIC_TOSS
	db THUNDER_WAVE
	db RECOVER
	; arbok
	db ACID_ARMOR
	db GLARE
	db EARTHQUAKE
	db SLUDGE
	; gyarados
	db SURF
	db HYPER_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; venusaur
	db DOUBLE_EDGE
	db SOLARBEAM
	db SLEEP_POWDER
	db MEGA_DRAIN
	; gengar
	db CONFUSE_RAY
	db BARRAGE
	db EXPLOSION
	db PSYCHIC_M

ChampArenaGymGuideMoveset:
	; chansey
	db REFLECT
	db SEISMIC_TOSS
	db SOFTBOILED
	db ICE_BEAM
	; snorlax
	db BODY_SLAM
	db BIDE
	db REST
	db EARTHQUAKE
	; cloyster
	db HYDRO_PUMP
	db BLIZZARD
	db WITHDRAW
	db GLARE
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db RECOVER
	db DISABLE
	; tauros
	db BODY_SLAM
	db BLIZZARD
	db EARTHQUAKE
	db HORN_DRILL
	; missingno
	db RAZOR_WIND ; ROOST
	db HI_JUMP_KICK
	db EARTHQUAKE
	db HYPER_BEAM

; Rival fights 9
ChampArena1RivalMoveset1:
	; exeggutor
	db SOLARBEAM
	db LEECH_SEED
	db DOUBLE_EDGE
	db TOXIC
	; slowbro
	db EARTHQUAKE
	db PSYCHIC_M
	db SEISMIC_TOSS
	db SURF
	; charizard
	db BODY_SLAM
	db FLAMETHROWER
	db EARTHQUAKE
	db TOXIC
	; persian
	db THUNDERBOLT
	db ROLLING_KICK
	db AURORA_BEAM
	db SLASH
	; jolteon
	db THUNDERBOLT
	db THUNDER_WAVE
	db DOUBLE_KICK
	db REFLECT
	; pinsir
	db SWORDS_DANCE
	db TWINEEDLE
	db SEISMIC_TOSS
	db TOXIC

ChampArena1RivalMoveset2:
	; exeggutor
	db SOLARBEAM
	db LEECH_SEED
	db DOUBLE_EDGE
	db TOXIC
	; blastoise
	db EARTHQUAKE
	db BARRAGE
	db SEISMIC_TOSS
	db SURF
	; ninetales
	db BODY_SLAM
	db FLAMETHROWER
	db DIG
	db TOXIC
	; lickitung
	db THUNDERBOLT
	db BARRAGE
	db BLIZZARD
	db DOUBLE_EDGE
	; raichu
	db THUNDERBOLT
	db THUNDER_WAVE
	db HI_JUMP_KICK
	db REFLECT
	; pinsir
	db SWORDS_DANCE
	db TWINEEDLE
	db SEISMIC_TOSS
	db TOXIC

ChampArena1RivalMoveset3:
	; venusaur
	db SOLARBEAM
	db LEECH_SEED
	db DOUBLE_EDGE
	db TOXIC
	; slowbro
	db EARTHQUAKE
	db PSYCHIC_M
	db SEISMIC_TOSS
	db SURF
	; ninetales
	db BODY_SLAM
	db FLAMETHROWER
	db DIG
	db TOXIC
	; fearow
	db SPIKE_CANNON
	db BARRAGE
	db RAZOR_WIND ; ROOST
	db WHIRLWIND
	; electabuzz
	db THUNDERBOLT
	db THUNDER_WAVE
	db COUNTER ; DRAIN PUNCH
	db REFLECT
	; pinsir
	db SWORDS_DANCE
	db TWINEEDLE
	db SEISMIC_TOSS
	db TOXIC

; Rival fights 10
ChampArena2RivalMoveset1:
	; exeggutor
	db PSYCHIC_M
	db LEECH_SEED
	db MEGA_DRAIN
	db TOXIC
	; slowbro
	db EARTHQUAKE
	db PSYCHIC_M
	db AMNESIA
	db BLIZZARD
	; charizard
	db GLARE
	db FLAMETHROWER
	db EARTHQUAKE
	db TOXIC
	; persian
	db THUNDERBOLT
	db SLASH
	db AURORA_BEAM
	db GLARE
	; zapdos
	db THUNDERBOLT
	db THUNDER_WAVE
	db DRILL_PECK
	db BARRAGE
	; pinsir
	db TWINEEDLE
	db BIND
	db SEISMIC_TOSS
	db TOXIC

ChampArena2RivalMoveset2:
	; exeggutor
	db PSYCHIC_M
	db LEECH_SEED
	db MEGA_DRAIN
	db TOXIC
	; blastoise
	db EARTHQUAKE
	db SURF
	db AMNESIA
	db BLIZZARD
	; moltres
	db GLARE
	db FLAMETHROWER
	db SOLARBEAM
	db TOXIC
	; lickitung
	db THUNDERBOLT
	db BARRAGE
	db BLIZZARD
	db THUNDER_WAVE
	; raichu
	db THUNDERBOLT
	db THUNDER_WAVE
	db SEISMIC_TOSS
	db BARRAGE
	; pinsir
	db TWINEEDLE
	db BIND
	db SEISMIC_TOSS
	db TOXIC

ChampArena2RivalMoveset3:
	; venusaur
	db SLUDGE
	db LEECH_SEED
	db MEGA_DRAIN
	db SWORDS_DANCE
	; articuno
	db SURF
	db PSYCHIC_M
	db AMNESIA
	db BLIZZARD
	; ninetales
	db CONFUSE_RAY
	db FLAMETHROWER
	db DIG
	db TOXIC
	; fearow
	db SPIKE_CANNON
	db SUBSTITUTE
	db RAZOR_WIND ; ROOST
	db WHIRLWIND
	; electabuzz
	db THUNDERBOLT
	db THUNDER_WAVE
	db COUNTER ; DRAIN PUNCH
	db PSYCHIC_M
	; pinsir
	db TWINEEDLE
	db BIND
	db SEISMIC_TOSS
	db TOXIC

EliteFourAgathaMoveset:
	; powered haunter
	db MEGA_DRAIN
	db NIGHT_SHADE
	db LOVELY_KISS
	db DREAM_EATER
	; golbat
	db FLY
	db TOXIC
	db SLUDGE
	db DOUBLE_TEAM
	; ninetales
	db AMNESIA
	db BODY_SLAM
	db FLAMETHROWER
	db DIG
	; arbok
	db GLARE
	db ACID_ARMOR
	db SLUDGE
	db WRAP
	; gengar
	db PSYCHIC_M
	db NIGHT_SHADE
	db MEGA_DRAIN
	db THUNDER

EliteFourBrunoMoveset:
	; hitmonchan
	db COMET_PUNCH
	db MEGA_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	; hitmonlee
	db BODY_SLAM
	db ROLLING_KICK
	db HI_JUMP_KICK
	db MEGA_KICK
	; onix
	db EXPLOSION
	db ROCK_SLIDE
	db EARTHQUAKE
	db BIND
	; electabuzz
	db THUNDERPUNCH
	db COUNTER ; DRAIN PUNCH
	db TAKE_DOWN ; HEAT RUSH
	db SCREECH
	; machamp
	db BODY_SLAM
	db ROCK_SLIDE
	db EARTHQUAKE
	db KARATE_CHOP

EliteFourLanceMoveset:
	; dragonite
	db WRAP
	db DRAGON_RAGE
	db THUNDER_WAVE
	db HYPER_BEAM
	; gyarados
	db FLY
	db SURF
	db BODY_SLAM
	db HYPER_BEAM
	; charizard
	db WING_ATTACK
	db FLAMETHROWER
	db HYPER_BEAM
	db EARTHQUAKE
	; aerodactyl
	db WING_ATTACK
	db ROCK_SLIDE
	db EARTHQUAKE
	db HYPER_BEAM
	; dragonite
	db BLIZZARD
	db FIRE_BLAST
	db THUNDER
	db HYPER_BEAM

EliteFourLoreleiMoveset:
	; slowbro
	db EARTHQUAKE
	db BLIZZARD
	db AMNESIA
	db PSYCHIC_M
	; cloyster
	db SURF
	db ICE_BEAM
	db EXPLOSION
	db WITHDRAW
	; dewgong
	db SURF
	db REST
	db ICE_BEAM
	db BLIZZARD
	; seadra
	db SURF
	db BLIZZARD
	db LOVELY_KISS
	db MEGA_DRAIN
	; lapras
	db THUNDERBOLT
	db LOVELY_KISS
	db SURF
	db BLIZZARD

; Rival fights 8
EliteFourRivalMoveset1:
	; venusaur
	db RAZOR_LEAF
	db SLEEP_POWDER
	db GROWTH
	db SLUDGE
	; articuno
	db DRILL_PECK
	db ICE_BEAM
	db AGILITY
	db SURF
	; primeape
	db SONICBOOM
	db EXPLOSION
	db COUNTER ; DRAIN PUNCH
	db THRASH
	; jolteon
	db THUNDERBOLT
	db PIN_MISSILE
	db SLAM ; FILTHY SLAM
	db BODY_SLAM
	; charizard
	db FLAMETHROWER
	db SLASH
	db WING_ATTACK
	db DRAGON_RAGE
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db THUNDERPUNCH
	db RECOVER

EliteFourRivalMoveset2:
	; charizard
	db THUNDERPUNCH
	db SLASH
	db FLAMETHROWER
	db SKY_ATTACK
	; exeggutor
	db PSYCHIC_M
	db SLEEP_POWDER
	db SOLARBEAM
	db EGG_BOMB
	; blastoise
	db SURF
	db WITHDRAW
	db EARTHQUAKE
	db ICE_BEAM
	; machamp
	db COUNTER ; DRAIN PUNCH
	db ROCK_SLIDE
	db BODY_SLAM
	db BIND
	; zapdos
	db DRILL_PECK
	db THUNDERBOLT
	db AGILITY
	db SPIKE_CANNON
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db ICE_PUNCH
	db RECOVER

EliteFourRivalMoveset3:
	; blastoise
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db ICE_BEAM
	db HYDRO_PUMP
	; moltres
	db FLAMETHROWER
	db SKY_ATTACK
	db AGILITY
	db DRAGON_RAGE
	; venusaur
	db SOLARBEAM
	db SLUDGE
	db CONSTRICT ; SIPHON SNAG
	db EARTHQUAKE
	; hitmonlee
	db COUNTER ; DRAIN PUNCH
	db MIRROR_MOVE
	db HI_JUMP_KICK
	db STOMP
	; jynx
	db ICE_BEAM
	db PSYCHIC_M
	db BODY_SLAM
	db SURF
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db FIRE_PUNCH
	db RECOVER

GymLeaderBlaineMoveset:
	; rapidash
	db FIRE_SPIN
	db STRENGTH
	db TAKE_DOWN ; HEAT RUSH
	db HI_JUMP_KICK
	; ninetales
	db FIRE_BLAST
	db CONFUSE_RAY
	db SOLARBEAM
	db FIRE_SPIN
	; magmar
	db FIRE_BLAST
	db PSYCHIC_M
	db CONFUSE_RAY
	db THUNDERPUNCH
	; flareon
	db FIRE_BLAST
	db TRI_ATTACK
	db DIG
	db FLASH
	; arcanine
	db FIRE_BLAST
	db DOUBLE_EDGE
	db DIG
	db AGILITY
	
GymLeaderBrockMoveset:
	; geodude
	db TACKLE
	db HARDEN
	db ROCK_THROW
	db NO_MOVE
	; onix
	db CONSTRICT
	db BIDE
	db SWORDS_DANCE
	db BIND

GymLeaderErikaMoveset1:
	; tangela
	db BIND
	db STUN_SPORE
	db SLEEP_POWDER
	db MEGA_DRAIN
	; victreebel
	db MEGA_DRAIN
	db STUN_SPORE
	db ACID
	db RAZOR_LEAF
	; ivysaur
	db RAZOR_LEAF
	db LEECH_SEED
	db ACID
	db NO_MOVE
	; vileplume
	db ACID
	db PETAL_DANCE
	db STUN_SPORE
	db SLEEP_POWDER

GymLeaderErikaMoveset2:
	; tangela
	db BIND
	db BODY_SLAM
	db SLEEP_POWDER
	db MEGA_DRAIN
	; victreebel
	db SWORDS_DANCE
	db WRAP
	db RAZOR_LEAF
	db SLAM ; FILTHY SLAM
	; venusaur
	db RAZOR_LEAF
	db LEECH_SEED
	db SLAM ; FILTHY SLAM
	db BODY_SLAM
	; vileplume
	db MEGA_DRAIN
	db SLEEP_POWDER
	db SOLARBEAM
	db SLAM ; FILTHY SLAM

GymLeaderErikaMoveset3:
	; tangela
	db MEGA_DRAIN
	db STUN_SPORE
	db SOLARBEAM
	db BIND
	; victreebel
	db RAZOR_LEAF
	db SLAM ; FILTHY SLAM
	db WRAP
	db SWORDS_DANCE
	; venusaur
	db RAZOR_LEAF
	db SOLARBEAM
	db LEECH_SEED
	db BODY_SLAM
	; exeggutor
	db REFLECT
	db EGG_BOMB
	db PSYCHIC_M
	db SLEEP_POWDER
	; vileplume
	db LEECH_SEED
	db PETAL_DANCE
	db SLUDGE
	db SOLARBEAM

GymLeaderGiovanniMoveset:
	; kingler
	db EARTHQUAKE
	db CRABHAMMER
	db SPIKE_CANNON
	db HARDEN
	; persian
	db SLASH
	db HYPER_BEAM
	db BUBBLEBEAM
	db THUNDERBOLT
	; dugtrio
	db EARTHQUAKE
	db STRENGTH
	db FISSURE
	db ROCK_SLIDE
	; nidoqueen
	db EARTHQUAKE
	db ICE_BEAM
	db THUNDERBOLT
	db BODY_SLAM
	; nidoking
	db EARTHQUAKE
	db COUNTER ; DRAIN PUNCH
	db THUNDER
	db SLUDGE
	; rhydon
	db ROCK_SLIDE
	db EARTHQUAKE
	db SUBMISSION
	db THUNDERBOLT

GymLeaderKogaMoveset1:
	; golbat
	db CONFUSE_RAY
	db TOXIC
	db BITE
	db SLUDGE
	; muk
	db ACID_ARMOR
	db MEGA_DRAIN
	db SLAM ; FILTHY SLAM
	db TOXIC
	; tentacruel
	db SURF
	db ICE_BEAM
	db BARRIER
	db SLAM ; FILTHY SLAM
	; venomoth
	db SOLARBEAM
	db DOUBLE_TEAM
	db TOXIC
	db PSYCHIC_M

GymLeaderKogaMoveset2:
	; golbat
	db TOXIC
	db CONFUSE_RAY
	db SLUDGE
	db BITE
	; muk
	db SLUDGE
	db MEGA_DRAIN
	db TOXIC
	db ACID_ARMOR
	; tentacruel
	db BARRIER
	db SURF
	db ICE_BEAM
	db WRAP
	; weezing
	db AMNESIA
	db SLUDGE
	db THUNDERBOLT
	db SELFDESTRUCT
	; venomoth
	db SOLARBEAM
	db DOUBLE_TEAM
	db TOXIC
	db SLUDGE

GymLeaderMistyMoveset:
	; psyduck
	db SCRATCH
	db DISABLE
	db CONFUSION
	db BUBBLEBEAM
	; goldeen
	db TAIL_WHIP
	db SUPERSONIC
	db HORN_ATTACK
	db WATERFALL
	; starmie
	db CONFUSION
	db SWIFT
	db BUBBLEBEAM
	db NO_MOVE

GymLeaderSabrina1Moveset:
	; kadabra
	db PSYBEAM
	db RECOVER
	db MEDITATE
	db REFLECT
	; mr_mime
	db SUBSTITUTE
	db MIMIC
	db LIGHT_SCREEN
	db PSYCHIC_M
	; golduck
	db SURF
	db CONFUSION
	db MEDITATE
	db THUNDERPUNCH
	; alakazam
	db THUNDER_WAVE
	db RECOVER
	db PSYCHIC_M
	db REFLECT

GymLeaderSabrina2Moveset:
	; kadabra
	db REFLECT
	db MEDITATE
	db PSYCHIC_M
	db RECOVER
	; mr_mime
	db LIGHT_SCREEN
	db MIMIC
	db PSYCHIC_M
	db SUBSTITUTE
	; golduck
	db THUNDERPUNCH
	db PSYCHIC_M
	db MEDITATE
	db SURF
	; butterfree
	db CONFUSE_RAY
	db PSYCHIC_M
	db MEGA_DRAIN
	db MIST
	; alakazam
	db THUNDER_WAVE
	db RECOVER
	db PSYCHIC_M
	db REFLECT

GymLeaderSurgeMoveset:
	; voltorb
	db THUNDERSHOCK
	db SCREECH
	db BIDE
	db SELFDESTRUCT
	; magnemite
	db SONICBOOM
	db THUNDERSHOCK
	db THUNDER_WAVE
	db NO_MOVE
	; raichu
	db THUNDERBOLT
	db THUNDER_WAVE
	db BODY_SLAM
	db ICE_PUNCH

MetronomeGamblerMoveset:
	; meowth
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE
	; kadabra
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE
	; machoke
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE

NurseJoyMoveset:
	; kangaskhan
	db REST
	db DOUBLE_TEAM
	db FISSURE
	db DOUBLE_EDGE
	; snorlax
	db REST
	db ICE_BEAM
	db AMNESIA
	db SCREECH
	; starmie
	db RECOVER
	db PSYCHIC_M
	db THUNDER_WAVE
	db SUBSTITUTE
	; porygon
	db REFLECT
	db BLIZZARD
	db RECOVER
	db THUNDER_WAVE
	; exeggutor
	db SOFTBOILED
	db REFLECT
	db DREAM_EATER
	db SLEEP_POWDER
	; chansey
	db SOFTBOILED
	db REFLECT
	db EGG_BOMB
	db THUNDER_WAVE

OfficerJennyMoveset:
	; pidgeot
	db RAZOR_WIND ; ROOST
	db AGILITY
	db SKY_ATTACK
	db TOXIC
	; blastoise
	db SURF
	db EARTHQUAKE
	db ICE_BEAM
	db BODY_SLAM
	; tangela
	db MEGA_DRAIN
	db SLEEP_POWDER
	db MIMIC
	db WRAP
	; gengar
	db PSYCHIC_M
	db SLAM ; FILTHY_SLAM
	db HYPNOSIS
	db THUNDERBOLT
	; parasect
	db SPORE
	db MEGA_DRAIN
	db SLASH
	db LEECH_LIFE
	; arcanine
	db REFLECT
	db FIRE_BLAST
	db BODY_SLAM
	db DIG

RocketBossGiovanniMoveset1:
	; sandslash
	db DIG
	db FURY_ATTACK
	db CUT
	db SHARPEN
	; kangaskhan
	db MEGA_PUNCH
	db SUBMISSION
	db DIZZY_PUNCH
	db NO_MOVE
	; dodrio
	db DRILL_PECK
	db ROLLING_KICK
	db FURY_SWIPES ; DUST CLAW
	db DIG
	; persian
	db HEADBUTT
	db BUBBLEBEAM
	db THUNDERBOLT
	db NO_MOVE

RocketBossGiovanniMoveset2:
	; machoke
	db DIG
	db BODY_SLAM
	db ROCK_SLIDE
	db KARATE_CHOP
	; kangaskhan
	db ICE_PUNCH
	db ROCK_SLIDE
	db SUBMISSION
	db BODY_SLAM
	; kingler
	db SURF
	db KARATE_CHOP
	db BODY_SLAM
	db HARDEN
	; golem
	db EARTHQUAKE
	db ROCK_SLIDE
	db EXPLOSION
	db NO_MOVE
	; persian
	db SLASH
	db BUBBLEBEAM
	db THUNDERBOLT
	db NO_MOVE

; Rival fights 4
SSAnneRival2Moveset1:
	; golbat
	db WING_ATTACK
	db CONFUSE_RAY
	db LEECH_LIFE
	db NO_MOVE
	; raticate
	db HYPER_FANG
	db FLASH
	db DOUBLE_KICK
	db NO_MOVE
	; diglett
	db DIG
	db SAND_ATTACK
	db GROWL
	db NO_MOVE
	; charmeleon
	db FIRE_PUNCH
	db SMOKESCREEN
	db RAGE
	db BITE

SSAnneRival2Moveset2:
	; pidgeotto
	db WING_ATTACK
	db SAND_ATTACK
	db CUT
	db NO_MOVE
	; raticate
	db HYPER_FANG
	db FIRE_PUNCH
	db DOUBLE_KICK
	db NO_MOVE
	; pikachu
	db THUNDERPUNCH
	db HEADBUTT
	db TAIL_WHIP
	db NO_MOVE
	; wartortle
	db BUBBLEBEAM
	db GLARE
	db BODY_SLAM
	db BITE

SSAnneRival2Moveset3:
	; fearow
	db DRILL_PECK
	db LEER
	db SUBMISSION
	db NO_MOVE
	; raticate
	db HYPER_FANG
	db BUBBLEBEAM
	db DOUBLE_KICK
	db NO_MOVE
	; growlithe
	db EMBER
	db QUICK_ATTACK
	db LICK
	db NO_MOVE
	; ivysaur
	db MEGA_DRAIN
	db POISONPOWDER
	db CONSTRICT ; SIPHON SNAG
	db LEECH_SEED

; Rival fights 5
PokeTowerRival2Moveset1:
	; golbat
	db WING_ATTACK
	db SLUDGE
	db CONFUSE_RAY
	db LEECH_LIFE
	; dugtrio
	db DIG
	db DISABLE
	db SAND_ATTACK
	db SLAM ; FILTHY SLAM
	; eevee
	db FLASH
	db HEADBUTT
	db DOUBLE_KICK
	db SAND_ATTACK
	; golduck
	db WATERFALL
	db LOW_KICK
	db CONFUSION
	db REFLECT
	; charmeleon
	db TAKE_DOWN ; HEAT RUSH
	db SLASH
	db RAGE
	db BITE
	
PokeTowerRival2Moveset2:
	; pidgeot
	db WING_ATTACK
	db RAZOR_WIND ; ROOST
	db CUT
	db GLARE
	; eevee
	db SLAM ; FILTHY SLAM
	db HEADBUTT
	db DOUBLE_KICK
	db SAND_ATTACK
	; raichu
	db THUNDERBOLT
	db THUNDER_WAVE
	db HEADBUTT
	db AGILITY
	; exeggcute
	db MEGA_DRAIN
	db SOFTBOILED
	db PSYBEAM
	db LEECH_SEED
	; wartortle
	db WATERFALL
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db BITE

PokeTowerRival2Moveset3:
	; fearow
	db DRILL_PECK
	db RAZOR_WIND ; ROOST
	db SUBMISSION
	db SWIFT
	; jynx
	db ICE_PUNCH
	db PSYBEAM
	db DOUBLESLAP
	db BUBBLEBEAM
	; eevee
	db SLAM ; FILTHY SLAM
	db HEADBUTT
	db DOUBLE_KICK
	db SAND_ATTACK
	; arcanine
	db TAKE_DOWN ; HEAT_RUSH
	db QUICK_ATTACK
	db DIG
	db HYPER_FANG
	; ivysaur
	db RAZOR_LEAF
	db POISONPOWDER
	db CONSTRICT ; SIPHON SNAG
	db MEGA_DRAIN

; Rival fights 6
SilphRival2Moveset1:
	; persian
	db SLASH
	db MIRROR_MOVE
	db LICK
	db SKULL_BASH
	; golduck
	db HYDRO_PUMP
	db PSYCHIC_M
	db AMNESIA
	db SWIFT
	; jolteon
	db THUNDER
	db PIN_MISSILE
	db DOUBLE_KICK
	db QUICK_ATTACK
	; dugtrio
	db EARTHQUAKE
	db DISABLE
	db SAND_ATTACK
	db SLAM ; FILTHY SLAM
	; charizard
	db FLAMETHROWER
	db SLASH
	db WING_ATTACK
	db RAGE

SilphRival2Moveset2:
	; lickitung
	db MEGA_PUNCH
	db BODY_SLAM
	db DISABLE
	db DEFENSE_CURL
	; exeggutor
	db SOLARBEAM
	db SOFTBOILED
	db PSYCHIC_M
	db LEECH_SEED
	; raichu
	db THUNDER
	db WITHDRAW
	db AGILITY
	db HEADBUTT
	; blastoise
	db HYDRO_PUMP
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db ICE_BEAM
	; flareon
	db FIRE_BLAST
	db PIN_MISSILE
	db DOUBLE_KICK
	db QUICK_ATTACK

SilphRival2Moveset3:
	; porygon
	db NIGHT_SHADE
	db RECOVER
	db CONFUSE_RAY
	db TRI_ATTACK
	; jynx
	db ICE_BEAM
	db PSYCHIC_M
	db BODY_SLAM
	db BUBBLEBEAM
	; vaporeon
	db HYDRO_PUMP
	db ROLLING_KICK
	db DOUBLE_KICK
	db QUICK_ATTACK
	; venusaur
	db SOLARBEAM
	db SLUDGE
	db CONSTRICT ; SIPHON SNAG
	db BODY_SLAM
	; arcanine
	db FLAMETHROWER
	db LEER
	db DIG
	db SKULL_BASH

; Rival fights 7
PreE4Rival2Moveset1:
	; primeape
	db SONICBOOM
	db EXPLOSION
	db COUNTER ; DRAIN PUNCH
	db THRASH
	; jolteon
	db THUNDER
	db PIN_MISSILE
	db DOUBLE_KICK
	db QUICK_ATTACK
	; golduck
	db HYDRO_PUMP
	db PSYCHIC_M
	db AMNESIA
	db SWIFT
	; dugtrio
	db EARTHQUAKE
	db DISABLE
	db SUBMISSION
	db SLAM ; FILTHY SLAM
	; persian
	db SLASH
	db MIRROR_MOVE
	db LICK
	db SKULL_BASH
	; charizard
	db FLAMETHROWER
	db SLASH
	db WING_ATTACK
	db RAGE

PreE4Rival2Moveset2:
	; machamp
	db COUNTER ; DRAIN PUNCH
	db ROCK_SLIDE
	db BODY_SLAM
	db BIND
	; raichu
	db THUNDER
	db WITHDRAW
	db SWIFT
	db HEADBUTT
	; blastoise
	db HYDRO_PUMP
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db ICE_BEAM
	; flareon
	db FIRE_BLAST
	db PIN_MISSILE
	db DOUBLE_KICK
	db QUICK_ATTACK
	; exeggutor
	db SOLARBEAM
	db SOFTBOILED
	db PSYCHIC_M
	db LEECH_SEED
	; lickitung
	db MEGA_PUNCH
	db BODY_SLAM
	db DISABLE
	db DEFENSE_CURL

PreE4Rival2Moveset3:
	; hitmonlee
	db COUNTER ; DRAIN PUNCH
	db MIRROR_MOVE
	db HI_JUMP_KICK
	db STOMP
	; porygon
	db NIGHT_SHADE
	db RECOVER
	db CONFUSE_RAY
	db TRI_ATTACK
	; jynx
	db ICE_BEAM
	db PSYCHIC_M
	db BODY_SLAM
	db BUBBLEBEAM
	; vaporeon
	db HYDRO_PUMP
	db ROLLING_KICK
	db DOUBLE_KICK
	db QUICK_ATTACK
	; arcanine
	db FIRE_BLAST
	db LEER
	db DIG
	db SKULL_BASH
	; venusaur
	db SOLARBEAM
	db SLUDGE
	db CONSTRICT ; SIPHON SNAG
	db BODY_SLAM
