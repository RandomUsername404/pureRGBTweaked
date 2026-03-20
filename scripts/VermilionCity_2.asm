; PureRGB Tweaked: Added GIFT Squirtle NPC
VermilionCityPrintOfficerJennyText::
	CheckEvent EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
	jr nz, .alreadyGot
	; check if player has the Thunderbadge
	ld a, [wObtainedBadges]
	bit BIT_THUNDERBADGE, a
	jr z, .noBadge
	ld hl, OfficerJennyOfferText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined
	lb bc, SQUIRTLE, 15
	call GivePokemon
	ret nc
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, OfficerJennyByeText
	rst _PrintText
	SetEvent EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
	ret

.noBadge
	ld hl, OfficerJennyNoBadgeText
	rst _PrintText
	ret

.declined
	ld hl, OfficerJennyDeclinedText
	rst _PrintText
	ret

.alreadyGot
	; check if player has beaten the E4
	CheckEvent EVENT_BECAME_CHAMP
	jr z, .squirtleText
	ld hl, JennyPreBattleText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, JennyAcceptedText
	rst _PrintText
	call Delay3
	ld hl, JennyAfterBattleText
	ld de, JennyAfterBattleText
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags3
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld a, OPP_JENNY
	ld [wCurOpponent], a
	ld a, 1
	ld [wTrainerNo], a
	ld a, SCRIPT_VERMILIONCITY_JENNY_POST_BATTLE
	ld [wVermilionCityCurScript], a
	ld [wCurMapScript], a
	ret

.refused
	ld hl, JennyRefusedText
	rst _PrintText
	ret

.squirtleText
	ld hl, OfficerJennyAfterText
	rst _PrintText
	ret

JennyPreBattleText:
	text_far _JennyBattleText
	text_end

JennyRefusedText:
	text_far _JennyRefusedText
	text_end

JennyAcceptedText:
	text_far _JennyAcceptedText
	text_end

JennyAfterBattleText:
	text_far _JennyAfterBattleText
	text_end

OfficerJennyNoBadgeText:
	text_far _OfficerJennyNoBadgeText
	text_end

OfficerJennyOfferText:
	text_far _OfficerJennyOfferText
	text_end

OfficerJennyByeText:
	text_far _OfficerJennyByeText
	text_waitbutton
	text_end

OfficerJennyDeclinedText:
	text_far _OfficerJennyDeclinedText
	text_end

OfficerJennyAfterText:
	text_far _OfficerJennyAfterText
	text_end
