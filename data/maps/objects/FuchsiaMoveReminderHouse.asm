	object_const_def
	const_export FUCHSIAMOVEREMINDERHOUSE_REMINDER
	const_export FUCHSIAMOVEREMINDERHOUSE_DELETER

FuchsiaMoveReminderHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1 ; HOW TO: x-coord, y-coord, MAP, wrap ID from destination map (starts at 0 but is decremented by 1 in the maps.asm macro, so pretend it starts at 1.)
	warp_event  3,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_DR_MASON, STAY, UP, TEXT_FUCHSIAMOVEREMINDERHOUSE_REMINDER
	object_event  5,  3, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_FUCHSIAMOVEREMINDERHOUSE_DELETER

	def_warps_to FUCHSIA_MOVE_REMINDER_HOUSE
 
