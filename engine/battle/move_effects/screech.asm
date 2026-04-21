_ScreechEffect::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wEnemyMonDefenseMod
	ld bc, wEnemyBattleStatus2
	jr z, .playersTurn
	ld hl, wEnemyMoveEffect
	ld de, wPlayerMonDefenseMod
	ld bc, wPlayerBattleStatus2
.playersTurn
	ld a, [wBattleFunctionalFlags]
	bit 5, a ; is this an auto-use? if so skip stat change
	jr nz, .skipStatChange
	call .checkPlayAnimation
	jr nc, .failed
	ld a, [bc]
	bit STAT_DOWN_IMMUNITY, a
	jr nz, .skipStatChange
	ld a, [de]
	dec a ; is it 1? (lowest stat mod possible)
	jr z, .skipStatChange ; can't lower any more
	; does opponent have
	ld [hl], DEFENSE_DOWN2_EFFECT
	push hl
	SetFlag FLAG_SKIP_STAT_ANIMATION
	SetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	callfar StatModifierDownEffect
	ResetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop hl
	ld [hl], SCREECH_EFFECT
.skipStatChange
	ld hl, wBattleFunctionalFlags
	bit 5, [hl] ; is this an auto-use? if so skip echoing effect
	jr nz, .skipEchoing
	set 2, [hl]	   ; screeches echoing everywhere
	ld a, [hl]
	and %11000111  ; clear existing counter bits
	or %00011000   ; reset counter to 3
	ld [hl], a
	ld hl, ScreechesEchoed
	rst _PrintText
.skipEchoing
	jr AutoWakeUpSleepScreech
.failed
	jpfar PrintButItFailedText_

.checkPlayAnimation
	ld a, [bc]
	bit STAT_DOWN_IMMUNITY, a
	jr nz, .no ; RGB Tweaked: SCREECH will only work if STAT_DOWN_IMMUNITY isn't set. Otherwise, the move fails.
	ld a, [de]
	dec a
	jr nz, .yes
.nextCheck
	ld a, [wBattleFunctionalFlags]
	bit 2, a
	jr nz, .no
.yes
	push hl
	push bc
	push de
	callfar PlayCurrentMoveAnimation2
	pop de
	pop bc
	pop hl
	scf
	ret
.no
	and a
	ret

AutoWakeUpSleepScreech:
	; if the opponent is asleep when you use SCREECH, wake them up automatically
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	ld de, wEnemySelectedMove
	jr z, .playersTurn2
	ld hl, wBattleMonStatus
	ld de, wPlayerSelectedMove
.playersTurn2
	ld a, [hl]
	and SLP_MASK
	ret z
	; wake up sleeping opponent
	xor a
	ld [hl], a
	; don't write $FF to selected move - let CheckPlayerStatusConditions handle the turn skip
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	callfar PrintMonWokeUp
	pop af
	ldh [hWhoseTurn], a
	ret

AutoWakeUpScreechEnemy::
	ld b, 0
	ld hl, wEnemyMonStatus
	jr AutoWakeupSleepScreechOnSendOut

AutoWakeUpSleepScreechPlayer::
	ld b, 1
	ld hl, wBattleMonStatus
AutoWakeupSleepScreechOnSendOut:
	ld a, [wBattleFunctionalFlags]
	bit 2, a ; are screeches echoing?
	ret z ; if not don't wake them up from sleep
	ld a, [hl]
	and SLP_MASK ; is the player asleep?
	ret z ; if not don't wake them up from sleep
	push bc
	callfar EchoingScreeches
	pop bc
	ldh a, [hWhoseTurn]
	push af
	ld a, b
	ldh [hWhoseTurn], a
	call AutoWakeUpSleepScreech
	pop af
	ldh [hWhoseTurn], a
	jpfar DrawHUDsAndHPBars

ScreechesEchoed:
	text_far _ScreechesEchoedText
	text_end
