; RGB Tweaked: Added secret post-game boss fight
ViridianGymPrintBlueText::  
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_BLUE
	jr z, .beforeBeat
	ld hl, ViridianGymBlueAfterBattleText
	rst _PrintText
	rst TextScriptEnd
.beforeBeat
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	ld c, BANK(Music_GymLeaderBattle)
	ld a, MUSIC_GYM_LEADER_BATTLE
	call PlayMusic
	ld hl, ViridianGymBluePreBattleText
	rst _PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, ViridianGymBlueEndBattleDefeatedText
	ld de, ViridianGymBlueEndBattleVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL3
	ld [wCurOpponent], a
	ld a, 10 ; team index 10 = X_RIVAL3_FINAL_MOVESET
	ld [wTrainerNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_VIRIDIANGYM_BLUE_POST_BATTLE ; calls ViridianGymBluePostBattle, which calls ViridianGymBluePostBattleScript
	ld [wViridianGymCurScript], a
	rst TextScriptEnd

ViridianGymBluePreBattleText:
	text_far _ViridianGymBluePreBattleText
	text_end

ViridianGymBlueEndBattleDefeatedText:
	text_far _ViridianGymBlueEndBattleDefeatedText
	text_end

ViridianGymBlueEndBattleVictoryText:
	text_far _ViridianGymBlueEndBattleVictoryText
	text_end

ViridianGymBlueAfterBattleText:
	text_far _ViridianGymBlueAfterBattleText
	text_end

ViridianGymBluePostBattleScript::  
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	ld c, BANK(Music_Credits)
	ld a, MUSIC_CREDITS
	call PlayMusic
	ld hl, wStatusFlags7          ; clear the flag that prevents
	res BIT_NO_MAP_MUSIC, [hl]    ; map music from auto-resuming on warp. 
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_BLUE ; This here line must be BEFORE DisplayTextID, otherwise the battle restarts.
	ld d, VIRIDIANGYM_BLUE
	callfar MakeSpriteFacePlayer
	ld a, TEXT_VIRIDIANGYM_BLUE
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, TOGGLE_VIRIDIAN_GYM_BLUE
	ld [wToggleableObjectIndex], a
	predef HideObject
	call UpdateSpritesAndDelay3
	call GBFadeInFromBlack
	jp ViridianGymResetScripts
