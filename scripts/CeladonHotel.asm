CeladonHotel_Script:
	call EnableAutoTextBoxDrawing
	; RGB Tweaked: Coin Grandpa
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	jr z, .skipClearRequest
	xor a
	ld [wCoinGrandpaRequestedMon], a
	res BIT_CUR_MAP_LOADED_1, [hl]
.skipClearRequest
	call CeladonHotelPickRandomMon
	;;;;;;;;;
	ld hl, CeladonHotelTrainerHeaders
	ld de, CeladonHotel_ScriptPointers
	ld a, [wCeladonHotelCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonHotelCurScript], a
	ret


CeladonHotel_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CELADONHOTEL_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CELADONHOTEL_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CELADONHOTEL_END_BATTLE
	dw_const CeladonLaprasGuyLeaves,                SCRIPT_CELADONHOTEL_LAPRAS_GUY_LEAVES
	dw_const CeladonLaprasGuyGoesThroughDoor,       SCRIPT_CELADONHOTEL_LAPRAS_GUY_LEAVES_THROUGH_DOOR
	dw_const CeladonLaprasGuyWaitingForLoserToMove, SCRIPT_CELADONHOTEL_LAPRAS_GUY_WAITING_FOR_LOSER_TO_MOVE

CeladonHotel_TextPointers:
	def_text_pointers
	dw_const CeladonChannelerText,      TEXT_CELADONHOTEL_CHANNELER
	dw_const CeladonHotelGrannyText,    TEXT_CELADONHOTEL_GRANNY
	dw_const CeladonHotelBeautyText,    TEXT_CELADONHOTEL_BEAUTY
	dw_const CeladonHotelSuperNerdText, TEXT_CELADONHOTEL_SUPER_NERD
	dw_const CeladonLaprasGuyText,      TEXT_CELADONHOTEL_LAPRAS_GUY
	dw_const CeladonHotelGrampsText,    TEXT_CELADONHOTEL_GRAMPS
	dw_const CeladonHotelBenchGuyText,  TEXT_CELADONHOTEL_BENCH_GUY

CeladonHotelTrainerHeaders:
	def_trainers 2
CeladonHotelTrainerHeader0:
	trainer EVENT_BEAT_CELADON_HOTEL_TRAINER_0, 0, CeladonHotelBattleText1, CeladonHotelEndBattleText1, CeladonHotelAfterBattleText1
	db -1 ; end

; PureRGBnote: ADDED: new trainer in the hotel who humorously is looking for the "ghost PC" which actually exists in this hotel.
CeladonChannelerText: 
	text_asm
	CheckEvent EVENT_BEAT_CELADON_HOTEL_TRAINER_0
	ld hl, CeladonHotelAfterBattleText1
	jr nz, .printDone
	ld hl, CeladonChannelerIntroText
	rst _PrintText
	call YesNoChoice
	ld hl, CeladonChannelerNo1
	jr nz, .printDone
	ld hl, CeladonChannelerQ2
	rst _PrintText
	call YesNoChoice
	; doesn't matter what you choose
	ld hl, CeladonHotelTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd
.printDone
	rst _PrintText
	rst TextScriptEnd

CeladonChannelerIntroText:
	text_far _CeladonChannelerIntro
	text_end

CeladonChannelerNo1:
	text_far _CeladonChannelerNo1
	text_end

CeladonChannelerQ2:
	text_far _CeladonChannelerQ2
	text_end

CeladonHotelBattleText1:
	text_far _CeladonHotelBattleText1
	text_end

CeladonHotelEndBattleText1:
	text_far _CeladonHotelEndBattleText1
	text_end

CeladonHotelAfterBattleText1:
	text_far _CeladonHotelAfterBattleText1
	text_end

CeladonHotelGrannyText:
	text_far _CeladonHotelGrannyText
	text_end

CeladonHotelBeautyText:
	text_far _CeladonHotelBeautyText
	text_end

CeladonHotelSuperNerdText:
	text_far _CeladonHotelSuperNerdText
	text_end

; PureRGBnote: ADDED: NPC who will give you lapras earlier once you beat rocket hideout.
; He's supposed to be the same guy who gives you lapras in silph co. but he's on a business trip 
; and goes back to silph co just in time for it to be occupied by team rocket.
CeladonLaprasGuyText:
	text_asm
	CheckEventHL EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld hl, CeladonLaprasGuyIntro
	jr z, .printDone
.celadonRocketsGone
	ld hl, CeladonLaprasGuyReady
	rst _PrintText
	lb bc, LAPRAS, 30
	ld a, BALL_DATA_GREAT << 3
	call GivePokemonCommon
	ld hl, CeladonLaprasGuyNoBoxRoom
	jr nc, .printDone
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeladonHeresYourLaprasText
	rst _PrintText
	SetEvent EVENT_GOT_LAPRAS_EARLY
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld a, SCRIPT_CELADONHOTEL_LAPRAS_GUY_LEAVES
	ld [wCeladonHotelCurScript], a
	ld hl, CeladonLaprasGuyAfter
