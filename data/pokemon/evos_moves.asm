; PureRGB Tweaked: CHANGED: many learnsets and evolution levels were adjusted versus the original game and PureRGB
; PureRGB: Many pointless empty movesets were removed and pointed to a single empty moveset.
; PureRGB + PureRGB Tweaked: Also some pre-evos had their learnsets combined with their fully evolved forms since they were the same exact data anyway
; See constants/pokemon_data_constants.asm
; Evos+moves data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, min level (1), species
;    * db EVOLVE_TRADE, min level (1), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

EvosMovesPointerTable:
	table_width 2
	dw RhydonEvosMoves
	dw KangaskhanEvosMoves
	dw NidoranMEvosMoves
	dw ClefairyEvosMoves
	dw SpearowEvosMoves
	dw VoltorbEvosMoves
	dw NidokingEvosMoves
	dw SlowbroEvosMoves
	dw IvysaurEvosMoves
	dw ExeggutorEvosMoves
	dw LickitungEvosMoves
	dw ExeggcuteEvosMoves
	dw GrimerEvosMoves
	dw GengarEvosMoves
	dw NidoranFEvosMoves
	dw NidoqueenEvosMoves
	dw CuboneEvosMoves
	dw RhyhornEvosMoves
	dw LaprasEvosMoves
	dw ArcanineEvosMoves
	dw MewEvosMoves
	dw GyaradosEvosMoves
	dw ShellderEvosMoves
	dw TentacoolEvosMoves
	dw GastlyEvosMoves
	dw ScytherEvosMoves
	dw StaryuEvosMoves
	dw BlastoiseEvosMoves
	dw PinsirEvosMoves
	dw TangelaEvosMoves
	dw NothingEvosMoves ; torched
	dw NothingEvosMoves
	dw GrowlitheEvosMoves
	dw OnixEvosMoves
	dw FearowEvosMoves
	dw PidgeyEvosMoves
	dw SlowpokeEvosMoves
	dw KadabraEvosMoves
	dw GravelerEvosMoves
	dw ChanseyEvosMoves
	dw MachokeEvosMoves
	dw MrMimeEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw ArbokEvosMoves
	dw ParasectEvosMoves
	dw PsyduckEvosMoves
	dw DrowzeeEvosMoves
	dw GolemEvosMoves
	dw NothingEvosMoves ; irradiated
	dw MagmarEvosMoves
	dw MagmarEvosMoves ; volcanic magmar
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MagnetonEvosMoves ; floating magneton
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw NothingEvosMoves ; chunky
	dw NothingEvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw WinterDragonairEvosMoves
	dw NothingEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw EeveeEvosMoves
	dw FlareonEvosMoves
	dw JolteonEvosMoves
	dw VaporeonEvosMoves
	dw MachopEvosMoves
	dw ZubatEvosMoves
	dw EkansEvosMoves
	dw ParasEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw NothingEvosMoves ; painless
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw NothingEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw NothingEvosMoves ; the maw
	dw NothingEvosMoves
	dw MukEvosMoves
	dw NothingEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw NothingEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw WeezingEvosMoves ; floating weezing
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw NothingEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw HardenedOnixEvosMoves
	dw MagnemiteEvosMoves
	dw MewtwoEvosMoves
	dw GengarEvosMoves ; powered haunter
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw NothingEvosMoves ; real missingno
	dw NothingEvosMoves ; Fossil Kabutops
	dw NothingEvosMoves ; Fossil aerodactyl
	dw NothingEvosMoves ; GHOST
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

RhyhornEvosMoves: ; same learnset as rhydon below
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
RhydonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TAIL_WHIP ; YellowLegacy
	db 11, FURY_ATTACK ; YellowLegacy
	db 12, BITE ; PureRGB
	db 13, STOMP ; YellowLegacy
	db 15, LOW_KICK ; PureRGB
	db 19, ROCK_THROW ; YellowLegacy
	db 20, HORN_ATTACK ; PureRGB
	db 23, HEADBUTT ; PureRGB
	db 24, DIG ; YellowLegacy
	db 36, SLAM ; PureRGB						FILTHY SLAM
	db 39, ROCK_SLIDE ; YellowLegacy
	db 42, SKULL_BASH ; PureRGB
	db 44, EARTHQUAKE ; YellowLegacy
	db 47, DEFENSE_CURL ; PureRGB
	db 52, MEGA_KICK ; PureRGB
	db 55, HORN_DRILL ; YellowLegacy
	db 56, HYPER_BEAM ; PureRGB
	db 0


KangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER ; YellowLegacy
	db 13, BITE ; YellowLegacy
	db 19, TAIL_WHIP ; YellowLegacy
	db 23, STOMP ; PureRGB
	db 24, MEGA_PUNCH ; YellowLegacy
	db 27, HEADBUTT ; PureRGB
	db 29, DIZZY_PUNCH ; YellowLegacy
	db 30, MIMIC ; PureRGB
	db 36, REST ; PureRGB
	db 37, BODY_SLAM ; YellowLegacy
	db 41, FOCUS_ENERGY ; PureRGB
	db 48, DOUBLE_EDGE ; YellowLegacy
	db 52, HYPER_BEAM ; PureRGB
	db 56, SUBMISSION ; PureRGB
	db 0


NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
	db 6, POISON_STING ; YellowLegacy
	db 8, HORN_ATTACK ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 21, SLAM ; PureRGB							FILTHY SLAM
	db 23, FOCUS_ENERGY ; YellowLegacy
	db 26, GLARE ; PureRGB
	db 30, FURY_ATTACK ; YellowLegacy
	db 37, COUNTER ; PureRGB						DRAIN PUNCH
	db 38, HORN_DRILL ; YellowLegacy
	db 43, EARTHQUAKE ; PureRGB
	db 54, POISON_GAS ; PureRGB
	db 0


NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, POISON_STING ; YellowLegacy
	db 8, HORN_ATTACK ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 25, THRASH ; YellowLegacy
	db 26, SLAM ; PureRGB							FILTHY SLAM
	db 27, FOCUS_ENERGY ; YellowLegacy
	db 28, GLARE ; PureRGB
	db 32, SLUDGE ; YellowLegacy
	db 36, FURY_ATTACK ; YellowLegacy
	db 37, COUNTER ; PureRGB						DRAIN PUNCH
	db 40, EARTHQUAKE ; YellowLegacy
	db 46, HORN_DRILL ; YellowLegacy
	db 57, POISON_GAS ; PureRGB
	db 0



SlowpokeEvosMoves: ; same learnset as slowbro below
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, GROWL ; YellowLegacy
	db 6, WATER_GUN ; YellowLegacy
	db 10, CONFUSION ; YellowLegacy
	db 18, DISABLE ; YellowLegacy
	db 22, HEADBUTT ; YellowLegacy
	db 24, BUBBLEBEAM ; PureRGB
	db 25, PSYBEAM ; YellowLegacy
	db 28, WATERFALL ; YellowLegacy
	db 36, WITHDRAW ; YellowLegacy
	db 37, SLAM ; PureRGB						FILTHY SLAM
	db 40, AMNESIA ; YellowLegacy
	db 45, PSYCHIC_M ; YellowLegacy
	db 0


IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 7, LEECH_SEED ; YellowLegacy
	db 9, VINE_WHIP ; YellowLegacy
	db 16, ACID ; YellowLegacy
	db 19, STUN_SPORE ; PureRGB
	db 22, POISONPOWDER ; YellowLegacy
	db 24, CONSTRICT ; PureRGB					SIPHON SNAG
	db 25, SLEEP_POWDER ; YellowLegacy
	db 29, RAZOR_LEAF ; YellowLegacy
	db 38, GROWTH ; YellowLegacy
	db 42, BODY_SLAM ; YellowLegacy
	db 54, SOLARBEAM ; YellowLegacy
	db 0


ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, POISONPOWDER ; YellowLegacy
	db 13, LEECH_SEED ; YellowLegacy
	db 19, CONFUSION ; YellowLegacy
	db 20, MEGA_DRAIN ; YellowLegacy
	db 25, REFLECT ; YellowLegacy
	db 27, PSYBEAM ; PureRGB
	db 28, STOMP ; YellowLegacy
	db 32, STUN_SPORE ; YellowLegacy
	db 33, BARRAGE ; PureRGB
	db 38, SOFTBOILED ; RGB Tweaked
	db 40, EGG_BOMB ; YellowLegacy
	db 45, PSYCHIC_M ; YellowLegacy
	db 48, SLEEP_POWDER ; YellowLegacy
	db 49, SOLARBEAM ; PureRGB
	db 0


LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, STOMP ; YellowLegacy
	db 13, WRAP ; PureRGB
	db 15, DISABLE ; YellowLegacy
	db 19, HEADBUTT ; YellowLegacy
	db 23, DEFENSE_CURL ; YellowLegacy
	db 28, DIZZY_PUNCH ; PureRGB
	db 31, SLAM ; PureRGB						FILTHY SLAM
	db 32, BODY_SLAM ; YellowLegacy
	db 37, MEDITATE ; PureRGB
	db 39, SCREECH ; YellowLegacy
	db 42, MEGA_PUNCH ; PureRGB
	db 50, HYPER_BEAM ; PureRGB
	db 0


ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
	db 10, POISONPOWDER ; YellowLegacy
	db 13, LEECH_SEED ; YellowLegacy
	db 19, CONFUSION ; YellowLegacy
	db 20, MEGA_DRAIN ; YellowLegacy
	db 25, REFLECT ; YellowLegacy
	db 27, PSYBEAM ; PureRGB
	db 32, STUN_SPORE ; YellowLegacy
	db 33, BARRAGE ; PureRGB
	db 34, SOFTBOILED ; PureRGB
	db 40, EGG_BOMB ; YellowLegacy
	db 45, PSYCHIC_M ; YellowLegacy
	db 48, SLEEP_POWDER ; YellowLegacy
	db 49, SOLARBEAM ; PureRGB
	db 0


GrimerEvosMoves: ; same learnset as muk below
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
MukEvosMoves:
	db 0
