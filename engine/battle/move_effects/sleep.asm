EchoingScreeches::
	ld c, 20
	rst _DelayFrames
	xor a
	ld [wTempoModifier], a
	ld a, 2
	ld [wFrequencyModifier], a
	ld a, SFX_BATTLE_31
	rst _PlaySound
	ld hl, .screechesPrevented
	rst _PrintText
	ret
.screechesPrevented
	text_far _ScreechesPreventedSleepText
	text_end

_SleepEffect::
	ld de, wEnemyMonStatus
	ld hl, wEnemyMonMoves
	ldh a, [hWhoseTurn]
	and a
	jp z, .sleepEffect
	ld de, wBattleMonStatus
	ld hl, wBattleMonMoves
.sleepEffect
	; are screeches echoing? If so prevent sleep status.
	ld a, [wBattleFunctionalFlags]
	bit 2, a
	jr nz, EchoingScreeches
	ld a, [de]
	ld b, a
	and $7
	jr z, .notAlreadySleeping ; can't affect a mon that is already asleep
	ld hl, AlreadyAsleepText
	rst _PrintText
	ret
.notAlreadySleeping
	ld a, b
	and a
	jr nz, .didntAffect ; can't affect a mon that is already statused
	; RGB Tweaked: check if target is invulnerable (mid-FLY or mid-DIG) and if it is, don't animate the attack and don't auto-use SCREECH
	ld bc, wEnemyBattleStatus1
	ldh a, [hWhoseTurn]
	and a
	jr z, .checkInvulnerable
	ld bc, wPlayerBattleStatus1
.checkInvulnerable
	ld a, [bc]
	bit INVULNERABLE, a
	jr nz, .didntAffect
	; does the target have screech? If so, try to trigger the SCREECH effect automatically
	ld b, NUM_MOVES
.loopCheckMoves
	ld a, [hli]
	cp SCREECH
	jr z, .opponentHasScreech
	dec b
	jr nz, .loopCheckMoves
	; no, it doesn't have SCREECH
.noScreech ; RGB Tweaked: auto-SCREECH will only trigger 50% of the time
	ld bc, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jp z, .checkRecharge
	ld bc, wPlayerBattleStatus2
.checkRecharge
	ld a, [bc]
	bit NEEDS_TO_RECHARGE, a ; does the target need to recharge? (hyper beam)
	res NEEDS_TO_RECHARGE, a ; target no longer needs to recharge
	ld [bc], a
	jr nz, .setSleepCounter ; if the target had to recharge, all hit tests will be skipped
	push de
	callfar MoveHitTest ; apply accuracy tests
	pop de
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
.setSleepCounter
; set target's sleep counter to a random number between 1 and 7
	push de
	callfar FarBattleRandom
	ld a, d
	pop de
	and $7
	jr z, .setSleepCounter
	ld [de], a
	callfar PlayCurrentMoveAnimation2
	ld hl, FellAsleepText
	rst _PrintText
	jpfar DrawTargetHPBar
.didntAffect
	jpfar PrintDidntAffectText
.opponentHasScreech
	; RGB Tweaked: 50% chance to auto-use SCREECH  
	push de
	callfar FarBattleRandom
	ld a, d
	pop de
	cp 50 percent + 1
	jr nc, .noScreech ; >= 50%: skip auto-SCREECH, sleep-inducing move lands instead
	callfar PlayCurrentMoveAnimation2 ; < 50%: auto-SCREECH is used, doesn't use up a turn
	ld hl, .letOutAScreech
	rst _PrintText
	ldh a, [hWhoseTurn]
	ld hl, wEnemyMoveNum
	ld de, wEnemyMoveEffect
	and a
	jr z, .playersTurn2
	ld hl, wPlayerMoveNum
	ld de, wPlayerMoveEffect
.playersTurn2
	push af
	xor 1 ; toggle whose turn it is so the opponent uses the attack
	ldh [hWhoseTurn], a
	ld a, [hl]
	push af
	ld a, [de]
	push af
	ld [hl], SCREECH
	ld a, SCREECH_EFFECT
	ld [de], a
	push hl
	push de
	; RGB Tweaked: if SCREECH was auto-used, don't trigger echoing effect
	ld hl, wBattleFunctionalFlags
	set 5, [hl]
	callfar _ScreechEffect
	ld hl, wBattleFunctionalFlags
	res 5, [hl]
	;;;;;;;
	pop de
	pop hl
	pop af
	ld [de], a
	pop af
	ld [hl], a
	pop af
	ldh [hWhoseTurn], a
	ret
; RGB Tweaked: Pokemon auto-using SCREECH will let out an audible cry
.letOutAScreech
	text_far _LetOutAScreechText
	text_asm
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies] ; hWhoseTurn=0 means player is attacker, so defender is enemy
	jr z, .playCry
	ld a, [wBattleMonSpecies] ; hWhoseTurn=1 means enemy is attacker, so defender is player
.playCry
	call PlayCry
	rst TextScriptEnd
	

FellAsleepText:
	text_far _FellAsleepText
	text_end

AlreadyAsleepText:
	text_far _AlreadyAsleepText
	text_end

