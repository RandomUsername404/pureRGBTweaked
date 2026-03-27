; PureRGBnote: ADDED: trainers can have custom movesets by specifying that in their party data

	const_def 1
	const CHAMP_ARENA_ERIKA_MOVESET
	const CHAMP_ARENA_BLAINE_MOVESET
	const CHAMP_ARENA_SURGE_MOVESET
	const CHAMP_ARENA_SABRINA_MOVESET
	const CHAMP_ARENA_BRUNO_MOVESET
	const CHAMP_ARENA_MISTY_MOVESET
	const CHAMP_ARENA_LANCE_MOVESET
	const CHAMP_ARENA_KOGA_MOVESET
	const CHAMP_ARENA_LORELEI_MOVESET
	const CHAMP_ARENA_BROCK_MOVESET
	const CHAMP_ARENA_AGATHA_MOVESET
	const CHAMP_ARENA_GYM_GUIDE_MOVESET
	const CHAMP_ARENA_RIVAL1_MOVESET
	const CHAMP_ARENA_RIVAL2_MOVESET
	const CHAMP_ARENA_RIVAL3_MOVESET
	const ELITE_FOUR_LANCE_MOVESET
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
	const ROCKET_BOSS_GIOVANNI1_MOVESET
	const ROCKET_BOSS_GIOVANNI2_MOVESET

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
	dw ChampArenaErikaMoveset
	dw ChampArenaBlaineMoveset
	dw ChampArenaSurgeMoveset
	dw ChampArenaSabrinaMoveset
	dw ChampArenaBrunoMoveset
	dw ChampArenaMistyMoveset
	dw ChampArenaLanceMoveset
	dw ChampArenaKogaMoveset
	dw ChampArenaLoreleiMoveset
	dw ChampArenaBrockMoveset
	dw ChampArenaAgathaMoveset
	dw ChampArenaGymGuideMoveset
	dw ChampArenaRivalMoveset1
	dw ChampArenaRivalMoveset2
	dw ChampArenaRivalMoveset3
	dw EliteFourLanceMoveset
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
	dw RocketBossGiovanniMoveset1
	dw RocketBossGiovanniMoveset2

ChampArenaErikaMoveset:
	; victreebel
	db SLASH
	db EGG_BOMB
	db SELFDESTRUCT
	db RAZOR_LEAF
	; tangela
	db FLASH
	db SPORE
	db MEGA_DRAIN
	db RAZOR_LEAF
	; chansey
	db SEISMIC_TOSS
	db SOFTBOILED
	db PSYCHIC_M
	db THUNDER
	; butterfree
	db RAZOR_WIND ; ROOST
	db MEDITATE
	db PSYCHIC_M
	db THUNDER_WAVE
	; venusaur
	db GROWTH
	db CONSTRICT ; SIPHON_SNAG
	db SOLARBEAM
	db EARTHQUAKE
	; vileplume
	db PETAL_DANCE
	db POISON_GAS
	db GROWTH
	db PSYCHIC_M

ChampArenaBlaineMoveset:
	; ninetales
	db FLAMETHROWER
	db DISABLE
	db SONICBOOM
	db CONFUSE_RAY
	; volcanic magmar
	db PSYCHIC_M
	db FIRE_PUNCH
	db ICE_PUNCH
	db MEDITATE
	; flareon
	db FLAMETHROWER
	db GLARE
	db DIG
	db FLASH
	; rapidash
	db KINESIS ; FIREWALL
	db HYPER_BEAM
	db SKULL_BASH
	db MEGA_KICK
	; arcanine
	db BONEMERANG
	db FIRE_BLAST
	db SLASH
	db SOLARBEAM
	; moltres
	db FIRE_SPIN
	db SKY_ATTACK
	db RAZOR_WIND ; ROOST
	db FIRE_BLAST

ChampArenaSurgeMoveset:
	; electrode
	db SELFDESTRUCT
	db SWIFT
	db THUNDERBOLT
	db MEGA_DRAIN
	; magneton
	db TRI_ATTACK
	db SONICBOOM
	db CONVERSION
	db THUNDERBOLT
	; electabuzz
	db FIRE_PUNCH
	db ICE_PUNCH
	db HI_JUMP_KICK
	db THUNDERPUNCH
	; jolteon
	db THUNDER
	db FLASH
	db TAKE_DOWN ; HEAT RUSH
	db THUNDER_WAVE
	; raichu
	db WITHDRAW
	db SURF
	db THUNDER
	db SWIFT
	; zapdos
	db DRILL_PECK
	db RAZOR_WIND ; ROOST
	db THUNDER
	db SPIKE_CANNON

ChampArenaSabrinaMoveset:
	; hypno
	db HYPNOSIS
	db PSYCHIC_M
	db ICE_PUNCH
	db FIRE_PUNCH
	; mr mime
	db THUNDER_WAVE
	db GLARE
	db PSYCHIC_M
	db MIRROR_MOVE
	; golduck
	db HYDRO_PUMP
	db TELEPORT
	db PSYBEAM
	db HI_JUMP_KICK
	; alakazam 1
	db TELEPORT
	db PSYCHIC_M
	db FLASH
	db DISABLE
	; butterfree
	db CONFUSE_RAY
	db SLEEP_POWDER
	db PSYCHIC_M
	db MEGA_DRAIN
	; alakazam 2
	db AURORA_BEAM
	db PSYCHIC_M
	db MEDITATE
	db RECOVER