; Learnset
	db 10, HARDEN ; YellowLegacy
	db 16, ACID ; YellowLegacy
	db 19, POISON_GAS ; YellowLegacy
	db 24, ACID_ARMOR ; YellowLegacy
	db 26, SLAM ; PureRGB							FILTHY SLAM
	db 27, MINIMIZE ; YellowLegacy
	db 33, SLUDGE ; YellowLegacy
	db 37, BODY_SLAM ; YellowLegacy
	db 41, COUNTER ; PureRGB						DRAIN PUNCH
	db 42, TOXIC ; YellowLegacy
	db 45, SCREECH ; YellowLegacy
	db 50, EXPLOSION ; PureRGB
	db 55, RECOVER ; PureRGB
	db 0



HaunterEvosMoves: ; same learnset as gengar below
; Evolutions
	db EVOLVE_TRADE, 1, GENGAR
	db EVOLVE_LEVEL, 42, GENGAR
GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SMOG ; YellowLegacy
	db 15, PSYWAVE ; YellowLegacy
	db 24, MEGA_DRAIN ; PureRGB
	db 29, BARRAGE ; PureRGB
	db 36, NIGHT_SHADE ; YellowLegacy
	db 41, SLAM ; PureRGB						FILTHY SLAM
	db 46, ICE_PUNCH ; PureRGB
	db 55, HYPNOSIS ; YellowLegacy
	db 56, DREAM_EATER ; YellowLegacy
	db 57, LOVELY_KISS ; PureRGB
	db 0


NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 6, POISON_STING ; YellowLegacy
	db 8, BITE ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 14, FURY_SWIPES ; PureRGB				DUST CLAW
	db 21, SLAM ; PureRGB						FILTHY SLAM
	db 23, TAIL_WHIP ; YellowLegacy
	db 25, ACID_ARMOR ; PureRGB
	db 30, HEADBUTT ; YellowLegacy
	db 31, SLASH ; PureRGB
	db 37, DIZZY_PUNCH ; PureRGB
	db 43, EARTHQUAKE ; PureRGB
	db 54, SUBMISSION ; PureRGB
	db 0


NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 2, TAIL_WHIP ; YellowLegacy
	db 6, POISON_STING ; YellowLegacy
	db 8, HEADBUTT ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 13, FURY_SWIPES ; PureRGB				DUST CLAW
	db 18, BITE ; PureRGB
	db 25, BODY_SLAM ; YellowLegacy
	db 26, SLAM ; PureRGB						FILTHY SLAM
	db 27, ACID_ARMOR ; PureRGB
	db 31, SLASH ; PureRGB
	db 32, SLUDGE ; YellowLegacy
	db 37, DIZZY_PUNCH ; PureRGB
	db 40, EARTHQUAKE ; YellowLegacy
	db 49, DRILL_PECK ; PureRGB
	db 54, SUBMISSION ; PureRGB
	db 0


CuboneEvosMoves: ; same learnset as marowak below
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
MarowakEvosMoves:
	db 0
; Learnset
	db 5, LEER ; YellowLegacy
	db 10, BONE_CLUB ; YellowLegacy
	db 13, TAIL_WHIP ; YellowLegacy
	db 18, HEADBUTT ; YellowLegacy
	db 19, SCREECH ; PureRGB
	db 22, LIGHT_SCREEN ; PureRGB
	db 25, FOCUS_ENERGY ; YellowLegacy
	db 26, COMET_PUNCH ; PureRGB
	db 30, DIG ; PureRGB
	db 31, BONEMERANG ; YellowLegacy
	db 33, BARRAGE ; PureRGB
	db 36, COUNTER ; PureRGB						DRAIN PUNCH
	db 38, THRASH ; YellowLegacy
	db 45, SKULL_BASH ; PureRGB
	db 46, RAGE ; YellowLegacy
	db 47, EARTHQUAKE ; YellowLegacy
	db 50, GLARE ; PureRGB
	db 56, SUBMISSION ; PureRGB
	db 0



LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, MIST ; YellowLegacy
	db 23, AURORA_BEAM ; YellowLegacy
	db 25, BODY_SLAM ; YellowLegacy
	db 30, CONFUSE_RAY ; YellowLegacy
	db 34, WATERFALL ; YellowLegacy
	db 38, ICE_BEAM ; YellowLegacy
	db 46, SING ; YellowLegacy
	db 51, HYDRO_PUMP ; YellowLegacy
	db 55, BLIZZARD ; YellowLegacy
	db 0



GrowlitheEvosMoves: ; same learnset as arcanine below
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, QUICK_ATTACK ; PureRGB
	db 10, LICK ; PureRGB
	db 18, EMBER ; YellowLegacy
	db 19, KINESIS ; PureRGB					FIREWALL
	db 23, LEER ; YellowLegacy
	db 24, HYPER_FANG ; PureRGB
	db 28, TAKE_DOWN ; PureRGB					HEAT_RUSH
	db 35, FLAMETHROWER ; YellowLegacy
	db 36, AGILITY ; YellowLegacy
	db 45, SKULL_BASH ; PureRGB
	db 52, BONEMERANG ; PureRGB
	db 56, FIRE_BLAST ; PureRGB
	db 0


MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TRANSFORM ; YellowLegacy
	db 15, CONFUSION ; YellowLegacy
	db 20, PSYBEAM ; RGB Tweaked
	db 25, MEGA_PUNCH ; RGB Tweaked
	db 30, METRONOME ; YellowLegacy
	db 40, PSYCHIC_M ; YellowLegacy
	db 63, SUBSTITUTE ; PureRGB
	db 75, RECOVER ; RGB Tweaked
	db 0


GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, BITE ; YellowLegacy
	db 22, GUST ; YellowLegacy
	db 25, WATERFALL ; YellowLegacy
	db 28, DRAGON_RAGE ; YellowLegacy
	db 32, LEER ; YellowLegacy
	db 33, BODY_SLAM ; PureRGB
	db 35, THRASH ; YellowLegacy
	db 41, HYDRO_PUMP ; YellowLegacy
	db 52, HYPER_BEAM ; YellowLegacy
	db 0


ShellderEvosMoves: ; same learnset as cloyster below
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
CloysterEvosMoves:
	db 0
; Learnset
	db 10, WATER_GUN ; YellowLegacy
	db 14, SUPERSONIC ; YellowLegacy
	db 17, LEER ; YellowLegacy
	db 20, AURORA_BEAM ; YellowLegacy
	db 23, WITHDRAW ; PureRGB
	db 25, BUBBLEBEAM ; YellowLegacy
	db 32, WATERFALL ; PureRGB
	db 35, ICE_BEAM ; YellowLegacy
	db 36, VICEGRIP ; PureRGB
	db 40, DEFENSE_CURL ; RGB Tweaked
	db 43, CLAMP ; YellowLegacy
	db 46, SPIKE_CANNON ; YellowLegacy
	db 50, BLIZZARD ; YellowLegacy
	db 52, AMNESIA ; PureRGB
	db 55, EXPLOSION ; YellowLegacy
	db 0


TentacoolEvosMoves: ; same learnset as tentacruel below
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
TentacruelEvosMoves:
	db 0
; Learnset
	db 7, SUPERSONIC ; YellowLegacy
	db 8, POISON_STING ; PureRGB
	db 13, WATER_GUN ; YellowLegacy
	db 18, ACID ; YellowLegacy
	db 19, CONSTRICT ; PureRGB						SIPHON SNAG
	db 21, WRAP ; PureRGB
	db 23, BUBBLEBEAM ; YellowLegacy
	db 24, CONFUSE_RAY ; PureRGB
	db 26, MEGA_DRAIN ; PureRGB
	db 35, BARRIER ; YellowLegacy
	db 40, SCREECH ; YellowLegacy
	db 43, SLUDGE ; YellowLegacy
	db 44, PSYBEAM ; PureRGB
	db 50, HYDRO_PUMP ; YellowLegacy
	db 0


GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
	db 10, SMOG ; YellowLegacy
	db 15, PSYWAVE ; YellowLegacy
	db 23, POISON_GAS ; YellowLegacy
	db 24, MEGA_DRAIN ; PureRGB
	db 29, BARRAGE ; PureRGB
	db 36, NIGHT_SHADE ; YellowLegacy
	db 41, SLAM ; PureRGB						FILTHY SLAM
	db 55, HYPNOSIS ; YellowLegacy
	db 56, DREAM_EATER ; YellowLegacy
	db 57, LOVELY_KISS ; PureRGB
	db 0


ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, FOCUS_ENERGY ; YellowLegacy
	db 16, CUT ; YellowLegacy
	db 23, PIN_MISSILE ; PureRGB
	db 24, AGILITY ; YellowLegacy
	db 27, FURY_ATTACK ; PureRGB
	db 30, WING_ATTACK ; YellowLegacy
	db 36, SLASH ; YellowLegacy
	db 42, TWINEEDLE ; YellowLegacy
	db 48, DOUBLE_TEAM ; YellowLegacy
	db 49, HI_JUMP_KICK ; PureRGB
	db 54, SWORDS_DANCE ; YellowLegacy
	db 0


StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
StarmieEvosMoves:
	db 0
; Learnset
	db 7, WATER_GUN ; YellowLegacy
	db 10, CONFUSION ; YellowLegacy
	db 15, SWIFT ; YellowLegacy
	db 18, DISABLE ; PureRGB
	db 22, HARDEN ; YellowLegacy
	db 24, BUBBLEBEAM ; YellowLegacy
	db 27, RECOVER ; YellowLegacy
	db 28, MEGA_DRAIN ; PureRGB
	db 37, MINIMIZE ; YellowLegacy
	db 39, ACID_ARMOR ; PureRGB
	db 40, PSYCHIC_M ; YellowLegacy
	db 42, LIGHT_SCREEN ; YellowLegacy
	db 47, HYDRO_PUMP ; YellowLegacy
	db 0


BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, BUBBLE ; YellowLegacy
	db 10, WATER_GUN ; YellowLegacy
	db 11, LIGHT_SCREEN ; PureRGB
	db 15, BITE ; YellowLegacy
	db 21, BUBBLEBEAM ; YellowLegacy
	db 24, GLARE ; PureRGB
	db 27, BODY_SLAM ; YellowLegacy
	db 31, WITHDRAW ; YellowLegacy
	db 33, WATERFALL ; YellowLegacy
	db 34, COUNTER ; PureRGB						DRAIN PUNCH
	db 42, SKULL_BASH ; YellowLegacy
	db 45, ICE_BEAM ; YellowLegacy
	db 52, HYDRO_PUMP ; YellowLegacy
	db 0


PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, HARDEN ; YellowLegacy
	db 8, FOCUS_ENERGY ; YellowLegacy
	db 21, KARATE_CHOP ; PureRGB
	db 24, VICEGRIP ; PureRGB
	db 25, SEISMIC_TOSS ; YellowLegacy
	db 30, TWINEEDLE ; YellowLegacy
	db 33, SPIKE_CANNON ; PureRGB
	db 36, SUBMISSION ; YellowLegacy
	db 38, EARTHQUAKE ; PureRGB
	db 42, SLASH ; YellowLegacy
	db 45, GUILLOTINE ; YellowLegacy
	db 48, BIND ; YellowLegacy
	db 54, SWORDS_DANCE ; YellowLegacy
	db 0


TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, ABSORB ; YellowLegacy
	db 18, CONSTRICT ; PureRGB					SIPHON SNAG
	db 19, VINE_WHIP ; YellowLegacy
	db 21, POISONPOWDER ; YellowLegacy
	db 23, STUN_SPORE ; YellowLegacy
	db 25, SLEEP_POWDER ; YellowLegacy
	db 30, DEFENSE_CURL ; PureRGB
	db 32, MEGA_DRAIN ; YellowLegacy
	db 34, AMNESIA ; PureRGB
	db 38, RAZOR_LEAF ; PureRGB
	db 42, BODY_SLAM ; YellowLegacy
	db 44, SPORE ; PureRGB
	db 45, GROWTH ; YellowLegacy
	db 48, BIND ; YellowLegacy
	db 49, DREAM_EATER ; PureRGB
	db 54, SELFDESTRUCT ; PureRGB
	db 0


NothingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0


HardenedOnixEvosMoves:
OnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, ROCK_THROW ; YellowLegacy
	db 17, ROAR ; PureRGB
	db 19, DIG ; YellowLegacy
	db 22, LIGHT_SCREEN ; PureRGB
	db 25, RAGE ; YellowLegacy
	db 29, HARDEN ; YellowLegacy
	db 30, CLAMP ; PureRGB
	db 33, AMNESIA ; PureRGB
	db 37, ROCK_SLIDE ; YellowLegacy
	db 38, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 42, SPIKE_CANNON ; PureRGB
	db 43, EARTHQUAKE ; YellowLegacy
	db 45, WITHDRAW ; PureRGB
	db 48, BIND ; YellowLegacy
	db 52, SELFDESTRUCT ; PureRGB
	db 60, DEFENSE_CURL ; RGB Tweaked
	db 0



SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER ; YellowLegacy
	db 10, FURY_ATTACK ; YellowLegacy
	db 13, FURY_SWIPES ; PureRGB						DUST CLAW
	db 14, FOCUS_ENERGY ; YellowLegacy
	db 18, SWIFT ; YellowLegacy
	db 19, WING_ATTACK ; PureRGB
	db 21, MIRROR_MOVE ; YellowLegacy
	db 22, SUBMISSION ; PureRGB
	db 24, DRILL_PECK ; YellowLegacy
	db 26, RAZOR_WIND ; RGB Tweaked					ROOST
	db 28, WHIRLWIND ; YellowLegacy
	db 30, SHARPEN ; YellowLegacy
	db 40, AGILITY ; YellowLegacy
	db 45, SONICBOOM ; PureRGB
	db 50, SPIKE_CANNON ; PureRGB
	db 0


PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, SAND_ATTACK ; YellowLegacy
	db 6, GUST ; PureRGB
	db 12, QUICK_ATTACK ; YellowLegacy
	db 19, WING_ATTACK ; YellowLegacy
	db 21, WHIRLWIND ; YellowLegacy
	db 26, RAZOR_WIND ; PureRGB					ROOST
	db 28, SHARPEN ; PureRGB
	db 32, FURY_ATTACK ; PureRGB
	db 34, AGILITY ; YellowLegacy
	db 35, GLARE ; PureRGB
	db 41, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 48, SKULL_BASH ; PureRGB
	db 49, MIRROR_MOVE ; YellowLegacy
	db 60, HYPER_BEAM ; PureRGB
	db 0


KadabraEvosMoves: ; same learnset as alakazam below
; Evolutions
	db EVOLVE_TRADE, 1, ALAKAZAM
	db EVOLVE_LEVEL, 42, ALAKAZAM
AlakazamEvosMoves:
	db 0
; Learnset
	db 16, CONFUSION ; YellowLegacy
	db 20, DISABLE ; YellowLegacy
	db 27, PSYBEAM ; YellowLegacy
	db 31, RECOVER ; YellowLegacy
	db 38, PSYCHIC_M ; YellowLegacy
	db 42, REFLECT ; YellowLegacy
	db 54, MEDITATE ; PureRGB
	db 0


GravelerEvosMoves: ; same learnset as golem below
; Evolutions
	db EVOLVE_TRADE, 1, GOLEM
	db EVOLVE_LEVEL, 38, GOLEM
GolemEvosMoves:
	db 0
; Learnset
	db 11, HARDEN ; PureRGB
	db 12, ROCK_THROW ; YellowLegacy
	db 13, FURY_SWIPES ; PureRGB						DUST CLAW
	db 19, DEFENSE_CURL ; PureRGB
	db 21, DIG ; YellowLegacy
	db 31, SELFDESTRUCT ; YellowLegacy
	db 32, BARRAGE ; PureRGB
	db 34, GLARE ; PureRGB
	db 40, ROCK_SLIDE ; YellowLegacy
	db 45, EARTHQUAKE ; YellowLegacy
	db 48, EXPLOSION ; YellowLegacy
	db 52, MEGA_KICK ; PureRGB
	db 60, FISSURE ; PureRGB
	db 65, MIRROR_MOVE ; PureRGB
	db 0


ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, DOUBLESLAP ; YellowLegacy
	db 18, SEISMIC_TOSS ; PureRGB
	db 24, SING ; YellowLegacy
	db 30, GROWL ; YellowLegacy
	db 34, BARRAGE ; PureRGB
	db 38, MINIMIZE ; YellowLegacy
	db 41, SOFTBOILED ; PureRGB
	db 44, DEFENSE_CURL ; YellowLegacy
	db 47, EGG_BOMB ; PureRGB
	db 48, LIGHT_SCREEN ; YellowLegacy
	db 50, MEGA_PUNCH ; YellowLegacy
	db 54, DOUBLE_EDGE ; YellowLegacy
	db 0


MachokeEvosMoves: ; same learnset as machamp below
; Evolutions
	db EVOLVE_TRADE, 1, MACHAMP
	db EVOLVE_LEVEL, 38, MACHAMP
MachampEvosMoves:
	db 0
; Learnset
	db 5, LEER ; YellowLegacy
	db 7, FOCUS_ENERGY ; YellowLegacy
	db 15, LOW_KICK ; PureRGB
	db 19, SEISMIC_TOSS ; YellowLegacy
	db 20, DEFENSE_CURL ; PureRGB
	db 23, JUMP_KICK ; PureRGB
	db 28, SUBMISSION ; YellowLegacy
	db 30, BIND ; PureRGB
	db 33, BODY_SLAM ; YellowLegacy
	db 41, KARATE_CHOP ; YellowLegacy
	db 42, ROCK_SLIDE ; PureRGB
	db 44, COMET_PUNCH ; PureRGB
	db 47, MEGA_PUNCH ; PureRGB
	db 52, SKULL_BASH ; PureRGB
	db 56, COUNTER ; PureRGB						DRAIN PUNCH
	db 0


MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, CONFUSION ; YellowLegacy
	db 23, LIGHT_SCREEN ; YellowLegacy
	db 24, REFLECT ; YellowLegacy
	db 25, TELEPORT ; PureRGB
	db 27, DOUBLESLAP ; YellowLegacy
	db 28, MIRROR_MOVE ; PureRGB
	db 31, PSYBEAM ; YellowLegacy
	db 32, SEISMIC_TOSS ; PureRGB
	db 39, MEDITATE ; YellowLegacy
	db 43, PSYCHIC_M ; YellowLegacy
	db 44, SONICBOOM ; PureRGB
	db 47, SUBSTITUTE ; YellowLegacy
	db 50, BARRIER ; YellowLegacy
	db 53, MIMIC ; PureRGB
	db 0


HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 24, STOMP ; PureRGB
	db 25, FOCUS_ENERGY ; YellowLegacy
	db 33, ROLLING_KICK ; YellowLegacy
	db 36, SUBMISSION ; PureRGB
	db 38, JUMP_KICK ; YellowLegacy
	db 41, MIRROR_MOVE ; PureRGB
	db 43, MEDITATE ; YellowLegacy
	db 46, COUNTER ; PureRGB						DRAIN PUNCH
	db 48, HI_JUMP_KICK ; YellowLegacy
	db 53, MEGA_KICK ; YellowLegacy
	db 0


HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, DOUBLE_TEAM ; PureRGB
	db 22, COMET_PUNCH ; PureRGB
	db 25, KARATE_CHOP ; YellowLegacy
	db 33, FIRE_PUNCH ; YellowLegacy
	db 35, ICE_PUNCH ; YellowLegacy
	db 37, THUNDERPUNCH ; YellowLegacy
	db 38, COUNTER ; PureRGB						DRAIN PUNCH
	db 40, DIZZY_PUNCH ; YellowLegacy
	db 42, SUBMISSION ; YellowLegacy
	db 43, MIRROR_MOVE ; PureRGB
	db 48, MEGA_PUNCH ; YellowLegacy
	db 0


