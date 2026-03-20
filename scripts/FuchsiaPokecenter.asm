FuchsiaPokecenter_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaPokecenter_ScriptPointers
	ld a, [wFuchsiaPokecenterCurScript]
	call CallFunctionInTable
	ret

FuchsiaPokecenter_TextPointers:
	def_text_pointers
	dw_const FuchsiaPokecenterNurseJoyText,         TEXT_FUCHSIAPOKECENTER_NURSE_JOY
	dw_const FuchsiaPokecenterChanseyText,          TEXT_FUCHSIAPOKECENTER_CHANSEY
	dw_const FuchsiaPokecenterRockerText,           TEXT_FUCHSIAPOKECENTER_ROCKER
	dw_const FuchsiaPokecenterCooltrainerFText,     TEXT_FUCHSIAPOKECENTER_COOLTRAINER_F
	dw_const FuchsiaPokecenterLinkReceptionistText, TEXT_FUCHSIAPOKECENTER_LINK_RECEPTIONIST

FuchsiaPokecenter_ScriptPointers:
	def_script_pointers
	dw_const FuchsiaPokecenterScript0,              SCRIPT_FUCHSIAPOKECENTER_DEFAULT
	dw_const JoyPostBattleScript,                   SCRIPT_FUCHSIAPOKECENTER_JOY_POST_BATTLE

EXPORT SCRIPT_FUCHSIAPOKECENTER_JOY_POST_BATTLE

FuchsiaPokecenterNurseJoyText:
	script_pokecenter_nurse_joy

FuchsiaPokecenterChanseyText:
	text_far _CopycatsHouse1FChanseyText
	text_asm
	ld a, CHANSEY
	call PlayCry
	ld c, DEX_CHANSEY - 1
	callfar SetMonSeen
	rst TextScriptEnd

FuchsiaPokecenterRockerText:
	text_far _FuchsiaPokecenterRockerText
	text_end

FuchsiaPokecenterCooltrainerFText:
	text_far _FuchsiaPokecenterCooltrainerFText
	text_end

FuchsiaPokecenterLinkReceptionistText:
	script_cable_club_receptionist

FuchsiaPokecenterScript0:
	ret

JoyPostBattleScript:
	ld a, [wIsInBattle]
	inc a
	jr z, .skip
	callfar PrintEndBattleText
	ld a, FUCHSIAPOKECENTER_NURSE_JOY
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	; restore movement byte 2 to DOWN to prevent random direction changes
	ld a, FUCHSIAPOKECENTER_NURSE_JOY
	ldh [hSpriteIndex], a
	call GetSpriteMovementByte2Pointer
	ld [hl], DOWN
	; update both facing fields to DOWN to survive CloseTextDisplay restore
	ld a, SPRITESTATEDATA1_FACINGDIRECTION
	ldh [hSpriteDataOffset], a
	ld a, FUCHSIAPOKECENTER_NURSE_JOY
	ldh [hSpriteIndex], a
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_DOWN
	inc h ; flip to SPRITESTATEDATA2
	ld [hl], SPRITE_FACING_DOWN
.skip
	xor a
	ld [wFuchsiaPokecenterCurScript], a
	ld [wCurMapScript], a
	ret
