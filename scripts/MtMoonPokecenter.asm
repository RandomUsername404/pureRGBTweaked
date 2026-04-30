MtMoonPokecenter_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenter_TextPointers:
	def_text_pointers
	dw_const MtMoonPokecenterNurseText,            TEXT_MTMOONPOKECENTER_NURSE
	dw_const MtMoonPokecenterYoungsterText,        TEXT_MTMOONPOKECENTER_YOUNGSTER
	dw_const MtMoonPokecenterGentlemanText,        TEXT_MTMOONPOKECENTER_GENTLEMAN
	dw_const MtMoonPokecenterMagikarpSalesmanText, TEXT_MTMOONPOKECENTER_MAGIKARP_SALESMAN
	dw_const MtMoonPokecenterClipboardText,        TEXT_MTMOONPOKECENTER_CLIPBOARD
	dw_const MtMoonPokecenterLinkReceptionistText, TEXT_MTMOONPOKECENTER_LINK_RECEPTIONIST
	dw_const MtMoonPokecenterBenchGuyText,         TEXT_MTMOONPOKECENTER_BENCH_GUY

MtMoonPokecenterNurseText:
	script_pokecenter_nurse

MtMoonPokecenterYoungsterText:
	text_far _MtMoonPokecenterYoungsterText
	text_end

MtMoonPokecenterClipboardText:
MtMoonPokecenterGentlemanText:
	text_far _MtMoonPokecenterGentlemanText
	text_end

MtMoonPokecenterMagikarpSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
	ld hl, .IGotADealText
	rst _PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	jp nz, .choseNo
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jp .printText
.enoughMoney
	lb bc, MAGIKARP, 5
	call GivePokemon
	jp nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_MAGIKARP
	rst TextScriptEnd

.alreadyBoughtMagikarp
	; PureRGB Tweaked: The Magikarp Salesman turns into a Move Tutor if we've bought his fish
	ld a, [wPartyMon1Species]
	cp MAGIKARP
	jr z, .dragonRageTutor
	cp PIKACHU
	jp z, .flyTutor
	; fall through to existing Gyarados check
	ld hl, .NoRefundsText
	rst _PrintText
	ld d, GYARADOS
	callfar IsMonInParty
	jp nc, .done
	CheckEvent FLAG_GYARADOS_FAMILY_LEARNSET
	jp nz, .done
	ld de, SalesManName
	call CopyTrainerName
	lb hl, DEX_GYARADOS, $FF
	ld de, MtMoonPokecenterMagikarpSalesmanArentYouGladText
	ld bc, LearnsetFadeOutInDetails
	predef_jump LearnsetTrainerScriptMain

.dragonRageTutor
	ld hl, .DragonRageOfferText
	ld a, DRAGON_RAGE
	ld [wMoveNum], a
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $50
	ld [wPriceTemp + 1], a
	call .TutorRoutine
	jr nc, .dragonRageSuccess
	jp .done
.dragonRageSuccess
	ld hl, .ByeText
	jp .printText

.flyTutor
	ld hl, .FlyOfferText
	ld a, FLY
	ld [wMoveNum], a
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $20
	ld [wPriceTemp + 1], a
	call .TutorRoutine
	jr nc, .flySuccess
	jp .done
.flySuccess
	ld hl, .FlyDoneText
	rst _PrintText
	ld hl, .ByeText
	jp .printText

.TutorRoutine
	rst _PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	jr nz, .cancelTutor
	ld a, [wPriceTemp]
	ldh [hMoney], a
	ld a, [wPriceTemp + 1]
	ldh [hMoney + 1], a
	ld a, [wPriceTemp + 2]
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .enoughMoneyTutor
	ld hl, .NoMoneyText
	rst _PrintText
	scf
	ret
.enoughMoneyTutor
	xor a
	ld [wWhichPokemon], a
	ld a, [wMoveNum]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	predef LearnMove
	ld a, b
	and a
	jr z, .cancelTutor
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	and a
	ret
.cancelTutor
	ld hl, .NoText
	rst _PrintText
	scf
	ret

.choseNo
	ld hl, .NoText
.printText
	rst _PrintText
.done
	rst TextScriptEnd

.DragonRageOfferText:
	text_far _MtMoonPokecenterMagikarpSalesmanDragonRageOfferText
	text_end

.FlyOfferText:
	text_far _MtMoonPokecenterMagikarpSalesmanFlyPikaOfferText
	text_end

.FlyDoneText:
	text_far _MtMoonPokecenterMagikarpSalesmanFlyPikaDoneText
	text_end

.ByeText:
	text_far _MtMoonPokecenterMagikarpSalesmanByeText
	text_end

.IGotADealText:
	text_far _MtMoonPokecenterMagikarpSalesmanIGotADealText
	text_end

.NoText:
	text_far _MtMoonPokecenterMagikarpSalesmanNoText
	text_end

.NoMoneyText:
	text_far _MtMoonPokecenterMagikarpSalesmanNoMoneyText
	text_end

.NoRefundsText:
	text_far _MtMoonPokecenterMagikarpSalesmanNoRefundsText
	text_end


SalesManName:
	db "SALESMAN@"

MtMoonPokecenterLinkReceptionistText:
	script_cable_club_receptionist

MtMoonPokecenterBenchGuyText:
	text_far _MtMoonPokecenterBenchGuyText
	text_end
