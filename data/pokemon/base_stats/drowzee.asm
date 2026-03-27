	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 102 ; base exp

	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
	dw DrowzeePicFront, DrowzeePicBackSW

	db POUND, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; PureRGB:
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	PSYCHIC_M,\
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH,\
	SEISMIC_TOSS,\ ; YellowLegacy
	THUNDER_WAVE   ; YellowLegacy
	; end

	db BANK(DrowzeePicFront)
	db 0
	db BANK(DrowzeePicBack)
	db BANK(DrowzeePicBackSW)

	dw 0, DrowzeePicBack