.printDone
	rst _PrintText
	rst TextScriptEnd

CeladonLaprasGuyLeaves:
	; if the guy who can walk left and right is on a specific position we have to make him get out of the way first
	ld a, [wSprite04StateData2MapX]
	sub 4 ; MapX is offset by 4 from actual coordinate
	cp 4
	ld de, CeladonLoserMovement
	jr z, .loserinway
	cp 5
	ld de, CeladonLoserMovement2
	jr nz, .losernotinway
.loserinway
	ld a, 4
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CELADONHOTEL_LAPRAS_GUY_WAITING_FOR_LOSER_TO_MOVE
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret
.losernotinway
	; make the other guy stop moving
	ld a, 4
	ldh [hSpriteIndex], a
	call GetSpriteMovementByte1Pointer
	ld [hl], STAY
	; silph guy walks away according to where you are
	ld a, [wXCoord]
	cp 4
	ld de, CeladonLaprasGuyMovement1
	jr nz, .notLeftOfLaprasGuy
	ld de, CeladonLaprasGuyMovement2
.notLeftOfLaprasGuy
	ld a, 5
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CELADONHOTEL_LAPRAS_GUY_LEAVES_THROUGH_DOOR
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret

CeladonLoserMovement2:
	db NPC_MOVEMENT_LEFT
CeladonLoserMovement:
	db NPC_MOVEMENT_LEFT
	db -1

CeladonLaprasGuyMovement1:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CeladonLaprasGuyMovement2:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CeladonLaprasGuyGoesThroughDoor:
	; leaves through the door with a sound
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	ld a, TOGGLE_LAPRAS_GUY_CELADON
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, 4
	ldh [hSpriteIndex], a
	call GetSpriteMovementByte1Pointer
	ld [hl], WALK
	call GetSpriteMovementByte2Pointer
	ld [hl], LEFT_RIGHT
	call ResetMapScripts
	ld [wCeladonHotelCurScript], a ; SCRIPT_CELADONHOTEL_DEFAULT
	ret	

CeladonLaprasGuyWaitingForLoserToMove:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, SCRIPT_CELADONHOTEL_LAPRAS_GUY_LEAVES
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret

CeladonLaprasGuyIntro:
	text_far _CeladonLaprasGuyIntro
	text_end

CeladonLaprasGuyReady:
	text_far _CeladonLaprasGuyReady
	text_end

CeladonHeresYourLaprasText:
	text_far _SilphCo7FSilphWorkerM1LaprasDescriptionText
	text_end

CeladonLaprasGuyNoBoxRoom:
	text_far _SwitchPCBoxesFirst
	text_end

CeladonLaprasGuyAfter:
	text_far _CeladonLaprasGuyAfter
	text_end

CeladonHotelBenchGuyText:
	text_far _CeladonCityHotelText
	text_end
	
; RGB Tweaked: everything beyond this line is used exclusively for our Coin Grandpa
CeladonHotelPickRandomMon:
	ld a, [wCoinGrandpaRequestedMon]
	and a
	ret nz ; already picked
	call Random
	ld hl, CoinGrandpaMonList
	ld b, a
.loop
	ld a, b
	and a
	jr z, .done
	inc hl
	dec b
	ld a, [hl]
	and a
	jr nz, .loop
	ld hl, CoinGrandpaMonList
	jr .loop
.done
	ld a, [hl]
	and a
	jr z, CeladonHotelPickRandomMon ; retry if landed on $00 terminator
	ld [wCoinGrandpaRequestedMon], a
	ret

CoinGrandpaMonList:
	db BULBASAUR, IVYSAUR, VENUSAUR, CHARMANDER, CHARMELEON, CHARIZARD
	db SQUIRTLE, WARTORTLE, BLASTOISE, CATERPIE, METAPOD, BUTTERFREE
	db WEEDLE, KAKUNA, BEEDRILL, PIDGEY, PIDGEOTTO, PIDGEOT
	db RATTATA, RATICATE, SPEAROW, FEAROW, EKANS, ARBOK
	db PIKACHU, RAICHU, SANDSHREW, SANDSLASH, NIDORAN_F, NIDORINA
	db NIDOQUEEN, NIDORAN_M, NIDORINO, NIDOKING, CLEFAIRY, CLEFABLE
	db VULPIX, NINETALES, JIGGLYPUFF, WIGGLYTUFF, ZUBAT, GOLBAT
	db ODDISH, GLOOM, VILEPLUME, PARAS, PARASECT, VENONAT, VENOMOTH
	db DIGLETT, DUGTRIO, MEOWTH, PERSIAN, PSYDUCK, GOLDUCK
	db MANKEY, PRIMEAPE, GROWLITHE, ARCANINE, POLIWAG, POLIWHIRL
	db POLIWRATH, ABRA, KADABRA, ALAKAZAM, MACHOP, MACHOKE, MACHAMP
	db BELLSPROUT, WEEPINBELL, VICTREEBEL, TENTACOOL, TENTACRUEL
	db GEODUDE, GRAVELER, GOLEM, PONYTA, RAPIDASH, SLOWPOKE, SLOWBRO
	db MAGNEMITE, MAGNETON, FARFETCHD, DODUO, DODRIO, SEEL, DEWGONG
	db SHELLDER, CLOYSTER, GASTLY, HAUNTER, GENGAR, ONIX, DROWZEE
	db HYPNO, KRABBY, KINGLER, VOLTORB, ELECTRODE, EXEGGCUTE, EXEGGUTOR
	db CUBONE, MAROWAK, HITMONLEE, HITMONCHAN, LICKITUNG, KOFFING
	db WEEZING, RHYHORN, RHYDON, CHANSEY, TANGELA, KANGASKHAN
	db HORSEA, SEADRA, GOLDEEN, SEAKING, STARYU, STARMIE, MR_MIME
	db SCYTHER, JYNX, ELECTABUZZ, MAGMAR, PINSIR, TAUROS, MAGIKARP
	db GYARADOS, LAPRAS, DITTO, EEVEE, VAPOREON, JOLTEON, FLAREON
	db PORYGON, OMANYTE, OMASTAR, KABUTO, KABUTOPS, AERODACTYL, SNORLAX
	db DRATINI, DRAGONAIR
	db $00 ; terminator

