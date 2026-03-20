CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTradeHouseMelanieText,   TEXT_CERULEANTRADEHOUSE_MELANIE
	dw_const CeruleanTradeHouseBulbasaurText, TEXT_CERULEANTRADEHOUSE_BULBASAUR
	dw_const CeruleanTradeHouseGrannyText,    TEXT_CERULEANTRADEHOUSE_GRANNY
	dw_const CeruleanTradeHouseTraderText,    TEXT_CERULEANTRADEHOUSE_TRADER

CeruleanTradeHouseGrannyText:
	text_far _CeruleanTradeHouseGrannyText
	text_end

CeruleanTradeHouseTraderText:
	text_asm
	ld a, TRADE_FOR_LOLA
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd

; PureRGB Tweaked: Added GIFT Bulbasaur NPC
CeruleanTradeHouseMelanieText:
	text_asm
	CheckEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
	jr nz, .alreadyGot
	ld hl, CeruleanHouse1MelanieGreetingText
	rst _PrintText
	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a
	jr z, .noAccess
	ld hl, CeruleanHouse1MelanieOfferText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined
	lb bc, BULBASAUR, 11
	call GivePokemon
	jr nc, .noAccess
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeruleanHouse1MelanieByeText
	rst _PrintText
	ld a, HS_CERULEAN_BULBASAUR
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
.noAccess
	rst TextScriptEnd

.declined
	ld hl, CeruleanHouse1MelanieDeclinedText
	rst _PrintText
	rst TextScriptEnd

.alreadyGot
	ld hl, CeruleanHouse1MelanieAfterText
	call PrintText
	rst TextScriptEnd

CeruleanHouse1MelanieGreetingText:
	text_far MelanieGreetingText
	text_waitbutton
	text_end

CeruleanHouse1MelanieOfferText:
	text_far MelanieOfferText
	text_end

CeruleanHouse1MelanieByeText:
	text_far MelanieByeText
	text_waitbutton
	text_end

CeruleanHouse1MelanieAfterText:
	text_far MelanieAfterText
	text_waitbutton
	text_end

CeruleanHouse1MelanieDeclinedText:
	text_far MelanieDeclinedText
	text_waitbutton
	text_end

CeruleanTradeHouseBulbasaurText:
	text_far MelanieBulbasaurText
	text_asm
	ld a, BULBASAUR
	call PlayCry
	ld c, DEX_BULBASAUR - 1
	callfar SetMonSeen
	rst TextScriptEnd
