"GLOBALS for MILLIWAYS
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<OBJECT GLOBAL-OBJECTS
	(DESC "everything")
	;(FDESC 0)
	(GENERIC 0)
	(GLOBAL STAIRS)
	(OWNER 0)
	(TEXT 0)
	(FLAGS	CONTBIT ;DEAD DOORBIT FEMALEBIT
		;INVISIBLE LIGHTBIT LOCKED MUNGBIT
		NARTICLEBIT NDESCBIT ONBIT OPENABLE OPENBIT
		;PERSONBIT PLURAL READBIT RMUNGBIT
		;SEARCHBIT SECRETBIT SEENBIT SURFACEBIT
		TAKEBIT TOOLBIT TOUCHBIT TRANSBIT TRYTAKEBIT
		VEHBIT VOWELBIT WEAPONBIT WEARBIT WORNBIT CAPTAINBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(DESC "all")
	(SYNONYM L.G ;XZZZP)
	(FLAGS NARTICLEBIT)
	(ACTION LOCAL-GLOBALS-F)>

<ROUTINE LOCAL-GLOBALS-F ()
 <COND (<OR <REMOTE-VERB?>
 			<AND <VERB? EXAMINE>
				 <EQUAL? ,PRSO ,INTNUM>>>
	<RFALSE>)
       (T <NOT-HERE ,LOCAL-GLOBALS>)>>



"CONSTANTS"

<GLOBAL LYING-DOWN <>>
<GLOBAL CARELESS-WORDS-FLAG <>>

<ADD-WORD RED ADJ>
<ADD-WORD GREEN ADJ>
<ADD-WORD BLUE ADJ>
<ADD-WORD ORANGE ADJ>
<ADD-WORD YELLOW ADJ>
<ADD-WORD WHITE ADJ>
<ADD-WORD BLACK ADJ>
<ADD-WORD PURPLE ADJ>
<ADD-WORD TEAL ADJ>
<SYNONYM TEAL TURQUOISE CYAN>
<SYNONYM PURPLE MAGENTA PINK VIOLET>
<SYNONYM RED CRIMSON BURGUNDY>
<SYNONYM BLUE NAVY AQUAMARINE INDIGO>
<SYNONYM WHITE PALE GHOSTLY LIGHT>
<SYNONYM BLACK DARK SHADE SHADY>


;[<ADD-WORD HELLO NOUN>
<ADD-WORD YES NOUN>
<ADD-WORD NO NOUN>
<ADD-WORD MRKUG NOUN>]


;"Magrathea - grey,
  Dark - Black
  Mouse Lab - White (black letters)
  Milliways - Red
  Ark B - Pink/Purple
  Morpher - Green
  Dirk - Blue
  Fjord - White
  PDW - Default of interpreter
  Bar - Red (If I can find a brown that would be cool...)"

<ROUTINE CHANGE-PART (COL "OPT" (Y 9) "AUX" X)
    <COND (<EQUAL? .COL 9>
           <SET Y 2>)
          (<EQUAL? .COL 1>
           <SET Y 1>)>
    <SIXCR>
    <SET X <INPUT 1>>
    <COLOR .Y .COL>
    <CLEAR -1>
    <SIXCR><SIXCR>;<SIXCR>
    <INIT-STATUS-LINE>
    <UPDATE-STATUS-LINE>
    ;<V-LOOK>>



; "WORDY ROUTINES"

<ROUTINE ACTUALLY (OBJ "OPT" STR)
    <TELL !\(>
    <COND (.STR
           <TELL .STR>)
          (ELSE
           <THE-J .OBJ T>)>
    <TELL !\) CR>>

<ROUTINE BANG-HEAD ()
    <TELL "You bang your head ">
    <COND (<EQUAL? <LOC ,PLAYER> ,RAMP>
           <TELL "against the ship's side">)
          (<EQUAL? <LOC ,PLAYER> ,HATCHWAY>
           <TELL "as you climb up the ladder, and look up to see that the door is jammed">)
          (<EQUAL? <LOC ,PLAYER> ,LEDGE ,WHALE-CRATER>
           <TELL "on the rock face">)>
    <TELL ,PAUSES>
    <RFALSE>>

<ROUTINE CANNOT-GO ()
	<TELL ,NOPE "go that way." CR>
	<SETG P-CONT <>>
	<RFALSE>>

<ROUTINE CANT-SEE (OBJ "OPT" STR)
	<TELL ,NOPE "see ">
    <COND (.STR
           <TELL "any " .STR>)
          (<EQUAL? ,PRSO ,PSEUDO-OBJECT <> ,ROOMS>
           <TELL "that">)
          (ELSE
           <TELL "any ">
           <D-J .OBJ ;T>)>
    <TELL " here." CR>
    <FUCKING-CLEAR>>

<ROUTINE FACTOR (STRING)
	 <TELL
" at an improbability factor of 2 to the " .STRING "th power to 1 against.">>

<ROUTINE FINE-PRODUCT ()
	 <TELL " bears a small label which reads \"Another fine product
of the " ,SCC ".\" ">>

<ROUTINE NOTES (NUM "OPT" CLER)
    <TELL "(Footnote " N .NUM !\)>
    <COND (.CLER
           <CRLF>)>>

<ROUTINE PART-OF (OB1 OB2 "OPT" STR)
    <TELL That+verb .OB1 "seem" " to be a part of ">
    <COND (.OB2
           <THE-J .OB2 T>)
          (ELSE
           <TELL .STR>)>
    <TELL ,PAUSES>>

<ROUTINE SIXCR ()
	<DO (NUM 1 5)
		<CRLF>>>

<ROUTINE WANT-DEATH ()
    <TELL "If you wanted to die, you would. But you don't, so let's not." CR>
    <RFALSE>>


<CONSTANT AGENCY "Galactic Security Agency">

<CONSTANT ALREADY-KNOW-THAT 
" But then again you must already know that, since you bought one.">

<CONSTANT ALSO-SEE ". Also see the entries on ">

<CONSTANT ASK-ABOUT-OBJECT
"\"Oh...you're trying to figure that out also?
The manual's not much help, is it? By the way,
do you know your score? I don't. My computer
doesn't have a status line.\"">

<CONSTANT AUTO "It's automatic. It won't budge.">

<CONSTANT BEAM " matter transference beam">

<CONSTANT BEAST "Ravenous Bugblatter Beast of Traal">

<CONSTANT BRAIN " brain the size of a planet">

<CONSTANT BUT-WHY "\"Why? Why not?\"">

<CONSTANT CAPTAIN-DEATH
"You feel the stunning blow of an aptly-named Stun Gun (trademark of Sirius Cybernetics Co) as he shoots
you at point-blank range. Thinking quickly about what to do before his friends teleport over for a party,
the captain sends you on your way via the airlock. Unfotunately, no ship comes to pick you up this time.">

<CONSTANT CHEERS "You hear a large cheer as the whole world is shut off.">

<CONSTANT C-UNDER "See under ">

<CONSTANT DO-YOURSELF "That's precisely the sort of stuff that you'll have to do yourself.">

<CONSTANT ELLIPSIS "...">

<CONSTANT EXPLODE-DEATH
"Unexpectedly, the button sets off an electrical spark near the oxygen tanks, and the whole ship explodes,
killing you and destroying everything inside with it in a huge fireball. This stunt was recorded from a
concert on a nearby planet, and made 62 views across the Sub-Etha net before it was taken down as spam.">

<CONSTANT GALACT "Pan Galactic Gargle Blaster">

<CONSTANT GET-RID " you've been trying to get rid of it for years.">

<CONSTANT GPP "Genuine People Personalities">

<CONSTANT GREENY " is a green cube. \"Ah! A green frob of randomness!\" Slarty
declares. \"And already its true form! If miracles were not just high levels of
improbability, they would be otherwise, and that would be less fun, so... Um.\"
He smiles halfheartedly at his odd logic, and looks away in a bout of confusion.|">

<CONSTANT GUIDE-NAME "The Hitchhiker's Guide to the Galaxy">

<CONSTANT HEADSHOT "y swiftly grabs a Kill-O-Zap gun and fires a load of
bullets at you. You surprisingly catch them all, a feat which you have never
accomplished before, and you slide to the floor.">

<CONSTANT HIT-WATER
"the water (mildly salty, you must admit) which has more of an
impact to your body than multiple matter transference beams.">

<CONSTANT HUMANS "Humans are so depressingly ">

<CONSTANT I-ASSUME "I assume you mean: ">

<CONSTANT IT-LOOKS-LIKE "It looks like ">

<CONSTANT LOST-PLANET " the legendary lost planet of Magrathea">

<CONSTANT MARVIN-ANGRY
"? Well, sorry, but it looks like that whole 'understanding' thing was all
fake. Not that I am actually sorry I don't think I'm ever trusting humans again..">

<CONSTANT NICE-DAY "t's a bright morning, the sun is shining, the birds are
singing, the meadows are blooming">

<CONSTANT NOPE "You can't ">

<CONSTANT NO-REFERRING "You don't need to refer to that.|">

<CONSTANT NOT-ENOUGH-ROOM "There's not enough room.|">

<CONSTANT NOTHING-NEW "You don't find anything new there.|">

<CONSTANT NOT-PLUGGED "It's not plugged into anything!">

<CONSTANT NO-VIOLENCE "You are obviously letting things get to you. You should learn to relax a little.|">

<CONSTANT OU-STOP-SEARCHING "ou stop searching">

<CONSTANT PAUSES ".|">

<CONSTANT PRESIDENT " President of the Galaxy">

<CONSTANT QUESTION-ANSWER
"the Question of the Answer to the Question
of Life, the Universe and Everything">

<CONSTANT PIC ".\"|">

<CONSTANT RATEOTU
"he Restaurant at the End of the Universe">

<CONSTANT REPLACE
"The cupboard seems unimpressed, guiding your hand away so you grasp empty air. \"You can't replace it, can you?\"">

<CONSTANT SAY-IT-AGAIN "Like I may have mentioned before, ">

<CONSTANT SCC "Sirius Cybernetics Corporation">

<CONSTANT SPACE-TEXT
"If you hyperventilate and then empty your lungs, you will last about thirty
seconds in the vacuum of space. However, because space is so vastly hugely
mind-bogglingly big, getting picked up by another ship within those thirty
seconds is almost infinitely improbable.">

<CONSTANT SPARK
"As you leap off the edge, a spark of an idea lights in your head. During
the few seconds in which you hang in midair, the idea reveals itself as
common sense and berates you for doing such a stupid thing as actually
jumping off the edge of over one hundred-metre cliff walls. Alas, this
message doesn't make much of a difference to your mental state, because
several milliseconds later, while you process this information, you hit ">

<CONSTANT SPEC-NUM "You have to specify a number between 0 and 9.|">

<CONSTANT SUDDEN "Suddenly, as you ">

<CONSTANT TOO-STUCK "It's too firmly stuck in the metal of his head. ">

<CONSTANT TRY-HARD "No matter how hard you try, it just won't.">

<CONSTANT WAITING "After waiting for a few minutes, you place the phone back down again.|">

;<CONSTANT WHICH-DIR "Which direction do you want to go in?">

<CONSTANT WORTHLESS "It has been designed to do worthless commands like that for you.">

<CONSTANT YOU-ARE "You already are!">

<CONSTANT YOUR-BRAIN
"\"Well, you are the only human alive that was living on Earth when it
was destroyed. So, the Question to the Answer of life, the Universe and
Everything should be somewhere in your brain, just waiting to be found.">

<CONSTANT YOU-DIDNT-SAY-W "[You didn't say w">

<CONSTANT YOU-HEAR "You can hear ">

<CONSTANT YOU-SEE "You can see ">

<CONSTANT ZEN "A brave, Zen-like effort. It fails.">



"Who cares?"
<GLOBAL YAWNS <PLTABLE "unusual" "interesting" "extraordinary" "special">>

<CONSTANT WHO-CARES-LENGTH 5>

<GLOBAL WHO-CARES-VERB
	<PLTABLE "do" "do" "let" "seem" "look">>

<GLOBAL WHO-CARES-TBL
	<PLTABLE 
        "n't appear interested"
		"n't care"
		" out a loud yawn"
		" impatient"
        " bored">>



; "STATUS LINE STUFF"
<CONSTANT S-TEXT 0>
<CONSTANT S-WINDOW 1>

<CONSTANT H-NORMAL 0>
<CONSTANT H-INVERSE 1>
<CONSTANT H-BOLD 2>
<CONSTANT H-ITALIC 4>

<CONSTANT D-SCREEN-ON 1>
<CONSTANT D-SCREEN-OFF -1>
<CONSTANT D-PRINTER-ON 2>
<CONSTANT D-PRINTER-OFF -2>
<CONSTANT D-TABLE-ON 3>
<CONSTANT D-TABLE-OFF -3>
<CONSTANT D-RECORD-ON 4>
<CONSTANT D-RECORD-OFF -4>


; "GLOBAL VARIABLES"
<GLOBAL DONT-FLAG <>>
<GLOBAL AWAITING-REPLY 0>
<GLOBAL IN-FRONT-FLAG <>> 
<GLOBAL UNDIED <>>


; "Tables"
<CONSTANT INDENTS
	<PTABLE
		   ""
		   "   "
		   "     "
	       "        "
	       "           ">>

<CONSTANT MARVIN-HERE
	<PLTABLE
		"follows you"
		"trudges after you, remarking about how much further your weak legs could carry you"
		"moves towards you"
		"trundles slowly, complaining about how rubbish your life must be"
		"follows you"
		"follows you">>

<CONSTANT AS-ICE
	<PLTABLE
		"The wind whips at your face, making you shiver as it freezes your skull."
		"The wind howls, chilling you to the bone."
		;"Your toes must have hypothermia by this point. If only you had some shoes!"
		"There's so much cold you handle, and the fact that you are shivering suggests this is too much."
        "You shiver, the icy air hanging around you like a deadline, slowly deteriorating your mind and body."
        "A stong gust knocks you over; you get back up again.">>

<CONSTANT FAMOUS-QUOTE
    <PLTABLE
        "Trust me.\""
        "I can fly!\""
        "He's unstoppable!\""
        "I can handle this gun.\""
        "We'll make it out alive.\""
        "The bills aren't important.\""
        "This better hold my weight...\""
        "Dare sonley wunpa cent tchanssov dare thyu no.\" (Footnote 14)"
        "Shut up, kid. You are five years old; you cannot do anything!\""
        "We look great in these, Joe. There is no way either of us will be pushed
down the stairs in work and end up in hospital with ten minutes left to live.\"">>

<CONSTANT BETA-MORAL
    <PLTABLE
        "an enormous pillar rises out of the ground,
and you were on it. Unfortunately for you, it was so
unstable that you slipped off it and fell over fifty
meters to your death on the ice"
        "the glacier splits in half and sends you plunging
into ice-cold water without any protection whatsoever"
        "a polar bear rises up behind you and lands right on top of you">>

<CONSTANT REGISTER-TITLES
    <PLTABLE
        "Reginald Markenplatt, John Smith, Holly Dameson, Alburto Molla"
        "Uncle Fleppe, Quarck Jenkins, Xgrrphlak, Karen Zog"
        "Tom, Looe \"Napoleon\" Leferv, Eergon Chakasa, G-g-g-g-gsipolosotanentyhdezxamarequlat O"
        "Oliver Tressenit, Itchy, Scratchy, Styevey Hryeney"
        "Arthur Philip Deodat, Testy X7G663, Dimwit Flathead"
        "Sam Sam Sam, (some sort of name that you can't make out), Jacky Rentear, Bugsy"
        "Zaphod Beeblebrox, Tootha, Aaron Eat'em, Yu Katchas">>