EkansEvosMoves: ; same learnset as Arbok below
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, ABSORB ; PureRGB
	db 9, POISON_STING ; YellowLegacy
	db 12, BITE ; YellowLegacy
	db 13, SMOG ; PureRGB
	db 15, ACID ; YellowLegacy
	db 19, CONSTRICT ; PureRGB						SIPHON SNAG
	db 22, SUBSTITUTE ; YellowLegacy
	db 23, MEGA_DRAIN ; PureRGB
	db 25, GLARE ; YellowLegacy
	db 26, SLAM ; PureRGB						FILTHY SLAM
	db 30, SCREECH ; YellowLegacy
	db 31, WITHDRAW ; PureRGB
	db 35, SLUDGE ; YellowLegacy
	db 36, LEECH_LIFE ; PureRGB
	db 38, ACID_ARMOR ; PureRGB
	db 39, WRAP ; YellowLegacy
	db 43, SUPER_FANG ; PureRGB
	db 50, SKULL_BASH ; PureRGB
	db 54, HAZE ; PureRGB
	db 0


ParasEvosMoves: ; same learnset as parasect below
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, STUN_SPORE ; YellowLegacy
	db 8, ABSORB ; YellowLegacy
	db 10, LEECH_LIFE ; YellowLegacy
	db 13, POISONPOWDER ; YellowLegacy
	db 18, CONSTRICT ; PureRGB						SIPHON SNAG
	db 24, SPORE ; YellowLegacy
	db 25, BARRAGE ; PureRGB
	db 27, MEGA_DRAIN ; YellowLegacy
	db 30, SLASH ; YellowLegacy
	db 36, GROWTH ; YellowLegacy
	db 39, SOLARBEAM ; PureRGB
	db 44, EARTHQUAKE ; PureRGB
	db 49, TWINEEDLE ; PureRGB
	db 0


PsyduckEvosMoves: ; same learnset as golduck below
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
GolduckEvosMoves:
	db 0
; Learnset
	db 10, DISABLE ; YellowLegacy
	db 11, PSYWAVE ; PureRGB
	db 13, WATER_GUN ; PureRGB
	db 15, CONFUSION ; YellowLegacy
	db 17, BUBBLEBEAM ; YellowLegacy
	db 23, SCREECH ; YellowLegacy
	db 24, LOW_KICK ; PureRGB
	db 27, REFLECT ; PureRGB
	db 28, TAIL_WHIP ; YellowLegacy
	db 32, WATERFALL ; PureRGB
	db 34, TELEPORT ; PureRGB
	db 38, PSYBEAM ; PureRGB
	db 42, PSYCHIC_M ; YellowLegacy
	db 45, AMNESIA ; YellowLegacy
	db 50, HYDRO_PUMP ; YellowLegacy
	db 51, SWIFT ; PureRGB
	db 60, MEDITATE ; PureRGB
	db 0


DrowzeeEvosMoves: ; same learnset as hypno below
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
HypnoEvosMoves:
	db 0
; Learnset
	db 12, DISABLE ; YellowLegacy
	db 17, CONFUSION ; YellowLegacy
	db 24, HEADBUTT ; YellowLegacy
	db 29, POISON_GAS ; YellowLegacy
	db 32, PSYCHIC_M ; YellowLegacy
	db 33, NIGHT_SHADE ; PureRGB
	db 37, MEDITATE ; YellowLegacy
	db 40, HYPNOSIS ; YellowLegacy
	db 45, DREAM_EATER ; YellowLegacy
	db 0


MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SMOG ; YellowLegacy
	db 15, LEER ; YellowLegacy
	db 20, CONFUSE_RAY ; YellowLegacy
	db 21, ROLLING_KICK ; PureRGB
	db 24, TELEPORT ; PureRGB
	db 30, BARRAGE ; PureRGB
	db 31, FIRE_PUNCH ; YellowLegacy
	db 37, DRAGON_RAGE ; RGB Tweaked
	db 40, SMOKESCREEN ; YellowLegacy
	db 43, FLAMETHROWER ; YellowLegacy
	db 44, EARTHQUAKE ; PureRGB
	db 49, POISON_GAS ; PureRGB
	db 54, FIRE_BLAST ; YellowLegacy
	db 0


ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, THUNDERSHOCK ; YellowLegacy
	db 20, THUNDER_WAVE ; YellowLegacy
	db 25, SCREECH ; YellowLegacy
	db 26, COMET_PUNCH ; PureRGB
	db 31, THUNDERPUNCH ; YellowLegacy
	db 33, COUNTER ; PureRGB						DRAIN PUNCH
	db 37, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 40, LIGHT_SCREEN ; YellowLegacy
	db 42, MEGA_PUNCH ; PureRGB
	db 43, THUNDERBOLT ; YellowLegacy
	db 54, THUNDER ; YellowLegacy
	db 55, HYPER_BEAM ; PureRGB
	db 0



MagnemiteEvosMoves: ; same learnset as magneton below
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, THUNDERSHOCK ; YellowLegacy
	db 11, SUPERSONIC ; YellowLegacy
	db 16, SONICBOOM ; YellowLegacy
	db 19, TELEPORT ; PureRGB
	db 21, THUNDER_WAVE ; YellowLegacy
	db 24, SWIFT ; YellowLegacy
	db 26, PSYBEAM ; PureRGB
	db 27, REFLECT ; YellowLegacy
	db 33, THUNDERBOLT ; YellowLegacy
	db 37, TRI_ATTACK ; YellowLegacy
	db 38, CLAMP ; PureRGB
	db 43, SCREECH ; YellowLegacy
	db 44, CONVERSION ; PureRGB
	db 50, THUNDER ; YellowLegacy
	db 52, SELFDESTRUCT ; PureRGB
	db 0


KoffingEvosMoves: ; same learnset as weezing below
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
WeezingEvosMoves:
	db 0
; Learnset
	db 13, BARRAGE ; PureRGB
	db 17, ROAR ; PureRGB
	db 23, ACID ; YellowLegacy
	db 26, HEADBUTT ; PureRGB
	db 27, SMOKESCREEN ; YellowLegacy
	db 33, SLUDGE ; YellowLegacy
	db 38, AMNESIA ; YellowLegacy
	db 40, SELFDESTRUCT ; YellowLegacy
	db 42, GROWTH ; PureRGB
	db 45, HAZE ; YellowLegacy
	db 46, POISON_GAS ; PureRGB
	db 48, EXPLOSION ; YellowLegacy
	db 50, EGG_BOMB ; PureRGB
	db 0


SeelEvosMoves: ; same learnset as dewgong below
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
DewgongEvosMoves:
	db 0
; Learnset
	db 5, GROWL ; YellowLegacy
	db 13, WATER_GUN ; YellowLegacy
	db 16, AURORA_BEAM ; YellowLegacy
	db 17, HEADBUTT ; PureRGB
	db 21, REST ; YellowLegacy
	db 25, BUBBLEBEAM ; YellowLegacy
	db 26, CONSTRICT ; PureRGB						SIPHON SNAG
	db 32, BODY_SLAM ; PureRGB
	db 39, SKULL_BASH ; PureRGB
	db 40, ICE_BEAM ; YellowLegacy
	db 41, MIST ; PureRGB
	db 43, AMNESIA ; PureRGB
	db 50, BLIZZARD ; YellowLegacy
	db 55, SWIFT ; PureRGB
	db 59, WITHDRAW ; PureRGB
	db 0


DiglettEvosMoves: ; same learnset as dugtrio below
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
DugtrioEvosMoves:
	db 0
; Learnset
	db 13, GROWL ; PureRGB
	db 15, FURY_SWIPES ; PureRGB						DUST CLAW
	db 19, DIG ; YellowLegacy
	db 24, SAND_ATTACK ; YellowLegacy
	db 30, SLAM ; PureRGB						FILTHY SLAM
	db 31, SLASH ; YellowLegacy
	db 35, SCREECH ; YellowLegacy
	db 40, EARTHQUAKE ; YellowLegacy
	db 43, FURY_ATTACK ; PureRGB
	db 49, DISABLE ; PureRGB
	db 55, FISSURE ; YellowLegacy
	db 59, SUBMISSION ; PureRGB
	db 0


TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, HORN_ATTACK ; YellowLegacy
	db 15, LEER ; YellowLegacy
	db 19, STOMP ; YellowLegacy
	db 23, TAIL_WHIP ; YellowLegacy
	db 27, HEADBUTT ; YellowLegacy
	db 29, FURY_ATTACK ; PureRGB
	db 33, BODY_SLAM ; PureRGB
	db 35, RAGE ; YellowLegacy
	db 37, GLARE ; PureRGB
	db 42, SKULL_BASH ; PureRGB
	db 45, THRASH ; YellowLegacy
	db 48, MEGA_KICK ; PureRGB
	db 50, DOUBLE_EDGE ; YellowLegacy
	db 53, HYPER_BEAM ; PureRGB
	db 0


FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER ; YellowLegacy
	db 9, SHARPEN ; YellowLegacy
	db 13, FURY_ATTACK ; YellowLegacy
	db 18, WING_ATTACK ; YellowLegacy
	db 19, KARATE_CHOP ; PureRGB
	db 23, SLASH ; YellowLegacy
	db 24, SWIFT ; PureRGB
	db 28, SWORDS_DANCE ; YellowLegacy
	db 31, DRILL_PECK ; YellowLegacy
	db 32, RAZOR_LEAF ; PureRGB
	db 35, SONICBOOM ; PureRGB
	db 39, AGILITY ; YellowLegacy
	db 40, POISON_GAS ; PureRGB
	db 45, WHIRLWIND ; PureRGB
	db 0


VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
	db 7, ABSORB ; PureRGB
	db 11, SUPERSONIC ; YellowLegacy
	db 13, LEECH_LIFE ; YellowLegacy
	db 14, PIN_MISSILE ; PureRGB
	db 17, CONFUSION ; YellowLegacy
	db 20, POISONPOWDER ; YellowLegacy
	db 29, STUN_SPORE ; YellowLegacy
	db 30, MIRROR_MOVE ; PureRGB
	db 33, PSYBEAM ; YellowLegacy
	db 34, SLUDGE ; PureRGB
	db 36, SLEEP_POWDER ; YellowLegacy
	db 37, DREAM_EATER ; PureRGB
	db 41, PSYCHIC_M ; YellowLegacy
	db 42, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 0


DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, THUNDER_WAVE ; YellowLegacy
	db 20, DRAGON_RAGE ; YellowLegacy
	db 25, AGILITY ; YellowLegacy
	db 29, BODY_SLAM ; PureRGB
	db 33, MIST ; PureRGB
	db 46, WHIRLWIND ; PureRGB
	db 47, SHARPEN ; PureRGB
	db 55, WING_ATTACK ; YellowLegacy
	db 60, HYPER_BEAM ; YellowLegacy
	db 0


DoduoEvosMoves: ; same learnset as dodrio below
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
DodrioEvosMoves:
	db 0
; Learnset
	db 10, FURY_SWIPES ; PureRGB						DUST CLAW
	db 14, DOUBLE_TEAM ; PureRGB
	db 17, STOMP ; PureRGB
	db 20, GROWL ; YellowLegacy
	db 24, FURY_ATTACK ; YellowLegacy
	db 26, ROLLING_KICK ; PureRGB
	db 30, DRILL_PECK ; YellowLegacy
	db 36, RAGE ; YellowLegacy
	db 39, TRI_ATTACK ; YellowLegacy
	db 41, EARTHQUAKE ; PureRGB
	db 45, LOW_KICK ; YellowLegacy
	db 46, JUMP_KICK ; YellowLegacy
	db 49, TWINEEDLE ; PureRGB
	db 51, AGILITY ; YellowLegacy
	db 0


PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, POLIWHIRL
	db 0
; Learnset
	db 6, MIST ; YellowLegacy
	db 9, BUBBLE ; YellowLegacy
	db 13, WATER_GUN ; YellowLegacy
	db 19, CONFUSION ; PureRGB
	db 20, BUBBLEBEAM ; RGB Tweaked
	db 26, WATERFALL ; RGB Tweaked
	db 27, BODY_SLAM ; PureRGB
	db 29, HYPNOSIS ; RGB Tweaked
	db 30, AMNESIA ; RGB Tweaked
	db 40, HYDRO_PUMP ; RGB Tweaked
	db 0


JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, CONFUSION ; YellowLegacy
	db 21, AURORA_BEAM ; PureRGB
	db 23, DOUBLESLAP ; YellowLegacy
	db 31, ICE_PUNCH ; YellowLegacy
	db 34, PSYBEAM ; PureRGB
	db 35, LOVELY_KISS ; YellowLegacy
	db 39, PSYCHIC_M ; YellowLegacy
	db 40, AMNESIA ; PureRGB
	db 42, DREAM_EATER ; PureRGB
	db 43, ICE_BEAM ; YellowLegacy
	db 47, BODY_SLAM ; YellowLegacy
	db 54, BLIZZARD ; YellowLegacy
	db 55, EGG_BOMB ; PureRGB
	db 63, MIST ; PureRGB
	db 0


MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, AGILITY ; YellowLegacy
	db 40, DRILL_PECK ; YellowLegacy
	db 45, FLAMETHROWER ; YellowLegacy
	db 51, FIRE_BLAST ; YellowLegacy
	db 55, SKY_ATTACK ; YellowLegacy
	db 60, FIRE_SPIN ; YellowLegacy
	db 61, DRAGON_RAGE ; PureRGB
	db 75, RAZOR_WIND ; RGB Tweaked					ROOST
	db 0


ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, AGILITY ; YellowLegacy
	db 40, DRILL_PECK ; YellowLegacy
	db 45, ICE_BEAM ; YellowLegacy
	db 51, BLIZZARD ; YellowLegacy
	db 55, SKY_ATTACK ; YellowLegacy
	db 60, MIST ; YellowLegacy
	db 61, WHIRLWIND ; PureRGB
	db 75, RAZOR_WIND ; RGB Tweaked					ROOST
	db 0


ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, AGILITY ; YellowLegacy
	db 40, DRILL_PECK ; YellowLegacy
	db 45, THUNDERBOLT ; YellowLegacy
	db 51, THUNDER ; YellowLegacy
	db 55, SKY_ATTACK ; YellowLegacy
	db 60, LIGHT_SCREEN ; YellowLegacy
	db 61, SPIKE_CANNON ; PureRGB
	db 75, RAZOR_WIND ; RGB Tweaked					ROOST
	db 0


DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0


MeowthEvosMoves: ; same learnset as persian below
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
PersianEvosMoves:
	db 0
; Learnset
	db 8, LICK ; PureRGB
	db 10, FURY_SWIPES ; PureRGB						DUST CLAW
	db 15, BITE ; YellowLegacy
	db 16, DOUBLE_KICK ; PureRGB
	db 18, PAY_DAY ; YellowLegacy
	db 21, HEADBUTT ; PureRGB
	db 22, SCREECH ; YellowLegacy
	db 25, FURY_ATTACK ; PureRGB
	db 33, MIRROR_MOVE ; PureRGB
	db 34, SLASH ; YellowLegacy
	db 45, HYPER_BEAM ; YellowLegacy
	db 46, SKULL_BASH ; PureRGB
	db 0


KrabbyEvosMoves: ; same learnset as kingler below
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
KinglerEvosMoves:
	db 0
; Learnset
	db 14, FURY_SWIPES ; PureRGB						DUST CLAW
	db 17, KARATE_CHOP ; PureRGB
	db 20, VICEGRIP ; YellowLegacy
	db 25, BUBBLEBEAM ; YellowLegacy
	db 26, AGILITY ; PureRGB
	db 29, CUT ; YellowLegacy
	db 30, STOMP ; YellowLegacy
	db 31, SLASH ; PureRGB
	db 35, CRABHAMMER ; YellowLegacy
	db 36, SLAM ; PureRGB						FILTHY SLAM
	db 39, FURY_ATTACK ; PureRGB
	db 40, HARDEN ; YellowLegacy
	db 44, EARTHQUAKE ; PureRGB
	db 50, GUILLOTINE ; YellowLegacy
	db 51, SPIKE_CANNON ; PureRGB
	db 0


VulpixEvosMoves: ; same learnset as ninetales below
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
NinetalesEvosMoves:
	db 0
; Learnset
	db 7, QUICK_ATTACK ; YellowLegacy
	db 9, LICK ; PureRGB
	db 12, DISABLE ; PureRGB
	db 13, ROAR ; YellowLegacy
	db 16, CONFUSE_RAY ; YellowLegacy
	db 25, REFLECT ; YellowLegacy
	db 28, BARRAGE ; PureRGB
	db 32, FLAMETHROWER ; YellowLegacy
	db 37, NIGHT_SHADE ; YellowLegacy
	db 42, FIRE_SPIN ; YellowLegacy
	db 44, AMNESIA ; PureRGB
	db 50, PSYCHIC_M ; PureRGB
	db 56, SONICBOOM ; PureRGB
	db 0


PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
RaichuEvosMoves:
	db 0
; Learnset
	db 6, QUICK_ATTACK ; YellowLegacy
	db 8, THUNDER_WAVE ; YellowLegacy
	db 11, TAIL_WHIP ; YellowLegacy
	db 15, DOUBLE_TEAM ; YellowLegacy
	db 16, FURY_SWIPES ; PureRGB						DUST CLAW
	db 20, THUNDERPUNCH ; YellowLegacy
	db 24, HEADBUTT ; YellowLegacy
	db 30, THUNDERBOLT ; YellowLegacy
	db 36, AGILITY ; YellowLegacy
	db 37, WITHDRAW ; PureRGB
	db 41, THUNDER ; YellowLegacy
	db 50, LIGHT_SCREEN ; YellowLegacy
	db 52, SWIFT ; PureRGB
	db 0


DratiniEvosMoves: ; same learnset as Dragonair below but we need to keep the code separate otherwise the Pokédex would show two different evolutions for Dratini
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, THUNDER_WAVE ; YellowLegacy
	db 20, DRAGON_RAGE ; YellowLegacy
	db 25, AGILITY ; YellowLegacy
	db 29, BODY_SLAM ; PureRGB
	db 33, MIST ; PureRGB
	db 60, HYPER_BEAM ; YellowLegacy
	db 0


DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
WinterDragonairEvosMoves:
	db 0
; Learnset
	db 10, THUNDER_WAVE ; YellowLegacy
	db 20, DRAGON_RAGE ; YellowLegacy
	db 25, AGILITY ; YellowLegacy
	db 29, BODY_SLAM ; PureRGB
	db 33, MIST ; PureRGB
	db 60, HYPER_BEAM ; YellowLegacy
	db 0


KabutoEvosMoves: ; same learnset as Kabutops below
; Evolutions
	db EVOLVE_LEVEL, 40, KABUTOPS
KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, LEER ; YellowLegacy
	db 15, WATER_GUN ; YellowLegacy
	db 19, ABSORB ; YellowLegacy
	db 24, LEECH_LIFE ; PureRGB
	db 25, ROCK_THROW ; YellowLegacy
	db 28, BIND ; PureRGB
	db 33, SHARPEN ; PureRGB
	db 35, MEGA_DRAIN ; YellowLegacy
	db 36, FURY_ATTACK ; PureRGB
	db 39, SLASH ; YellowLegacy
	db 40, SKULL_BASH ; PureRGB
	db 43, SWORDS_DANCE ; YellowLegacy
	db 44, TWINEEDLE ; PureRGB
	db 46, ROCK_SLIDE ; YellowLegacy
	db 49, EARTHQUAKE ; PureRGB
	db 53, HYDRO_PUMP ; YellowLegacy
	db 60, CRABHAMMER ; RGB Tweaked
	db 0


HorseaEvosMoves: ; same learnset as seadra below
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
SeadraEvosMoves:
	db 0
; Learnset
	db 10, WATER_GUN ; YellowLegacy
	db 14, SMOKESCREEN ; YellowLegacy
	db 18, LEER ; YellowLegacy
	db 22, BUBBLEBEAM ; YellowLegacy
	db 24, MEGA_DRAIN ; PureRGB
	db 26, DRAGON_RAGE ; YellowLegacy
	db 27, LOVELY_KISS ; PureRGB
	db 30, AURORA_BEAM ; YellowLegacy
	db 31, PIN_MISSILE ; PureRGB
	db 33, WATERFALL ; YellowLegacy
	db 37, AGILITY ; YellowLegacy
	db 39, DOUBLE_TEAM ; PureRGB
	db 45, HYDRO_PUMP ; YellowLegacy
	db 0


