Route14Object:
	db $43 ; border block

	db 0 ; warps

	db 1 ; signs
	sign 17, 13, 11 ; Route14Text11

	db 10 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, 4, 4, STAY, DOWN, 1, OPP_BIRD_KEEPER, 12
	object SPRITE_BLACK_HAIR_BOY_1, 15, 6, STAY, DOWN, 2, OPP_BIRD_KEEPER, 13
	object SPRITE_BLACK_HAIR_BOY_1, 12, 11, STAY, DOWN, 3, OPP_BIRD_KEEPER, 14
	object SPRITE_BLACK_HAIR_BOY_1, 14, 15, STAY, UP, 4, OPP_BIRD_KEEPER, 15
	object SPRITE_BLACK_HAIR_BOY_1, 15, 31, STAY, LEFT, 5, OPP_BIRD_KEEPER, 4
	object SPRITE_BLACK_HAIR_BOY_1, 6, 49, STAY, UP, 6, OPP_BIRD_KEEPER, 5
	object SPRITE_BIKER, 5, 39, STAY, DOWN, 7, OPP_BIKER, 13
	object SPRITE_BIKER, 4, 30, STAY, RIGHT, 8, OPP_BIKER, 14
	object SPRITE_BIKER, 15, 30, STAY, LEFT, 9, OPP_BIKER, 15
	object SPRITE_BIKER, 4, 31, STAY, RIGHT, 10, OPP_BIKER, 2