CeladonHotelGrampsText:
	text_asm
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .hasCoinCase
	ld hl, .noCoinCaseText
	rst _PrintText
	rst TextScriptEnd
.hasCoinCase
	; load requested mon name
	ld a, [wCoinGrandpaRequestedMon]
	and a
	jr nz, .hasRequest
	call CeladonHotelPickRandomMon
.hasRequest
	ld a, [wCoinGrandpaRequestedMon]
	ld [wNamedObjectIndex], a
	call GetMonName
	call CopyToStringBuffer
	ld hl, .introText
	rst _PrintText
	; check first party slot
	ld a, [wPartyMon1Species]
	ld b, a
	ld a, [wCoinGrandpaRequestedMon]
	cp b
	jr z, .match
	; check special variants
	call .checkSpecialVariant
	jr nc, .noMatch
	jr .specialPayout
.noMatch
	ld hl, .wrongMonText
	rst _PrintText
	rst TextScriptEnd
.match
	; normal payout: 270 coins
	xor a
	ldh [hUnusedCoinsByte], a
	ld a, $02
	ldh [hCoins], a
	ld a, $70
	ldh [hCoins + 1], a
	jr .payout
.specialPayout
	; special variant payout: 630 coins
	; load base species name for display
	ld a, [wCoinGrandpaRequestedMon]
	ld [wNamedObjectIndex], a
	call GetMonName
	call CopyToStringBuffer
	xor a
	ldh [hUnusedCoinsByte], a
	ld a, $06
	ldh [hCoins], a
	ld a, $30
	ldh [hCoins + 1], a
	ld hl, .specialPayoutText
	rst _PrintText
	jr .resetAndClose
.payout
	ld hl, .receivedText
	rst _PrintText
.resetAndClose
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	; add coins to player
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	xor a
	ld [wCoinGrandpaRequestedMon], a
	rst TextScriptEnd

.checkSpecialVariant
	; check if first party mon is a special variant of requested mon
	; returns carry set if match found
	ld a, [wPartyMon1Species]
	ld b, a
	ld a, [wCoinGrandpaRequestedMon]
	cp DRAGONAIR
	jr nz, .checkOnix
	ld a, b
	cp WINTER_DRAGONAIR
	jr z, .variantMatch
	jr .noVariantMatch
.checkOnix
	cp ONIX
	jr nz, .checkHaunter
	ld a, b
	cp HARDENED_ONIX
	jr z, .variantMatch
	jr .noVariantMatch
.checkHaunter
	cp HAUNTER
	jr nz, .checkMagmar
	ld a, b
	cp POWERED_HAUNTER
	jr z, .variantMatch
	jr .noVariantMatch
.checkMagmar
	cp MAGMAR
	jr nz, .checkMagneton
	ld a, b
	cp VOLCANIC_MAGMAR
	jr z, .variantMatch
	jr .noVariantMatch
.checkMagneton
	cp MAGNETON
	jr nz, .checkWeezing
	ld a, b
	cp FLOATING_MAGNETON
	jr z, .variantMatch
	jr .noVariantMatch
.checkWeezing
	cp WEEZING
	jr nz, .noVariantMatch
	ld a, b
	cp FLOATING_WEEZING
	jr z, .variantMatch
.noVariantMatch
	and a ; clear carry
	ret
.variantMatch
	scf ; set carry
	ret

.introText:
	text_far _CeladonHotelGrampsIntroText
	text_end

.noCoinCaseText:
	text_far _CeladonHotelGrampsNoCoinCaseText
	text_end

.wrongMonText:
	text_far _CeladonHotelGrampsWrongMonText
	text_end

.receivedText:
	text_far _CeladonHotelGrampsReceivedText
	text_end

.specialPayoutText:
	text_far _CeladonHotelGrampsSpecialPayoutText
	text_end
