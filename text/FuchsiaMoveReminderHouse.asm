_MoveDeleterGreetingText::
	text "DOC says I'm so"
	line "forgetful that it"
	cont "is contagious."

	para "Want me to make a"
	line "#MON forget a"
	cont "move?"
	done

_MoveDeleterSaidYesText::
	text "Which #MON"
	line "should forget a"
	cont "move?"
	prompt

_MoveDeleterWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	done

_MoveDeleterConfirmText::
	text "Make it forget"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " was"
	line "forgotten!"
	prompt

_MoveDeleterByeText::
	text "Come visit me"
	line "again!"
	
	para "Now, should I use"
	line "my GREEN or my"
	cont "RED deck here<...>"
	done

_MoveDeleterOneMoveText::
	text "That #mon"
	line "has one move."
	cont "Pick another?"
	done 

_MoveReminderGreetingText::
	text "Hello, I am"
	line "DR.MASON!"     ; "PROF.OAK" doesn't take a space either, so...
	
	para "I tutor children,"
	line "but I also tutor"
	cont "#MON."
	
	para "I teach them to"
	line "remember moves"
	cont "they've forgotten."

	para "¥1000 per lesson."
	line "How about it?"
	done

_MoveReminderSaidYesText::
	text "Which #MON"
	line "should I tutor?"
	prompt

_MoveReminderNotEnoughMoneyText::
	text "Hmmm..."

	para "You don't have"
	line "enough money!"
	done

_MoveReminderWhichMoveText::
	text "Which move should"
	line "it learn?"
	done

_MoveReminderByeText::
	text "If any of your"
	line "#MON need to"
	cont "remember a move,"
	cont "come visit me!"
	done

_MoveReminderNoMovesText::
	text "This #MON"
	line "hasn't forgotten"
	cont "any moves."
	done 