SandshrewEvosMoves: ; same learnset as Sandslash below
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, POISON_STING ; YellowLegacy
	db 10, SAND_ATTACK ; YellowLegacy
	db 14, DIG ; YellowLegacy
	db 15, SHARPEN ; PureRGB
	db 17, PIN_MISSILE ; PureRGB
	db 18, SWIFT ; YellowLegacy
	db 22, SLASH ; YellowLegacy
	db 29, FURY_ATTACK ; PureRGB
	db 30, EARTHQUAKE ; YellowLegacy
	db 42, SWORDS_DANCE ; YellowLegacy
	db 48, TWINEEDLE ; PureRGB
	db 0


OmanyteEvosMoves: ; same learnset as omastar below
; Evolutions
	db EVOLVE_LEVEL, 40, OMASTAR
OmastarEvosMoves:
	db 0
; Learnset
	db 18, BUBBLEBEAM ; YellowLegacy
	db 22, HORN_ATTACK ; YellowLegacy
	db 24, MEGA_DRAIN ; PureRGB
	db 25, ROCK_THROW ; YellowLegacy
	db 27, SPIKE_CANNON ; YellowLegacy
	db 28, WITHDRAW ; PureRGB
	db 30, LEER ; YellowLegacy
	db 31, WATERFALL ; PureRGB
	db 37, ROCK_SLIDE ; YellowLegacy
	db 39, BODY_SLAM ; PureRGB
	db 42, CLAMP ; YellowLegacy
	db 43, DEFENSE_CURL ; PureRGB
	db 46, HYDRO_PUMP ; YellowLegacy
	db 0


JigglypuffEvosMoves: ; same learnset as wigglytuff below
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
WigglytuffEvosMoves:
	db 0
; Learnset
	db 3, POUND ; YellowLegacy
	db 5, DEFENSE_CURL ; YellowLegacy
	db 10, SING ; RGB Tweaked
	db 14, DISABLE ; YellowLegacy
	db 16, DOUBLESLAP ; YellowLegacy
	db 24, REST ; YellowLegacy
	db 30, BODY_SLAM ; YellowLegacy
	db 32, RECOVER ; PureRGB
	db 37, DIZZY_PUNCH ; PureRGB
	db 38, LOVELY_KISS ; YellowLegacy
	db 43, DOUBLE_EDGE ; YellowLegacy
	db 50, EXPLOSION ; PureRGB
	db 60, MINIMIZE ; PureRGB
	db 0


EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 6, TAIL_WHIP ; YellowLegacy
	db 7, SHARPEN ; PureRGB
	db 8, SAND_ATTACK ; YellowLegacy
	db 9, BITE ; YellowLegacy
	db 10, QUICK_ATTACK ; YellowLegacy
	db 14, GROWL ; YellowLegacy
	db 15, ROAR ; PureRGB
	db 17, DOUBLE_KICK ; YellowLegacy
	db 18, STOMP ; PureRGB
	db 22, HEADBUTT ; YellowLegacy
	db 30, FOCUS_ENERGY ; YellowLegacy
	db 31, TRI_ATTACK ; PureRGB
	db 36, JUMP_KICK ; YellowLegacy
	db 0


FlareonEvosMoves: ; Automatically tries to learn EMBER on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN ; PureRGB
	db 8, SAND_ATTACK ; YellowLegacy
	db 10, LEER ; YellowLegacy
	db 14, ROAR ; PureRGB
	db 18, STOMP ; PureRGB
	db 21, KINESIS ; PureRGB					FIREWALL
	db 23, QUICK_ATTACK ; YellowLegacy
	db 25, RAGE ; PureRGB
	db 26, EMBER ; YellowLegacy
	db 28, AGILITY ; PureRGB
	db 30, DOUBLE_KICK ; YellowLegacy
	db 36, FLAMETHROWER ; YellowLegacy
	db 38, GLARE ; PureRGB
	db 39, DOUBLE_EDGE ; YellowLegacy
	db 41, GROWTH ; YellowLegacy
	db 44, SKULL_BASH ; PureRGB
	db 47, FIRE_SPIN ; YellowLegacy
	db 49, MEGA_KICK ; PureRGB
	db 52, FIRE_BLAST ; YellowLegacy
	db 0


JolteonEvosMoves: ; Automatically tries to learn THUNDERSHOCK on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN ; PureRGB
	db 8, SAND_ATTACK ; YellowLegacy
	db 14, ROAR ; PureRGB
	db 18, STOMP ; PureRGB
	db 23, QUICK_ATTACK ; YellowLegacy
	db 25, DOUBLE_TEAM ; PureRGB
	db 26, THUNDERSHOCK ; YellowLegacy
	db 30, DOUBLE_KICK ; YellowLegacy
	db 32, BARRIER ; PureRGB
	db 36, THUNDERBOLT ; YellowLegacy
	db 39, PIN_MISSILE ; YellowLegacy
	db 41, AGILITY ; YellowLegacy
	db 44, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 47, THUNDER_WAVE ; YellowLegacy
	db 52, THUNDER ; YellowLegacy
	db 0


VaporeonEvosMoves: ; Automatically tries to learn WATER_GUN on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN ; PureRGB
	db 8, SAND_ATTACK ; YellowLegacy
	db 14, ROAR ; PureRGB
	db 16, WATER_GUN ; YellowLegacy
	db 18, STOMP ; PureRGB
	db 23, QUICK_ATTACK ; YellowLegacy
	db 26, BUBBLEBEAM ; YellowLegacy
	db 30, BITE ; YellowLegacy
	db 32, WATERFALL ; PureRGB
	db 35, GLARE ; PureRGB
	db 36, AURORA_BEAM ; YellowLegacy
	db 39, MIST ; YellowLegacy
	db 40, HAZE ; YellowLegacy
	db 41, ACID_ARMOR ; YellowLegacy
	db 44, SWIFT ; PureRGB
	db 47, REST ; YellowLegacy
	db 52, HYDRO_PUMP ; YellowLegacy
	db 0


MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
	db 5, LEER ; YellowLegacy
	db 7, FOCUS_ENERGY ; YellowLegacy
	db 15, LOW_KICK ; PureRGB
	db 19, SEISMIC_TOSS ; YellowLegacy
	db 20, DEFENSE_CURL ; PureRGB
	db 23, JUMP_KICK ; PureRGB
	db 28, SUBMISSION ; YellowLegacy
	db 30, BIND ; PureRGB
	db 41, ROCK_SLIDE ; PureRGB
	db 44, COMET_PUNCH ; PureRGB
	db 45, KARATE_CHOP ; YellowLegacy
	db 47, MEGA_PUNCH ; PureRGB
	db 52, SKULL_BASH ; PureRGB
	db 56, COUNTER ; PureRGB						DRAIN PUNCH
	db 0



ZubatEvosMoves: ; same learnset as golbat below
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
GolbatEvosMoves:
	db 0
; Learnset
	db 5, SUPERSONIC ; YellowLegacy
	db 7, GUST ; YellowLegacy
	db 12, BITE ; YellowLegacy
	db 19, CONFUSE_RAY ; YellowLegacy
	db 21, LEECH_LIFE ; PureRGB
	db 23, WING_ATTACK ; YellowLegacy
	db 27, ACID ; YellowLegacy
	db 28, SWORDS_DANCE ; PureRGB
	db 36, SLUDGE ; YellowLegacy
	db 37, SKULL_BASH ; PureRGB
	db 44, SUPER_FANG ; PureRGB
	db 46, HAZE ; YellowLegacy
	db 50, POISON_GAS ; PureRGB
	db 59, SONICBOOM ; PureRGB
	db 0


PoliwhirlEvosMoves: ; same learnset as poliwrath below
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
PoliwrathEvosMoves:
	db 0
; Learnset
	db 6, MIST ; YellowLegacy
	db 10, DOUBLESLAP ; YellowLegacy
	db 13, WATER_GUN ; YellowLegacy
	db 19, CONFUSION ; PureRGB
	db 22, BUBBLEBEAM ; YellowLegacy
	db 25, KARATE_CHOP ; YellowLegacy
	db 30, ICE_PUNCH ; YellowLegacy
	db 31, WATERFALL ; PureRGB
	db 35, BODY_SLAM ; YellowLegacy
	db 36, DIZZY_PUNCH ; PureRGB
	db 43, HYPNOSIS ; YellowLegacy
	db 48, AMNESIA ; YellowLegacy
	db 52, COUNTER ; PureRGB						DRAIN PUNCH
	db 53, HYDRO_PUMP ; YellowLegacy
	db 0


WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
	db 0


KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
	db 7, HARDEN ; YellowLegacy
	db 0


BeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, PIN_MISSILE ; YellowLegacy
	db 12, RAGE ; YellowLegacy
	db 14, LIGHT_SCREEN ; PureRGB
	db 15, FOCUS_ENERGY ; YellowLegacy
	db 17, WING_ATTACK ; PureRGB
	db 18, FURY_ATTACK ; YellowLegacy
	db 21, ACID ; YellowLegacy
	db 27, TWINEEDLE ; YellowLegacy
	db 30, SLUDGE ; YellowLegacy
	db 35, SWORDS_DANCE ; YellowLegacy
	db 40, AGILITY ; YellowLegacy
	db 41, DRILL_PECK ; PureRGB
	db 47, SPIKE_CANNON ; PureRGB
	db 54, HAZE ; PureRGB
	db 0


