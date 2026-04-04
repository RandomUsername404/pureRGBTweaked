	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
	dw KadabraPicFrontAlt, KadabraPicBackSW

	db TELEPORT, PSYWAVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; PureRGB:
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ROLLING_KICK,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	FLASH,\
	SEISMIC_TOSS,\ ; YellowLegacy
	THUNDER_WAVE   ; YellowLegacy
	; end

	db BANK(KadabraPicFrontAlt)
	db BANK(KadabraPicFront)
	db BANK(KadabraPicBack)
	db BANK(KadabraPicBackSW)

	dw KadabraPicFront, KadabraPicBack