<ROUTINE HAR-HAR ()
	<SETG CLOCK-WAIT T>
	<TELL <PICK-ONE ,YUKS> CR>
	<SETG P-CONT <>>
	<RFALSE>>

<GLOBAL YUKS
    <PLTABLE
	    "What a concept."
        "Nice try."
	    "You can't be serious."
	    "Not likely."
	    "Think again.">>


<ROUTINE IMPOSSIBLE ()
	<SETG CLOCK-WAIT T>
	<TELL <PICK-ONE ,IMPOSSIBLES> CR>
	<RFALSE>>

<GLOBAL IMPOSSIBLES
    <PLTABLE
	    "You have lost your mind."
	    "You are clearly insane."
	    "You appear to have gone barking mad."
	    "I'm not convinced you're allowed to be playing with this computer."
	    "Run out on the street and say that. See what happens."
	    "No, no, a thousand times no. Go boil an egg."
	    "[..And I have a crazy person controlling me. Hmmgrbllgh....]"
        "There's another turn down the drain.">>


<ROUTINE WONT-HELP ()
	<SETG CLOCK-WAIT T>
	<TELL <PICK-ONE ,WASTES> CR>>

<GLOBAL WASTES
    <PLTABLE
	    "Complete waste of time."
	    "Useless. Utterly useless."
	    "A totally unhelpful idea."
	    "Real great answer."
	    "Not helpful."
        "Why bother?">>


<ROUTINE HACK-HACK (STR)
	 <TELL .STR !\ ><THE-J ,PRSO T><TELL !\  <PICK-ONE ,HO-HUM> ,PAUSES>>

<CONSTANT HO-HUM
	<PLTABLE
	 	"doesn't do anything"
	 	"accomplishes nothing"
	 	"has no desirable effect"
		"won't help any"
		"is a waste of time">>


<ROUTINE TELL-ME-HOW ()
    <SETG CLOCK-WAIT T>
	<TELL <PICK-ONE ,LOGICIAN> CR>>

<GLOBAL LOGICIAN
    <PLTABLE
	    "You may know how to do that, but I don't."
	    "You must tell me how to do that."
	    "How?"
	    "Give me some more specifics, and I'll help."
	    "Please, explain.">>




;"This function finds the first time a certain value has been
mentioned in a table and return the place. Only first time.
This also assumes the table is an LTABLE. If nothing, it
returns the function as FALSE."

<ROUTINE FIND-NUM-TBL (TBL VAL "OPT" (LIMIT <GET .TBL 0>) "AUX" (FINAL <>))
    <DO (NUM 1 .LIMIT)
         <COND (<EQUAL? <GET .TBL .NUM> .VAL>
                <SET FINAL .NUM>
                <RETURN>)
               ;(ELSE
                <AGAIN>)>>
    <RETURN .FINAL>>


;"From Arthur: the Quest for Excalibur. Thank you!"
<ROUTINE WORD-FROM-NUMBERS (COUNT "OPT" (1ST? T) "AUX" N)
	<COND (.1ST?
		   <TELL " ">
		   <COND (<L? .COUNT 0>
		   	      <TELL "minus ">
		   	      <SET COUNT <ABS .COUNT>>)>)>
	<COND
		(<EQUAL? .COUNT  0> <TELL "zero">)
		(<EQUAL? .COUNT  1> <TELL "one">)
		(<EQUAL? .COUNT  2> <TELL "two">)
		(<EQUAL? .COUNT  3> <TELL "three">)
		(<EQUAL? .COUNT  4> <TELL "four">)
		(<EQUAL? .COUNT  5> <TELL "five">)
		(<EQUAL? .COUNT  6> <TELL "six">)
		(<EQUAL? .COUNT  7> <TELL "seven">)
		(<EQUAL? .COUNT  8> <TELL "eight">)
		(<EQUAL? .COUNT  9> <TELL "nine">)
		(<EQUAL? .COUNT 10> <TELL "ten">)
		(<EQUAL? .COUNT 11> <TELL "eleven">)
		(<EQUAL? .COUNT 12> <TELL "twelve">)
		(<EQUAL? .COUNT 13> <TELL "thirteen">)
		(<EQUAL? .COUNT 14> <TELL "fourteen">)
		(<EQUAL? .COUNT 15> <TELL "fifteen">)
		(<EQUAL? .COUNT 16> <TELL "sixteen">)
		(<EQUAL? .COUNT 17> <TELL "seventeen">)
		(<EQUAL? .COUNT 18> <TELL "eighteen">)
		(<EQUAL? .COUNT 19> <TELL "nineteen">)
		(<EQUAL? .COUNT 20> <TELL "twenty">)
		(<EQUAL? .COUNT 30> <TELL "thirty">)
		(<EQUAL? .COUNT 40> <TELL "forty">)
		(<EQUAL? .COUNT 50> <TELL "fifty">)
		(<EQUAL? .COUNT 60> <TELL "sixty">)
		(<EQUAL? .COUNT 70> <TELL "seventy">)
		(<EQUAL? .COUNT 80> <TELL "eighty">)
		(<EQUAL? .COUNT 90> <TELL "ninety">)
		(<L? .COUNT 100>
			<SET N <MOD .COUNT 10>>
			<WORD-FROM-NUMBERS <- .COUNT .N> <>>
			<TELL "-">
			<WORD-FROM-NUMBERS .N <>>)
		(<L? .COUNT 1000>
			<WORD-FROM-NUMBERS </ .COUNT 100> <>>
			<TELL " hundred">
			<COND
				(<G? <MOD .COUNT 100> 0>
					<TELL " and ">
					<WORD-FROM-NUMBERS <MOD .COUNT 100> <>>)>)
		(T
			<WORD-FROM-NUMBERS </ .COUNT 1000> <>>
			<TELL " thousand">
			<COND
				(<G? <MOD .COUNT 1000> 0>
					<TELL ", ">
					<WORD-FROM-NUMBERS <MOD .COUNT 1000> <>>)>)>>




"GLOBAL PEOPLE"

<OBJECT OTHER-PLAYER
	(LOC LOCAL-GLOBALS)
	(SDESC "Dirk Gently")
	(SYNONYM DIRK GENTLY)
    (ADJECTIVE DIRK)
	(ACTION OTHER-PLAYER-F)>

<ROUTINE OTHER-PLAYER-F ()
 <COND (<0? ,MY-NAME>
        <COND (<AND <VERB? FIND WHO>
                    ;<EQUAL? ,OTHER-PLAYER ,PRSO ,PRSI>>
               <TELL "You used to know a Dirk Gently.">
               <COND (<FSET? ,OFFICE ,SADRADIOBIT>
                      <TELL " In fact, you ">
                      <ITALICIZE "were">
                      <TELL " a Dirk Gently recently.">)>
               <CRLF>
               <RTRUE>)
              (<AND <EVERYWHERE-VERB?>
                    ;<EQUAL? ,OTHER-PLAYER ,PRSO ,PRSI>>
               <TELL
"You don't see a Dirk Gently around here. You used to know one,
though. Anyway, no point in knowing any more about him, since ">
               <COND (<FSET? ,OFFICE ,SADRADIOBIT>
                      <TELL "it's unlikely you'll ever see him again ">
                      <NOTES 15>)
                     (ELSE
                      <TELL "he was probably destroyed along with the rest of Earth">)>
               <TELL ,PAUSES>
               <RTRUE>)
              (<FSET? ,OFFICE ,SADRADIOBIT>
               <TELL "You're not Dirk Gently right now." CR>
               <RTRUE>)
              (ELSE
               <CANT-SEE <> "Dirk Gently">)>)
       (<1? ,MY-NAME>
        <TELL "You're not Arthur Dent right now. You don't know where he is, either." CR>
        <RTRUE>)>>

<OBJECT MAXXY
    (LOC LOCAL-GLOBALS)
    (DESC "Max Quordlepleen")
    (SYNONYM MAX QUORDLEPL QUORDLE MAXXY MAXIMUS MAXIMILLI)
    (ADJECTIVE MAX MAXXY MAXIMUS MAXIMILLI)
    (FLAGS PERSONBIT NARTICLEBIT)
    (GENERIC MAX-G)
    (ACTION MAXXY-F)>

<ROUTINE MAXXY-F ()
    <COND (<PERSON-F ,MAXXY>
           <RTRUE>)>>

<OBJECT HOTBLACK
    (LOC LOCAL-GLOBALS)
    (DESC "Hotblack Desiato")
    (SYNONYM DESIATO ROCKSTAR)
    (ADJECTIVE HOTBLACK HOT BLACK)
    (FLAGS PERSONBIT NARTICLEBIT)
    (ACTION HOTBLACK-F)>

<ROUTINE HOTBLACK-F ()
    <COND (<VERB? FIND>
           <COND (<IN-REST? ,PLAYER>
                  <COND (<IN? ,PLAYER ,KITCHEN>
                         <TELL D ,HOTBLACK " is a rockstar, not a cook!" CR>)
                        (<IN? ,PLAYER ,THIRD-C>
                         <TELL "You're in " D ,THIRD-C ". Why would " D ,HOTBLACK " be in " D ,THIRD-C !\? CR>)
                        (<EQUAL? ,HERE ,CAR-PARK ,RECEPTION>
                         <TELL "Try looking up in the actual Restaurant itself, instead of the " D ,HERE ,PAUSES>)
                        (ELSE
                         <TELL "You look around. He might be here. Where could he be?" CR>)>)
                 (ELSE
                  <TELL "Yeah, maybe it would be better to try looking in the Restaurant itself." CR>)>)
          (<PERSON-F ,HOTBLACK>
           <RTRUE>)>>





"OBJECTS"

<OBJECT FRUSTATION
	(LOC GLOBAL-OBJECTS)
	(DESC "puzzle")
	(SYNONYM FRUSTRATION PROBLEM PUZZLE)
    (FLAGS SEENBIT)
	(ACTION FRUSTRATION-F)>

<ROUTINE FRUSTRATION-F ()
	 <COND (<VERB? ENJOY>
		<TELL ,ZEN CR>)
           (<VERB? FIND>
        <TELL "You sound like somebody who doesn't care for fun." CR>)>>


<ROUTINE FUCKING-CLEAR ()
	 <SETG P-CONT <>>
	 ;<SETG QUOTE-FLAG <>>
	 <RFATAL>>


<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM INT.NUM ;NUMBER)
	(ADJECTIVE NUMBER)
	(DESC "number")
	(ACTION INTNUM-F)>