ChampArenaBrunoMoveset:
	; hitmonchan
	db COMET_PUNCH
	db MIRROR_MOVE
	db COUNTER ; DRAIN_PUNCH
	db SLAM ; FILTHY_SLAM
	; hitmonlee
	db HI_JUMP_KICK
	db AGILITY
	db EARTHQUAKE
	db SUBMISSION
	; onix
	db WITHDRAW
	db FLAMETHROWER
	db EARTHQUAKE
	db ROCK_SLIDE
	; fearow
	db MIRROR_MOVE
	db DRILL_PECK
	db SUBMISSION
	db SPIKE_CANNON
	; primeape
	db EXPLOSION
	db COMET_PUNCH
	db SONICBOOM
	db KARATE_CHOP
	; machamp
	db DEFENSE_CURL
	db COMET_PUNCH
	db COUNTER ; DRAIN_PUNCH
	db EARTHQUAKE

ChampArenaMistyMoveset:
	; staryu
	db SWIFT
	db SURF
	db RECOVER
	db MEGA_DRAIN
	; seaking
	db WATERFALL
	db HYPER_BEAM
	db TWINEEDLE
	db WITHDRAW
	; seadra
	db LOVELY_KISS
	db DRAGON_RAGE
	db SURF
	db FLASH
	; wigglytuff
	db RECOVER
	db DIZZY_PUNCH
	db HYPER_BEAM
	db FLAMETHROWER
	; vaporeon
	db SWIFT
	db HYDRO_PUMP
	db MEGA_DRAIN
	db FLASH
	; starmie
	db PSYCHIC_M
	db HYDRO_PUMP
	db RECOVER
	db THUNDER_WAVE

ChampArenaLanceMoveset:
	; gyarados
	db SURF
	db EARTHQUAKE
	db THUNDERBOLT
	db BODY_SLAM
	; dragonair
	db THUNDER_WAVE
	db ICE_BEAM
	db FLAMETHROWER
	db FLASH
	; seadra
	db DRAGON_RAGE
	db WATERFALL
	db FIRE_BLAST
	db AMNESIA
	; dragonite 1
	db KARATE_CHOP
	db RAZOR_WIND ; ROOST
	db SHARPEN
	db WHIRLWIND
	; aerodactyl
	db RAZOR_WIND ; ROOST
	db SKULL_BASH
	db WHIRLWIND
	db SWORDS_DANCE
	; dragonite 2
	db HYPER_BEAM
	db THUNDER
	db RAZOR_WIND ; ROOST
	db DRAGON_RAGE

ChampArenaKogaMoveset:
	; tentacruel
	db MEGA_DRAIN
	db CONSTRICT ; SIPHON_SNAG
	db TOXIC
	db SURF
	; scyther
	db TWINEEDLE
	db SKY_ATTACK
	db SLASH
	db RAZOR_WIND ; ROOST
	; muk
	db GROWTH
	db POISON_GAS
	db COUNTER ; DRAIN_PUNCH
	db EXPLOSION 
	; parasect
	db SPORE
	db TWINEEDLE
	db GROWTH
	db SOLARBEAM
	; venomoth
	db SLEEP_POWDER
	db MIRROR_MOVE
	db SLUDGE
	db LEECH_LIFE
	; weezing
	db EGG_BOMB
	db POISON_GAS
	db GROWTH
	db FIRE_BLAST

ChampArenaLoreleiMoveset:
	; dewgong
	db WITHDRAW
	db BLIZZARD
	db SURF
	db CONSTRICT ; SIPHON_SNAG
	; slowbro
	db WITHDRAW
	db PSYCHIC_M
	db SURF
	db FIRE_PUNCH
	; jynx
	db LOVELY_KISS
	db ICE_PUNCH
	db THUNDERPUNCH
	db PSYCHIC_M
	; winter dragonair
	db MEGA_DRAIN
	db SURF
	db ICE_BEAM
	db THUNDERBOLT
	; lapras
	db BLIZZARD
	db HYDRO_PUMP
	db SOLARBEAM
	db FLASH
	; articuno
	db RAZOR_WIND ; ROOST
	db ICE_BEAM
	db PSYCHIC_M
	db WHIRLWIND

ChampArenaBrockMoveset:
	; golem
	db ROCK_SLIDE
	db EARTHQUAKE
	db MIRROR_MOVE
	db MEGA_KICK
	; kangaskhan
	db DIZZY_PUNCH
	db COMET_PUNCH
	db BODY_SLAM
	db EARTHQUAKE
	; kabutops
	db TWINEEDLE
	db ROCK_SLIDE
	db LEECH_LIFE
	db SWORDS_DANCE
	; omastar
	db WITHDRAW
	db DEFENSE_CURL
	db SURF
	db MEGA_DRAIN 
	; aerodactyl
	db RAZOR_WIND ; ROOST
	db SKULL_BASH
	db WHIRLWIND
	db SLASH
	; onix
	db WITHDRAW
	db SELFDESTRUCT
	db EARTHQUAKE
	db SPIKE_CANNON

