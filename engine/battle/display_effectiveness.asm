DisplayEffectiveness:
;joenote - if a multi-attack move, only display effectiveness on the first attack 
	callba TestMultiAttackMoveUse
	jr nz, .next
	callba TestMultiAttackMoveUse_firstAttack
	ret nz
.next
	
	ld a, [wDamageMultipliers]
	and $7F
	cp $0A
	ret z
	ld hl, SuperEffectiveText
	jr nc, .done
	ld hl, NotVeryEffectiveText
.done
	jp PrintText

SuperEffectiveText:
	TX_FAR _SuperEffectiveText
	db "@"

NotVeryEffectiveText:
	TX_FAR _NotVeryEffectiveText
	db "@"

;joenote - consolidating this task into one function in a different bank
;		- don't print the redundant hits message if attacking only twice
MultiAttackHitXTimesTXT_player:
	ld hl, MultiHitText
	ld a, [wPlayerMoveEffect]
	ld b, a
	ld a, [wPlayerMoveNum]
	ld c, a
	jr MultiAttackHitXTimesTXT_common
MultiAttackHitXTimesTXT_enemy:
	ld hl, HitXTimesText
	ld a, [wEnemyMoveEffect]
	ld b, a
	ld a, [wEnemyMoveNum]
	ld c, a
;fall through
MultiAttackHitXTimesTXT_common:
	ld a, b
	cp ATTACK_TWICE_EFFECT
	jr z, .skipXhitsTXT
	ld a, c
	cp TWINEEDLE
	jr z, .skipXhitsTXT
	call PrintText
.skipXhitsTXT	
	ret

MultiHitText:
	TX_FAR _MultiHitText
	db "@"

HitXTimesText:
	TX_FAR _HitXTimesText
	db "@"