<ROUTINE INTNUM-F ()
    <COND (<VERB? EXAMINE WHAT FIND TAKE>
        <TELL N ,P-NUMBER " is ">
        <COND (<=? ,P-NUMBER 0>
            <TELL "zilch">)
        (<=? ,P-NUMBER 1>
            <TELL "the loneliest number that you'll ever meet">)
        (<=? ,P-NUMBER 2>
            <TELL "the loneliest number since the number 1">)
        (<=? ,P-NUMBER 3>
            <TELL "the magic number">)
        (<=? ,P-NUMBER 4>
            <TELL "the only number that has the same number of characters as its value when written out in English">)
        (<=? ,P-NUMBER 5>
            <TELL "the only number that's part of more than one pair of twin primes">)
        (<=? ,P-NUMBER 6>
            <TELL "the smallest perfect number">)
        (<=? ,P-NUMBER 7>
            <TELL "a 1995 film directed by David Fincher, who was destroyed by the Vogons along
with all the records of that movie, but that's not important right now, or so Ford keeps saying.">)
        (<=? ,P-NUMBER 8>
            <TELL "the first number that's neither prime nor semiprime">)
        (<=? ,P-NUMBER 9>
            <TELL "the cube of the magic number (possibly 3 times more magical)">)
        (<=? ,P-NUMBER 10>
            <TELL "a nice number, even if you happen to not particularly like it">)
        (<=? ,P-NUMBER 42>
            <TELL "the Answer to the Ultimate Question of Life, The Universe, and Everything">)
        (<=? ,P-NUMBER 1729>
            <TELL "a very interesting number; it is the smallest number
expressible as the sum of two cubes in two different ways">)
        (<=? ,P-NUMBER 12345>
            <TELL "the combination on your luggage - the luggage that you lost on a trip back to England from Greece,
which included some postcards, a bottle of retsina, and a can of greek olive oil." CR>)
        (<=? ,P-NUMBER -32768 32767>
            <TELL "the ">
            <COND (<L? ,P-NUMBER 0>
                <TELL "min">)
            (ELSE 
                <TELL "max">)>
            <TELL "imum 16-bit signed integer">)
        (ELSE
            <TELL "the number between ">
            <COND (<G? ,P-NUMBER 0>
                <TELL N <- ,P-NUMBER 1> " and " N <+ ,P-NUMBER 1>>)
            (ELSE
                <TELL N <+ ,P-NUMBER 1> " and " N <- ,P-NUMBER 1>>)>)>
      <COND (<=? ,P-NUMBER 42>
          <TELL ". Surprisingly, this is extremely important in the long run, and is why mice are out to get your brain." CR>)
      (<=? ,P-NUMBER 7>
          <TELL "" CR>)
      (<=? ,P-NUMBER 12345>
          <NOTES 3 T>)
      (ELSE
          <TELL ", but that's not important right now." CR>)>)
    ;(<AND <VERB? TAKE>
		  <=? ,P-NUMBER 5 10>>
     <PERFORM ,V?FAINT>)>>


<OBJECT STAIRS
	(LOC LOCAL-GLOBALS)
	(DESC "stairs")
	(SYNONYM STAIR STAIRS STAIRWAY GANGWAY STAIRCASE STEP STEPS STAIRWELL)
	(FLAGS NARTICLEBIT NDESCBIT)
    (GENERIC STAIRS-G)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<VERB? CLIMB-UP ;CLIMB-FOO>
		    <DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		    <DO-WALK ,P?DOWN>)
           (<VERB? FIND>
            <COND (<OR <VISIBLE? ,STAIRS>
                       <VISIBLE? ,SNOW-STAIRS>>
                   <TELL "Right here." CR>)
                  (ELSE
                   <TELL "I'm sure you'll find some around here." CR>)>)
           (<VERB? FOLLOW WALK-AROUND>
            <COND (<AND <GETP ,HERE ,P?UP>
                        <GETP ,HERE ,P?DOWN>>
                   <TELL "Which direction do you want to go in?" CR>)
                  (<GETP ,HERE ,P?UP>
                   <DO-WALK ,P?UP>)
                  (<GETP ,HERE ,P?DOWN>
                   <DO-WALK ,P?DOWN>)
                  (ELSE
                   <TELL ,NOPE "seem to be able to go up or down. That means" ,ELLIPSIS CR>
                   <V-FOO>)>)>>

<ROUTINE GLOBAL-ROOM-F ()
	 <COND (<VERB? LOOK-INSIDE>
			<V-LOOK>
			<RTRUE>)
	       ;(<VERB? THROUGH WALK-TO>
			<V-WALK-AROUND>)
	       (<VERB? LEAVE DISEMBARK>
			<DO-WALK ,P?OUT>)
	       (<VERB? WALK-AROUND>
		    <TELL
"Walking around the room reveals nothing new. To move elsewhere, just type
the desired direction." CR>)
	       ;(<VERB? LAMP-ON>
			<PERFORM ,V?LAMP-ON ,LIGHT-GLOBAL>
			<RTRUE>)>>

<ROUTINE DO-INSTEAD-OF (OBJ1 OBJ2)
	<COND (<EQUAL? ,PRSI .OBJ2> <PERFORM ,PRSA ,PRSO .OBJ1> <RTRUE>)
	      (<EQUAL? ,PRSO .OBJ2> <PERFORM ,PRSA .OBJ1 ,PRSI> <RTRUE>)
	      ;(T		    <PERFORM ,PRSA ,PRSO ,PRSI> <RTRUE>)
	      (T ;<V-FOO> <>)>>

<OBJECT TURN
	(LOC GLOBAL-OBJECTS)
	(ADJECTIVE INT.NUM ;NUMBER FULL)
	(SYNONYM TURN TURNS MINUTE MINUTES)
	(DESC "turn" ;"minute")
	(ACTION TURN-F)>

<ROUTINE TURN-F ()
 <COND (<VERB? USE>
	<PERFORM ,V?WAIT-FOR ,PRSO>
	<RTRUE>)>>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM IT THIS ITSELF)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT)
	(ACTION IT-F)>

<ROUTINE IT-F ()
 ;<COND (<OR <AND <IOBJ? IT>
		 ;<FSET? ,PRSO ,PERSONBIT>
		 <VERB? ASK-ABOUT ASK-FOR SEARCH-FOR TELL-ABOUT>>
	    <AND <DOBJ? IT>
		 <VERB? ASK-CONTEXT-ABOUT ASK-CONTEXT-FOR FIND ;WHAT>>>
	<TELL "\"I'm not sure what you're talking about.\"" CR>)>
 <>>

<OBJECT HELLO-OBJECT
    (LOC GLOBAL-OBJECTS)
    (DESC "hello")
    (SYNONYM HELLO HI GREET GREETINGS HOWDY HEY)
    ;(ADJECTIVE \")
    ;(GENERIC INTQUOTE)
    (FLAGS NARTICLEBIT)
    (ACTION HELLO-OBJECT-F)>

<ROUTINE HELLO-OBJECT-F ()
    <COND (<OR <AND <VERB? SAY TELL>
                    <DOBJ? HELLO-OBJECT>>>
           <PERFORM ,V?HELLO ;,PRSI>
           <RTRUE>)
          (ELSE
           <IMPOSSIBLE>
           <RTRUE>)>>

<OBJECT YES-OBJECT
    (LOC GLOBAL-OBJECTS)
    (DESC "yes")
    (SYNONYM YES)
    ;(ADJECTIVE \")
    ;(GENERIC INTQUOTE)
    (FLAGS NARTICLEBIT)
    (ACTION YES-OBJECT-F)>

<ROUTINE YES-OBJECT-F ()
    <COND (<OR <AND <VERB? SAY TELL>
                    <DOBJ? YES-OBJECT>>>
           <PERFORM ,V?YES>
           <RTRUE>)
          (ELSE
           <IMPOSSIBLE>
           <RTRUE>)>>

<OBJECT NO-OBJECT
    (LOC GLOBAL-OBJECTS)
    (DESC "no")
    (SYNONYM NO)
    ;(ADJECTIVE \")
    ;(GENERIC INTQUOTE)
    (FLAGS NARTICLEBIT)
    (ACTION NO-OBJECT-F)>

<ROUTINE NO-OBJECT-F ()
    <COND (<OR <AND <VERB? SAY TELL>
                    <DOBJ? NO-OBJECT>>>
           <PERFORM ,V?NO>
           <RTRUE>)
          (ELSE
           <IMPOSSIBLE>
           <RTRUE>)>>

<OBJECT MRKUG-OBJECT
    (LOC GLOBAL-OBJECTS)
    (SDESC "Mrkug")
    (SYNONYM MRKUG MRIUG MRIVG)
    ;(ADJECTIVE \")
    ;(GENERIC INTQUOTE)
    (FLAGS NARTICLEBIT)
    (ACTION MRKUG-OBJECT-F)>

<ROUTINE MRKUG-OBJECT-F ()
    <COND (<OR <AND <VERB? SAY TELL>
                    <DOBJ? MRKUG-OBJECT>>>
           <V-MRKUG>
           <RTRUE>)
          (ELSE
           <IMPOSSIBLE>
           <RTRUE>)>>

<OBJECT SHOES
    (LOC GLOBAL-OBJECTS)
    (DESC "shoes")
    (SYNONYM SHOE SHOES SLIPPER SLIPPERS)
    (ADJECTIVE MY)
    (ACTION SHOES-F)>

<ROUTINE SHOES-F ()
    <COND (<VERB? FIND>
           <TELL "Sorry, no shoes. Only your feet." CR>)
          (ELSE
           <TELL "No shoes here!" CR>)>>

<OBJECT GRUES
    (LOC GLOBAL-OBJECTS)
    (DESC "grue")
    (SYNONYM GRUE GRUES)
    (ADJECTIVE SCARY DARK)
    (FLAGS INVISIBLE)
    (ACTION GRUES-F)>

<ROUTINE GRUES-F ()
    <COND (<IN? ,PLAYER ,WHALE-CRATER>
           <TELL ,SAY-IT-AGAIN "any grues here are dead." CR>)
          (ELSE
           <TELL "All you can do is just hope for no grues." CR>)>>

<OBJECT FLOOR
	(LOC GLOBAL-OBJECTS)
	(SDESC "ramp")
	;(ADJECTIVE DRAWING ;ROOM GREAT ;HALL)
	(SYNONYM FLOOR ;AREA GROUND CARPET RUG)
	(FLAGS SEENBIT SURFACEBIT OPENBIT ;SEENBIT)
	(ACTION FLOOR-F)>

<ROUTINE FLOOR-F ("AUX" (OBJ <>) N (X <>))
 <COND ;(<REMOTE-VERB?> <RFALSE>)
       (<VERB? CLIMB-ON>
	<ALREADY ,WINNER "on it">)
       (<AND <VERB? PUT THROW-AT>
	     ;<NOT <DOBJ? MOONMIST>>
	     <IOBJ? FLOOR>>
	;<MOVE ,PRSO ,HERE>
	;<TELL "Okay." CR>
    <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
           <FCLEAR ,ESCAPE-POD ,SADRADIOBIT>
           <SET X T>)>
	<PERFORM ,V?DROP ,PRSO>
    <COND (.X
           <FSET ,ESCAPE-POD ,SADRADIOBIT>)>
	<RTRUE>)
	   (<VERB? EXAMINE>
	<TELL "Very uninteresting." CR>)
       (<VERB? LOOK-ON SEARCH SEARCH-FOR>
	<START-SEARCH .OBJ>
	<RTRUE>)
		(<VERB? ATTACK KILL>
	<IMPOSSIBLE>
	<RTRUE>)>>

<ROUTINE START-SEARCH ("OPTIONAL" (OBJ <>))
	<TELL
"Nothing suspicious meets your eye after a moment's scrutiny. Do you want
to continue?">
	<COND (<NOT <YES?>>
	       <OKAY>
	       <RTRUE>)
	      (T
	       <SETG FOUND-IT .OBJ>
	       <SETG FOUND-LOC ,HERE>
	       <QUEUE I-FOUND-IT <RANDOM 7>>
	       <V-WAIT 8 <> T>
	       <RTRUE>)>>

<GLOBAL FOUND-IT:OBJECT <>>
<GLOBAL FOUND-LOC:OBJECT <>>

<ROUTINE I-FOUND-IT ("OPTIONAL" (GARG <>) "AUX" OBJ)
	%<DEBUG-CODE <COND (<OR ,IDEBUG <==? .GARG ,G-DEBUG>>
			    <TELL "[I-FOUND-IT:">
			    <COND (<==? .GARG ,G-DEBUG> <RFALSE>)>)>>
	<COND (<NOT <EQUAL? ,FOUND-LOC ,HERE>>
	       <RFALSE>)
	      (T ;<ZERO? ,FOUND-IT>
	       <TELL ,NOTHING-NEW>
	       ;<RFATAL>
		   <FUCKING-CLEAR>)>>

<OBJECT DANGER
	(LOC GLOBAL-OBJECTS)
	(DESC "danger")
	(SYNONYM DANGER THREAT ATTACK FEAR)>

;<ROUTINE GENERIC-ROOM (X "OPTIONAL" Y) ,GLOBAL-HERE>

<OBJECT GLOBAL-HERE
	(LOC GLOBAL-OBJECTS)
	(DESC "here")
	(ADJECTIVE THIS)
	(SYNONYM HERE AREA ROOM PLACE)
	;(GENERIC GLOBAL-HERE)
	(FLAGS NARTICLEBIT)
	(ACTION GLOBAL-HERE-F)>

<ROUTINE GLOBAL-HERE-F ("AUX" OBJ (X <>))
 <COND (<VERB? EXAMINE LIE SIT SMELL WALK-TO>
	<DO-INSTEAD-OF ,HERE ,GLOBAL-HERE>
	<RTRUE>)
       (<VERB? PUT PUT-IN ;TIE-TO>
	<MORE-SPECIFIC>)
       (<VERB? SEARCH SEARCH-FOR>
	<COND (<AND <T? ,PRSI>
		    <==? <META-LOC ,PRSI> ,HERE>>
	       <SET X ,PRSI>)
	      (T
	       <SET OBJ <FIRST? ,HERE>>
	       <REPEAT ()
		       <COND (<ZERO? .OBJ>
			      <RETURN>)
			     ;(<FSET? .OBJ ,SECRETBIT>
			      <SET X .OBJ>
			      <RETURN>)
			     (<AND <NOT <FSET? .OBJ ,PERSONBIT>>
				   <OR <FSET? .OBJ ,CONTBIT>
				       <FSET? .OBJ ,SURFACEBIT>>
				   <OR ;<SET X <FIND-IN .OBJ ,SECRETBIT>>
				       <SET X <FIND-IN .OBJ ,RMUNGBIT>>>>
			      <FSET .OBJ ,OPENBIT>
			      <RETURN>)
			     (T <SET OBJ <NEXT? .OBJ>>)>>)>
	<START-SEARCH .X>
	<RTRUE>)>>

<OBJECT CHAIR
	(LOC LOCAL-GLOBALS)
	(DESC "chair")
	;(ADJECTIVE WING)
	(SYNONYM CHAIR SEAT CHAIRS BENCH)
	(FLAGS SEENBIT SURFACEBIT ;VEHBIT)
	(ACTION CHAIR-F)>

<ROUTINE CHAIR-F ()
 <COND (<VERB? SIT ;LOOK-UNDER CLIMB-ON ;CLIMB-DOWN BOARD>
	    <WONT-HELP>)
       (T <RANDOM-PSEUDO>)>>

<OBJECT TABLE-RANDOM
	(LOC LOCAL-GLOBALS)
	(DESC "table")
	;(ADJECTIVE BILLIARD CARD)
	(SYNONYM TABLE DESK ;RECEPTION)
	(FLAGS SEENBIT SURFACEBIT)
	(ACTION RANDOM-PSEUDO)>

<OBJECT SLEEP-GLOBAL
	(LOC GLOBAL-OBJECTS)
	;(ADJECTIVE ;SOME MY)
	(SYNONYM SLEEP)
	(DESC "sleep")
	(FLAGS NARTICLEBIT)
	(ACTION SLEEP-GLOBAL-F)>

<ROUTINE SLEEP-GLOBAL-F ()
 <COND (<VERB? WALK-TO FIND>
	    <PERFORM ,V?FAINT>
	    <RTRUE>)>>

<ROUTINE ROB (WHAT THIEF "OPTIONAL" (TELL? <>) "AUX" N X (TOLD? <>))
	 <SET X <FIRST? .WHAT>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN>)>
		 <SET N <NEXT? .X>>
		 ;<COND (<NOT <FSET? .X ,TAKEBIT>>
			<SET X .N>
			<AGAIN>)>
		 <COND (<AND <NOT .N> .TOLD? .TELL?>
			<TELL " and ">)>
		 <SET TOLD? T>
		 <COND (.TELL?
			;<TELL the .X>
			<THE-J .X T>
			<COND (.N <TELL !\,>)
			      (T <TELL ". ">)>)>
		 <MOVE .X .THIEF>
		 ;<FCLEAR .X ,TAKEBIT>
		 <SET X .N>>>

<OBJECT LIGHT-GLOBAL 
	(LOC GLOBAL-OBJECTS)
	(DESC "light")
	(ADJECTIVE FLOOD MOON)
	(SYNONYM LIGHT LIGHTS LAMP MOONLIGHT)
	(FLAGS SEENBIT ONBIT LIGHTBIT ;TRYTAKEBIT ;NALLBIT)
	(ACTION LIGHT-GLOBAL-F)>

<ROUTINE LIGHT-GLOBAL-F ("AUX" P)
 <COND (<REMOTE-VERB?> <RFALSE>)
       (<VERB? LAMP-ON LAMP-OFF>
        <COND (<IN? ,PLAYER ,OFFICE>
               <TELL "The lights went a few days after the couch arrived." CR>)
              (<IN? ,PLAYER ,STUNT-SHIP>
               <TELL "If only." CR>)
              (ELSE
               <TELL "You have absolutely no control over the light!" CR>
		       <FUCKING-CLEAR>)>
	;<COND (<AND <OUTSIDE? ,HERE> ;<NOT <EQUAL? ,HERE ,CAR>>>
	       <TELL "You can't reach it from here." CR>)
	      (<VERB? LAMP-ON>
	       <COND (<FSET? ,HERE ,ONBIT>
		      <ALREADY ,LIGHT-GLOBAL "on">)
		     (T
		      <FSET ,HERE ,ONBIT>
		      <OKAY ,LIGHT-GLOBAL "on">)>)
	      (<VERB? LAMP-OFF>
	       <COND (<NOT <FSET? ,HERE ,ONBIT>>
		      <ALREADY ,LIGHT-GLOBAL "off">)
		     (<SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>
		      <TELL
D .P " says, \"Please don't leave us in the dark.\"" CR>)
		     (T
		      <FCLEAR ,HERE ,ONBIT>
		      <OKAY ,LIGHT-GLOBAL "off">)>)>)>>

<ADJ-SYNONYM MY MINE YOUR>

<OBJECT YOURS
	(LOC GLOBAL-OBJECTS)
	(DESC "you")
	(FLAGS INVISIBLE)>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND)
	(ADJECTIVE BARE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                       ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                       CAPTAIN\'S")
	;(OWNER BODY-PART-OWNERS)
	(DESC ;"your " "hands")
	(FLAGS NDESCBIT TOUCHBIT NARTICLEBIT PLURALBIT BODYPARTBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F (ACTOR)
     <COND ;(<ADJ-USED? ,HANDS
                       ,W?MARVIN\'S ,W?MARV\'S ,W?SLARTIBAR
                       ,W?SLARTY\'S ,W?ZAPHOD\'S ,W?TRILLIAN\'S
                       ,W?TRICIA\'S ,W?CAPTAIN\'S>
            <TELL ,NO-REFERRING>
            <RTRUE>)
           (<VERB? SHAKE>
			<COND (<SET ACTOR <FIND-IN ,HERE ,PERSONBIT>>
				   <PERFORM ,V?THANK .ACTOR>
				   <RTRUE>)
				  (T
				   <TELL "You must look odd." ;"Pleased to meet you." CR>)>)
		   (<VERB? TAKE>
			<HAR-HAR>)>>

;<ROUTINE HANDS-F ("AUX" P A)
 <COND (<NOT <SET P <FIND-BODY ,HANDS>>>
	<RTRUE>)
       (<REMOTE-VERB?>
	<RFALSE>)>
 <COND ;(<EQUAL? .P ,PLAYER>
	<COND (<VERB? BRUSH>
	       <RFALSE>)>)
       (<VERB? KISS>
	<COND (<AND <FSET? .P ,FEMALEBIT>
		    <T? ,GENDER-KNOWN>
		    <NOT <FSET? ,PLAYER ,FEMALEBIT>>>
	       <PERFORM ,V?HELLO .P>)
	      (T
	       <PERFORM ,V?KISS .P>)>
	<RTRUE>)
       (<AND <VERB? SHAKE TAKE> <DOBJ? HANDS>>
	<COND (<T? ,PRSI> ;<ZERO? .P>
	       <SET P ,PRSI>)>
	;<COND (<ZERO? .P>
	       <COND ;(<ADJ-USED? ,W?HER>
		      <SET P <FIND-FLAG-HERE-BOTH ,PERSONBIT,FEMALEBIT,WINNER>>
		      <COND (<ZERO? .P>
			     <TELL "There's no woman here!" CR>
			     <RTRUE>)>)
		     ;(<ADJ-USED? ,W?HIS>
		      <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,FEMALEBIT,WINNER>>
		      <COND (<ZERO? .P>
			     <TELL "There's no man here!" CR>
			     <RTRUE>)>)
		     (T
		      <SET P <FIND-FLAG-HERE ,PERSONBIT ,WINNER>>
		      <COND (<ZERO? .P>
			     <TELL "There's no one here!" CR>
			     <RTRUE>)>)>)>
	<PERFORM ,V?HELLO .P>
	<RTRUE>)>>

<OBJECT HEAD
	(LOC GLOBAL-OBJECTS)
	;(OWNER YOURS)
	(DESC ;"your " "head")
	(SYNONYM HEAD FACE BARIN NOGGIN)
	(ADJECTIVE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                  ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                  CAPTAIN\'S")
	(FLAGS NARTICLEBIT BODYPARTBIT)
	(ACTION HEAD-F)>

<ROUTINE HEAD-F ()
 <COND ;(<ADJ-USED? ,HEAD
                   ,W?MARVIN\'S ,W?MARV\'S ,W?SLARTIBAR
                   ,W?SLARTY\'S ,W?ZAPHOD\'S ,W?TRILLIAN\'S
                   ,W?TRICIA\'S ,W?CAPTAIN\'S>
        <TELL ,NO-REFERRING>
        <RTRUE>)
       (<VERB? NOD>
		<PERFORM ,V?YES>
		<RTRUE>)
       (<VERB? SHAKE>
		<PERFORM ,V?NO>
		<RTRUE>)
	   (<VERB? TAKE>
		<HAR-HAR>)>>

<OBJECT EYES
	(LOC GLOBAL-OBJECTS)
	;(OWNER YOURS)
	(DESC ;"your " "eyes")
	(SYNONYM EYE EYES)
	(ADJECTIVE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                  ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                  CAPTAIN\'S")
	(FLAGS NARTICLEBIT BODYPARTBIT)
	;(ACTION EYES-F)>

<ROUTINE EYES-F ()
	 <COND ;(<ADJ-USED? ,EYES
                       ,W?MARVIN\'S ,W?MARV\'S ,W?SLARTIBAR
                       ,W?SLARTY\'S ,W?ZAPHOD\'S ,W?TRILLIAN\'S
                       ,W?TRICIA\'S ,W?CAPTAIN\'S>
            <TELL ,NO-REFERRING>
            <RTRUE>)
           (<VERB? OPEN>
			<TELL "They are." CR>)
	       (<VERB? CLOSE>
			<TELL "That won't help." CR>)
		   (<VERB? TAKE MOVE PULL-APART>
		    <TELL "I'd rather you didn't pull out your eyes." CR>)>>

<OBJECT TEETH
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "teeth")
	;(OWNER YOURS)
	(SYNONYM TEETH MOUTH TOOTH)
	(ADJECTIVE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                  ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                  CAPTAIN\'S")
	(FLAGS NARTICLEBIT BODYPARTBIT)
    ;(ACTION BODYPART-F)>

;<ROUTINE BODYPART-F ("AUX" X)
    <COND (<OR <ADJ-USED? ,PRSO
                          ,W?MARVIN\'S ,W?MARV\'S ,W?SLARTIBAR
                          ,W?SLARTY\'S ,W?ZAPHOD\'S ,W?TRILLIAN\'S
                          ,W?TRICIA\'S ,W?CAPTAIN\'S>
               <ADJ-USED? ,PRSI
                          ,W?MARVIN\'S ,W?MARV\'S ,W?SLARTIBAR
                          ,W?SLARTY\'S ,W?ZAPHOD\'S ,W?TRILLIAN\'S
                          ,W?TRICIA\'S ,W?CAPTAIN\'S>>
           <TELL ,NO-REFERRING>
           <RTRUE>)>>

<OBJECT EARS
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "ears")
	;(OWNER YOURS)
	(SYNONYM EAR EARS)
	(ADJECTIVE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                  ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                  CAPTAIN\'S")
	(FLAGS NARTICLEBIT BODYPARTBIT)
    ;(ACTION BODYPART-F)>

<OBJECT FEET
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "feet")
	;(OWNER YOURS)
	(SYNONYM FOOT FEET TOES TOE ANKLE ANKLES)
	(ADJECTIVE MY ;"MARVIN\'S MARV\'S SLARTIBAR SLARTY\'S
                  ZAPHOD\'S TRILLIAN\'S TRICIA\'S
                  CAPTAIN\'S")
	(FLAGS NARTICLEBIT BODYPARTBIT)
    ;(ACTION BODYPART-F)>


<OBJECT THIRD-PLANET
	(LOC LOCAL-GLOBALS)
	(DESC "Earth")
	(ADJECTIVE THIRD BLUE BLUE-GREEN GREEN SMALL)
	(SYNONYM PLANET EARTH)
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION THIRD-PLANET-F)>

<ROUTINE THIRD-PLANET-F ()
	 <COND (<VERB? LEAVE DISEMBARK>
            <COND (<1? ,MY-NAME>
                   <TELL
"You're going to have to do that yourself, because I don't exactly know how to">
                   <COND (<L? ,SOFA-HURDLE 4>
                          <TELL " get over that sofa">)>
                   <TELL ". It doesn't look exactly easy." CR>
                   <RTRUE>)>
		    <TELL "You did!" CR>)
	       (<VERB? EXAMINE>
            <COND (<FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                   <V-LOOK>)
                  (<1? ,MY-NAME>
                   <TELL
"Don't start thinking about that. You're trying
to leave this place, not trying to look at it." CR>)
                  (ELSE
                   <TELL
"It is an utterly insignificant little blue-green planet,
of the sort where they probably still wear digital watches." CR>)>)>>

<OBJECT STAR
	(LOC LOCAL-GLOBALS)
	(DESC "sun")
	(SYNONYM STAR SUN SYSTEM SOL)
	(ADJECTIVE RAPIDLY APPROACHI STAR SOLAR BIG SMALL UNREGARDE YELLOW ORANGE)
	(FLAGS NDESCBIT)
	(ACTION STAR-F)>

<ROUTINE STAR-F ()
     <COND (<VERB? EXAMINE>
	        <COND (<EQUAL? ,HERE ,STUNT-SHIP>
		           <TELL
"The approaching star is enormous, the large star which hosts
(to name only one) the well-known planet of Kakrafoon." CR>)
		          ;(<EQUAL? ,HERE ,DAIS ,SPEEDBOAT>
		           <TELL "The sun is a smallish orange star." CR>)
		          (<OR <FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                       <1? ,MY-NAME>>
		           <TELL "The sun is a smallish yellow star">
                   <COND (<FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                          <TELL
", although it looks a lot brighter than it normally would. Also, even though it's
freezing cold, you're getting burnt right now. Also, the snow (which is very pure
white) is reflecting lots more light into your face, so you assume this is what
sunbathing is like. You never did understand what all the rage about sunbathing was">)>
                   <TELL ,PAUSES>)
		          ;(T
		           <CANT-SEE ,STAR>)>)>>

<OBJECT KAKRAFOON
	(LOC LOCAL-GLOBALS)
	(DESC "Kakrafoon")
	(SYNONYM KAKRAFOON FOON PLANET)
	(FLAGS NDESCBIT)
	(ACTION KAKRAFOON-F)>

<ROUTINE KAKRAFOON-F ()
    <COND (<VERB? EXAMINE>
           <TELL "A small planet, on which a">
           <COND (<FSET? ,KAKRAFOON ,RADPLUGBIT>
                  <TELL " Disaster Area concert">)
                 (ELSE
                  <TELL
"n enormous concert by one of the most famous plutonium rock bands ever">)>
           <TELL
" is currently being held. This stunt ship is meant to fly
into the sun for a dramatic solar flare to reach the planet
eight minutes later, exactly at the climax of the song. Of
course, nobody's meant to actually be in the spaceship; but
eh, not many people would care if you were inside the ship
- which it would appear that you are." CR>)>>

<OBJECT OBJECT-OF-GAME
	(LOC GLOBAL-OBJECTS)
	(DESC "point of the game")
	(SYNONYM OBJECT GAME GOAL POINT MILLIWAYS)
	(FLAGS VOWELBIT)
    (GENERIC RESTAURANT-G)
	(ACTION OBJECT-OF-GAME-F)>

<ROUTINE OBJECT-OF-GAME-F ()
	 <COND (<VERB? WHO WHAT-ABOUT WHAT FIND>
			<TELL ,DO-YOURSELF CR>)
		   (<VERB? EXAMINE LAMP-ON PLAY READ THROUGH>
	        <SETG CLOCK-WAIT T>
	        <TELL "You're playing it now!" CR>)>>


<OBJECT LIFE
	(LOC GLOBAL-OBJECTS)
	(DESC "life")
	(SYNONYM LIFE EVERYTHING)
	(ADJECTIVE ;POINT LIFE UNIVERSE EVERYTHING)
	(FLAGS NARTICLEBIT)
	(ACTION LIFE-F)>

<ROUTINE LIFE-F ()
	 <COND (<VERB? WHAT>
			<TELL "Ask Marvin." CR>)
		   ;(<VERB? ASK-ABOUT>
		   	<RFALSE>)>>

<OBJECT WATER
	(LOC GLOBAL-OBJECTS)
	(DESC "water")
	(SYNONYM WATER SEA LAKE)
	(FLAGS NARTICLEBIT)
    (GENERIC WATER-G)
	(ACTION WATER-F)>

<ROUTINE WATER-F ()
	<COND (<VERB? FIND>
		<TELL "There isn't any water here, if that's what you want to ask." CR>)
	(T
		<TELL "There isn't any water here!" CR>)>>

<ROUTINE CROWD-F ()
    <COND (<VERB? MOVE PUSH WALK-AROUND THROUGH>
           <TELL "It's too tightly packed." CR>)
          (<VERB? EXAMINE>
           <TELL "A mob. That's all you can say." CR>)>>

<OBJECT UP
	(LOC GLOBAL-OBJECTS)
	(DESC "up")
	(SYNONYM UP ABOVE)
	(FLAGS VOWELBIT NARTICLEBIT)
	(ACTION UP-F)>

<ROUTINE UP-F ()
	<COND (<VERB? CLOSE>
		   <PERFORM ,V?SHUSH>
		   <RTRUE>)
          (<VERB? EXAMINE>
		   <COND (<VISIBLE? ,SKY>
		   		  <PERFORM ,V?EXAMINE ,SKY>)
				 (ELSE
				  <PERFORM ,V?EXAMINE ,CEILING>)>)
		  (<VERB? MOVE BOARD WALK>
		   <DO-WALK ,P?UP>)
		  (<VERB? TAKE>
		   <DONT-UNDERSTAND>
           <FUCKING-CLEAR>)>>

<OBJECT DOWN
	(LOC GLOBAL-OBJECTS)
	(DESC "down")
	(SYNONYM DOWN BELOW)
	(FLAGS VOWELBIT NARTICLEBIT)
	(ACTION DOWN-F)>

<ROUTINE DOWN-F ()
	<COND (<VERB? MOVE BOARD WALK>
		   <DO-WALK ,P?DOWN>)
		  (<VERB? EXAMINE>
           <TELL "That's the floor." CR>)>>

<OBJECT THIRD-PLANET
	(LOC GLOBAL-OBJECTS)
	(DESC "Earth")
	(SYNONYM EARTH SUN SOL PLANET)
	(ADJECTIVE THIRD PLANET FROM SUN SOL EARTH)
	(FLAGS NARTICLEBIT)
	(ACTION THIRD-PLANET-F)>

<ROUTINE THIRD-PLANET-F ()
	<COND (<AND <VERB? ASK-ABOUT ASK-CONTEXT-ABOUT TELL-ABOUT>
			<EQUAL? ,PRSI ,THIRD-PLANET>>
		<RFALSE>)
	(ELSE
		<CANT-SEE ,THIRD-PLANET>)>>

<OBJECT RANDOM-THINGS
	(LOC GLOBAL-OBJECTS)
	(DESC "stuff")
	(SYNONYM THINGS STUFF OBJECT OBJECTS)
	(FLAGS NARTICLEBIT)
    (GENERIC RANDOM-THINGS-G)
	(ACTION STUFF-F)>

<ROUTINE STUFF-F ()
	<TELL "Please be more specific." CR>
	<FUCKING-CLEAR>>


;"BEER - a random object adder. Add all you want!"

<OBJECT BEER
    (LOC LOCAL-GLOBALS)
    (SDESC "alcohol")
    (SYNONYM BEER VODKA ALCOHOL WINE WHISKY DRINK TOOTHBRUS BRUSH RUBBER ERASER BAND DISASTER AREA)
    (GENERIC BEER-G)
    ;(FLAGS TAKEBIT)
    (ACTION BEER-F)>

<ROUTINE BEER-F ()
    <FCLEAR ,BEER ,PLURALBIT>
    <COND (<OR <NOUN-USED? ,BEER ,W?BEER ,W?VODKA ,W?ALCOHOL>
               <NOUN-USED? ,BEER ,W?WINE ,W?WHISKY ,W?DRINK>>
           <PUTP ,BEER ,P?SDESC "alcohol">)
          (<NOUN-USED? ,BEER ,W?TOOTHBRUS ,W?BRUSH>
           <PUTP ,BEER ,P?SDESC "toothbrush">)
          (<NOUN-USED? ,BEER ,W?RUBBER ,W?ERASER>
           <PUTP ,BEER ,P?SDESC "rubber">)
          (<NOUN-USED? ,BEER ,W?BAND ,W?DISASTER ,W?AREA>
           <PUTP ,BEER ,P?SDESC "Disaster Area">
           <FSET ,BEER ,PLURALBIT>)>
    <RFALSE>>



;[<OBJECT FROBS
    (LOC GLOBAL-OBJECTS)
    (DESC "frobs")
    (SYNONYM FROBS FROBI FROBBI)
    (ACTION FROBS-F)>

<ROUTINE FROBS-F ()
    <CHOICE-FROBS>>

<ROUTINE CHOICE-FROBS (;'RTN)
    <COND (<VISI-FROB? "(">
           <COND (<VISIBLE? ,BLUE-FROB>
                  <THE-J ,BLUE-FROB T>
                  <COND (<OR ;<VISIBLE? ,KNIFE>
                             <VISIBLE? ,RED-FROB>
                             <VISIBLE? ,GREEN-FROB>>
                         <TELL !\, !\ >)>)
                 ;(<VISIBLE? ,KNIFE>
                  <COND (<AND <NOT <OR ;<VISIBLE? ,KNIFE>
                                       <VISIBLE? ,RED-FROB>
                                       <VISIBLE? ,GREEN-FROB>>>
                              <VISIBLE? ,BLUE-FROB>>
                         <TELL "and ">)>
                  <THE-J ,KNIFE T>
                  <COND (<OR ;<VISIBLE? ,KNIFE>
                             <VISIBLE? ,RED-FROB>
                             <VISIBLE? ,GREEN-FROB>>
                         <TELL !\, !\ >)>)
                 (<VISIBLE? ,RED-FROB>
                  <COND (<AND <NOT <OR ;<VISIBLE? ,KNIFE>
                                       ;<VISIBLE? ,RED-FROB>
                                       <VISIBLE? ,GREEN-FROB>>>
                              <OR <VISIBLE? ,BLUE-FROB>
                                  ;<VISIBLE? ,KNIFE>>>
                         <TELL "and ">)>
                  <THE-J ,RED-FROB T>
                  <COND (<OR ;<VISIBLE? ,KNIFE>
                             ;<VISIBLE? ,RED-FROB>
                             <VISIBLE? ,GREEN-FROB>>
                         <TELL !\, !\ >)>)
                 (<VISIBLE? ,GREEN-FROB>
                  <COND (<AND ;<NOT <OR <VISIBLE? ,KNIFE>
                                       <VISIBLE? ,RED-FROB>
                                       <VISIBLE? ,GREEN-FROB>>>
                              <OR <VISIBLE? ,BLUE-FROB>
                                  ;<VISIBLE? ,KNIFE>
                                  <VISIBLE? ,RED-FROB>>>
                         <TELL "and ">)>
                  <THE-J ,GREEN-FROB T>)>
           <VISI-FROB? ")">
           <COND (<AND <VISIBLE? ,BLUE-FROB>
                       <THE-J ,BLUE-FROB T><TELL ": ">>
                  <SETG PRSO ,BLUE-FROB>
                  <COND (<VERB? SHOW GIVE><V-SHOW>)
                        (<VERB? EXAMINE>  <V-EXAMINE>)
                        (<VERB? FIND>      <V-FIND>)
                        (ELSE             <PERFORM ,PRSA ,PRSO ,PRSI>)>)
                 ;(<AND <VISIBLE? ,KNIFE>
                       <THE-J ,KNIFE T><TELL ": ">>
                  <SETG PRSO ,KNIFE>
                  <COND (<VERB? SHOW GIVE><V-SHOW>)
                        (<VERB? EXAMINE>  <V-EXAMINE>)
                        (<VERB? FIND>      <V-FIND>)
                        (ELSE             <PERFORM ,PRSA ,PRSO ,PRSI>)>)>
           <COND (<AND <VISIBLE? ,GREEN-FROB>
                       <THE-J ,GREEN-FROB T><TELL ": ">>
                  <SETG PRSO ,GREEN-FROB>
                  <COND (<VERB? SHOW GIVE><V-SHOW>)
                        (<VERB? EXAMINE>  <V-EXAMINE>)
                        (<VERB? FIND>      <V-FIND>)
                        (ELSE             <PERFORM ,PRSA ,PRSO ,PRSI>)>)>
           <COND (<AND <VISIBLE? ,RED-FROB>
                       <THE-J ,RED-FROB T><TELL ": ">>
                  <SETG PRSO ,RED-FROB>
                  <COND (<VERB? SHOW GIVE> <V-SHOW>)
                        (<VERB? EXAMINE>   <V-EXAMINE>)
                        (<VERB? FIND>      <V-FIND>)
                        (ELSE              <PERFORM ,PRSA ,PRSO ,PRSI>)>)>)
          (ELSE
           <RFALSE>)>>

<ROUTINE VISI-FROB? (STR)
    <COND (<OR <VISIBLE? ,BLUE-FROB>
               ;<VISIBLE? ,KNIFE>
               <VISIBLE? ,RED-FROB>
               <VISIBLE? ,GREEN-FROB>>
           <TELL .STR>)
          (ELSE
           <TELL "You can't see any frobs here." CR>
           <FUCKING-CLEAR>
           <V-FOO>
           <RFALSE>)>>]

<OBJECT MAGIC-WORD
    (LOC GLOBAL-OBJECTS)
    (DESC "magic word")
    (SYNONYM WORD PHRASE SENTENCE XYZZY PLUGH PUGH PLOVER)
    (ADJECTIVE MAGIC SPECIAL PHILOSOPH)
    ;(GENERIC MAGIC-WORD)
    (ACTION MAGIC-WORD-F)>

<ROUTINE MAGIC-WORD-F ()
    <COND (<AND <VERB? SAY FIND WHERE WHAT-ABOUT WHAT>
                <DOBJ? MAGIC-WORD>>
           <TELL "What "><ITALICIZE "is"><TELL " the magic word? You don't know." CR>)>>

<OBJECT CODE-3
    (LOC GLOBAL-OBJECTS)
    (DESC "three-digit code")
    (SYNONYM CODE NUMBER)
    (ADJECTIVE THREE DIGIT THREE-DIG ;NEXT ;FIRST)
    ;(GENERIC INTNUM)
    (ACTION CODE-3-F)>

<ROUTINE CODE-3-F ()
    <COND (<NOT <OR <IN? ,PLAYER ,PDW>
                    <HELD? ,DEVICE>>>
           <TELL "What code?" CR>
           <FUCKING-CLEAR>)
          (<AND <VERB? SAY FIND WHERE WHAT-ABOUT WHAT>
                <DOBJ? CODE-3>>
           <COND (<FSET? ,CODE-3 ,RADPLUGBIT>
                  <TELL "It's"><TELL-CODE><TELL ", dummy!">)
                 (ELSE
                  <TELL "What "><ITALICIZE "is"><TELL " the code? You don't know." CR>)>)>>

;<OBJECT PLAIN-NAME ;"for things like MY NAME IS..."
	(LOC GLOBAL-OBJECTS)
    ;(OWNER <>)
	(DESC "name")
	(SYNONYM NAME NAMES)
    (GENERIC PLAIN-NAME)
	(FLAGS NDESCBIT TOUCHBIT)
    (ACTION PLAIN-NAME-F)>

;<ROUTINE PLAIN-NAME-F ()
    <COND ;(<EQUAL? <GETP ,PLAIN-NAME ,P?OWNER> ,GL-BEAST>
           )
          (ELSE
           <COND (<VERB? READ EXAMINE>
                  <COND (<IN? ,PLAYER ,DRESSING-ROOM-BBBB>
                         <PERFORM ,PRSA ,REGISTER>)
                        (ELSE
                         <TELL "I can't see any names. What are you looking at?" CR>)>)
                 (ELSE
                  <TELL ,SAY-IT-AGAIN "whose name?" CR>
                  <FUCKING-CLEAR>)>)>>

;<OBJECT SARCASTIC-NAME
	(LOC GLOBAL-OBJECTS)
	(DESC "other name")
	(SYNONYM NAME BUDDHA AUNT FRED)
	(ADJECTIVE AUNT\'S FRED\'S BUDDHA)
    ;(GENERIC PLAIN-NAME)
	(FLAGS VOWELBIT ;INVISIBLE)>

<OBJECT YOUR-NAME
	(LOC GLOBAL-OBJECTS)
	(DESC "name")
    (OWNER PLAYER)
	(SYNONYM NAME NAMES)
	(ADJECTIVE ;YOUR MY)
	(FLAGS NARTICLEBIT TOUCHBIT SEENBIT)
    ;(GENERIC YOUR-NAME)
	(ACTION YOUR-NAME-F)>

<ROUTINE YOUR-NAME-F ()
     <COND (<NOT <ADJ-USED? ,YOUR-NAME ,W?MY>>
            <COND (<VERB? READ EXAMINE>
                   <COND (<IN? ,PLAYER ,DRESSING-ROOM-BBBB>
                          <PERFORM ,PRSA ,REGISTER>)
                         (ELSE
                          <TELL "I can't see any names. What are you looking at?" CR>
                          <RTRUE>)>)
                  (ELSE
                   <TELL ,SAY-IT-AGAIN "whose name?" CR>
                   <RTRUE>)>)
           (ELSE
	        <COND (<VERB? WHAT FIND SAY EXAMINE>
	       	       ;<PERFORM ,V?WHO ,ME>
	       	       <TELL "Your name is ">
                   <COND (<0? ,MY-NAME>
                          <TELL "Arthur Dent">)
                         (ELSE
                          <TELL "Dirk Gently">)>
                   <TELL ". Pleased to meet you. I'm your computer." CR>
                   <RTRUE>)
	               ;(<AND <EQUAL? ,HERE ,OUTER-LAIR>
	       	             <FSET? ,GL-BEAST ,MUNGEDBIT>>
	       	        <RFALSE>)
	               (<VERB? ;EXAMINE RUB MOVE>
	       	        <TELL "Huh?" CR>
                    <RTRUE>)>
            <RFALSE>)>>

<OBJECT GL-BEAST
	(LOC LOCAL-GLOBALS ;GLOBAL-OBJECTS)
	(SDESC "Ravenous Bugblatter Beast of Traal")
	(SYNONYM RAVENOUS BUGBLATTER BEAST BEAST\'S TRAAL TRAAL\'S NAME)
	(ADJECTIVE RAVENOUS BUGBLATTER BEAST BEAST\'S FROM TRAAL TRAAL\'S)
	(FLAGS ;NARTICLEBIT ;INVISIBLE TOUCHBIT SEENBIT)
    ;(GENERIC YOUR-NAME)
    (ACTION GL-BEAST-F)>

;<ROUTINE GL-BEAST-F ()
    <COND (<OR <AND <VERB? LOOK-UP FIND SEARCH-FOR>
                    <IOBJ? REGISTER>>
               <AND <VERB? FIND LOOK-UP EXAMINE>
                    <DOBJ? GL-BEAST>
                    ;<NOUN-USED? ,GL-BEAST ,W?NAME>>>
           <COND (<NOT <IOBJ? REGISTER>>
                  <COND (<AND <NOT <VISIBLE? ,REGISTER>>>
                         <COND (ELSE ;<NOT <NOUN-USED? ,GL-BEAST ,W?NAME>>
                                <TELL <PICK-ONE <PLTABLE
"You can't see any beast here, which is pretty lucky."
"You should be glad you can't see any Beast here."
"You can't see the Ravenous Bugblatter Beast of Traal here.
You don't think you can, anyway.">> CR>
                                <RTRUE>)
                               ;(ELSE
                                <TELL "Where are you meant to find the beast's name?" CR>)>
                         <FUCKING-CLEAR>
                         <RTRUE>)>)>
           <COND (<DOBJ? GL-BEAST>
                  <PUTP ,PLAIN-NAME ,P?OWNER ,GL-BEAST>
                  <PERFORM ,PRSA ,GL-BEAST ,PRSI>
                  <PUTP ,PLAIN-NAME ,P?OWNER <>>
                  <RTRUE>)
                 (<IOBJ? GL-BEAST>
                  <PUTP ,PLAIN-NAME ,P?OWNER ,GL-BEAST>
                  <PERFORM ,PRSA ,PRSO ,GL-BEAST>
                  <PUTP ,PLAIN-NAME ,P?OWNER <>>
                  <RTRUE>)>
           <RTRUE>)
          (ELSE
           <TELL "Huh?" CR>
           <FUCKING-CLEAR>)>>

;<OBJECT GL-BEAST
	(LOC GLOBAL-OBJECTS)
    (OWNER BEAST)
	(SDESC "Ravenous Bugblatter Beast of Traal")
	(SYNONYM RAVENOUS BUGBLATTER BEAST TRAAL NAME)
	(ADJECTIVE BEAST\'S RAVENOUS BUGBLATTER BEAST FROM TRAAL TRAAL\'S)
	(FLAGS NARTICLEBIT ;INVISIBLE TOUCHBIT SEENBIT)
    ;(GENERIC PLAIN-NAME)
    (ACTION GL-BEAST-F)>

<ROUTINE GL-BEAST-F ()
    <COND ;(<ADJ-USED? ,PRSO ,W?MY>
           <PERFORM ,PRSA ,YOUR-NAME ,PRSI>
           <RTRUE>)
          ;(<ADJ-USED? ,PRSI ,W?MY>
           <PERFORM ,PRSA ,PRSO ,YOUR-NAME>
           <RTRUE>)
          (<OR <DOBJ? GL-BEAST>
               <IOBJ? GL-BEAST>>
           <COND (<NOUN-USED? ,GL-BEAST ,W?NAME>
                  <PUTP ,GL-BEAST ,P?SDESC "the Beast's name">
                  ;[<PUTP ,GL-BEAST ,P?SDESC "Ravenous Bugblatter Beast of Traal">
                  <PERFORM ,PRSA ,PRSO ,PRSI>
                  <PUTP ,GL-BEAST ,P?SDESC "name">]
                  <FSET ,GL-BEAST ,NARTICLEBIT>)
                 (ELSE
                  <PUTP ,GL-BEAST ,P?SDESC ,BEAST>
                  <FCLEAR ,GL-BEAST ,NARTICLEBIT>)>
           <COND (<OR <AND <VERB? LOOK-UP FIND SEARCH-FOR>
                           <IOBJ? REGISTER>>
                      <AND <VERB? FIND LOOK-UP EXAMINE>
                           <DOBJ? GL-BEAST>
                           <NOUN-USED? ,GL-BEAST ,W?NAME>>>
                  <COND (<NOT <IOBJ? REGISTER>>
                         <COND (<AND <NOT <VISIBLE? ,REGISTER>>>
                                <COND (<NOT <NOUN-USED? ,GL-BEAST ,W?NAME>>
                                       <TELL <PICK-ONE <PLTABLE
"You can't see any beast here, which is pretty lucky."
"You should be glad you can't see any Beast here."
"You can't see the Ravenous Bugblatter Beast of Traal here.
You don't think you can, anyway.">> CR>)
                                      (ELSE
                                       <TELL "Where are you meant to find the beast's name?" CR>)>
                                <FUCKING-CLEAR>
                                ;<V-FOO>
                                <RTRUE>)
                               ;(<AND <VISIBLE? ,REGISTER>>
                                <TELL "(in the register)" CR>)>)>
                  <COND (<FSET? ,REGISTER ,SADRADIOBIT>
                         <TELL
"You scan the register and find \"The " ,BEAST "\" ..."
CR CR "Looks like I was right. You can see his name near-ish
the end. Poor ol' Max was probably scared for his life when
he wrote that name in the register." CR>
                         <FSET ,REGISTER ,RADPLUGBIT>
                         <FCLEAR ,REGISTER ,SADRADIOBIT>)
                        (<FSET? ,REGISTER ,RADPLUGBIT>
                         <TELL "Yes, it's in the register." CR>)
                        (ELSE
                         <TELL "Oh, look, it's in the register! Well, I already knew that, but still..." CR>
                         <FSET ,REGISTER ,RADPLUGBIT>)>
                  <RTRUE>)>
           <RFALSE>)>>

;<OBJECT BLACK-TEA
	(LOC ROOMS)
	(DESC "black tea")>

;[<OBJECT STUFF-THINGS
	(LOC GLOBAL-OBJECTS)
	(DESC "whatever")
	(SYNONYM HERE)
	(ADJECTIVE I CAN\'T SEE THAT ANY \")
	(FLAGS NARTICLEBIT)
	(ACTION STUFF-THINGS-F)>

<ROUTINE STUFF-THINGS-F ()
	<TELL "Seriously, why? Can't you just be serious for once?" CR>
	<SETG AWAITING-REPLY 1>
	<SETG P-CONT -1>
	<QUEUE I-REPLY 2>>]

<OBJECT YOU-YOU
	(LOC GLOBAL-OBJECTS)
	(DESC "you? Me? Whoever you're talking about")
	(SYNONYM YOU YOURSELF)
	(FLAGS NARTICLEBIT PERSONBIT TOUCHBIT)
	(ACTION YOU-YOU-F)>

<ROUTINE YOU-YOU-F ()
    <COND (<ORDERING?>
           <COND (<EQUAL? ,PRSI ,YOU-YOU>
                  <SETG PRSI ,WINNER>)
                 (<EQUAL? ,PRSO ,YOU-YOU>
                  <SETG PRSO ,WINNER>)>
           <RFALSE>)
          (<VERB? THANK>
           <RFALSE>)
          (<VERB? EXAMINE>
		   <TELL "That isn't important." CR>)
	      (ELSE
		   <TELL "Whoever you're talking about, this is not the time to start thinking about that." CR>)>>

; "Ceiling, Floor, Sky & Walls - and other basic stuff"
<ROUTINE I-CFSW ()
	<PUTP ,PLAYER ,P?SDESC "you">
	<COND (<IN? ,PLAYER ,RAMP>
		   <PUTP ,FLOOR ,P?SDESC "ramp">)
          (<EQUAL? ,HERE ,CHANNEL1 ,CHANNEL2 ,CHANNEL3>
           <PUTP ,FLOOR ,P?SDESC "channel bed">)
		  (<FSET? ,HERE ,OUTSIDEBIT>
		   <PUTP ,FLOOR ,P?SDESC "ground">)
		  (ELSE
		   <PUTP ,FLOOR ,P?SDESC "floor">)>
	<COND (<FSET? ,HERE ,OUTSIDEBIT>
		   <FSET ,CEILING ,INVISIBLE>
		   <FSET ,WALLS ,INVISIBLE>
		   <FCLEAR ,SKY ,INVISIBLE>)
		  (ELSE
		   <FCLEAR ,CEILING ,INVISIBLE>
		   <FCLEAR ,WALLS ,INVISIBLE>
           <COND (<NOT <IN-REST? ,PLAYER>>
                  <FSET ,SKY ,INVISIBLE>)
                 (ELSE
                  <FCLEAR ,SKY ,INVISIBLE>)>)>
	<COND (<EQUAL? ,PRSO ,IT>
		   <SETG PRSO ,P-IT-OBJECT>)
		  (<EQUAL? ,PRSO ,HIM>
		   <SETG PRSO ,P-HIM-OBJECT>)
		  (<EQUAL? ,PRSO ,HER>
		   <SETG PRSO ,P-HER-OBJECT>)
		  (<EQUAL? ,PRSO ,THEM>
		   <SETG PRSO ,P-THEM-OBJECT>)>
	<COND (<EQUAL? ,PRSI ,IT>
		   <SETG PRSI ,P-IT-OBJECT>)
		  (<EQUAL? ,PRSI ,HIM>
		   <SETG PRSI ,P-HIM-OBJECT>)
		  (<EQUAL? ,PRSI ,HER>
		   <SETG PRSI ,P-HER-OBJECT>)
		  (<EQUAL? ,PRSI ,THEM>
		   <SETG PRSI ,P-THEM-OBJECT>)>>

<OBJECT CEILING
	(LOC GLOBAL-OBJECTS)
	(DESC "ceiling")
	(SYNONYM CEILING)
	(FLAGS INVISIBLE SEENBIT TOUCHBIT)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	<COND (<VERB? EXAMINE>
           <COND (<IN-REST? ,PLAYER>
                  <PERFORM ,V?EXAMINE ,SKY>)>
		   <TELL "It doesn't look interesting." CR>)>>

;<OBJECT FLOOR
	(LOC GLOBAL-OBJECTS)
	(DESC "floor")
	(SYNONYM FLOOR GROUND)
	(ACTION FLOOR-F)>

;<ROUTINE FLOOR-F ()
	<COND (<VERB? EXAMINE>
		<TELL "It doesn't look interesting." CR>)>>

<OBJECT WALLS
	(LOC GLOBAL-OBJECTS)
	(DESC "walls")
	(SYNONYM WALLS WALL)
    (ADJECTIVE NORTH SOUTH EAST WEST NE SE NW SW)
	(FLAGS INVISIBLE PLURALBIT SEENBIT TOUCHBIT)
	(ACTION WALLS-F)>

<ROUTINE WALLS-F ()
	<COND (<VERB? EXAMINE>
           <COND (<IN? ,PLAYER ,INTERVIEW-ROOM>
                  <COND (<NOUN-USED? ,WALLS ,W?WALLS>
                         <TELL
"All of the walls are plain, with only a few brown stains - except the south wall, which ">
                         <DESC-SOUTH-WALL>
                         <CRLF>)
                        (<ADJ-USED? ,WALLS ,W?SOUTH>
                         <TELL "The south wall is as white as the other walls, but it ">
                         <DESC-SOUTH-WALL>
                         <CRLF>)
                        (ELSE
                         <TELL
"Quite plain, that's for sure - excluding a few
brown stains. The south wall is more interesting." CR>)>)
                 (ELSE
                  <TELL "The walls don't look interesting." CR>)>
           <RTRUE>)
          (<AND <VERB? WALK-TO CLIMB-UP>
                <ADJ-USED? ,WALLS ,W?SOUTH>
                <IN? ,PLAYER ,INTERVIEW-ROOM>>
           <PERFORM ,V?WALK-TO ,MOUSE-PAINTING>
           <RTRUE>)>>

<ROUTINE DESC-SOUTH-WALL ()
    <TELL "hosts an emergency exit">
    <COND (<AND <FSET? ,MOUSE-PAINTING ,NDESCBIT>
                <IN? ,MOUSE-PAINTING ,INTERVIEW-ROOM>>
           <TELL
", and next to is a strange and (not to mention) quite
badly-made painting">)>
    <TELL !\.>>

<OBJECT SKY
	(LOC GLOBAL-OBJECTS)
	(SDESC "sky")
	(SYNONYM SKY SPACE)
	(FLAGS ;INVISIBLE SEENBIT TOUCHBIT)
	(ACTION SKY-F)>

<ROUTINE SKY-F ()
	<COND (<VERB? EXAMINE>
		   <COND (<EQUAL? ,HERE ,BLIGHTED-GROUND>
		   	      <TELL
"Now, that is one interesting thing that has happened to you today.
The sky is a beautiful reddish-purple, which momentarily lifts your mood." CR>)
                 (<EQUAL? ,HERE ,THIRD-C>
                  <COND (<OR <HELD? ,FIRST-CLASS-CARD>
                             ,BEEN-ALREADY-HALL
                             ,MAX-ALLOWED>
                         <TELL "You can just head northeast to the Dining Hall to get a better view." CR>
                         <RTRUE>)>
                  <TELL "The view is awful!">
                  <COND (<FSET? ,FORD ,SEENBIT>
                         <TELL "There is a better view to the northeast, though." CR>)>
                  <CRLF>
                  <RTRUE>)
                 (<EQUAL? ,HERE ,RECEPTION ,CAR-PARK ,KITCHEN>
                  <TELL "Just because you're in Milliways doesn't mean you'll always find a nice view." CR>)
                 (<IN-REST? ,PLAYER>
                  <TELL
"The skies boil with a violent light. A monstrous, grisly light which
pours in on you like a pot of hot tar spilling over a statue:|
| - a hideous light,
| - a boiling, pestilential light,
| - a light that could disfigure hell.|
|In the northeast quadrant of the sky, you notice an exploding star
that expands, shining, to a climax which ends in a supernova - or
something of the sort, which you never learnt the difference between.
The rest of the sky is either twinkling with stars or pitch dark." CR>)
                 (ELSE
                  <TELL "It doesn't look interesting." CR>)>)
          (<VERB? RUB>
           <HAR-HAR>)>>

<OBJECT AIR
	(LOC GLOBAL-OBJECTS)
	(DESC "air")
	(SYNONYM AIR VACUUM)
	(FLAGS ;INVISIBLE SEENBIT)
	(ACTION UNIMPORTANT-THING-F)>

<OBJECT HEART-OF-GOLD
	(LOC LOCAL-GLOBALS)
	(DESC "the Heart of Gold")
	(SYNONYM HEART GOLD SHIP SPACESHIP)
	(ADJECTIVE SPACE NEW COOL HEART BIG)
	(FLAGS NARTICLEBIT NDESCBIT)
	(ACTION HEART-OF-GOLD-F)>

<ROUTINE HEART-OF-GOLD-F ()
	<COND (<VERB? EXAMINE>
		<TELL "The incredibly amazing new Heart of Gold. It is beautiful, and
shaped like a sleek running shoe." CR>)
	(<VERB? DISEMBARK>
		<COND (<EQUAL? ,HERE ,HATCHWAY ,RAMP>
			<DO-WALK ,P?DOWN>)
		(T
			<TELL "You aren't inside " D ,HEART-OF-GOLD " at the moment, though." CR>)>)
	(<VERB? CLIMB-ON WALK-TO BOARD THROUGH LEAP>
		<COND (<EQUAL? ,HERE ,RAMP ,BLIGHTED-GROUND>
		    <DO-WALK ,P?UP>)
		(T
			<V-WALK-AROUND>)>)>>

<OBJECT FRUSTATION
	(LOC GLOBAL-OBJECTS)
	(DESC "problem")
	(SYNONYM FRUSTRATION PROBLEM PUZZLE)
	(FLAGS SEENBIT TOUCHBIT)
	(ACTION FRUSTRATION-F)>

<ROUTINE FRUSTRATION-F ()
	 <COND (<VERB? ENJOY>
		<TELL ,ZEN CR>)>>

<OBJECT TIME
	(LOC GLOBAL-OBJECTS)
	(DESC "the time")
	(SYNONYM TIME)
	(FLAGS NARTICLEBIT TOUCHBIT)>

<ROUTINE CANT-ENTER-OBJECT ()
	<COND (<VERB? EXAMINE>
		   <TELL "It leads to "><THE-J ,PRSO T><TELL ,PAUSES>)
		  (<VERB? WALK-TO BOARD THROUGH LEAP ;CLIMB-IN WALK>
		   <TELL <PICK-ONE <LTABLE "No need." "You can live without needing to enter there." "You don't have to go there.">> CR>
		   <COND (<VERB? WALK>
		   		  <RFALSE>)
				 (ELSE
				  <RTRUE>)>)
		  (ELSE
		   <UNIMPORTANT-THING-F>)>>

<ROUTINE UNIMPORTANT-THING-F ()
	 <COND (<AND <VERB? ASK-ABOUT>
		     <EQUAL? ,PRSO ,GUIDE>>
		<RFALSE>)
	       (T
		<TELL "That's not important; leave it alone." CR>)>>

<OBJECT WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC ;"room " "window")
	;(ADJECTIVE ROOM)
	(SYNONYM WINDOW WINDSHIELD WINDSCREEN ;DOOR)
	;(GENERIC GENERIC-WINDOW)
	(FLAGS SEENBIT NDESCBIT)
	(ACTION WINDOW-F)>

<ROUTINE WINDOW-F ()
 <COND (<VERB? OPEN CLOSE LOCK UNLOCK>
	    <COND (<NOT <IN? ,PLAYER ,STUNT-SHIP>>
               <COND (<VERB? OPEN UNLOCK>
	                  <TELL "It's been jammed shut, courtesy of bad designers." CR>)
	                 (T ;<VERB? CLOSE>
	                  <ALREADY ,WINDOW "closed">
	                  <RTRUE>)>)
              (ELSE
               <TELL
"Great. Just try to open the thing which is
keeping you from flying into outer space!" CR>)>)
       (<VERB? DISEMBARK ;"CLIMB OUT" LEAVE THROUGH>
	    <TELL "It's ">
        <COND (<IN? ,PLAYER ,STUNT-SHIP>
               <TELL "there for a reason">)
              (ELSE
               <TELL "jammed">)>
        <TELL ,PAUSES>)
       (<VERB? MUNG ATTACK>
        <TELL "Let's not resort to vandalism, please. Even if it is just a window." CR>)
       (<VERB? LOOK-INSIDE LOOK-THROUGH LOOK-OUTSIDE EXAMINE>
	    <COND (<IN? ,PLAYER ,STUNT-SHIP>
               <TELL
"Don't look out. Don't think of the impending doom which you are being
hurtled at. Please, nobody cares. Just DON'T LOOK OUT THE WINDOW." CR>)
              (ELSE
               <TELL "All you can see is a backstreet." CR>)>)>>

;<OBJECT GAME
	(LOC GLOBAL-OBJECTS)
	(DESC "MILLIWAYS")
	(SYNONYM GAME MILLIWAYS)
	(ADJECTIVE POINT AIM)
	(FLAGS NARTICLEBIT)
	(ACTION GAME-F)>

;<ROUTINE GAME-F ()
 	 <COND (<VERB? EXAMINE FIND LAMP-ON PLAY READ THROUGH>
	        <SETG CLOCK-WAIT T>
	        <TELL "You're playing it now!" CR>)>>

<OBJECT DINNER
	(LOC LOCAL-GLOBALS)
	(OWNER PLAYER)
	(DESC "dinner")
	(ADJECTIVE ;COVERED MY ACTUAL PROPER REAL HARAGIA EZ)
	(SYNONYM DINNER FOOD ;ARRAY DISHES PLATE ;FISH MEAL HARAGIA BEGANOA)
	(FLAGS NARTICLEBIT TRYTAKEBIT TAKEBIT ;RADPLUGBIT ;"Overdose of Blaster")
	(SIZE 10)
	(DESCFCN DINNER-D)
    (GENERIC DINNER-G)
	(ACTION DINNER-F)>

<ROUTINE DINNER-D ()
	<TELL "There is an "><ITALICIZE "actual"><TELL " meal here. A good one at that." CR>>

<ROUTINE DINNER-F ()
 <COND (<VERB? EAT ENJOY>
 		<COND (<NOT <IN-REST? ,PLAYER>>
               <TELL
"What! You were just recently in the perfect space to eat - Milliways,
t" ,RATEOTU ". And you want to eat it "><ITALICIZE "here"><TELL !\? CR>
               <RTRUE>)
              (<NOT <FSET? ,DINNER ,RADPLUGBIT>>
               <TELL
"You stuff it in your mouth very quickly, and your hunger
vanishes instantly. You take a deep breath after the final
mouthful, savouring the taste. But as the plate is being
cleared away by service robots, you notice that something
has changed. Or has it?|
|Suddenly, you realise what has happened. There was a spoonful
of " ,GALACT " in there. Oh dear. What is happening to your
head? Standing up, you look around, and everything is normal.
The thing is, you have changed. And you know it - in fact,
you know a "><ITALICIZE "lot"><TELL " more than just that." CR CR>
               <V-SCORESHOT>
               <REMOVE ,DINNER>
               <QUEUE I-FORD-JOINS 2>)
              (ELSE
               <TELL
"You begin to chew at it, but something tastes wrong. You
look at the meal - seems fine. And then you realise that
you spilled too much " ,GALACT " in the meal. Could it be
that bad?|
|...Evidently it "><ITALICIZE "is"><JIGS-UP " that
bad, because soon you find yourself on the floor,
with an extreme case of liver failure.|Perhaps you
should have gotten a subscription to that club a
few miles from home, a few months before it was
destroyed.|But oh well. You didn't.">)>)
       (<VERB? EXAMINE ;SMELL>
		<TELL "An ">
        <ITALICIZE "actual">
        <TELL " meal. Like, really authentic, proper ingerdients. Oh, and it was made by you." CR>)>>

<ROUTINE RANDOM-PSEUDO ()
 <COND (<VERB? ASK-ABOUT ASK-CONTEXT-ABOUT LOOK-BEHIND LOOK-UNDER TELL-ABOUT>
	<RFALSE>)
       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
	<NOTHING-SPECIAL>
	<RTRUE>)
       (T
	<WONT-HELP>
	;<TELL "You can't do anything useful with that." CR>)>>





"GENERICS"

<ROUTINE CAPTAIN-G ()
    <COND (<AND <FSET? ,ARK ,SADRADIOBIT>
                <OR <FSET? ,MORPHER-CAPTAIN ,SECRETBIT>
                    <FSET? ,MORPHER-CAPTAIN ,MUNGBIT>>>
           <RFALSE>)
          (<FSET? ,ARK ,SADRADIOBIT>
           <RETURN ,ARK-CAPTAIN>)
          (<OR <FSET? ,MORPHER-CAPTAIN ,SECRETBIT>
               <FSET? ,MORPHER-CAPTAIN ,MUNGBIT>>
           <RETURN ,MORPHER-CAPTAIN>)
          (ELSE
           ;<TELL "What captain?" CR>
           ;<FUCKING-CLEAR>
           <RFALSE>)>>

<ROUTINE PEN-G ()
    <COND (<AND <FSET? ,DRESSING-ROOM-BBBB ,SEENBIT>
                <FSET? ,AUTO-SIGN ,TOUCHBIT>>
           <RFALSE>)
          (<FSET? ,DRESSING-ROOM-BBBB ,SEENBIT>
           <RETURN ,PENCIL>)
          (<FSET? ,AUTO-SIGN ,TOUCHBIT>
           <ACTUALLY ,AUTO-SIGN>
           <RETURN ,AUTO-SIGN>)
          (ELSE
           ;<TELL "What captain?" CR>
           ;<FUCKING-CLEAR>
           <RFALSE>)>>

<ROUTINE RESTAURANT-G ()
    <ACTUALLY ,RESTAURANT>
    <RETURN ,RESTAURANT>>

<ROUTINE RANDOM-THINGS-G ()
    <RETURN ,RANDOM-THINGS>>

<ROUTINE BEER-G ()
    <COND (<FIND-NUM-TBL ,P-LEXV ,W?AREA>
           <RETURN ,GLOBAL-HERE>)
          (ELSE
           <RETURN ,BEER>)>>

<ROUTINE DARK-G ()
    <COND (<IN? ,DARKY-ROOM ,DARK>
           ;<ACTUALLY ,DARKY-ROOM>
           <RETURN ,DARKY-ROOM>)
          (ELSE
           <COND (<NOT <EVERYWHERE-VERB?>>
                  <ACTUALLY ,DARK-OBJECT>)>
           <RETURN ,DARK-OBJECT>)>>

<ROUTINE FROB-G ()
    <COND (<AND <FSET? ,BLUE-FROB ,SEENBIT>
                <NOT <FSET? ,GREEN-FROB ,INVISIBLE>>
                <NOT <FSET? ,RED-FROB ,INVISIBLE>>
                <EVERYWHERE-VERB?>>
           <RETURN ,GREEN-FROB>)
          (<AND <FSET? ,BLUE-FROB ,SEENBIT>
                <NOT <FSET? ,GREEN-FROB ,INVISIBLE>>
                <NOT <FSET? ,RED-FROB ,INVISIBLE>>>
           <RFALSE>)
          (ELSE
           <RFALSE>)>>

<ROUTINE FRUIT-G ()
    <COND (<AND <FIND-NUM-TBL ,P-LEXV ,BOWL>
                <EVERYWHERE-VERB?>>
           <RETURN ,BOWL>)
          (<FIND-NUM-TBL ,P-LEXV ,BOWL>
           <RFALSE>)
          (ELSE
           <RETURN ,FRUIT>)>>

<ROUTINE PHONE-G ()
    <COND ;(<VERB? $CALL>
           <RETURN ,PHONE>)
          (<VERB? WRITE WRITE-WHAT>
           <RETURN ,CELL-PHONE>)
          (ELSE
           <RETURN ,PHONE>)>>

<ROUTINE PINK-BATH-G ()
    <COND (<VISIBLE? ,PINK-BATH>
           <ACTUALLY ,PINK-BATH>)>
    <RETURN ,PINK-BATH>>

<ROUTINE WATER-G ()
    <COND (<AND <VISIBLE? ,WATER-PORTION>
                <VISIBLE? ,MINERAL-WATER>
                <NOT <EVERYWHERE-VERB?>>>
           <RFALSE>)
          (<AND <VISIBLE? ,WATER-PORTION>
                <NOT <EVERYWHERE-VERB?>>>
           <RETURN ,WATER-PORTION>)
          (<OR <VISIBLE? ,MINERAL-WATER>
               <AND <EVERYWHERE-VERB?>
                    <FSET? ,MINERAL-WATER ,SEENBIT>
                    <ACTUALLY ,MINERAL-WATER>>>
           <RETURN ,MINERAL-WATER>)
          (ELSE
           <RETURN ,WATER>)>>

<ROUTINE LIGHT-G ()
    <COND ;(<EVERYWHERE-VERB?>
           <RETURN ,LIGHT-GLOBAL>)
          (<AND <VISIBLE? ,RED-LIGHT>
                <NOT <EVERYWHERE-VERB?>>>
           <RETURN ,RED-LIGHT>)
          (ELSE
           <RETURN ,LIGHT-GLOBAL>)>>

<ROUTINE DOOR-G ()
    <COND (<IN? ,PLAYER ,DINING-HALL>
           <RFALSE>)
          (<EVERYWHERE-VERB?>
           <TELL "Which door? There's a lot of them in this game." CR>
           <FUCKING-CLEAR>
           <RTRUE>)
          (ELSE
           <RFALSE>)>>

<ROUTINE MAX-G ()
    <COND (<VERB? $CALL>
           <RETURN ,HALLWAY3>)
          (ELSE
           <RETURN ,MAXXY>)>>

<ROUTINE PILLS-G ()
    <COND (<NOT <EVERYWHERE-VERB?>>
           <ACTUALLY ,PILLS>)>
    <RETURN ,PILLS>>

<ROUTINE DEVICE-G ()
    <COND (<NOT <EVERYWHERE-VERB?>>
           <ACTUALLY ,DEVICE>)>
    <RETURN ,DEVICE>>

<ROUTINE BEAM-G ()
    <COND (<EVERYWHERE-VERB?>
           <RETURN ,TELEPORTER>)
          (ELSE
           <RFALSE>)>>

<ROUTINE POLICE-G ()
    <RETURN ,LIP1>>

<ROUTINE STAIRS-G ()
    <RETURN ,STAIRS>>

<ROUTINE DINNER-G ()
    <COND (<AND <VISIBLE? ,PLATE>
                <NOT <VISIBLE? ,DINNER>>>
           <RETURN ,PLATE>)
          (ELSE
           <RETURN ,DINNER>)>>

<ROUTINE KEY-G ()
    <COND (<AND <OR <DOBJ? GUIDE>
                    <IOBJ? GUIDE>>
                <VERB? ASK-ABOUT>>
           <RETURN ,LIP4>)
          (<AND <VISIBLE? ,WEIRDBOX-KEY>
                <IN? ,PLAYER ,PDW>>
           <ACTUALLY ,WEIRDBOX-KEY>
           <RETURN ,WEIRDBOX-KEY>)
          (<AND <FSET? ,MARVIN ,RADPLUGBIT>
                <OR <DOBJ? MARVIN>
                    <IOBJ? MARVIN>>>
           <ACTUALLY ,KEYSET>
           <RETURN ,KEYSET>)
          (ELSE
           <RFALSE>)>>

<ROUTINE THING-G ()
    <COND (<IN? ,PLAYER ,DARK>
           <RETURN ,OTHER-THING>)
          (ELSE
           <RETURN ,THING>)>>



"Legendary Items"
<OBJECT BABEL-FISH
	(LOC PLAYER)
	(DESC "babel fish")
	(ADJECTIVE BABEL)
	(SYNONYM BABEL FISH)
	(FLAGS TRYTAKEBIT WORNBIT)
	(ACTION BABEL-FISH-F)
    (SIZE 0)>

<ROUTINE BABEL-FISH-F ()
	 <COND (<VERB? TAKE REMOVE PUT PUT-IN>
		<TELL
"That would be foolish. Having a " D ,BABEL-FISH " in your ear is terribly
useful." CR>
        <RTRUE>)
           (<VERB? EXAMINE SEARCH RUB LICK>
        <TELL "It's all the way down your ear canal! Seriously?" CR>)>>

<OBJECT THING
	(LOC GOWN)
	(SDESC "thing your aunt gave you which you don't know what it is")
	(SYNONYM THING GIFT AUNT)
	(ADJECTIVE AUNT\'S FROM MY)
	(FLAGS TAKEBIT CONTBIT ;SEARCHBIT OPENBIT TRANSBIT)
	(SIZE 6)
	(CAPACITY 150)
    (GENERIC THING-G)
	(ACTION THING-F)>

<ROUTINE THING-F ()
     <PUTP ,THING ,P?SDESC "thing your aunt gave you which you don't know what it is">
	 <COND (<VERB? EXAMINE>
		<TELL
"Apart from a label on the bottom saying \"Made in Ibiza\" it furnishes you
with no clue as to its purpose, if indeed it has one. You are surprised to see
it because you thought you'd thrown it away. Like most gifts from your aunt,"
,GET-RID CR>)
	       (<AND <VERB? DROP>
		     ;<NOT <EQUAL? ,HERE ,MAZE ,ACCESS-SPACE>>>
		<MOVE ,THING ,HERE>
		<TELL
"It falls to the ground with a light \"thunk.\" It doesn't do anything
else at all." CR>)
           (<VERB? SEARCH LOOK-INSIDE>
        <PUTP ,THING ,P?SDESC "Thing">)
	       (<VERB? CLOSE>
		<TELL
"Come to think of it, you vaguely remember an instruction booklet with
directions for that. You never read it and lost it ages ago." CR>)>>

<OBJECT SLEEVES
	(LOC GLOBAL-OBJECTS)
	(DESC "sleeve")
	(SYNONYM SLEEVE SLEEVES)
    (FLAGS TOUCHBIT)
	(ACTION SLEEVES-F)>

<ROUTINE SLEEVES-F ()
	<COND (<NOT <VISIBLE? ,GOWN>>
		<TELL ,NOPE "see any" D ,SLEEVES "here!" CR>)
	       (<VERB? WEAR TAKE>
		<PERFORM ,PRSA ,GOWN>
		<RTRUE>)>>

		
<OBJECT GOWN
	(LOC HATCHWAY)
	(DESC "gown")
    (OWNER PLAYER)
    (FDESC "Your gown appears to have slipped through the hatchway, and is now on the floor.")
	(DESCFCN GOWN-D)
	(SYNONYM GOWN POCKET ROBE LOOP)
	(ADJECTIVE MY ;YOUR DRESSING TATTY FADED BATTERED)
    (FLAGS WEARBIT TRYTAKEBIT TAKEBIT CONTBIT NARTICLEBIT ;SEARCHBIT OPENABLEBIT)
	(SIZE 15)
	(CAPACITY 20)
	(ACTION GOWN-F)>

<ROUTINE GOWN-D ()
    <TELL "Your gown is here." CR>
    <COND (<FSET? ,GOWN ,OPENBIT>
           <PRINT-CONT ,GOWN <> 0 <> T>)>>

<ROUTINE GOWN-F ()
    <COND (<VERB? EXAMINE>
		   <TELL "The dressing gown is faded and battered, and is
clearly a garment which has seen better decades. It has a pocket which is ">
		   <COND (<FSET? ,GOWN ,OPENBIT>
				  <TELL "open">)
				 (T
				  <TELL "closed">)>
		   <TELL ,PAUSES>)
		  (<AND <VERB? OPEN>
		  		<NOT <FSET? ,GOWN ,OPENBIT>>
				<FSET? ,GOWN ,WORNBIT>>
		   <FSET ,GOWN ,OPENBIT>
		   <PRINT-CONT ,GOWN <> 0 <> T>)
		  (<VERB? SEARCH LOOK-INSIDE>
           <COND (<FSET? ,GOWN ,OPENBIT>
                  <PRINT-CONT ,GOWN <> 0 <> T>)
                 (ELSE
                  <FIRST-YOU "opening" ,GOWN>)>
		   <RTRUE>)
		  (<AND <VERB? DROP>
		  		<FSET? ,GOWN ,WORNBIT>>
		   <TELL "You'll have to remove it first." CR>
		   <RTRUE>)>>


<OBJECT TEA
	(LOC GLOBAL-OBJECTS)
	(SYNONYM TEA)
	(ADJECTIVE REAL NO)
	(DESC "tea")
	(ACTION TEA-F)>

<ROUTINE TEA-F ()
	<COND (<AND <VERB? ASK-ABOUT ASK-CONTEXT-ABOUT>
				<NOT <DOBJ? TEA>>>
		   <RFALSE>)
	(ELSE
		<TELL "Pull youself together; you're making absolutely no sense." CR>
		<FUCKING-CLEAR>)>>


"And now for the alleged GUIDE..."

<GLOBAL MAGRATHEA-CHECK <>>

<OBJECT GUIDE
	(LOC GOWN)
	(DESC "The Hitchhiker's Guide")
	(LDESC "There is a copy of The Hitchhiker's Guide here.")
	(SYNONYM COPY GUIDE GALAX)
	(ADJECTIVE HITCHHIKE SUB-ETHA)
	(SIZE 15)
	(FLAGS NARTICLEBIT TRYTAKEBIT TAKEBIT READBIT ;PERSONBIT)
	(TEXT "Try: CONSULT GUIDE ABOUT (something).")
	(ACTION GUIDE-F)>

;<ROUTINE GUIDE-DESCFCN ("OPTIONAL" X)
	 <TELL "There is a copy of " ,GUIDE-NAME " here." CR>>

<ROUTINE GUIDE-F ()
	<COND (<VERB? EXAMINE>
		<TELL
"The Guide is a Mark II model. Its only resemblance to the Mark IV pictured
in the brochure in your game package is the large, friendly \"Don't Panic!\"
on its cover.|
|
The Guide is a Sub-Etha Relay. You can use it to tap information from a huge
and distant data bank by consulting the Guide about some item or subject.">
        <COND (<FSET? ,GUIDE ,BADRADIOBIT>
               <TELL "|None of this matters anyway, because the Guide is broken.">)>
        <CRLF>)
	;(<VERB? TAKE>
     <COND (<ITAKE>
            <TELL "Taken." CR>)
           (ELSE
            <TELL "Some unseen force whispers in your ear: \"Don't do it. The Guide is too valuable.\"" CR>
            <RTRUE>)>)
    ;(<VERB? DROP>
     <COND (<IDROP>
            <TELL "Dropped." CR>)
           (ELSE
            <COND (<AND <VERB? PUT-IN>
                        <IOBJ? THING GOWN>>
                   <TELL "You squeeze it in." CR>
                   <MOVE ,GUIDE ,PRSI>)
                  (ELSE
                   <TELL "Some unseen force whispers in your ear: \"Don't do it. The Guide is too valuable.\"" CR>
                   <RTRUE>)>)>)
    (<VERB? ASK-ABOUT>
	 <COND (<OR <EQUAL? ,PRSO ,GUIDE>
	 			;<AND <EQUAL? ,PRSO ,IT>
					 <EQUAL? ,P-IT-OBJECT ,GUIDE>>>
        <COND (<FSET? ,GUIDE ,BADRADIOBIT>
               <TELL "There is no response. It's broken." CR>
               <RTRUE>)>
		<COND (<EQUAL? ,PRSI ,LIP1>
			<TELL
"Suddenly, agents of the " ,AGENCY " pop in using Sub-Etha belts, rough you up
a bit, tell you there's no such thing as the " ,AGENCY " and never to consult "
D ,GUIDE " about the " ,AGENCY " again; then they leave." CR>
			<RTRUE>)
		(ELSE
		<TELL
"The Guide checks through its Sub-Etha-Net database and eventually comes
up with the following entry:" CR CR>
		<HLIGHT ,H-ITALIC>
		<COND (<EQUAL? ,PRSI ,GUIDE>
			<TELL
D ,GUIDE " is a wholly remarkable product." ,ALREADY-KNOW-THAT CR>)
			(<EQUAL? ,PRSI ,HEART-OF-GOLD>
			<TELL
"There is absolutely no such spaceship as " D ,HEART-OF-GOLD " and anything
you've ever read in this spot to the contrary was just a prank.|
-- " ,AGENCY CR>)
			(<EQUAL? ,PRSI ,BLIGHTED-GROUND>
			;<COND (<EQUAL? <RANDINT 1 2> 2>)>
					<TELL
"The " ,SCC " incompetently produces a wide range of inefficient and unreliable
high-tech machinery. However, thanks to SCC's ruthless marketing division, this
junk accounts for over 95% of the high-tech machinery sold in the Galaxy.
(SCC's marketing division will be the first against the wall when the
revolution comes.)" CR>)
			(<EQUAL? ,PRSI ,MARVIN>
			<TELL
,GPP " are a misguided attempt by the " ,SCC " to make their machines behave
more like people. Among the more miserable failures: paranoid-depressive
robots and overprotective computers." CR>)
			(<EQUAL? ,PRSI ,DARK>
			<TELL
"A must for the serious hitchhiker, peril-sensitive sunglasses darken at the "
"first hint of danger, thus shielding the wearer from seeing anything alarming.
Recommended brand: Joo Janta." CR>)   
			(<EQUAL? ,PRSI ,MAGRATHEA>
			<TELL
"According to legend, Magrathea was a planet that amassed incredible wealth by
manufacturing "  D ,OTHER-PLANETS ". They would hold extravagant parties on
planets made of gold or other substances.">
				<COND (<AND <NOT ,MAGRATHEA-CHECK>>
					<TELL " Come to think of it, you can't see any parties around here.">)>
				<SETG ,MAGRATHEA-CHECK T>
				<CRLF>)
			;(<EQUAL? ,PRSI ,ENGINE-ROOM ,MAIN-DRIVE ,SPARE-DRIVE>
			<TELL
"Scientists have long known how to produce FINITE amounts of improbability,
using a " ,FIG ", an " D ,PLOTTER " and a good source of" ,BROWNIAN ".
Recently, however, they have learned to generate INFINITE amounts, thanks to
the invention of the In" ,FIG ". It is rumored that an" ,IID ", based on this
new generator, is currently under development" ,ALSO-SEE D ,PLOTTER " and"
,BROWNIAN ,PAUSES>)
            (<EQUAL? ,PRSI ,SLARTY>
            <TELL
D ,SLARTY " is most well-known for his award-winning design of the Fjords of Norway"
,ALSO-SEE ,LOST-PLANET ,PAUSES>)
			(<EQUAL? ,PRSI ,BLUE-FROB ,RED-FROB ,GREEN-FROB ;,FROBS>
			<TELL
"A frob. Now what can one say about this object? The official definition of this object is this:|
|">
			<HLIGHT ,H-NORMAL><BOLDEN " FROB (plural FROBS)">
			<ITALICIZE "
||    A frob is classified as a small object which can be changed or manipulated in form. The
form you will generally find a frob in is when it appears as just a colourful object. However,
if you are lucky you may find one in its true form, or be able to change it to that. The true form
relates to a certain statistic, such as wealth, knowledge, or charm. It is said that all the frobs
were made from the splintered remains of the 5 pieces of the Wikkit Key. Some true forms include a
knife, a perfect sphere, a complex shape, or a wiggly line in multiple dimensions (whilst visible
in 3D without needing an alternate entity, if that makes sense, which it doesn't).
|    Now, this may seem Like the premise of an epic hero film or something, but frobs are known all
across the galaxy as things which you might use every day. Try looking for one! You can probably
find a frob in in the bathroom, or maybe in the garden.|
|Possible uses of the word FROB:|
    - Old man, give me the frob|
    - \"She took the frob and threw it in the test tube.\""><CRLF>)
			(<OR <EQUAL? ,PRSI ,ZAPHOD>>
			<TELL D ,ZAPHOD " is the former" ,PRESIDENT ,PAUSES>)
            (<OR <EQUAL? ,PRSI ,FORD>>
			<TELL D ,FORD " Prefect is a researcher for " ,GUIDE-NAME ,PAUSES>)
            (<EQUAL? ,PRSI ,MAXXY>
            <TELL
D ,MAXXY " is one of the most famous celebrities in all of the known
Universe; he is the host of " D ,RESTAURANT !\, !\t ,RATEOTU ,PAUSES>)
            (<EQUAL? ,PRSI ,BAR ,BURGERS>
            <TELL
D ,BAR " is a place where you can sit and watch the Big Bang"
,ALSO-SEE D ,MAXXY " and " D ,RESTAURANT ,PAUSES>)
			(<EQUAL? ,PRSI ,TOWEL>
			<TELL
"A towel is the most useful thing (besides the Guide) a Galactic hitchhiker
can have. Its uses include travel, combat, communications, protection from the
elements, hand-drying and disguise. Towels have great symbolic value, with
many associated points of honour. Never mock the towel of another, even if it
has little pink and blue flowers on it. Never do something to somebody else's
towel that you would not want them to do to yours. And, if you borrow the towel
of another, you MUST return it before leaving their world." CR>)
			(<EQUAL? ,PRSI ,MINERAL-WATER>
			<TELL
"A strong body of opinion holds that this is not water at all, despite the
claims on the label about how pure the spring is, and all that tosh about
sparkling babbling brooks and so on. There is something highly suspect about
the water on Santraginus Five, as anyone who's ever met any of their fish
will tell you. Santragiean Mineral Water is also highly ILLEGAL, so if you
have some in your possession, make sure you KEEP it on you." CR>)
            (<EQUAL? ,PRSI ,RAMP ,TELEPORTER>
		    <TELL
"A thoroughly unpleasant means of travelling which involves tearing you apart
in one place and slamming you back together in another. (Of course, it's
better than the older method, where disassembled people would be transmitted
down phone lines and arrive in a garbled and sometimes completely disconnected
state.) You should have a drink or two or three before going through one"
,ALSO-SEE "Alcohol and Protein." CR>)
            (<AND <EQUAL? ,PRSI ,BEER>
                  <OR <NOUN-USED? ,BEER ,W?BEER ,W?VODKA ,W?ALCOHOL>
                      <NOUN-USED? ,BEER ,W?WINE ,W?WHISKY ,W?DRINK>>>
		    <TELL
"Alcohol, in addition to its familiar enjoyable effects, also helps cushion
the shock of" ,BEAM !\s ,ALSO-SEE ,GALACT ,PAUSES>)
            (<OR <AND <EQUAL? ,PRSI ,BEER>
                      <NOUN-USED? ,BEER ,W?BAND ,W?DISASTER ,W?AREA>>
                 <EQUAL? ,PRSI ,HOTBLACK>>
            <FSET ,KAKRAFOON ,RADPLUGBIT>
            <TELL
"Disaster Area are a plutonium rock band from the Gagrakacka Mind Zones and
are generally regarded as not only the loudest rock band in the Galaxy, but
also as being able to produce the loudest noise of any kind at all. The songs
are very popular when listened to at minimum volume but highly regulated across
most of the Galaxy. Disaster Area's music generally revolves around the theme of 
boy-meets-girl-under-silver-moon-which-then-explodes-for-no-apparent-reason.|
|Regular concert goers (an almost infinitely improbable thing) have judged
that the best way to enjoy their concerts was usually to be heard from within
large concrete bunkers some thirty-seven miles away from the stage, whilst
the musicians themselves played their instruments by remote control from
within a heavily insulated spaceship in orbit around the planet - or more
frequently - around a completely different planet altogether.|
|Many worlds have now banned their act altogether, sometimes for artistic
reasons, but most commonly because the band's public address system contravenes
local strategic arms limitations treaties, and has reportedly sent many species
past the edge of extinction." CR>)
            (<OR <AND <EQUAL? ,PRSI ,INTNUM>
                      <=? 42 ,P-NUMBER>>
                 <EQUAL? ,PRSI ,LEDGE>>
		    <TELL
N ,P-NUMBER " is the Answer to the Question of Life, the Universe and Everything.
Although " ,QUESTION-ANSWER " is unkown, and has been for millions of years, many
scientists are determined to find it one day ">
            <NOTES 13>
            <TELL ,ALSO-SEE D ,MAGRATHEA ", the Theory of Theories, and " D ,MICE ,PAUSES>)
            (<EQUAL? ,PRSI ,INTERVIEW-ROOM>
            <TELL
"There is a theory that states that if the answer is ever found, it
will be destroyed and replaced with an even more mindboggling idea
which has yet to be found." CR CR
"There is another theory stating that this has already happened." CR>)
            (<EQUAL? ,PRSI ,MICE ,BENJY ,PERCY>
            <TELL
"Mice are 6th-dimension beings who commonly take the form of a small furry rodent,
so that they can pass inconspicuously by certain restrictions for high-tier races
or threats. On the note of threat, mice are highly dangerous, and it is suggested
you don't meet them unless you have a payload of money to give them or a death wish." CR>)
            (<EQUAL? ,PRSI ,PEANUT-PACKET>
		    <TELL
"Sources of protein, such as the common peanut, are carried by all serious
hitchhikers. Protein loss occurs in" ,BEAM "s and you will become groggy
unless you replace it immediately." CR>)
			(<EQUAL? ,PRSI  ,BABEL-FISH>
		    <TELL
"A mind-bogglingly improbable creature. A " D ,BABEL-FISH ", when placed in
one's ear, allows one to understand any language." CR>)
            (<EQUAL? ,PRSI ,GL-BEAST>
			<TELL
"The " ,BEAST " is a mind-bogglingly stupid animal. It has almost no capacity
for learning from experience and is therefore surprised by virtually everything
that happens to it. Here is an example of how stupid it is: it thinks that if
you can't see it, it can't see you.|
Its behaviour would be quite endearing if it wasn't spoilt by this one
thing: it is the most violently carnivorous creature in the Galaxy. Avoid,
avoid, avoid." CR>)
			(<EQUAL? ,PRSI ,BLASTER>
			<TELL
"The best drink in existence; somewhat like having your brains
smashed out by a slice of lemon wrapped around a large gold brick.||">
<HLIGHT ,H-NORMAL><TELL "It also says that drinking some of the "
,GALACT " and surviving the shock apparently makes you wiser, but
you're npot sure how tyrue that can be - Zaphod Beeblebrox has a "
,GALACT " as a morning routine." CR>)
			(<EQUAL? ,PRSI ,THIRD-PLANET>
			<TELL "Mostly harmless." CR>)
			(<EQUAL? ,PRSI ,SKY>
			<TELL ,SPACE-TEXT CR>)
            (<EQUAL? ,PRSI ,LIP2>
            <TELL ,C-UNDER "ADVICE">)
            (<EQUAL? ,PRSI ,LIP3>
            <TELL ,C-UNDER "GUIDANCE">)
			(<OR <FSET? ,PRSI ,TOOLBIT>
				 <EQUAL? ,PRSI ,LIP4>>
			<TELL
"The editor responsible for entries under this heading has been out to lunch
for a couple of years but is expected back soon, at which point there will be
rapid updates. Until then, don't panic, unless your situation is really a life
or death one, in which case, sure, go ahead, panic." CR>)
			(<EQUAL? ,PRSI ,TEA>
			<TELL
"Sorry, that portion of our Sub-Etha database was accidentally deleted last
night during a wild office party. The lost data will be restored as soon as
we find someone who knows where the back-up tapes are kept, if indeed any
are kept at all." CR>)
			(<EQUAL? ,PRSI ,SPORFE>
			<TELL "Generally, these are used as subtle murder devices, as you can
hand it as a gift to someone who has no idea what it is actually used for, and
the next time they use it, they would inadvertently die a very sad and messy death.
It is said to have been the highest cause of death for the first few weeks after
it was invented. In short, don't own one of these if you're happy with
your life the way it is." CR>)
			(<EQUAL? ,PRSI ,RESTAURANT>
			<TELL
"Ahh. Milliways. " !\T ,RATEOTU !\.>
            <SIXCR>
			<HLIGHT ,H-NORMAL>
			<TELL
"It goes on to explain, in extremely vague then suddenly extremely detailed (and
obviously copyrighted) paragraphs how Milliways, better known as " !\t ,RATEOTU ",
is the best restaurant you can ever visit. It is also situated at the end of time
and matter, and you eat dinner while watching the Universe explode around you. The
text assures you that you cannot and will not die - because of some \"complicated
machine that is a nice addition to the Restaurant, especially if you want to have
the dessert that is served after everything ends.\" Also see: " D ,BAR ,PAUSES
"At the bottom of the page, there is only one word:">
            <SIXCR>
			<ITALICIZE "Froody.">
			<CRLF>)
            (<EQUAL? ,PRSI ,DINNER>
            <TELL
"Dinners are great. Dinner at Milliways is even better. And if you want to have
the best dinner ever, you should try the Haragia ez Beganoa. It is made from any
type of meat, though some sort of vegetarian version is generally preferred. The
recipe for it is as follows:|
|    - 1 steak of some sort of meat (but not black cow, which explodes if it is cooked)
|    - A cup of non-deadly liquid, such as water
|    - Breadcrumbs - or any crumbled food. If you're going really posh, you can
use dried olives or crushed peanuts.
|    - A spoonful of " ,GALACT
"||Okay, now this last part is a little more important. I cannot stress how important
it is that you don't put any more than one spoonful. If you do, you may die, due to
a highly aggressive chemical reaction that occurs between the other ingredients and
the PGGB. So please, listen to me. ONE SPOONFUL. No more. Less is unlikely to happen." CR>
            <HLIGHT ,H-NORMAL>
            <TELL CR "[The rest is gibberish.]" CR>)
			(T
			<TELL
"That is one of the Great Unanswered Questions. For a list of the others,
consult the Guide." CR>)>)>
        <HLIGHT ,H-NORMAL>)>)>>


<OBJECT OTHER-PLANETS
	(LOC LOCAL-GLOBALS)
	(DESC "other planets")
	(SYNONYM PLANET PLANETS)
	(ADJECTIVE OTHER)
	(FLAGS INVISIBLE NDESCBIT VOWELBIT NARTICLEBIT)>

<ROOM FOO-ROOM
    (LOC ROOMS)
    (DESC "Foo Room (You have found a bug!)")
    (LDESC
"If you have reached here, you have found a BUG!
Please report it to maxfouquetogarra@gmail.com .
Thanks!||... Oh - and you'll have to restore or
restart to leave this damned place, or just QUIT.")
    (FLAGS LIGHTBIT ONBIT)>