MankeyEvosMoves: ; same learnset as Primeape below
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
PrimeapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LOW_KICK ; YellowLegacy
	db 12, FURY_SWIPES ; PureRGB						DUST CLAW
	db 15, GLARE ; PureRGB
	db 20, DEFENSE_CURL ; PureRGB
	db 21, KARATE_CHOP ; YellowLegacy
	db 25, RAGE ; PureRGB
	db 27, FOCUS_ENERGY ; YellowLegacy
	db 33, SEISMIC_TOSS ; YellowLegacy
	db 35, VICEGRIP ; PureRGB
	db 39, THRASH ; YellowLegacy
	db 40, COMET_PUNCH ; PureRGB
	db 45, SCREECH ; YellowLegacy
	db 46, COUNTER ; PureRGB						DRAIN PUNCH
	db 51, EXPLOSION ; PureRGB
	db 54, SONICBOOM ; PureRGB
	db 0


VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, ABSORB ; PureRGB
	db 11, SUPERSONIC ; YellowLegacy
	db 13, LEECH_LIFE ; YellowLegacy
	db 14, PIN_MISSILE ; PureRGB
	db 17, CONFUSION ; YellowLegacy
	db 20, POISONPOWDER ; YellowLegacy
	db 25, ACID ; YellowLegacy
	db 27, WING_ATTACK ; PureRGB
	db 29, STUN_SPORE ; YellowLegacy
	db 30, MIRROR_MOVE ; PureRGB
	db 33, PSYBEAM ; YellowLegacy
	db 36, SLEEP_POWDER ; YellowLegacy
	db 37, DREAM_EATER ; PureRGB
	db 41, PSYCHIC_M ; YellowLegacy
	db 42, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 46, SLUDGE ; YellowLegacy
	db 53, SKY_ATTACK ; PureRGB
	db 0


CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
	db 0


MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
	db 7, HARDEN ; YellowLegacy
	db 0


ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, CONFUSION ; YellowLegacy
	db 11, PSYWAVE ; PureRGB
	db 12, LEECH_LIFE ; YellowLegacy
	db 13, POISONPOWDER ; YellowLegacy
	db 14, STUN_SPORE ; YellowLegacy
	db 15, SLEEP_POWDER ; YellowLegacy
	db 18, SUPERSONIC ; YellowLegacy
	db 24, GUST ; YellowLegacy
	db 25, CONFUSE_RAY ; PureRGB
	db 26, PSYBEAM ; YellowLegacy
	db 28, WHIRLWIND ; YellowLegacy
	db 32, PSYCHIC_M ; YellowLegacy
	db 45, DREAM_EATER ; PureRGB
	db 50, MIST ; PureRGB
	db 0


MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 63, BARRIER ; YellowLegacy
	db 66, PSYCHIC_M ; YellowLegacy
	db 70, RECOVER ; YellowLegacy
	db 75, MIST ; YellowLegacy
	db 81, AMNESIA ; YellowLegacy
	db 0


SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 29, HEADBUTT ; YellowLegacy
	db 33, HARDEN ; YellowLegacy
	db 36, REST ; YellowLegacy
	db 41, POISON_GAS ; PureRGB
	db 43, BODY_SLAM ; YellowLegacy
	db 48, DOUBLE_EDGE ; YellowLegacy
	db 55, MEGA_KICK ; PureRGB
	db 56, HYPER_BEAM ; YellowLegacy
	db 59, EXPLOSION ; PureRGB
	db 73, SCREECH ; RGB Tweaked
	db 0


MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 15, TACKLE ; YellowLegacy
	db 0


VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, SONICBOOM ; YellowLegacy
	db 18, BARRAGE ; PureRGB
	db 19, THUNDERSHOCK ; YellowLegacy
	db 22, SELFDESTRUCT ; YellowLegacy
	db 24, THUNDER_WAVE ; PureRGB
	db 26, SWIFT ; YellowLegacy
	db 28, SCREECH ; PureRGB
	db 30, LIGHT_SCREEN ; YellowLegacy
	db 35, THUNDERBOLT ; YellowLegacy
	db 39, REFLECT ; PureRGB
	db 44, EXPLOSION ; YellowLegacy
	db 48, EARTHQUAKE ; RGB Tweaked
	db 50, THUNDER ; YellowLegacy
	db 0


ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
ClefableEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, SING ; PureRGB
	db 15, DOUBLESLAP ; PureRGB
	db 19, MINIMIZE ; YellowLegacy
	db 21, HEADBUTT ; PureRGB
	db 26, DEFENSE_CURL ; YellowLegacy
	db 28, MIMIC ; PureRGB
	db 30, METRONOME ; YellowLegacy
	db 33, LOVELY_KISS ; PureRGB
	db 35, BODY_SLAM ; YellowLegacy
	db 38, PETAL_DANCE ; PureRGB
	db 43, LIGHT_SCREEN ; YellowLegacy
	db 45, HI_JUMP_KICK ; RGB Tweaked
	db 54, DREAM_EATER ; PureRGB
	db 55, LOVELY_KISS ; PureRGB (repeated?)
	db 59, MIST ; PureRGB
	db 0


AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
	db 0


PidgeottoEvosMoves: ; same learnset as pidgeot below
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SAND_ATTACK ; YellowLegacy
	db 6, GUST ; PureRGB
	db 12, QUICK_ATTACK ; YellowLegacy
	db 18, WING_ATTACK ; YellowLegacy
	db 21, WHIRLWIND ; YellowLegacy
	db 26, RAZOR_WIND ; PureRGB					ROOST
	db 29, SHARPEN ; PureRGB
	db 32, FURY_ATTACK ; PureRGB
	db 34, AGILITY ; YellowLegacy
	db 35, GLARE ; PureRGB
	db 40, SKY_ATTACK ; YellowLegacy
	db 43, SLASH ; PureRGB
	db 48, SKULL_BASH ; PureRGB
	db 49, MIRROR_MOVE ; YellowLegacy
	db 60, HYPER_BEAM ; PureRGB
	db 0


BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db 7, LEECH_SEED ; YellowLegacy
	db 9, VINE_WHIP ; YellowLegacy
	db 18, STUN_SPORE ; PureRGB
	db 21, CONSTRICT ; PureRGB						SIPHON SNAG
	db 22, POISONPOWDER ; YellowLegacy
	db 25, SLEEP_POWDER ; YellowLegacy
	db 29, RAZOR_LEAF ; YellowLegacy
	db 38, GROWTH ; YellowLegacy
	db 42, BODY_SLAM ; YellowLegacy
	db 52, SOLARBEAM ; YellowLegacy
	db 0


VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEECH_SEED ; YellowLegacy
	db 9, VINE_WHIP ; YellowLegacy
	db 16, ACID ; YellowLegacy
	db 20, STUN_SPORE ; PureRGB
	db 22, POISONPOWDER ; YellowLegacy
	db 24, CONSTRICT ; PureRGB						SIPHON SNAG
	db 25, SLEEP_POWDER ; YellowLegacy
	db 29, RAZOR_LEAF ; YellowLegacy
	db 36, SLUDGE ; YellowLegacy
	db 38, GROWTH ; YellowLegacy
	db 42, BODY_SLAM ; YellowLegacy
	db 54, SOLARBEAM ; YellowLegacy
	db 0


GoldeenEvosMoves: ; same learnset as seaking below
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
SeakingEvosMoves:
	db 0
; Learnset
	db 7, PECK ; YellowLegacy
	db 10, SUPERSONIC ; YellowLegacy
	db 13, WATER_GUN ; YellowLegacy
	db 15, HORN_ATTACK ; YellowLegacy
	db 17, WATERFALL ; YellowLegacy
	db 18, BUBBLEBEAM ; PureRGB
	db 21, CONFUSE_RAY ; PureRGB
	db 24, FURY_ATTACK ; YellowLegacy
	db 33, DRILL_PECK ; YellowLegacy
	db 35, DOUBLE_EDGE ; PureRGB
	db 38, SKULL_BASH ; PureRGB
	db 43, HORN_DRILL ; YellowLegacy
	db 44, WITHDRAW ; PureRGB
	db 45, MIST ; PureRGB
	db 48, AGILITY ; YellowLegacy
	db 52, TWINEEDLE ; PureRGB
	db 57, HYPER_BEAM ; PureRGB
	db 0


PonytaEvosMoves: ; same learnset as rapidash below
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
RapidashEvosMoves:
	db 0
; Learnset
	db 9, TAIL_WHIP ; PureRGB
	db 18, KINESIS ; PureRGB					FIREWALL
	db 19, STOMP ; YellowLegacy
	db 25, DOUBLE_KICK ; YellowLegacy
	db 26, FOCUS_ENERGY ; PureRGB
	db 28, GROWL ; YellowLegacy
	db 29, HEADBUTT ; PureRGB
	db 33, TAKE_DOWN ; PureRGB					HEAT RUSH
	db 35, AGILITY ; YellowLegacy
	db 36, FIRE_SPIN ; YellowLegacy
	db 37, SWIFT ; PureRGB
	db 39, FLAMETHROWER ; RGB Tweaked
	db 40, FURY_ATTACK ; PureRGB
	db 45, FIRE_BLAST ; YellowLegacy
	db 46, SKULL_BASH ; PureRGB
	db 49, MEGA_KICK ; PureRGB
	db 50, HI_JUMP_KICK ; YellowLegacy
	db 54, SOLARBEAM ; PureRGB
	db 0


RattataEvosMoves: ; same learnset as Raticate below
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, QUICK_ATTACK ; YellowLegacy
	db 9, BITE ; YellowLegacy
	db 12, SHARPEN ; PureRGB
	db 14, HYPER_FANG ; YellowLegacy
	db 19, FOCUS_ENERGY ; YellowLegacy
	db 20, DOUBLE_KICK ; PureRGB
	db 24, DIG ; YellowLegacy
	db 26, RAGE ; PureRGB
	db 28, SUPER_FANG ; YellowLegacy
	db 31, SKULL_BASH ; PureRGB
	db 44, MEGA_PUNCH ; PureRGB
	db 0


NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 8, HORN_ATTACK ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 19, POISON_STING ; YellowLegacy
	db 21, BITE ; YellowLegacy
	db 22, SLAM ; PureRGB						FILTHY SLAM
	db 24, DIG ; YellowLegacy
	db 26, GLARE ; PureRGB
	db 27, FOCUS_ENERGY ; YellowLegacy
	db 32, SLUDGE ; YellowLegacy
	db 36, FURY_ATTACK ; YellowLegacy
	db 37, COUNTER ; PureRGB						DRAIN PUNCH
	db 40, EARTHQUAKE ; YellowLegacy
	db 46, HORN_DRILL ; YellowLegacy
	db 54, POISON_GAS ; PureRGB
	db 0


NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 6, POISON_STING ; YellowLegacy
	db 8, BITE ; YellowLegacy
	db 12, DOUBLE_KICK ; YellowLegacy
	db 14, FURY_SWIPES ; PureRGB						DUST CLAW
	db 21, HEADBUTT ; YellowLegacy
	db 22, SLAM ; PureRGB						FILTHY SLAM
	db 24, DIG ; YellowLegacy
	db 25, ACID_ARMOR ; PureRGB
	db 27, TAIL_WHIP ; YellowLegacy
	db 31, SLASH ; PureRGB
	db 32, SLUDGE ; YellowLegacy
	db 37, DIZZY_PUNCH ; PureRGB
	db 40, EARTHQUAKE ; YellowLegacy
	db 54, SUBMISSION ; PureRGB
	db 0


GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset
	db 11, HARDEN ; PureRGB
	db 12, ROCK_THROW ; YellowLegacy
	db 13, FURY_SWIPES ; PureRGB						DUST CLAW
	db 19, DEFENSE_CURL ; PureRGB
	db 21, DIG ; YellowLegacy
	db 31, SELFDESTRUCT ; YellowLegacy
	db 32, BARRAGE ; PureRGB
	db 34, GLARE ; PureRGB
	db 40, ROCK_SLIDE ; YellowLegacy
	db 45, EARTHQUAKE ; YellowLegacy
	db 48, EXPLOSION ; YellowLegacy
	db 52, MEGA_KICK ; PureRGB
	db 60, FISSURE ; PureRGB
	db 65, MIRROR_MOVE ; PureRGB
	db 0


PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, PSYBEAM ; YellowLegacy
	db 20, RECOVER ; YellowLegacy
	db 21, SONICBOOM ; RGB Tweaked
	db 24, SHARPEN ; YellowLegacy
	db 28, TRI_ATTACK ; YellowLegacy
	db 32, AGILITY ; YellowLegacy
	db 33, CONFUSE_RAY ; RGB Tweaked
	db 35, CONVERSION ; PureRGB
	db 39, NIGHT_SHADE ; RGB Tweaked
	db 40, BARRIER ; YellowLegacy
	db 42, PSYCHIC_M ; PureRGB
	db 50, HYPER_BEAM ; YellowLegacy
	db 54, SELFDESTRUCT ; PureRGB
	db 58, BARRAGE ; RGB Tweaked
	db 65, SLAM ; RGB Tweaked					FILTHY_SLAM
	db 0


AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, BITE ; YellowLegacy
	db 22, SUPERSONIC ; YellowLegacy
	db 27, ROCK_THROW ; YellowLegacy
	db 32, WING_ATTACK ; YellowLegacy
	db 33, SWORDS_DANCE ; PureRGB
	db 38, SKULL_BASH ; PureRGB
	db 40, ROCK_SLIDE ; YellowLegacy
	db 44, EARTHQUAKE ; PureRGB
	db 49, WHIRLWIND ; PureRGB
	db 50, HYPER_BEAM ; YellowLegacy
	db 0


CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db 9, EMBER ; YellowLegacy
	db 12, FURY_SWIPES ; PureRGB						DUST CLAW
	db 13, LEER ; YellowLegacy
	db 15, SMOKESCREEN ; PureRGB
	db 17, RAGE ; YellowLegacy
	db 18, KINESIS ; PureRGB					FIREWALL
	db 19, BITE ; RGB Tweaked
	db 23, FIRE_PUNCH ; RGB Tweaked
	db 28, TAKE_DOWN ; RGB Tweaked					HEAT RUSH
	db 33, SLASH ; YellowLegacy
	db 38, FLAMETHROWER ; YellowLegacy
	db 46, FIRE_SPIN ; YellowLegacy
	db 0


SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db 5, BUBBLE ; YellowLegacy
	db 10, WATER_GUN ; YellowLegacy
	db 11, LIGHT_SCREEN ; PureRGB
	db 15, BITE ; YellowLegacy
	db 21, BUBBLEBEAM ; YellowLegacy
	db 23, GLARE ; PureRGB
	db 27, BODY_SLAM ; YellowLegacy
	db 31, WITHDRAW ; YellowLegacy
	db 33, WATERFALL ; YellowLegacy
	db 34, COUNTER ; PureRGB						DRAIN PUNCH
	db 42, SKULL_BASH ; YellowLegacy
	db 45, ICE_BEAM ; YellowLegacy
	db 52, HYDRO_PUMP ; YellowLegacy
	db 0


CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 9, EMBER ; YellowLegacy
	db 13, LEER ; YellowLegacy
	db 14, FURY_SWIPES ; PureRGB						DUST CLAW
	db 15, SMOKESCREEN ; PureRGB
	db 17, RAGE ; YellowLegacy
	db 20, KINESIS ; PureRGB					FIREWALL
	db 23, BITE ; YellowLegacy
	db 26, FIRE_PUNCH ; RGB Tweaked
	db 30, TAKE_DOWN ; RGB Tweaked					HEAT RUSH
	db 33, SLASH ; YellowLegacy
	db 40, FLAMETHROWER ; YellowLegacy
	db 56, FIRE_SPIN ; YellowLegacy
	db 0


WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db 5, BUBBLE ; YellowLegacy
	db 10, WATER_GUN ; YellowLegacy
	db 11, LIGHT_SCREEN ; PureRGB
	db 15, BITE ; YellowLegacy
	db 21, BUBBLEBEAM ; YellowLegacy
	db 23, GLARE ; PureRGB
	db 27, BODY_SLAM ; YellowLegacy
	db 31, WITHDRAW ; YellowLegacy
	db 33, WATERFALL ; YellowLegacy
	db 34, COUNTER ; PureRGB						DRAIN PUNCH
	db 42, SKULL_BASH ; YellowLegacy
	db 45, ICE_BEAM ; YellowLegacy
	db 52, HYDRO_PUMP ; YellowLegacy
	db 0


CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, EMBER ; YellowLegacy
	db 13, LEER ; YellowLegacy
	db 14, FURY_SWIPES ; PureRGB						DUST CLAW
	db 15, SMOKESCREEN ; PureRGB
	db 17, RAGE ; YellowLegacy
	db 20, KINESIS ; PureRGB					FIREWALL
	db 23, BITE ; YellowLegacy
	db 28, FIRE_PUNCH ; RGB Tweaked
	db 32, TAKE_DOWN ; RGB Tweaked					HEAT_RUSH
	db 33, SLASH ; YellowLegacy
	db 36, WING_ATTACK ; YellowLegacy
	db 42, FLAMETHROWER ; YellowLegacy
	db 56, FIRE_SPIN ; YellowLegacy
	db 0


OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
	db 5, POISONPOWDER ; YellowLegacy
	db 8, LEECH_SEED ; YellowLegacy
	db 13, ABSORB ; YellowLegacy
	db 16, STUN_SPORE ; YellowLegacy
	db 21, ACID ; YellowLegacy
	db 23, NIGHT_SHADE ; PureRGB
	db 25, MEGA_DRAIN ; YellowLegacy
	db 30, SLEEP_POWDER ; YellowLegacy
	db 35, PETAL_DANCE ; YellowLegacy
	db 40, SLUDGE ; YellowLegacy
	db 45, PSYCHIC_M ; PureRGB
	db 50, SOLARBEAM ; YellowLegacy
	db 51, GROWTH ; PureRGB
	db 57, POISON_GAS ; PureRGB
	db 0


GloomEvosMoves: ; same learnset as vileplume below
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
VileplumeEvosMoves:
	db 0
; Learnset
	db 5, POISONPOWDER ; YellowLegacy
	db 8, LEECH_SEED ; YellowLegacy
	db 13, ABSORB ; YellowLegacy
	db 16, STUN_SPORE ; YellowLegacy
	db 21, ACID ; YellowLegacy
	db 23, NIGHT_SHADE ; PureRGB
	db 25, MEGA_DRAIN ; YellowLegacy
	db 30, SLEEP_POWDER ; YellowLegacy
	db 35, PETAL_DANCE ; YellowLegacy
	db 40, SLUDGE ; YellowLegacy
	db 45, PSYCHIC_M ; PureRGB
	db 50, SOLARBEAM ; YellowLegacy
	db 51, GROWTH ; PureRGB
	db 57, POISON_GAS ; PureRGB
	db 0


BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 13, POISONPOWDER ; YellowLegacy
	db 14, WRAP ; PureRGB
	db 21, STUN_SPORE ; YellowLegacy
	db 25, ACID ; YellowLegacy
	db 27, HEADBUTT ; YellowLegacy
	db 29, RAZOR_LEAF ; YellowLegacy
	db 30, SLAM ; PureRGB						FILTHY SLAM
	db 36, SLUDGE ; YellowLegacy
	db 42, VICEGRIP ; PureRGB
	db 48, SLEEP_POWDER ; YellowLegacy
	db 49, EGG_BOMB ; PureRGB
	db 54, SELFDESTRUCT ; PureRGB
	db 58, GROWTH ; PureRGB
	db 0


WeepinbellEvosMoves: ; same learnset as victreebel below
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
VictreebelEvosMoves:
	db 0
; Learnset
	db 13, POISONPOWDER ; YellowLegacy
	db 14, WRAP ; PureRGB
	db 15, VINE_WHIP ; YellowLegacy
	db 21, STUN_SPORE ; YellowLegacy
	db 25, ACID ; YellowLegacy
	db 27, HEADBUTT ; YellowLegacy
	db 29, RAZOR_LEAF ; YellowLegacy
	db 30, SLAM ; PureRGB						FILTHY SLAM
	db 36, SLUDGE ; YellowLegacy
	db 42, VICEGRIP ; PureRGB
	db 48, SLEEP_POWDER ; YellowLegacy
	db 49, EGG_BOMB ; PureRGB
	db 54, SELFDESTRUCT ; PureRGB
	db 58, GROWTH ; PureRGB
	db 0

