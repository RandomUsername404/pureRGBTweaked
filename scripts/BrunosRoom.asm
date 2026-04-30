BrunosRoom_Script:
	call BrunoShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, BrunosRoomTrainerHeaders
	ld de, BrunosRoom_ScriptPointers
	ld a, [wBrunosRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunosRoomCurScript], a
	ret

BrunoShowOrHideExitBlock:
	call WasMapJustLoaded
	ret z
	CheckEvent EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	jp EliteFourOnMapLoad

BrunosRoom_ScriptPointers:
	def_script_pointers
	dw_const BrunosRoomDefaultScript,               SCRIPT_BRUNOSROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_BRUNOSROOM_BRUNO_START_BATTLE
	dw_const BrunosRoomBrunoEndBattleScript,        SCRIPT_BRUNOSROOM_BRUNO_END_BATTLE
	dw_const BrunosRoomPlayerIsMovingScript,        SCRIPT_BRUNOSROOM_PLAYER_IS_MOVING

BrunosRoomDefaultScript:
	ld hl, wBrunosRoomCurScript
	lb bc, TEXT_BRUNOSROOM_BRUNO_DONT_RUN_AWAY, SCRIPT_BRUNOSROOM_PLAYER_IS_MOVING
	jp EliteFourDefaultScript

BrunosRoomPlayerIsMovingScript:
	ld hl, wBrunosRoomCurScript
	jp EliteFourIsPlayerMovingScript

BrunosRoomBrunoEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jr z, ResetBrunoScript
	ld d, BRUNOSROOM_BRUNO
	callfar MakeSpriteFacePlayer
	CheckEvent EVENT_BECAME_CHAMP
	jr z, .displayText
	SetEvent EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
.displayText
	ld a, TEXT_BRUNOSROOM_BRUNO
	ldh [hTextID], a
	call DisplayTextID
	ld a, BRUNOSROOM_BRUNO
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SFX_GO_INSIDE
	rst _PlaySound
	ret
ResetBrunoScript:
	xor a ; SCRIPT_BRUNOSROOM_DEFAULT
	ld [wBrunosRoomCurScript], a
	ret

BrunosRoom_TextPointers:
	def_text_pointers
	dw_const BrunosRoomBrunoText,            TEXT_BRUNOSROOM_BRUNO
	dw_const EliteFourDontRunAwayText,       TEXT_BRUNOSROOM_BRUNO_DONT_RUN_AWAY

BrunosRoomTrainerHeaders:
	def_trainers
BrunosRoomTrainerHeader0:
	trainer EVENT_BEAT_BRUNOS_ROOM_TRAINER_0, 0, BrunoBeforeBattleText, BrunoEndBattleText, BrunoAfterBattleText
BrunosRoomTrainerHeader1:
	trainer EVENT_BEAT_BRUNOS_ROOM_TRAINER_1, 0, BrunoBeforeRematchText, BrunoEndRematchText, BrunoAfterRematchText
	db -1 ; end

BrunosRoomBrunoText:
	text_asm
;;;;;;;;;; PureRGBnote: ADDED: makes the battle music the gym leader theme
	ld a, 10
;;;;;;;;;;
	CheckEvent EVENT_BECAME_CHAMP
	ld hl, BrunosRoomTrainerHeader0
	jr z, .talkToTrainer
	ld hl, BrunosRoomTrainerHeader1
.talkToTrainer
	call TalkToTrainer
	rst TextScriptEnd

BrunoBeforeBattleText:
	text_far _BrunoBeforeBattleText
	text_end

BrunoEndBattleText:
	text_far _BrunoEndBattleText
	text_end

BrunoAfterBattleText:
	text_far _BrunoAfterBattleText
	text_end

BrunoBeforeRematchText:
	text_far _BrunoBeforeRematchText
	text_end

BrunoEndRematchText:
	text_far _BrunoEndRematchText
	text_end

BrunoAfterRematchText:
	text_far _BrunoAfterRematchText
	text_end