ChampArenaAgathaMoveset:
	; marowak
	db BONEMERANG
	db BARRAGE
	db COMET_PUNCH
	db SKULL_BASH
	; mr mime
	db PSYCHIC_M
	db SONICBOOM
	db TELEPORT
	db ICE_PUNCH
	; ninetales
	db FLAMETHROWER
	db SONICBOOM
	db CONFUSE_RAY
	db SOLARBEAM
	; arbok
	db WITHDRAW
	db LEECH_LIFE
	db SUPER_FANG
	db ACID
	; tangela
	db MEGA_DRAIN
	db FLASH
	db SELFDESTRUCT
	db SPORE
	; gengar
	db BARRAGE
	db ICE_PUNCH
	db MEGA_DRAIN
	db THUNDERBOLT

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

ChampArenaRivalMoveset1:
	; articuno
	db ICE_BEAM
	db RAZOR_WIND ; ROOST
	db PSYCHIC_M
	db FLY
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; exeggutor
	db PSYCHIC_M
	db SOLARBEAM
	db SLEEP_POWDER
	db EGG_BOMB
	; snorlax
	db BODY_SLAM
	db REST
	db KARATE_CHOP
	db SLASH
	; charizard
	db RAZOR_WIND ; ROOST
	db FLAMETHROWER
	db SKY_ATTACK
	db EARTHQUAKE

ChampArenaRivalMoveset2:
	; moltres
	db FLAMETHROWER
	db RAZOR_WIND ; ROOST
	db SKY_ATTACK
	db SOLARBEAM
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; tauros
	db BODY_SLAM
	db SKULL_BASH
	db MEGA_KICK
	db FURY_ATTACK
	; gengar
	db BARRAGE
	db PSYCHIC_M
	db LOVELY_KISS
	db MEGA_DRAIN
	; blastoise
	db HYDRO_PUMP
	db WITHDRAW
	db COUNTER ; DRAIN_PUNCH
	db ICE_BEAM

ChampArenaRivalMoveset3:
	; zapdos
	db THUNDERBOLT
	db RAZOR_WIND ; ROOST
	db SPIKE_CANNON
	db THUNDER_WAVE
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; kingler
	db CRABHAMMER
	db EARTHQUAKE
	db SPIKE_CANNON
	db VICEGRIP
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; gyarados
	db SURF
	db EARTHQUAKE
	db THUNDERBOLT
	db STRENGTH
	; venusaur
	db SLEEP_POWDER
	db RAZOR_LEAF
	db SLUDGE
	db DRAGON_RAGE

EliteFourLanceMoveset:
	; gyarados
	db HYPER_BEAM
	db HYDRO_PUMP
	db FLAMETHROWER
	db DRAGON_RAGE
	; dragonair
	db HYPER_BEAM
	db DRAGON_RAGE
	db THUNDER_WAVE
	db BODY_SLAM
	; seadra
	db MEGA_DRAIN
	db BARRAGE
	db DRAGON_RAGE
	db HYDRO_PUMP
	; dragonite
	db DRAGON_RAGE
	db ICE_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; aerodactyl
	db SWORDS_DANCE
	db SKULL_BASH
	db EARTHQUAKE
	db WHIRLWIND
	; dragonite
	db HYPER_BEAM
	db WHIRLWIND
	db RAZOR_WIND ; ROOST
	db DRAGON_RAGE

EliteFourRivalMoveset1:
	; articuno
	db ICE_BEAM
	db BLIZZARD
	db AGILITY
	db WHIRLWIND
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; exeggutor
	db PSYCHIC_M
	db SLEEP_POWDER
	db SOLARBEAM
	db EGG_BOMB
	; snorlax
	db POISON_GAS
	db HYPER_BEAM
	db MEGA_KICK
	db EXPLOSION
	; charizard
	db THUNDERPUNCH
	db SLASH
	db FLAMETHROWER
	db SKY_ATTACK

EliteFourRivalMoveset2:
	; moltres
	db FLAMETHROWER
	db SKY_ATTACK
	db AGILITY
	db DRAGON_RAGE
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; tauros
	db GLARE
	db SKULL_BASH
	db MEGA_KICK
	db BODY_SLAM
	; gengar
	db DREAM_EATER
	db SLUDGE
	db ICE_PUNCH
	db LOVELY_KISS
	; blastoise
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db ICE_BEAM
	db HYDRO_PUMP

EliteFourRivalMoveset3:
	; zapdos
	db DRILL_PECK
	db THUNDERBOLT
	db AGILITY
	db SPIKE_CANNON
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; kingler
	db CRABHAMMER
	db FURY_ATTACK
	db EARTHQUAKE
	db SPIKE_CANNON
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; gyarados
	db HYDRO_PUMP
	db HYPER_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; venusaur
	db RAZOR_LEAF
	db SLEEP_POWDER
	db GROWTH
	db SLAM ; FILTHY_SLAM

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
