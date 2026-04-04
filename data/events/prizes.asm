; PureRGBnote: CHANGED: different prize pokemon and TMs

PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db JYNX
	db ELECTABUZZ
	db "@"

PrizeMenuMon1Cost:
	bcd2 400
	bcd2 750
	bcd2 750
	db "@"

PrizeMenuMon2Entries:
	db DITTO
	db DRATINI
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 1000
	bcd2 3000
	bcd2 5000
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 1500
	bcd2 3000
	bcd2 4000
	db "@"
