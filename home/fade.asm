; These routines manage gradual fading
; (e.g., entering a doorway)
LoadGBPal::
	ld a, [wMapPalOffset] ;tells if wCurMap is dark (requires HM5_FLASH?)
	ld b, a
	ld hl, FadePal4
	ld a, l
	sub b
	ld l, a
	jr nc, .ok
	dec h
.ok
	ld a, [hli]
	ld [rBGP], a
	ld a, [hli]
	ld [rOBP0], a
	ld a, [hli]
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	ret

GBFadeInFromBlack::
	callba GBCFadeInFromBlack
	ld hl, FadePal4
	ld b, 1
	ld c, 1
	jr z, GBFadeIncCommon.delayset
	ld hl, FadePal1
	ld b, 4
	jr GBFadeIncCommon

GBFadeOutToWhite::
	callba GBCFadeOutToWhite
	ld hl, FadePal8
	ld b, 1
	ld c, 1
	jr z, GBFadeIncCommon.delayset
	ld hl, FadePal6
	ld b, 3

GBFadeIncCommon:
	ld c, 8
.delayset
	ld a, [hli]
	ld [rBGP], a
	ld a, [hli]
	ld [rOBP0], a
	ld a, [hli]
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	call DelayFrames
	dec b
	jr nz, GBFadeIncCommon
	ret

GBFadeOutToBlack::
	callba GBCFadeOutToBlack
	ld hl, FadePal1 + 2
	ld b, 1
	ld c, 1
	jr z, GBFadeDecCommon.delayset
	ld hl, FadePal4 + 2
	ld b, 4
	jr GBFadeDecCommon

GBFadeInFromWhite::
	callba GBCFadeInFromWhite
	ld hl, FadePal5 + 2
	ld b, 1
	ld c, 1
	jr z, GBFadeDecCommon.delayset
	ld hl, FadePal7 + 2
	ld b, 3

GBFadeDecCommon:
	ld c, 8
.delayset
	ld a, [hld]
	ld [rOBP1], a
	ld a, [hld]
	ld [rOBP0], a
	ld a, [hld]
	ld [rBGP], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	call DelayFrames
	dec b
	jr nz, GBFadeDecCommon
	ret

FadePal1:: db %11111111, %11111111, %11111111
FadePal2:: db %11111110, %11111110, %11111000
FadePal3:: db %11111001, %11100100, %11100100
FadePal4:: db %11100100, %11010000, %11100000
;                rBGP      rOBP0      rOBP1
FadePal5:: db %11100100, %11010000, %11100000
FadePal6:: db %10010000, %10000000, %10010000
FadePal7:: db %01000000, %01000000, %01000000
FadePal8:: db %00000000, %00000000, %00000000
