; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF OPTIONS_PAGE_4_COUNT EQU 2 ; number of options on this page
DEF SPRITE_OPTIONS_PAGE_NUMBER EQU 4 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
SpriteOptionsXPosBitData:
	db 12, 9, BIT_BACK_SPRITES
	dw wSpriteOptions2
	db -1


SpriteOptionsHeader:
	dw DrawSpriteOptionsMenu
	dw SpriteOptionsSetCursorPositionActions
	dw SetSpriteOptionsFromCursorPositions
	dw SpriteOptionsLeftRightFuncs
	dw DisplayOptions3
	dw DisplayBattleOptions
	dw SpriteOptionsAorSelectButton
	dw SpriteInfoTextJumpTable
	; fall through
DisplaySpriteOptions:
	ld hl, SpriteOptionsHeader
	ld bc, SpriteOptionsData
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
SpriteOptionsYCoordVariableOffsetList:
	db 3, 0
	db 5, 1
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

SpriteOptionsData:
	db OPTIONS_PAGE_4_COUNT ; length of list
	db SPRITE_OPTIONS_PAGE_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw SpriteOptionsYCoordVariableOffsetList

SpriteOptionsSetCursorPositionActions:
	dw SetCursorPositionFromSpriteOptions
	dw FrontSpriteCursorFunc

SpritesOptionText:
	db   "SPRITES"
	next " BACK:   OG SW97"
	next " FRONT:  @"

DrawSpriteOptionsMenu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, SpritesOptionText
	call PlaceString
	hlcoord 10, 5 
	lb bc, $C0, 3
	ld de, 1
	jp DrawTileLineIncrement

SpriteOptionsAorSelectButton:
	ld a, [hJoy5]
	bit B_PAD_A, a
	jp z, OptionsPageAorSelectButtonDefault
	; fall through
SpriteOptionsAButton:
	ld a, [SpriteOptionsYCoordVariableOffsetList + 2]
	ld b, a
	ld a, [wTopMenuItemY]
	cp b ;is the cursor on the FRONT row?
	ret nz
	push af
	ld a, [wTopMenuItemX]
	push af
	ld a, [wCurrentOptionIndex]
	push af
	xor a
	ld [wTopMenuItemY], a
	ld a, SFX_PRESS_AB
	rst _PlaySound
	call DisplayFrontSpriteOptions
	ld a, [wNewInGameFlags]
	bit IN_GAME, a
	jr z, .noTilesetReload ; if we're not in game yet, no need to reload
	CheckAndResetEvent FLAG_RELOAD_TILESET_IN_OPTION_MENU
	call nz, ReloadMapData
.noTilesetReload
	hlcoord 14, PAGE_CONTROLS_Y_COORD
	ld a, ' '
	ld [hli], a
	ld [hl], a
	pop af
	ld [wCurrentOptionIndex], a
	pop af
	ld [wTopMenuItemX], a
	pop af
	ld [wTopMenuItemY], a
	scf
	ret

SpriteOptionsLeftRightFuncs:
	dw GenericSpriteOptionsCursorToggleFunc
	dw DontChangeOptionCursor
	dw CursorCancelRow

GenericSpriteOptionsCursorToggleFunc:
	ld b, %101
	jp GenericOptionsCursorToggleFunc

SetSpriteOptionsFromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, SpriteOptionsXPosBitData
	ld b, OPTIONS_PAGE_4_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromSpriteOptions:
	ld hl, SpriteOptionsXPosBitData
	jp SetGenericCursorPositionFromOptions

FrontSpriteCursorFunc:
	; always at 9
	ld a, 9
	ld [wOptions2CursorX], a
	ret

SpriteInfoTextJumpTable:
	dw BackSpriteText
	dw FrontSpriteText

BackSpriteText:
	text_far _BackSpriteText
	text_end

IconsOptionText:
	text_far _IconsOptionText
	text_end

FrontSpriteText:
	text_far _FrontSpriteText
	text_end
