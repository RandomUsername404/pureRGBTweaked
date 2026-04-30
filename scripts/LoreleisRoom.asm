LoreleisRoom_Script:
	call LoreleiShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, LoreleisRoomTrainerHeaders
	ld de, LoreleisRoom_ScriptPointers
	ld a, [wLoreleisRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wLoreleisRoomCurScript], a
	ret

LoreleiShowOrHideExitBlock:
	call WasMapJustLoaded
	ret z
	ld hl, wElite4Flags
	set BIT_STARTED_ELITE_4, [hl]
	CheckEvent EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
	jp EliteFourOnMapLoad

LoreleisRoom_ScriptPointers:
	def_script_pointers
	dw_const LoreleisRoomDefaultScript,             SCRIPT_LORELEISROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_LORELEISROOM_LORELEI_START_BATTLE
	dw_const LoreleisRoomLoreleiEndBattleScript,    SCRIPT_LORELEISROOM_LORELEI_END_BATTLE
	dw_const LoreleisRoomPlayerIsMovingScript,      SCRIPT_LORELEISROOM_PLAYER_IS_MOVING

LoreleisRoomDefaultScript:
	lb bc, TEXT_LORELEISROOM_DONT_RUN_AWAY, SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	ld hl, wLoreleisRoomCurScript
	jp EliteFourDefaultScript

LoreleisRoomPlayerIsMovingScript:
	ld hl, wLoreleisRoomCurScript
	jp EliteFourIsPlayerMovingScript

LoreleisRoomLoreleiEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jr z, ResetLoreleiScript
	ld d, LORELEISROOM_LORELEI
	callfar MakeSpriteFacePlayer
	CheckEvent EVENT_BECAME_CHAMP
	jr z, .displayText
	SetEvent EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
.displayText
	ld a, TEXT_LORELEISROOM_LORELEI
	ldh [hTextID], a
	call DisplayTextID
	ld a, LORELEISROOM_LORELEI
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SFX_GO_INSIDE
	rst _PlaySound
	ret
ResetLoreleiScript:
	xor a ; SCRIPT_LORELEISROOM_DEFAULT
	ld [wLoreleisRoomCurScript], a
	ret

LoreleisRoom_TextPointers:
	def_text_pointers
	dw_const LoreleisRoomLoreleiText,            TEXT_LORELEISROOM_LORELEI
	dw_const EliteFourDontRunAwayText, 			 TEXT_LORELEISROOM_DONT_RUN_AWAY

LoreleisRoomTrainerHeaders:
	def_trainers
LoreleisRoomTrainerHeader0:
	trainer EVENT_BEAT_LORELEIS_ROOM_TRAINER_0, 0, LoreleisRoomLoreleiBeforeBattleText, LoreleisRoomLoreleiEndBattleText, LoreleisRoomLoreleiAfterBattleText
LoreleisRoomTrainerHeader1:
	trainer EVENT_BEAT_LORELEIS_ROOM_TRAINER_1, 0, LoreleisRoomLoreleiBeforeRematchText, LoreleisRoomLoreleiEndRematchText, LoreleisRoomLoreleiAfterRematchText
	db -1 ; end

LoreleisRoomLoreleiText:
	text_asm
;;;;;;;;;; PureRGBnote: ADDED: makes the battle music the gym leader theme
	ld a, 9
;;;;;;;;;;
	CheckEvent EVENT_BECAME_CHAMP
	ld hl, LoreleisRoomTrainerHeader0
jr z, .talkToTrainer
	ld hl, LoreleisRoomTrainerHeader1
.talkToTrainer
	call TalkToTrainer
	rst TextScriptEnd

LoreleisRoomLoreleiBeforeBattleText:
	text_far _LoreleisRoomLoreleiBeforeBattleText
	text_end

LoreleisRoomLoreleiEndBattleText:
	text_far _LoreleisRoomLoreleiEndBattleText
	text_end

LoreleisRoomLoreleiAfterBattleText:
	text_far _LoreleisRoomLoreleiAfterBattleText
	text_end

LoreleisRoomLoreleiBeforeRematchText:
	text_far _LoreleisRoomLoreleiBeforeRematchText
	text_end

LoreleisRoomLoreleiEndRematchText:
	text_far _LoreleisRoomLoreleiEndRematchText
	text_end

LoreleisRoomLoreleiAfterRematchText:
	text_far _LoreleisRoomLoreleiAfterRematchText
	text_end

LoreleisRoomLoreleiDontRunAwayText:
	text_far _LoreleisRoomLoreleiDontRunAwayText
	text_end
