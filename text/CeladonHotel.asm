_CeladonHotelGrannyText::
	text "#MON? No, this"
	line "is a hotel for"
	cont "people."

	para "We're full up."
	done

_CeladonHotelBeautyText::
	text "I'm on vacation"
	line "with my brother"
	cont "and boyfriend."

	para "CELADON is such a"
	line "pretty city!"
	done

_CeladonHotelSuperNerdText::
	text "Why did she bring"
	line "her brother?"
	done

_CeladonChannelerIntro::
	text "My job is to"
	line "drive out evil"
	cont "spirits."
	para "I'm here on"
	line "reports of a"
	cont "ghostly computer."
	para "Have you seen"
	line "one?"
	done

_CeladonChannelerNo1::
	text "Keep your eyes"
	line "open!"
	para "It could be"
	line "anywhere in here!"
	done

_CeladonChannelerQ2::
	text "Really?!"
	line "Did you use it?!"
	done

_CeladonHotelBattleText1::
	text "You need to be"
	line "exorcized!!"
	done

_CeladonHotelEndBattleText1::
	text "Begone"
	line "evil spirits!"
	prompt

_CeladonHotelAfterBattleText1::
	text "This ghostly"
	line "computer is a"
	cont "tough one."
	para "But I'll drive"
	line "it away someday!"
	done

; RGB Tweaked: everything beyond this line is used exclusively for our Coin Grandpa
_CeladonHotelGrampsIntroText::
	text "My dear, I have"
	line "a soft spot for"
	cont "#MON."

	para "Show me a fine"
	line "@"
	text_ram_stringbuffer
	text " and"
	
	para "I'll reward"
	line "you handsomely!"
	prompt

_CeladonHotelGrampsNoCoinCaseText::
	text "Don't mind me,"
	line "just daydreaming"
	cont "about my youth"
	cont "as a trainer."

	para "Traveling the"
	line "world, catching"
	cont "new #MON<...>"
	done

_CeladonHotelGrampsWrongMonText::
	text "Hmm, that's not"
	line "quite what I had"
	cont "in mind."

	para "Maybe you have"
	line "one stored in"
	cont "your PC?"
	
	para "I'd love to"
	line "see it someday."
	done

_CeladonHotelGrampsReceivedText::
	text "Ahh, magnificent!"
	line "Just like the ones"
	cont "I traveled with"
	cont "in my glory days."

	para "Here, take these"
	line "@"
	text_bcd hCoins, 2 | LEFT_ALIGN | LEADING_ZEROES
	text " coins!"
	done

_CeladonHotelGrampsSpecialPayoutText::
	text "Good heavens!"
	line "This is no"
	
	para "ordinary"
	line "@"
	text_ram_stringbuffer
	text "!"
	
	para "In all my years"
	line "traveling, I've"
	cont "never seen one"
	cont "quite like this!"

	para "Here, take these"
	line "@"
	text_bcd hCoins, 2 | LEFT_ALIGN | LEADING_ZEROES
	text " coins!"
	done
