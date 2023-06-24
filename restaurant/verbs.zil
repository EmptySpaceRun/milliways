"VERBS for MILLIWAYS
Copyright (C) 1988 Infocom, Inc.  All rights reserved."





"WALKTHROUGH commands"
<SYNTAX $ONE = V-P1>
<SYNTAX $TWO = V-P2>
<SYNTAX $TRI = V-P3>
<SYNTAX $FJ  = V-FJORDS>
<SYNTAX $PDW = V-DESIGN>
<SYNTAX $BAR = V-BBBB>
<SYNTAX $DIR = V-DIRK>
<SYNTAX $ARK = V-ARK>
<SYNTAX $ESC = V-ESC>
<SYNTAX $DIN = V-DINNER>

<ROUTINE LONG-TIME ()
    <PERFORM ,V?WAIT-FOR>
    <PERFORM ,V?WAIT-FOR>
    <PERFORM ,V?WAIT-FOR>
    <PERFORM ,V?WAIT-FOR>
    <PERFORM ,V?WAIT-FOR>>

<ROUTINE V-P1 ()
    <MOVE ,GOWN ,PLAYER>
	<FSET ,GOWN ,WORNBIT>
	<FSET ,GOWN ,OPENBIT>
    <MOVE ,MARVIN ,WHALE-CRATER>
	<FSET ,MARVIN ,ONBIT>
	<MOVE ,BLUE-FROB ,PLAYER>
    <PUTP ,BLUE-FROB ,P?SDESC "small penknife">
    <GOTO ,WHALE-CRATER>
	<INCREMENT-SCORE 20 T>
	<END-OF-PART-1 T>
    <LONG-TIME>
	<PERFORM ,V?EXAMINE ,DARK-OBJECT>
	<PERFORM ,V?TELL ,BLUR>>

<ROUTINE V-P2 ()
	<MOVE ,GOWN ,PLAYER>
	<FSET ,GOWN ,WORNBIT>
	<FSET ,GOWN ,OPENBIT>
    <MOVE ,MARVIN ,WHALE-CRATER>
	<FSET ,MARVIN ,ONBIT>
	<MOVE ,BLUE-FROB ,PLAYER>
    <PUTP ,BLUE-FROB ,P?SDESC "small penknife">
    ;<GOTO ,WHALE-CRATER>
	<INCREMENT-SCORE 55 T> ;20+10+25
	<DEQUEUE I-ASK-DEATH>
	<EXPLODE-DEVICE>
	<SETG MOUSE-PROB 10>
    <V-ESC>>

<ROUTINE V-P3 ()
    ;"Gown"
	<MOVE ,GOWN ,PLAYER>
	<FSET ,GOWN ,WORNBIT>
	<FSET ,GOWN ,OPENBIT>
    ;"Frob"
	<MOVE ,BLUE-FROB ,PLAYER>
    <PUTP ,BLUE-FROB ,P?SDESC "small penknife">
    ;"Marvin"
    <MOVE ,MARVIN ,CAR-PARK>
    <FSET ,MARVIN ,ONBIT>
    <MOVE ,RADIO ,MARVIN>
    <MOVE ,PLANT ,MARVIN>
    ;"Miscellaneous"
    <MOVE ,TOWEL ,PLAYER>
    <MOVE ,SPORFE ,THING>
	<FSET ,INTERVIEW-ROOM ,SADRADIOBIT>
    <FSET ,FORD ,SEENBIT>
    <FSET ,FIRST-CLASS ,SEENBIT>
    <FSET ,DRESSING-ROOM-REU ,RADPLUGBIT>
	;"Skip cupboard/idiot puzzle"
    <MOVE ,PLATE ,THING>
    <MOVE ,BLASTER ,THING>
	<MOVE ,FIRST-CLASS-IDIOT ,FIRST-CLASS>
	<FSET ,FIRST-CLASS-IDIOT ,MUNGBIT>
	<MOVE ,FIRST-CLASS-CARD ,PLAYER>
    <FSET ,FIRST-CLASS-CARD ,SADRADIOBIT>
	<GOTO ,CAR-PARK>
	<INCREMENT-SCORE 110 T> ;55+20+35
	<SETG MOUSE-PROB 10>
	<DO-WALK ,P?NORTH>>

<ROUTINE V-FJORDS ()
	<V-P3>
	<SETG DARK-FLAG ,GLACIER-1>
    <SETG IMMOVABLE T>
	<LONG-TIME>
	<PERFORM ,V?RUB ,DARK-OBJECT>
	<PERFORM ,V?PUSH ,LUMP>>

<ROUTINE V-DESIGN ()
	<V-P3>
	<SETG DARK-FLAG ,PDW>
    <SETG IMMOVABLE T>
	<LONG-TIME>
	<PERFORM ,V?LISTEN ,DARK-OBJECT>
	<PERFORM ,V?DROP ,OTHER-THING>>

<ROUTINE V-BBBB ()
	<V-P3>
	<SETG DARK-FLAG ,BAR>
    <SETG IMMOVABLE T>
    <MOVE ,AUTO-SIGN ,PLAYER>
	<LONG-TIME>
	<PERFORM ,V?SMELL ,DARK-OBJECT>
	<PERFORM ,V?THROUGH ,DARKY-ROOM>>

<ROUTINE V-DIRK ()
	<V-P3>
	<SETG DARK-FLAG ,OFFICE>
    <SETG IMMOVABLE T>
    ;<MOVE ,AUTO-SIGN ,PLAYER>
	<LONG-TIME>
	<PERFORM ,V?LISTEN ,DARK-OBJECT>
	<PERFORM ,V?DROP ,OTHER-THING>>

<ROUTINE V-ARK ()
	<V-P3>
	<SETG DARK-FLAG ,ARK>
    <SETG IMMOVABLE T>
    ;<MOVE ,AUTO-SIGN ,PLAYER>
	<LONG-TIME>
	<PERFORM ,V?SMELL ,DARK-OBJECT>
	<PERFORM ,V?THROUGH ,DARKY-ROOM>>

<ROUTINE V-ESC ()
    <LONG-TIME>
	<PERFORM ,V?EXAMINE ,DARK-OBJECT>
	<PERFORM ,V?TELL ,BLUR>>

<ROUTINE V-DINNER ()
	<V-P3>
    <SETG DARK-FLAG ,CAR-PARK>
    <MOVE ,DINNER ,DARK-OBJECT>
    %<DEBUG-CODE <COND (<T? ,P-DBUG><MOVE ,PEANUT-PACKET ,PLATE>)>>
    <MOVE ,KEYSET ,DARK-OBJECT>
	<LEAVE-DARK>>

"PERSONAL DEBUG COMMANDS"
<SYNTAX $WEIGHT OBJECT (FIND ROOMSBIT) = V-$WEIGHT>
<SYNTAX $LOC = V-$LOC>
<SYNTAX SHOWME OBJECT (EVERYWHERE) = V-SHOWME>
<SYNTAX MOVEME OBJECT (MANY EVERYWHERE) = V-MOVEME>

<ROUTINE V-$WEIGHT ("AUX" (X ,PLAYER))
    <COND (<NOT <EQUAL? ,PRSO ,ROOMS <>>>
           <SET X ,PRSO>)>
    <THE-J .X T T><TELL !\: !\  N <WEIGHT .X> CR>>

<ROUTINE V-$LOC ()
    <THE-J <LOC ,PLAYER> T T><CRLF>>

<ROUTINE V-SHOWME ()
    <COND (<EQUAL? ,PRSO ,GLOBAL-HERE>
           <D-J ,HERE>)
          (ELSE
           <THE-J ,PRSO T T>)>
    <CRLF>
    <TELL <GET ,INDENTS 1>><TELL " In "><THE-J <LOC ,PRSO> T>
    <COND (<EQUAL? <LOC ,PLAYER> ,PRSO>
           <TELL " (player in it)">)
          (<HELD? ,PRSO>
           <TELL " (player holding it)">)>
    <CRLF>
    <TELL <GET ,INDENTS 2>>
    <COND (<FSET? ,PRSO ,PERSONBIT>
           <TELL " person.">)>
    <COND (<FSET? ,PRSO ,OPENBIT>
           <TELL " open.">)>
    <COND (<FSET? ,PRSO ,CONTBIT>
           <TELL " container">)>
    <COND (<FIRST? ,PRSO>
           <COND (<NOT <FSET? ,PRSO ,CONTBIT>>
                  <TELL " not-container">)>
           <TELL !\: !\ >
           <PRINT-CONTENTS ,PRSO><CRLF><TELL <GET ,INDENTS 2>>)
          (ELSE
           <COND (<FSET? ,PRSO ,CONTBIT>
                  <TELL !\.>)>)>
    <COND (<FSET? ,PRSO ,SADRADIOBIT>
           <TELL " sadradio.">)>
    <COND (<FSET? ,PRSO ,BADRADIOBIT>
           <TELL " badradio.">)>
    <COND (<FSET? ,PRSO ,RADPLUGBIT>
           <TELL " radplug.">)>
    <COND (<FSET? ,PRSO ,INVISIBLE>
           <TELL " invisible.">)>
    <COND (<FSET? ,PRSO ,SECRETBIT>
           <TELL " secret.">)>
    <COND (<FSET? ,PRSO ,TOUCHBIT>
           <TELL " touched.">)>
    <COND (<FSET? ,PRSO ,SEENBIT>
           <TELL " seen.">)>
    <CRLF>>

<ROUTINE V-MOVEME ()
    <MOVE ,PRSO ,PLAYER>
    <FCLEAR ,PRSO ,INVISIBLE>
    <FCLEAR ,PRSO ,SECRETBIT>
    <TELL "[Done...? I think.]" CR>>



"META commands"

<ROUTINE TRANSCRIPT (STR)
	<TELL "Here " .STR "s a transcript of interaction with" CR>>

<ROUTINE V-SCRIPT ()
	<LOWCORE FLAGS <BOR <LOWCORE FLAGS> 1>>
	<TRANSCRIPT "begin">
	<V-VERSION>
	<RTRUE>>

<ROUTINE V-UNSCRIPT ()
	<TRANSCRIPT "end">
	<V-VERSION>
	<LOWCORE FLAGS <BAND <LOWCORE FLAGS> -2>>
	<RTRUE>>

<ROUTINE V-$ID ()
	 <TELL "Interpreter ">
	 <PRINTN <LOWCORE INTID>>
	 <TELL " Version ">
	 <PRINTC <LOWCORE INTVR>>
	 <CRLF>
	 <RTRUE>>

<ROUTINE V-$VERIFY ()
 <COND (<T? ,PRSO>
	<COND (<AND <EQUAL? ,PRSO ,INTNUM>
		    <EQUAL? ,P-NUMBER 105>>
	       <TELL N ,SERIAL CR>)
	      (T <DONT-UNDERSTAND>)>)
       (T
	<TELL "Verifying disk..." CR>
	<COND (<VERIFY> <TELL "The disk is correct." CR>)
	      (T <TELL
"Oh, oh! The disk seems to have a defect. Try verifying again.
(If you've already done that, the disk surely has a defect." CR>)>)>>

<ROUTINE BOLDEN (STR)
	<HLIGHT ,H-BOLD>
	<TELL .STR>
	<HLIGHT ,H-NORMAL>>

<ROUTINE ITALICIZE (STR)
	<HLIGHT ,H-ITALIC>
	<TELL .STR>
	<HLIGHT ,H-NORMAL>>

<ROUTINE TOO-DARK ()
	<TELL "It's too dark to see!" CR>>

%<DEBUG-CODE [
;<ROUTINE V-$CHEAT ("AUX" (N 0) CH)
	 <COND (<OR <NOT <DOBJ? INTNUM>>
		    <NOT <EQUAL? ,P-NUMBER 1 2 3>>>
		<SETG CLOCK-WAIT T>
		<TELL "{Try $CHEAT 1, 2 or 3.}" CR>
		<RTRUE>)>
	 <COND (<NOT <ZERO? ,MOVES>>
		<TELL "Don't you want to restart first?">
		<COND (<YES?> <RESTART>)
		      (T <TELL "OK, but this may not work!" CR>)>)>>

<GLOBAL IDEBUG:FLAG <>>
<CONSTANT G-DEBUG 4>

;<ROUTINE V-$QUEUE ("AUX" C E TICK)
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <REPEAT ()
		 <COND (<==? .C .E> <RETURN>)
		       (<AND <NOT <ZERO? <GET .C ,C-ENABLED?>>>
			     <NOT <ZERO? <SET TICK <GET .C ,C-TICK>>>>>
			<APPLY <GET .C ,C-RTN> ,G-DEBUG>
			<PRINTC 9>
			<TELL N .TICK CR>)>
		 <SET C <REST .C ,C-INTLEN>>>>

<ROUTINE V-$COMMAND ()
	 <DIRIN 1>
	 <RTRUE>>

;<ROUTINE V-$RANDOM ()
	 <COND (<NOT <DOBJ? INTNUM>>
		<TELL "Illegal." CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<ROUTINE V-$RECORD ()
	 <DIROUT ,D-RECORD-ON> ;"all READS and INPUTS get sent to command file"
	 <RTRUE>>

<ROUTINE V-$UNRECORD ()
	 <DIROUT ,D-RECORD-OFF>
	 <RTRUE>>
]>

"ZORK game commands"

"SUBTITLE SETTINGS FOR VARIOUS LEVELS OF DESCRIPTION"

<GLOBAL VERBOSITY:NUMBER 1>	"0=SUPERB 1=BRIEF 2=VERBOS"

<ROUTINE YOU-WILL-GET (STR)
	<TELL ;"OK, you will get " .STR " descriptions." CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG VERBOSITY 0>
	 <YOU-WILL-GET "Superbrief">>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSITY 1>
	 <YOU-WILL-GET "Brief">>

<ROUTINE V-VERBOSE ()
	<SETG VERBOSITY 2>
	<YOU-WILL-GET "Verbose">
	<CRLF>
	<V-LOOK>>



;[<GLOBAL COLOR? T>

<ROUTINE PRE-COLOR-ON ()
    <SETG COLOR? T>>

<ROUTINE V-COLOR ("OPT" (ON? <>))
    <COND (<ZERO? .ON?>
           <TELL "Color off." CR>)>>]




<ROUTINE V-INVENTORY ()
    <COND (<NOT <FIRST? ,PLAYER>>
           <TELL "You are empty-handed." CR>)
          (ELSE
           <PRINT-CONT ,PLAYER>)>>


;"



* FLINCHES *
'What is THIS?!' roars the crowd of ZIL coders. 
'It's a program checking if the object in question has an SDESC or not!' replies the timid coder.
'Surely there must be a better way to do it!' they say. 'Look, it's all over the code!'
'OK... I could have put it in the THE routine.' He shies away from the awful looks.
												   'Anyway, it works, so it must be good.
													Plus, I saved loads of space by converting
													every 'the' with a space on either side to
													a variable!'
		THE CROWD LOOKS VERY UNIMPERESSED, SIR, SHOULDN'T YOU DO SOMETHING ABOUT IT?
        
        - 'I can't be bothered.' * Sips tea *
"

<ROUTINE THE-J (OBJ THE-A "OPT" CAP? (NOWN <>) "AUX" (STR <>) (OWNS <>))
	<COND (<AND <EQUAL? .OBJ ,PLAYER>
				.CAP?>
	       <TELL "You">
		   <RTRUE>)>
	<COND (<AND <NOT .NOWN>
                <SET OWNS <GETP .OBJ ,P?OWNER>>>
           <COND (<EQUAL? .OWNS ,PLAYER>
                  <COND (.CAP?
                         <TELL !\Y>)
                        (ELSE
                         <TELL !\y>)>
                  <TELL "our ">)
                 (ELSE
                  <THE-J .OWNS .THE-A .CAP?>
                  <TELL "'s ">)>
           <THE-J .OBJ .THE-A .CAP? T>)
		  (ELSE 
           <COND (<AND <NOT <FSET? .OBJ ,NARTICLEBIT>>
                       <NOT .NOWN>>
		   		  <COND (.THE-A
				  		 <COND (.CAP?
						 		<TELL !\T>)
							   (ELSE
							    <TELL !\t>)>
						 <TELL "he ">)
						(ELSE
                         <COND (<FSET? .OBJ ,PLURALBIT>
                                <COND (.CAP?
						           	   <TELL !\S>)
						              (ELSE
						               <TELL !\s>)>
                                <TELL "ome">)
                               (ELSE
                                <COND (.CAP?
						           	   <TELL !\A>)
						              (ELSE
						               <TELL !\a>)>
						        <COND (<FSET? .OBJ ,VOWELBIT>
						        	   <TELL !\n>)>)>
						 <TELL !\ >)>)>
		   <COND (<SET .STR <GETP .OBJ ,P?SDESC>>
                  <TELL .STR>)
		         (ELSE
		          <D-J .OBJ>)>)>>

<ROUTINE D-J (OBJ "AUX" STR)
	<COND (<SET .STR <GETP .OBJ ,P?SDESC>>
		   <TELL .STR>)
		  (ELSE
		   <TELL D .OBJ>)>>

<ROUTINE V-WEAR ()
    <COND (<FSET? ,PRSO ,WEARBIT>
           <COND (<FSET? ,PRSO ,WORNBIT>
                  <TELL "You are already wearing " him ,PRSO ,PAUSES>
                  <RFALSE>)>
	       <COND (<AND ,KILL-NOW?
                       <NOT <RUNNING? I-MOUSE-BLAB>>>
	       		  <TELL ,SUDDEN "attempt to put" him ,PRSO>
	       		  <TELL " on, Perc" ,HEADSHOT>
	       		  <JIGS-UP "">)>
           <FSET ,PRSO ,WORNBIT>
           <FSET ,PRSO ,TOUCHBIT>
           <TELL "Worn." CR>)
          (ELSE
           <TELL ,NOPE "wear that!" CR>)>
    <RTRUE>>

<ROUTINE V-QUIT ("OPT" (ASK? T))
	 <V-SCORE>
	 <COND (<NOT .ASK?> <TELL "Thanks for playing." CR> <QUIT>)>
	 <TELL
"Are you sure you wish to leave the game? (Y is affirmative): ">
	 <COND (<YES?> <TELL "Thanks for playing." CR> <QUIT>)
	       (T <TELL "Ok." CR>)>>

<ROUTINE V-RESTART ()
	 <V-SCORE T>
	 <TELL "Do you wish to restart? (Y is affirmative): ">
	 <COND (<YES?>
		<TELL "Restarting." CR>
		<RESTART>
		<TELL-FAILED>)
           (ELSE
        <TELL "Ok." CR>)>>

<ROUTINE TELL-FAILED ()
	<TELL "Suddenly, you recieve a brief message from the Galactic Compendium:" CR CR>
    <BOLDEN "        Failed.">
    <CRLF>>

<ROUTINE V-SAVE ("AUX" X)
	 <PUTB ,G-INBUF 1 0>
	 <SETG CLOCK-WAIT T>
	 <SET X <SAVE>>
	 <COND (<OR <EQUAL? .X 2>
		    <BTST <LOWCORE FLAGS> 4>>
		<V-$REFRESH>)>
	 <COND (<ZERO? .X>
		<TELL-FAILED>
		<FUCKING-CLEAR>)
	       (T
	        <TELL "OK." CR>
		<COND (<NOT <EQUAL? .X 1>>
		       <V-LOOK>)>
		<RTRUE>)>>

<ROUTINE V-RESTORE ()
	 <COND (<NOT <RESTORE>>
		<TELL-FAILED>
		<RFALSE>)>>

<ROUTINE V-FIRST-LOOK ()
	 <COND (<AND <IN? ,PLAYER ,STUNT-SHIP>
                 <NOT <FSET? ,STUNT-SHIP ,LIGHTBIT>>>
            <SETG LOOKING-DARK T>
            <STUNT-SHIP-F ,M-BEG>
            <SETG LOOKING-DARK <>>)
           (<DESCRIBE-ROOM ;<1? ,VERBOSITY>>
		    <COND (<NOT <0? ,VERBOSITY>>
		           <DESCRIBE-OBJECTS>)>)>>

<ROUTINE V-VERSION ()
	<TELL
"MILLIWAYS: the Restaurant at the End of the Universe|
An interactive fiction by Max Fog|
Based on the book by Douglas Adams|
Sequel to the original game by Douglas Adams & Steve Meretzky|
Release number " N <BAND <LOWCORE ZORKID> *3777*> " / Serial number ">
	 <LOWCORE-TABLE SERIAL 6 PRINTC>
	 <CRLF>>

<ROUTINE V-ABOUT ()
	<SETG CLOCK-WAIT T>
	<V-VERSION> <CRLF>
    <TELL "This game is classified as CRUEL on the Zarfian level of cruelty. Hint: Grab everything you find!">
    <SIXCR>
	<TELL "These are some of the people who helped with the game:" CR CR>
	<BOLDEN "SPECIAL MENTIONS">
	<TELL CR "
 STU GALLEY        -  began the programming of Magrathea|
  ADAM SOMMERFIELD  -  programmed some of Magrathea, finished off the first design|
  ANDY GALILEE      -  fixed the inventory and updated the game to V5|
  HENRIK ÅSMAN      -  helped shift the code from the old parser to the new parser, as well as bug-fixing|
  TARA McGREW       -  worked with bug-fixing and other" CR CR>
	<BOLDEN "TESTERS">
	<TELL CR "
 MATHBRUSH (intfiction.org)    Gold-level tester|
  LARRY HORSFIELD" CR>
    <BOLDEN "REGISTER NAMES">
    <TELL " (from intfiction.org)" CR "
 JOEY \"JESS\" CRAMSEY
  MANON
  ONNO BROUWER
  JINX
  BRIAN RUSHTON (mathbrush)">>

<ROUTINE V-SHUSH ()
	<TELL "That isn't happening any time soon." CR>>

;<ROUTINE V-VERSION ()
	 <TELL "MILLIWAYS|
Infocom interactive science fiction|
Copyright (c) 1988 by Infocom, Inc.  All rights reserved.|
Release number " N <BAND <LOWCORE ZORKID> *3777*> " / Serial number ">
	 <LOWCORE-TABLE SERIAL 6 PRINTC>
	 <CRLF>>


; "SCOREMAD tells you if the score is off the charts or not."
<GLOBAL SCOREMAD <>>
; "SCOREOUT is the number which the score is out by."
<GLOBAL SCOREOUT:NUMBER 0>

<SYNTAX $SCORESHOT = V-SCORESHOT>
<ROUTINE V-SCORESHOT ()
	<TELL CR
"You know everything you think you could need to know. You realise how
old the universe is. The physics of the Time Turbines, and death, are
mere trifles. People think they've got problems? Not compared to the
state the universe is in right now. It gives you a headache just trying
to think down to other people's levels. You are powerful! And yet..." CR CR>
    <CRLF>
	<SETG SCOREMAD T>
    <FSET ,MARVIN ,SADRADIOBIT>
	<QUEUE I-LOSE-IT-EVERY-TURN 3>>

<ROUTINE I-LOSE-IT-EVERY-TURN ()
	<QUEUE I-LOSE-IT-EVERY-TURN -1>
	<COND (<L? ,SCOREOUT 32>
		   <SETG SCOREOUT <+ ,SCOREOUT 1>>
		   <COND (<EQUAL? ,SCOREOUT 1>
		   		  <TELL CR "You are beginning to feel very miserable." CR>)
				 (<EQUAL? ,SCOREOUT 8>
				  <TELL CR "You begin to realise that you are losing all this knowledge
you gained. All this knowledge! This makes you even more depressed." CR>)
				 (<EQUAL? ,SCOREOUT 9 19 29>
				  <TELL CR "All this knowledge, all this knowledge to waste..." CR>)
				 (<EQUAL? ,SCOREOUT 32>
				  <TELL CR
"... And all of the knowledge is gone. You forget what you were thinking about,
whatever miserable thing it was. You congratulate yourself for stopping the
descent of your score." CR>
				  <INCREMENT-SCORE 25 T>
                  <FCLEAR ,MARVIN ,SADRADIOBIT>
                  <FCLEAR ,MARVIN ,RADPLUGBIT>
				  <DEQUEUE I-LOSE-IT-EVERY-TURN>)>)>>

; "This game got a maximum score of 500 000. Don't ask."
<CONSTANT SCORE-MAX 400>
<ROUTINE V-SCORE ("OPTIONAL" (ASK? T))
	 ;<COND (<NOT <=? ,SCORE 400>>
		<TELL
"We are about to give you your score. Put on your peril-sensitive sunglasses
now. (Hit RETURN or ENTER when ready.) ">
		<PRINTI ">">
		<PUTB ,P-INBUF 1 0>
		<READ ,P-INBUF ,P-LEXV>
		<SETG P-CONT <>>
		;<CRLF>)>
	 <COND (<AND ,SCOREMAD
	 			 <NOT <EQUAL? ,SCOREOUT 32>>>
	 		<TELL "You appear to have a score of:" CR>
			<PRINTI "Um..||Uh...||(Try hitting RETURN or ENTER, would you please?) >">
			<PUTB ,P-INBUF 1 0>
			<READ ,P-INBUF ,P-LEXV>
			<SIXCR>;<SIXCR> ;"Oof..."
			;"Honestly, I'm scared of this. But it works."
			<TELL "
|                                7?
^[[2J^[[H^[(A   HP&'^$[0){{^A[^i  d##'(]^5m
|  ^[%6              lq\"" ,SCORE ,SCORE "
|              ^[&3xWAIT!x
|              ^[&4xWAIT!x
|             ^[^[&""""WAIiITTTTTT!       ">
			<BOLDEN "[`\\   /`]">
			<TELL " UUUUUuuuuuuuUUU^[!^[b7&#@@@@@
|^[*6#%'%t                            ">
			<BOLDEN "\\ \\ / /">
			<TELL "|                            G5*;:\"&^@! ">
			<BOLDEN "]"><TELL " 2 "><BOLDEN "[">
			<TELL " yHjid0)%^[HP&" ,MOVES "#####^[%%343IRU&^*(" N ,HERE "
|              lqqqqqqqqqqqqqqqqqqqq   "><BOLDEN "/ / \\ \\">
			<TELL "|            x[88^[ ........ ,,,,,,,,,">
			<BOLDEN "[_/"><TELL ",, "><BOLDEN "\\_] ">
			<TELL "|               mqqqqqqqqqqqqqqqqqqqqj|
^[iim\"     ^[[hh^[%%rJ     " ,SCORE "    'kk|||... " ;"That big X works... I think."
N <SCORE-COUNT> "00 points. In " N ,MOVES " turns." CR>
            <COND (<L? ,SCOREOUT 10>
                   <NOTES 8>
                   <CRLF>)>
			<FUCKING-CLEAR>)
	(ELSE
	 <TELL "Your score is " N ,SCORE " of a possible 400, in " N ,MOVES " turn">
	 <COND (<NOT <1? ,MOVES>>
			<TELL !\s>)>
     <TELL ". This ">
     <COND (<=? ,SCORE 400>
            <TELL "means you are finally worthy of">)
           (ELSE
            <TELL "gives you">)>
     <TELL " the rank of ">
     <COND (<G? ,SCORE 400>
            <V-FOO>)
           (<=? ,SCORE 400>
            <TELL "Hitchhiker">)
           (<G? ,SCORE 360>
            <TELL "Cool Intergalactic Explorer">)
           (<G? ,SCORE 314>
            <TELL "Somebody (who I might actually be able to talk to at a party)">)
           (<G? ,SCORE 242>
            <TELL "Not Your Ordinary Person">)
           (<=? ,SCORE 200>
            <TELL "Half-Empty Kind of Guy">)
           (<G? ,SCORE 123>
            <TELL "Outsider">)
           (<G? ,SCORE 75>
            <TELL "Cheapo Hitchhiker">)
           (<G? ,SCORE 42>
            <TELL "Earthman">)
           (<G? ,SCORE 0>
            <TELL "Noob">)
           (<0? ,SCORE>
            <TELL "Nobody">)
           (T
            <TELL <PICK-ONE <PLTABLE
                                "Incompetent"
                                "Worthless"
                                "Unsatisfactory"
                                "Twopenny-Halfpenny"
                                "Degenerate">>
                  " "
                  <PICK-ONE <PLTABLE
                                "Loser"
                                "Failure"
                                "Washout"
                                "Idiot"
                                "Lemon">>>)>
	 <TELL ,PAUSES>)>
	 ,SCORE>

<ROUTINE V-NOTIFY ()
	 <TELL "Okay, you will no">
	 <COND (,NOTIFICATION-ON
		    <SETG NOTIFICATION-ON <>>
		    <TELL " longer">)
	       (T
		    <SETG NOTIFICATION-ON T>
		    <TELL "w">)>
	 <TELL " be notified when your score changes." CR>>

<GLOBAL NOTIFICATION-ON T>

<GLOBAL NOTIFICATION-WARNING <>>


<ROUTINE NO-NEED ("OPTIONAL" (STR <>) (OBJ <>))
	<SETG CLOCK-WAIT T>
	<TELL He+verb ,WINNER "do" "n't need to ">
	<COND (.STR <TELL .STR>) (T <VERB-PRINT>)>
	<COND (<EQUAL? .STR "go" "drive">
	       <TELL " in that " D ,INTDIR>)
	      (<T? .OBJ>
	       <THE-J .OBJ T>)
	      (T <THE-J ,PRSO T>)>
	<TELL ,PAUSES>>

<ROUTINE YOU-CANT ("OPTIONAL" (STR <>) (WHILE <>) (STR1 <>))
	<SETG CLOCK-WAIT T>
	<TELL He ,WINNER " can't ">
	;<TELL ,NOPE>
	<COND (<VERB? DIAGNOSE>
		   <TELL "do">)
		  (<ZERO? .STR>
	       ;<VERB-PRINT> <TELL "do that to">)
	      (T <TELL .STR>)>
	<COND (<EQUAL? .STR "go" "drive">
	       <TELL " in that " D ,INTDIR>)
	      (T
	       <COND (<==? ,PRSO ,PSEUDO-OBJECT <>>
		      <TELL " that">)
		     ;(<AND <DOBJ? FLOOR>
			   <OUTSIDE? ,HERE>>
		      <TELL " the ground">)
		     (T <TELL !\ ><THE-J ,PRSO T>)>
	       <COND (.STR1
		      <TELL " while">
		      <COND (.WHILE
			     <TELL he+verb .WHILE "is">)
			    (T <TELL he+verb ,PRSO "is">)>
		      <TELL !\  .STR1>)
		     ;(T <TELL " now">)>)>
	<TELL !\! CR>>

<ROUTINE YOU-SHOULDNT ("OPT" (PREP <>))
	<SETG CLOCK-WAIT T>
	<TELL He ,WINNER " shouldn't ">
	<VERB-PRINT>
	<TELL !\ >
	<THE-J ,PRSO T>
	<COND (<T? .PREP>
	       <TELL .PREP>
		   <THE-J ,PRSI T>)>
	<TELL ,PAUSES>>

""

"SUBTITLE - GENERALLY USEFUL ROUTINES & CONSTANTS"

<ROUTINE TELL-BEING-WORN (OBJ)
	<COND (<FSET? .OBJ ,WORNBIT>
	       <TELL " (worn)">)
	      ;(<AND <FSET? .OBJ ,ONBIT>
		    <NOT <EQUAL? ,LIT ,HERE ;1>>>
	       <TELL " (providing light)">)>>

;[" <ROUTINE PRINT-CONT (CONT "AUX" OBJ NXT (1ST? T) (VAL <>))
	 <SET OBJ <FIRST? .CONT>>
	 <REPEAT ()
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <COND (<OR <FSET? .OBJ ,INVISIBLE>
				  <FSET? .OBJ ,NDESCBIT> ;"was semied"
				  <EQUAL? .OBJ ,WINNER ;,NOW-WEARING>>
			      <MOVE .OBJ ,INTDIR>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
	 <SET OBJ <FIRST? .CONT>>
	 <COND (<NOT .OBJ>
		<COND (<NOT <==? .CONT ,PLAYER>>
		       <TELL " nothing " <PICK-ONE ,YAWNS>>)>)
	       (T
		<REPEAT ()
		        <COND (.OBJ
		               <SET NXT <NEXT? .OBJ>>
		               <COND (.1ST?
			              <SET VAL T>
				      <SET 1ST? <>>)
			             (T
			              <COND (.NXT <TELL !\,>)
				            (T <TELL " and">)>)>
		               <THE-J .OBJ T>
		               <TELL-BEING-WORN .OBJ>
			       <THIS-IS-IT .OBJ>
		               <FCLEAR .OBJ ,SECRETBIT>
			       <FSET .OBJ ,SEENBIT>
			       <SET OBJ .NXT>)
			      (T
		               <RETURN>)>>)>
	 <ROB ,INTDIR .CONT>
	 .VAL> "]

<ROUTINE DESCRIBE-OBJECTS ("OPTIONAL" (CONT <>)
			   "AUX" OBJ NXT STR (VAL <>) (HE 0) (SHE 0)
				 (FIRST T) (TWO? <>) (IT? <>) (ANY? <>))
	 <COND (<ZERO? .CONT>
		<SET CONT ,HERE>)>
	 ;<COND (<ZERO? ,LIT>
	        <TOO-DARK>
	        <RTRUE>)>
      ;"Hide invisible objects"
	<SET OBJ <FIRST? .CONT>>
	<COND (<ZERO? .OBJ>
	       <RFALSE>)>
	<REPEAT ()
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <COND (<OR <FSET? .OBJ ,INVISIBLE>
				  <FSET? .OBJ ,NDESCBIT>
				  <EQUAL? .OBJ ,PLAYER>
				  ;<AND ;<FSET? .OBJ ,PERSONBIT>
				       ;<OR <FSET? .OBJ ,RMUNGBIT>;"not desc'd"
					   ;<IN-MOTION? .OBJ>>>
				  <EQUAL? .OBJ <LOC ,PLAYER>>>
			      <FCLEAR .OBJ ,RMUNGBIT>
			      <MOVE .OBJ ,PSEUDO-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
      <COND (<EQUAL? .CONT ,HERE>
	;"Describe people in proper order:"
       ;<SET NXT ,CHARACTER-MAX>
       ;<REPEAT ()
	       <PUT ,TOUCHED-LDESCS .NXT 0>
	       <COND (<DLESS? NXT 1> <RETURN>)>>
       ;<SET NXT 0>
       ;<REPEAT ()
	       <COND (<IGRTR? NXT ,CHARACTER-MAX>
		      <RETURN>)
		     (<IN? <SET OBJ <GET ,CHARACTER-TABLE .NXT>> ,HERE>
		      <PUT ,FOLLOW-LOC .NXT ,HERE>
		      <SET VAL <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		      <FSET .OBJ ,SEENBIT>
		      <COND (<OR <==? .VAL ,M-FATAL>
				 <ZERO? .ANY?>>
			     <SET ANY? .VAL>)>
		      <COND (<FSET? .OBJ ,FEMALEBIT>
			     <COND (<0? .SHE> <SET SHE .OBJ>)
				   (T <SET SHE 1>)>)
			    (T
			     <COND (<0? .HE> <SET HE .OBJ>)
				   (T <SET HE 1>)>)>
		      <MOVE .OBJ ,PSEUDO-OBJECT>)>>
       ;<SET NXT 0>
       ;<REPEAT ()
	       <COND (<IGRTR? NXT ,CHARACTER-MAX>
		      <RETURN>)
		     (<T? <SET OBJ <GET ,TOUCHED-LDESCS .NXT>>>
		      ;<PUT ,TOUCHED-LDESCS .NXT 0>
		      <SET FIRST T>
		      <SET STR <GET ,CHARACTER-TABLE .NXT>>
		      <TELL The .STR>
		      <SET STR .NXT>
		      <REPEAT ()
			      <COND (<IGRTR? STR ,CHARACTER-MAX>
				     <COND (.FIRST <TELL " is ">)
					   (T <TELL " are ">)>
				     <TELL <GET ,LDESC-STRINGS .OBJ> ,PAUSES>
				     <RETURN>)
				    (<==? .OBJ <GET ,TOUCHED-LDESCS .STR>>
				     <PUT ,TOUCHED-LDESCS .STR 0>
				     <SET FIRST <>>
				     <TELL " and" ;the
					   <GET ,CHARACTER-TABLE .STR>>)>>)>>
	;<COND (<NOT <EQUAL? .SHE 0 1>>
	       <THIS-IS-IT .SHE>)
	      (<EQUAL? .SHE 1>
	       <SETG P-HER-OBJECT <>>)>
	;<COND (<NOT <EQUAL? .HE 0 1>>
	       <THIS-IS-IT .HE>)
	      (<EQUAL? .HE 1>
	       <SETG P-HIM-OBJECT <>>)>
	;<SET FIRST T>
	;<CRLF>
      ;"Apply all FDESCs and eliminate those objects"
	<SET OBJ <FIRST? .CONT>>
	<REPEAT ()
		<COND (<AND .OBJ
			    <NOT <FSET? .OBJ ,TOUCHBIT>>>
		       <SET NXT <NEXT? .OBJ>>
		       <SET STR <GETP .OBJ ,P?FDESC>>
		       <COND (.STR
			      ;<SET VAL T>
			      <COND (<ZERO? .ANY?> <SET ANY? T>)>
			      <TELL CR .STR>
                  <COND (<AND ;<0? .LEVEL>
		                      ;<SET AV <LOC ,PLAYER>>
		                      <OR ;<AND <FSET? <LOC ,PLAYER> ,VEHBIT>
                                       <SET AV <LOC ,PLAYER>>>
                                  <FSET? ,ESCAPE-POD ,SADRADIOBIT>>>
		                 <TELL " (outside "><THE-J ,ESCAPE-POD T><TELL !\)>)>
			      <CRLF>
                  <FCLEAR .OBJ ,SECRETBIT>
			      <FSET .OBJ ,SEENBIT>
			      <THIS-IS-IT .OBJ>
			      <MOVE .OBJ ,PSEUDO-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
       ;"Apply all LDESC's and eliminate those objects"
       <SET OBJ <FIRST? .CONT>>
       <REPEAT ()
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <SET STR <GETP .OBJ ,P?LDESC>>
		       <COND (.STR
		              ;<SET VAL T>
			      <COND (<ZERO? .ANY?> <SET ANY? T>)>
			      <TELL CR .STR>
                  <COND (<AND ;<0? .LEVEL>
		                      ;<SET AV <LOC ,PLAYER>>
		                      <OR ;<AND <FSET? <LOC ,PLAYER> ,VEHBIT>
                                       <SET AV <LOC ,PLAYER>>>
                                  <FSET? ,ESCAPE-POD ,SADRADIOBIT>>>
		                 <TELL " (outside "><THE-J ,ESCAPE-POD T><TELL !\)>)>
                  <CRLF>
			      <FCLEAR .OBJ ,SECRETBIT>
			      <FSET .OBJ ,SEENBIT>
			      <THIS-IS-IT .OBJ>
			      <MOVE .OBJ ,PSEUDO-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>)>
		; "Apply all DESCFCNs and hide those objects"
       <SET OBJ <FIRST? .CONT>>
       <REPEAT ()
		<COND (.OBJ
			   <COND (<AND <EQUAL? .OBJ ,SATCHEL>
			   			   <NOT <IN? ,FORD ,PSEUDO-OBJECT>>>
					  <SET .OBJ <NEXT? .OBJ>>
					  <MOVE ,SATCHEL ,ROOMS>)>
		       <SET NXT <NEXT? .OBJ>>
		       <SET STR <GETP .OBJ ,P?DESCFCN>>
		       <COND (.STR
		              ;<CRLF>
			      <SET VAL <APPLY .STR ,M-OBJDESC>>
                  <COND (<AND ;<0? .LEVEL>
		                      ;<SET AV <LOC ,PLAYER>>
		                      <OR ;<AND <FSET? <LOC ,PLAYER> ,VEHBIT>
                                       <SET AV <LOC ,PLAYER>>>
                                  <FSET? ,ESCAPE-POD ,SADRADIOBIT>>>
		                 <THE-J .OBJ T T><TELL " is outside the escape pod." CR>)>
			      <COND (<OR <==? .VAL ,M-FATAL>
					 <ZERO? .ANY?>>
				     <SET ANY? .VAL>)>
			      <THIS-IS-IT .OBJ>
			      <FSET .OBJ ,SEENBIT>
			      ;<CRLF>
			      <MOVE .OBJ ,PSEUDO-OBJECT>
				  <COND (<AND <EQUAL? .OBJ ,FORD>
				  			  <IN? ,SATCHEL ,ROOMS>>
						 <MOVE ,SATCHEL ,HERE>
						 <SET .OBJ ,SATCHEL>
						 <AGAIN>)>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
       ;"Print whatever's left in a nice sentence"
	<SET OBJ <FIRST? ,HERE>>
	<SET VAL <>>
	<COND (.OBJ
	       <REPEAT ()
        ;<COND (.OBJ
               <SET NXT <NEXT? .OBJ>>
		       <SET VAL T>
               <DESCRIBE-OBJECT .OBJ <> 0>
               <MOVE .OBJ ,INTNUM>)>
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <SET VAL T>
		       <COND (.FIRST
			      <SET FIRST <>>
			      <CRLF>
			      <COND (<EQUAL? .CONT ,HERE>
				     ;<CRLF>
				     <COND (<FSET? ,HERE ,LIGHTBIT>
					    <TELL ,YOU-SEE>)
					   ;(<OR <FIND-IN ,WINNER ,ONBIT>
						<FIND-IN ,HERE ,ONBIT>>
					    <TELL
His ,WINNER " light reveals">)
					   (T <TELL
"The light reveals " ;"from the next room">)>)>)
			     (T
			      <COND (.NXT <TELL !\, !\ >)
						(T    <TELL " and ">)>)>
               <THE-J .OBJ <> ;<FSET? .OBJ ,TOUCHBIT>>
		       <FCLEAR .OBJ ,SECRETBIT>
		       <FSET .OBJ ,SEENBIT>
		       <THIS-IS-IT .OBJ>
		       <TELL-BEING-WORN .OBJ>	
		       <COND (<AND <SEE-INSIDE? .OBJ>
				   <SEE-ANYTHING-IN? .OBJ>>
			      <MOVE .OBJ ,INTNUM>)>
		       <COND (<AND <NOT .IT?>
				   <NOT .TWO?>>
			      <SET IT? .OBJ>)
			     (T
			      <SET TWO? T>
			      <SET IT? <>>)>
		       <SET OBJ .NXT>)
		      (T
		       <COND (<AND .IT?
				   <NOT .TWO?>>
			      <SETG P-IT-OBJECT .IT?>)>
		       <COND (<EQUAL? .CONT ,HERE>
			      <TELL " here">)>
		       <TELL ,PAUSES>
		       <COND (<ZERO? .ANY?> <SET ANY? T>)>
		       <RETURN>)>>)>
	<SET OBJ <FIRST? ,INTNUM>>
	<REPEAT ()
		<COND (<ZERO? .OBJ>
		       <RETURN>)>
		<SET VAL T>
        <COND (<AND <FIRST? .OBJ>
                    <SEE-INSIDE? .OBJ>>
              <PRINT-CONT .OBJ> ;<OPEN-ANYTHING .OBJ <>>)>
		<SET OBJ <NEXT? .OBJ>>>
	;<COND (<T? .VAL ;.ANY?> <CRLF>)>
	<ROB ,INTNUM .CONT>
	<ROB ,PSEUDO-OBJECT .CONT>
	.ANY? ;.VAL>

<ROUTINE SEE-ANYTHING-IN? (CONT "AUX" OBJ NXT (ANY? <>))
	 <SET OBJ <FIRST? .CONT>>
	 <REPEAT ()
		 <COND (.OBJ
			<COND (<AND <NOT <FSET? .OBJ ,INVISIBLE>>
				    <NOT <FSET? .OBJ ,NDESCBIT>>
				    <NOT <EQUAL? .OBJ ,PLAYER>>>
			       <SET ANY? T>
			       <RETURN>)>
			<SET OBJ <NEXT? .OBJ>>)
		       (T
			<RETURN>)>>
	 <RETURN .ANY?>>

<ROUTINE DESCRIBE-ROOM (;["OPTIONAL" (LOOK? <>)] "AUX" (V? <>) STR L (LNG <>))
	 <COND ;(<T? .LOOK?> <SET V? T>)
	       (<==? 2 ,VERBOSITY> <SET LNG T> <SET V? T>)
		   (<OR <==? 1 ,VERBOSITY>
		   		<EQUAL? <LOC ,PLAYER> ,GALLEY ,DORM ,BATHROOM-SHIP ,PRES-BRIDGE>>
			<SET V? T>)
	       (<==? 0 ,VERBOSITY> <SET V? <>>)
	       (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<SET V? T>)>
	 <COND (T ;<IN? ,HERE ,ROOMS>
		<HLIGHT ,H-BOLD>
		<D-J ,HERE>
		<COND (<FSET? <SET L <LOC ,PLAYER>> ,VEHBIT> ;"Was WINNER, but here it's player"
		       <TELL ", in ">
		       ;<THIS-IS-IT .L>
			   <THE-J .L T>)
              (<AND <IN? ,PLAYER ,CHANNEL3>
                    <OR ,HELD-ROCK?
                        ,TOWEL-HOLDING>>
               <TELL ", holding a piece of rock">
               <COND (,TOWEL-HOLDING
                      <TELL " with a towel">)>)
              (<AND <FSET? ,ESCAPE-POD ,SADRADIOBIT>>
               <TELL ", on the escape pod">)>
		<CRLF>
		<HLIGHT ,H-NORMAL>)>
	 <COND (.V?
		;<COND (<AND .V? <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       T)
		      (<AND .V? <SET STR <GETP ,HERE ,P?FDESC>>>
		       <TELL .STR CR>)
		      (<AND .V? <SET STR <GETP ,HERE ,P?LDESC>>>
		       <TELL .STR CR>)
		      (T <APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>)>
		<COND (<AND .V? <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       T)
			  (<AND .LNG <SET STR <GETP ,HERE ,P?FDESC>>>
			   <TELL .STR CR>)
			  (<AND .V? <SET STR <GETP ,HERE ,P?LDESC>>>
		       <TELL .STR CR>)
			  (T <APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>)>)>
	 <FSET ,HERE ,SEENBIT>
	 <FSET ,HERE ,TOUCHBIT>
	 T>


<ROUTINE DESCRIBE-DOORS (DOOR STR)
    <CHECK-DOOR .DOOR>
    <TELL !\  .STR !\. " Next to it is "><THE-J <FIND-DOOR-PANEL .DOOR> T><TELL ,PAUSES>>


"Lengths:"
<CONSTANT REXIT 0>
<CONSTANT UEXIT <VERSION? (ZIP 1) (T 2)>>
	"Uncondl EXIT:	(dir TO rm)		 = rm"
<CONSTANT NEXIT <VERSION? (ZIP 2) (T 3)>>
	"Non EXIT:	(dir ;SORRY string)	 = str-ing"
<CONSTANT FEXIT <VERSION? (ZIP 3) (T 4)>>
	"Fcnl EXIT:	(dir PER rtn)		 = rou-tine, 0"
<CONSTANT CEXIT <VERSION? (ZIP 4) (T 5)>>
	"Condl EXIT:	(dir TO rm IF f)	 = rm, f, str-ing"
<CONSTANT DEXIT <VERSION? (ZIP 5) (T 6)>>
	"Door EXIT:	(dir TO rm IF dr IS OPEN)= rm, dr, str-ing, 0"

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG <VERSION? (ZIP 1) (T 4)>>	"GET/B"
<CONSTANT CEXITSTR 1>		"GET"
<CONSTANT DEXITOBJ 1>		"GET/B"
<CONSTANT DEXITSTR <VERSION? (ZIP 1) (T 2)>>	"GET"



; "Useless. Utterly useless."
<ROUTINE PICK-ONE-NEW (FROB "AUX" L CNT RND MSG RFROB)
	 <SET L <- <GET .FROB 0> 1>>
	 <SET CNT <GET .FROB 1>>
	 <SET FROB <REST .FROB 2>>
	 <SET RFROB <REST .FROB <* .CNT 2>>>
	 <SET RND <- .L .CNT>>
	 <SET RND <RANDOM .RND>>
	 %<DEBUG-CODE
	   <COND (<NOT <G? .RND 0>>
	   	  <TELL "Well, I think I forgot something behind me. Sorry, it won't take long.">
		  <FUCKING-CLEAR>
		  ;<TELL
"{PICK-ONE-NEW: L=" N .L " CNT=" N .CNT " RND=" N .RND " FROB="N .FROB";}"""CR>)>>
	 <SET MSG <GET .RFROB .RND>>
	 <PUT .RFROB .RND <GET .RFROB 1>>
	 <PUT .RFROB 1 .MSG>
	 <SET CNT <+ .CNT 1>>
	 <COND (<==? .CNT .L> <SET CNT 0>)>
	 <PUT .FROB 0 .CNT>
	 .MSG>

<ROUTINE PICK-ONE (FROB) <GET .FROB <RANDOM <GET .FROB 0>>>>

<ROUTINE NOT-HOLDING? (OBJ)
	<COND (<AND <NOT <IN? .OBJ ,WINNER>>
		    <NOT <IN? <LOC .OBJ> ,WINNER>>>
	       <SETG CLOCK-WAIT T>
	       <TELL He+verb ,WINNER "is" "n't holding" him .OBJ ,PAUSES>)>>

<ROUTINE GOTO (RM "OPTIONAL" (TEST <>) (FOLLOW? T) "AUX" X)
	;<COND (<EQUAL? <LOC ,PLAYER ;,WINNER> .RM>
	       <WALK-WITHIN-ROOM>
	       <RFALSE>)>
	<COND ;(<APPLY <GETP ,HERE ,P?ACTION> ,M-LEAVE>
	       <RFALSE>)
	      (<==? ,WINNER ,PLAYER>
	       <COND (<AND .FOLLOW?
			   <T? ,FOLLOWER>>
		      <FRIEND-FOLLOWS-YOU .RM>)>)>
	<COND (<AND <T? .TEST>
		    <==? ,WINNER ,PLAYER>>
	       <SET X <DIR-FROM ,HERE .RM>>
	       <COND (<T? .X>
		      <COND (<==? ,M-FATAL <APPLY <GETP ,HERE ,P?ACTION> .X>>
			     <RFALSE>)>)>)>
	<PUT ,FOLLOW-LOC <GETP ,WINNER ,P?CHARACTER> .RM>
	<MOVE ,PLAYER ;,WINNER .RM>
	<COND (<==? ,WINNER ,PLAYER>
	       <SETG OHERE ,HERE>
	       <SETG HERE .RM>
	       ;<MAKE-ALL-PEOPLE -12 ;"listening to you">
	       <ENTER-ROOM>
	       ;<RTRUE>)>>

;"This doesn't work like that..."
<ROUTINE MAKE-ALL-PEOPLE (NUM "OPTIONAL" (RM 0) "AUX" P NNUM)
	;"<COND (<ZERO? .RM>
	       <SET RM ,HERE>)>
	<COND (<L? .NUM 0>
	       <SET NNUM <- 0 .NUM>>)>
	<SET P <FIRST? .RM>>
	<REPEAT ()
		<COND (<ZERO? .P>
		       <RETURN>)
		      (<FSET? .P ,PERSONBIT>
		       <COND (<G? .NUM 0>
			      <PUTP .P ,P?LDESC .NUM>)
			     (<==? .NNUM <GETP .P ,P?LDESC>>
			      <PUTP .P ,P?LDESC 0>)>)>
		<SET P <NEXT? .P>>>"
	<RFALSE>>


<GLOBAL FOLLOWER:OBJECT 0>

;<ROUTINE NEW-FOLLOWER (PER)
	<COND (<NOT <EQUAL? ,FOLLOWER <> .PER>>
	       <PUTP ,FOLLOWER ,P?LDESC 0>
	       <TELL
"\"I'll leave you two alone, then,\" says " D ,FOLLOWER ".|">)>
	<SETG FOLLOWER .PER>>

<ROUTINE FRIEND-FOLLOWS-YOU (RM "AUX" C)
 <COND ;(<ZERO? <GETP .RM ,P?LINE>>
	<RFALSE>)
       (<IN? ,FOLLOWER .RM>
	<RFALSE>)
       (T
	<MOVE ,FOLLOWER .RM>
	;<PUTP ,FOLLOWER ,P?LDESC 23 ;"following you">
	<THE-J ,FOLLOWER T T>
	<TELL <PICK-ONE ,TRAILS-ALONG>>
	<CRLF>)>>

<GLOBAL TRAILS-ALONG ;"Used only for FORD-FOLLOW, so I edited it"
    <PLTABLE
        " walk a few steps behind"
        " trail along"
        " stay at your side"
        " walk along with you">>

<ROUTINE DIR-FROM (HERE THERE "AUX" (V <>) P D)
 <COND (<DIR-FROM-TEST .HERE .THERE ,P?UP>	<RETURN ,P?UP>)
       (<DIR-FROM-TEST .HERE .THERE ,P?DOWN>	<RETURN ,P?DOWN>)
       (<DIR-FROM-TEST .HERE .THERE ,P?IN>	<RETURN ,P?IN>)
       (<DIR-FROM-TEST .HERE .THERE ,P?OUT>	<RETURN ,P?OUT>)>
 <SET P 0>
 <REPEAT ()
	 <COND (<L? <SET P <NEXTP .HERE .P>> ,LOW-DIRECTION>
		<RETURN .V>)
	       (<SET D <DIR-FROM-TEST .HERE .THERE .P>>
		<COND (<AND <L? .D ,LOW-DIRECTION> <NOT .V>>
		       <SET V .P>)
		      (T <RETURN .P>)>)>>>

<ROUTINE DIR-FROM-TEST (HERE THERE P "AUX" L TBL)
	<COND (<ZERO? <SET TBL <GETPT .HERE .P>>>
	       <RFALSE>)>
	<SET L <PTSIZE .TBL>>
	<COND (<AND <EQUAL? .L ,DEXIT ,UEXIT ,CEXIT>
		    <==? <GET/B .TBL ,REXIT> .THERE>>
	       <RETURN .P>)>>

<ROUTINE HELD? (OBJ "OPTIONAL" (CONT <>) "AUX" L)
	 <COND (<ZERO? .CONT> <SET CONT ,PLAYER ;,WINNER>)>
	 <REPEAT ()
		 <SET L <LOC .OBJ>>
		 <COND (<NOT .L> <RFALSE>)
		       (<EQUAL? .L .CONT> <RTRUE>)
		       (<EQUAL? .CONT ,PLAYER ,WINNER>
			<COND ;(<EQUAL? .OBJ ,HANDS ,HEAD ,EYES>
			       <RTRUE>)
                  (<OR <AND <FSET? .OBJ ,BODYPARTBIT>
						    <FIND-NUM-TBL ,BODY-PARTS-OWNERS .CONT>>
                       <AND <EQUAL? .OBJ ,HEAD ,FEET>
                            <EQUAL? .CONT ,MICE ,BENJY ,PERCY>>>
				   <RTRUE>)
			      ;(<EQUAL? .OBJ ,NOW-WEARING>
			       <RTRUE>)
			      ;(<AND <EQUAL? .OBJ ,ARTIFACT>
				    <EQUAL? ,WINNER .L <LOC .L>>>
			       <RTRUE>)
			      (T <SET OBJ .L>)>)
		       (<EQUAL? .L ,ROOMS ,GLOBAL-OBJECTS> <RFALSE>)
		       (T <SET OBJ .L>)>>>

<GLOBAL FAIL-THROW <>>

<ROUTINE IDROP ()
	 <COND (<EQUAL? ,PRSO ,BABEL-FISH>
			<SETG P-CONT <>>
			<TELL "That would be foolish. Having a babel fish in your ear is terribly useful." CR>
			<MOVE ,BABEL-FISH ,PLAYER>
			<FSET ,BABEL-FISH ,WORNBIT>
			<SETG FAIL-THROW T>
			<RFALSE>)
		   (<FSET? ,PRSO ,WORNBIT>
			<TELL "You'll have to remove it first." CR>
			<MOVE ,PRSO ,PLAYER>
			<FSET ,PRSO ,WORNBIT>
			<SETG FAIL-THROW T>
			<RFALSE>)>
	 <COND ;(<FSET? ,PRSO ,PERSONBIT>
		<TELL The ,PRSO " wouldn't enjoy that." CR>
		<RFALSE>)
	       (<NOT-HOLDING? ,PRSO>
		<RFALSE>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TOO-BAD-BUT <LOC ,PRSO> "closed">
		<RFALSE>)
	       (T
        <COND (<AND <EQUAL? ,PRSO ,PLANT ,RADIO>
                	<FSET? ,PLANT ,RADPLUGBIT>>
        	   <UNPLUG-HELD-STUFF ,PRSO>)>
		<MOVE ,PRSO <LOC ,WINNER>>
		<FCLEAR ,PRSO ,WORNBIT>
		<FCLEAR ,PRSO ,NDESCBIT>
		<FCLEAR ,PRSO ,INVISIBLE>
		<RTRUE>)>>

;<GLOBAL INDENTS
	<PTABLE ""
	       "  "
	       "    "
	       "      "
	       "        "
	       "          ">>

<GLOBAL FUMBLE-NUMBER:NUMBER 6>
<GLOBAL FUMBLE-PROB:NUMBER 8>
;<GLOBAL ITAKE-LOC:OBJECT <>>

<ROUTINE ITAKE ("OPTIONAL" (VB T) (OB:OBJECT <>) "AUX" CNT OBJ L)
	 <COND (<ZERO? .OB>
		<SET OB ,PRSO>)>
     <COND (<AND ,KILL-NOW?
                 <NOT <RUNNING? I-MOUSE-BLAB>>
	 			 <NOT <EQUAL? ,PRSO ,SPORFE>>
                 <IN? ,PRSO ,INTERVIEW-ROOM>>
            <COND (.VB
	 		       <TELL ,SUDDEN "attempt to take "><THE-J ,PRSO T>
			       <TELL ", Benj" ,HEADSHOT>
                   <JIGS-UP "">)>)
           (<AND <EQUAL? .OB ,MEAT-DISH>
                 <FSET? ,MEAT-DISH ,SADRADIOBIT>>
            <COND (.VB
	 		       <TELL "You really want to take that now? No thanks." CR>)>
            <RFALSE>)
           (<AND <EQUAL? .OB ,PEANUT-PACKET>
                 <FSET? ,PEANUT-PACKET ,BADRADIOBIT>>
            <COND (.VB
	 		       <TELL "You try to grab them, but they slip through your hands." CR>)>
            <RFALSE>)
           (<AND <NOT <FSET? ,ESCAPE-POD ,SADRADIOBIT>>
                 <HELD? .OB ,ESCAPE-POD>>
            <TELL "You'll have to enter the " D ,ESCAPE-POD " first." CR>
            <THIS-IS-IT ,ESCAPE-POD>
            <RFALSE>)
           (<AND <DOBJ? CLYDE-PANEL>
                 <IN? ,CLYDE-PANEL ,CLYDE>>
            <COND (.VB
	 		       <TELL "You can't just take it like that! " ,TOO-STUCK>
                   <PERFORM ,V?EXAMINE ,CLYDE-PANEL>)>
           <RFALSE>)>
	 <COND (<AND <EQUAL? ,PRSO ;,P?UP ,UP>
                 <VERB? TAKE>>
	 	<TELL "What do you want to take?" CR>
		<FUCKING-CLEAR>
        <RFALSE>)>
	 <SET L <LOC .OB>>
     <COND (<IN? ,PRSO ,PLAYER>
		<COND (.VB
            <ALREADY ,PLAYER><TELL "holding "><THE-J ,PRSO T><TELL "!" CR>)>
        <RFALSE>)>
	 <COND (<AND .L <FSET? .L ,PERSONBIT>>
		<COND (<AND <EQUAL? .L ,MARVIN ,MORPHER-CAPTAIN ,SLARTY>
			    <NOT <FSET? .L ,MUNGBIT>>>
		       <COND (.VB <YOU-CANT "take" .L "holding it">)>
		       <RFALSE>)
		      (T <FSET .OB ,TAKEBIT>)>)>
	 <COND (<NOT <FSET? .OB ,TAKEBIT>>
		<COND (.VB <YOU-CANT "take">)>
		<RFALSE>)
	       (<AND <G? <SET CNT <CCOUNT ,WINNER>> ,FUMBLE-NUMBER>
		     <PROB <* .CNT ,FUMBLE-PROB>>
		     <SET OBJ <FIND-FLAG-NOT ,WINNER ,WORNBIT>>>
		;<TOO-BAD-BUT>
		<THE-J .OBJ T T>
        <TELL
" slips from" his ,WINNER " arms while " he+verb ,WINNER "is"
" taking" him .OB ", and both tumble " <GROUND-DESC> !\. !\ 
He+verb ,WINNER "is" " carrying too many things." CR>
		<MOVE .OBJ ,HERE>
		<MOVE .OB ,HERE>
		<FUCKING-CLEAR>
        <RFALSE>)
           (<G? <+ ;"<+ <WEIGHT ,PRSO>" <GETP ,PRSO ,P?SIZE> ;">" <WEIGHT ,WINNER>> 50>
		<COND (.VB
		    <TELL "Your load is too heavy." CR>)>
		<FUCKING-CLEAR>
        <RFALSE>)
	       (T
		<MOVE .OB ,WINNER>
		<FSET .OB ,SEENBIT>
		<FSET .OB ,TOUCHBIT>
		<FCLEAR .OB ,NDESCBIT>
		<FCLEAR .OB ,INVISIBLE>
		<FCLEAR .OB ,SECRETBIT>
		;<COND (<==? ,WINNER ,PLAYER> <SCORE-OBJ .OB>)>
		;<SETG ITAKE-LOC <>>
		<COND (<AND <NOT <VERB? TAKE>>
			    <NOT <==? .L ,WINNER>>
			    <OR <FSET? .L ,PERSONBIT>
				;<EQUAL? .L ,SIDEBOARD>>>
		       <FIRST-YOU "taking" .OB .L>
		       ;<COND (<NOT .VB> <SETG ITAKE-LOC .L>)>)>
		<RTRUE>)>>

<ROUTINE CCOUNT (OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,WORNBIT>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

<ROUTINE CHECK-DOOR (DR)
	<THE-J .DR T T>
    <TELL " is ">
	<THIS-IS-IT .DR>
	<COND (<FSET? .DR ,OPENBIT> <TELL "open">)
	      (T
	       <TELL "closed">
	       <COND (<FSET? .DR ,LOCKED> <TELL " and locked">)>)>
	<TELL "." ;CR>>

<ROUTINE INCREMENT-SCORE (NUM "OPT" QUIET)
	<SETG SCORE <+ ,SCORE .NUM>>
	<COND (<AND <NOT .QUIET>
                ,NOTIFICATION-ON>
           <CRLF>
		   <HLIGHT ,H-ITALIC>
		   <TELL "[Your score has just gone up by">
           <WORD-FROM-NUMBERS .NUM>
           <TELL " points.">
           <COND (<NOT ,NOTIFICATION-WARNING>
			      <SETG NOTIFICATION-WARNING T>
			      <TELL
" Note: you can turn this feature on and off using the NOTIFY command.">)>
           <TELL !\] CR>
		   <HLIGHT ,H-NORMAL>)>>

<ROUTINE ROOM-CHECK ("AUX" P PA)
	 <SET P ,PRSO>
	 <COND (<EQUAL? .P ,ROOMS>
		<RFALSE>)
	       (<IN? .P ,ROOMS>
		<COND (<EQUAL? ,HERE .P>
		       <RFALSE>)
		      (<OR ;<EQUAL? ,HERE <GETP .P ,P?STATION>>
			   <GLOBAL-IN? .P ,HERE>>
		       <COND (<AND <VERB? LIE SIT SEARCH SEARCH-FOR>
				   <NOT <==? <SET P <META-LOC .P>> ,HERE>>>
			      <FIRST-YOU "trying to enter" .P>
			      <SET PA ,PRSA>
			      <SET P <PERFORM ,V?THROUGH .P>>
			      <SETG PRSA .PA>
			      <COND (<==? ,M-FATAL .P>
				     <RTRUE>)
				    (T <RFALSE>)>)
			     (T <RFALSE>)>)
		      ;(<NOT <SEE-INTO? .P>>
		       <RTRUE>)
		      (T <RFALSE>)>)
	       (<OR ;<==? .P ,PSEUDO-OBJECT>
		    <AND <EQUAL? <META-LOC .P> ,HERE ,GLOBAL-OBJECTS ,LOCAL-GLOBALS>
             <NOT <EQUAL? ,PRSO ,SOFA>>>>
		<RFALSE>)
	       (<NOT <VISIBLE? .P>>
		<NOT-HERE .P>)>>

<ROUTINE SEE-INSIDE? (OBJ "OPTIONAL" (ONLY-IN <>))
	<COND ;(<FSET? .OBJ ,INVISIBLE> <RFALSE>)	;"for LIT? - PLAYER"
	      (<FSET? .OBJ ,TRANSBIT> <RTRUE>)
	      (<FSET? .OBJ ,OPENBIT> <RTRUE>)
	      (.ONLY-IN <RFALSE>)
	      (<FSET? .OBJ ,SURFACEBIT> <RTRUE>)>>

<ROUTINE ARENT-TALKING ()
	<SETG CLOCK-WAIT T>
	<TELL "You aren't talking to anyone!" CR>>

<ROUTINE ALREADY (OBJ "OPTIONAL" (STR <>))
	<SETG CLOCK-WAIT T>
	<TELL "But ">
	<COND ;(<NOUN-USED? .OBJ ,W?DOOR>	;"confusing in secret passage"
	       <TELL "The door">)
	      (T <THE-J .OBJ T>)>
	<COND (<EQUAL? .OBJ ,PLAYER><TELL " are">)
	      (T <TELL " is">)>
	<TELL " already ">
	<COND (.STR <TELL .STR "!" CR>)>
	<RTRUE>>

<ROUTINE NOT-CLEAR-WHOM ()
	;<SETG QUOTE-FLAG <>>
	;<SETG P-CONT <>>
	<TELL "It's not clear whom you're talking to."
;"[To talk to someone, type their name, then a comma, then what you want
them to do.]" CR>
	<FUCKING-CLEAR>>

<ROUTINE OKAY ("OPTIONAL" (OBJ <>) (STR <>))
	<COND (<EQUAL? ,WINNER ,PLAYER ;,BUTLER>
	       <COND (<VERB? THROUGH WALK WALK-TO>
		      <RTRUE>)>)
	      (T <TELL "\"">)>
	<TELL "OK">
	<COND (.OBJ
	       <TELL ", " he .OBJ>
	       <COND (.STR <TELL " is now " .STR>)>
	       <COND (<=? .STR "on">		<FSET .OBJ ,ONBIT>)
				 (<=? .STR "off">		<FCLEAR .OBJ ,ONBIT>)
				 (<=? .STR "open">		<FSET .OBJ ,OPENBIT>)
				 (<=? .STR "closed">	<FCLEAR .OBJ ,OPENBIT>)
				 (<=? .STR "locked">	<FSET .OBJ ,LOCKED>)
				 (<=? .STR "unlocked">	<FCLEAR .OBJ ,LOCKED>)>)>
	<COND (<OR .STR <NOT .OBJ>>
	       <COND (<NOT <==? ,WINNER ,PLAYER>>
		      <TELL ",\" says "><THE-J ,WINNER T><TELL !\. !\  He ,WINNER " does so." CR>
		      <RTRUE>)>
	       <TELL ,PAUSES>)>
	<COND (<AND <ZERO? ,LIT>
		    <T? <SETG LIT <LIT? ;,HERE>>>>
	       <CRLF>
	       <V-LOOK>)>
	<RTRUE>>

<ROUTINE TOO-BAD-BUT ("OPTIONAL" (OBJ <>) (STR <>))
	<TELL "Too bad, but ">
	<COND (.OBJ
	       <THE-J .OBJ T>)>
	<COND (.STR
	       <TELL " is " .STR>
	       <COND (<EQUAL? .STR "angry" "peeved">
		      <TELL " with you">)>
	       <TELL ,PAUSES>)>
	<RTRUE>>

;"<ROUTINE NOT-ACCESSIBLE? (OBJ)
 <COND (<EQUAL? <META-LOC .OBJ> ,WINNER ,HERE ,GLOBAL-OBJECTS> <RFALSE>)
       (<VISIBLE? .OBJ> <RFALSE>)
       (T <RTRUE>)>>"

<ROUTINE VISIBLE? (OBJ "AUX" L P) ;"can player SEE object?"
	 <COND (<NOT .OBJ> <RFALSE>)
	       (<ACCESSIBLE? .OBJ> <RTRUE>)>
	 ;<COND (<CORRIDOR-LOOK .OBJ>
		<RETURN T>)>
	 ;<SET P .L>
	 <SET L <LOC .OBJ>>
	 <COND (<SEE-INSIDE? .L>
		<VISIBLE? .L>
		<RFALSE>)>>

<ROUTINE ACCESSIBLE? (OBJ "AUX" L)	;"can player TOUCH object?"
	 <COND (<NOT .OBJ> <RFALSE>)
	       (T <SET L <LOC .OBJ>>)>
     ;<COND (<EVERYWHERE-VERB?>
        <RTRUE>)>
	 <COND (<AND <OR <FSET? .OBJ ,INVISIBLE>
	 			     <AND <FSET? .OBJ ,SECRETBIT>
                          ;<NOT <ALL-OVER-VERB?>>>>
                 ;<NOT <EVERYWHERE-VERB?>>>
		<RFALSE>)
	       (<EQUAL? .OBJ ,PSEUDO-OBJECT>
		<COND (<EQUAL? ,LAST-PSEUDO-LOC ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       ;(<EQUAL? .OBJ ,CAR>
		<COND (<EQUAL? <GETP ,CAR ,P?STATION> ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<NOT .L>
		<RFALSE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<RTRUE>)	       
	       ;(<EQUAL? .L ,ROOMS>
		<RETURN <SEE-INTO? .OBJ <>>>)	       
	       (<EQUAL? .L ,LOCAL-GLOBALS>
        <COND (<NOT <EQUAL? <LOC ,PLAYER> ,HERE>>
               <COND (<GLOBAL-IN? .OBJ ,HERE>
                      <RTRUE>)
                     (ELSE
                      <RETURN <GLOBAL-IN? .OBJ <LOC ,PLAYER>>>)>)>)
	       (<NOT <EQUAL? <META-LOC .OBJ> ,HERE <LOC ,PLAYER>>>
        <RFALSE>)
	       (<EQUAL? .L ,WINNER ,HERE <LOC ,PLAYER>>
		<RTRUE>)
	       (<OR <FSET? .L ,OPENBIT>
		    <FSET? .L ,SURFACEBIT>
		    <FSET? .L ,PERSONBIT>
            <FSET? .L ,VEHBIT>>
		<ACCESSIBLE? .L>)
	       (T
		<RFALSE>)>>

<ROUTINE WHO-CARES ("AUX" N)
	<SET N <RANDOM ,WHO-CARES-LENGTH>>
	<HE-SHE-IT ,PRSI T <GET ,WHO-CARES-VERB .N>>
	<TELL <GET ,WHO-CARES-TBL .N> ,PAUSES>>

"SUBTITLE REAL VERBS"

<ROUTINE PRE-SAIM ()
	<PERFORM ,V?AIM ,PRSI ,PRSO>
	<RTRUE>>

<ROUTINE V-SAIM () <V-FOO>>

;<ROUTINE V-STEER () <TELL "That would be pointless." CR>>
<ROUTINE V-AIM () <YOU-CANT ;"aim">>

<ROUTINE V-COMPUTER-WHAT ()
    <TELL
"Do you still use the traditional analog-style keyboard? Pathetic. Voice
activation--- or even better, brain scan--- is the preferred option nowadays." CR>>

<ROUTINE PRE-SANALYZE () <PERFORM ,V?EXAMINE ,PRSI ,PRSO> <RTRUE>>
<ROUTINE   V-SANALYZE () <V-FOO>>

;<ROUTINE PRE-ANALYZE ()
 <COND (<ROOM-CHECK>
	<RTRUE>)
       (<OR <FSET? ,PRSO ,PERSONBIT> ;<EQUAL? ,PRSO ,YOU ,ME>>
	<SETG CLOCK-WAIT T>
	<FACE-RED>)
       ;(<AND <EQUAL? ,PRSI ,FINGERPRINTS>
	     <NOT <EQUAL? <META-LOC ,PRINT-KIT> ,HERE>>>
	<NOT-HERE ,PRINT-KIT>
	<RTRUE>)>>

;<ROUTINE V-ANALYZE ()
	 <COND (,KILL-NOW?
	 		<TELL ,SUDDEN "look closely at"><TELL !\ ><THE-J ,PRSO T>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
 <COND ;(<EQUAL? ,PRSI ,FINGERPRINTS>
	<TELL "You don't find any interesting prints." CR>
	<RTRUE>)
       (<FSET? ,PRSO ,PERSONBIT> <TELL-ME-HOW>)
       ;(<FSET? ,PRSO ,LIGHTBIT> <CHECK-ON-OFF>)
       (<FSET? ,PRSO ,DOORBIT> <CHECK-DOOR ,PRSO> <CRLF>)
       (T <TELL He+verb ,PRSO "look" " normal." CR> ;<YOU-CANT "check">)>>

<ROUTINE V-ANSWER ()
	 <COND (<T? ,AWAITING-REPLY>
		    <COND (<FIND-NUM-TBL ,P-LEXV ,W?YES>
		           <PERFORM ,V?YES>
                   <RTRUE>)
		          (<FIND-NUM-TBL ,P-LEXV ,W?NO>
		           <PERFORM ,V?NO>
                   <RTRUE>)>)>
     <NOT-CLEAR-WHOM>
	 <SETG P-CONT <>>
	 ;<SETG QUOTE-FLAG <>>
	 <RTRUE>>

<ROUTINE V-REPLY ()
	 <SETG P-CONT <>>
	 ;<SETG QUOTE-FLAG <>>
	 <COND (<AND <FSET? ,PRSO ,PERSONBIT>
		     <NOT <FSET? ,PRSO ,MUNGBIT>>>
		<WAITING-FOR-YOU-TO-SPEAK>)
	       (T <YOU-CANT ;"answer">)>> 

<ROUTINE WAITING-FOR-YOU-TO-SPEAK ()
	<TELL He+verb ,PRSO "seem" " to be waiting for you to speak." CR>>

<ROUTINE V-ASK ()
 <COND (<AND ;<T? ,P-CONT>
	     <FSET? ,PRSO ,PERSONBIT>
	     <NOT <FSET? ,PRSO ,MUNGBIT>>>
	<SETG WINNER ,PRSO>
	<SETG QCONTEXT ,PRSO>
	;<PERFORM ,V?ASK-CONTEXT-ABOUT>
    <TELL "What do you want to ask "><THE-J ,PRSO T><TELL " about?" CR>
    <FUCKING-CLEAR>)
       (T <V-ASK-ABOUT>)>>

<ROUTINE PRE-ASK ()
 <COND (<OR <EQUAL? ,PRSO ,GUIDE ,MICROPHONE>
            <EQUAL? ,PRSI ,GUIDE ,MICROPHONE>>
 		<RFALSE>)
       (<EQUAL? ,PRSO ,PLAYER>
 	    <RFALSE>)
       (<AND <NOT <EQUAL? <META-LOC ,PRSO> ,HERE>>
	         <NOT <GLOBAL-IN? ,PRSO ,HERE>>>
	    <NOT-HERE ;-PERSON ,PRSO>
	    <FUCKING-CLEAR>)
       (<OR ;<EQUAL? ,PRSO ,PLAYER>
	        <NOT <FSET? ,PRSO ,PERSONBIT>>
	        ;<FSET? ,PRSO ,MUNGBIT>>
	    <COND (<AND <VERB? $CALL>
				    ;<OR <NOT ,P-CONT>
				    	<ZERO? ,P-CONT>>>
	           <MISSING "verb">
	           <FUCKING-CLEAR>)
	          (<NOT <VERB? LISTEN>>
	           <WONT-HELP-TO-TALK-TO ,PRSO>
	           <FUCKING-CLEAR>)>)
       (<NOT <GRAB-ATTENTION ,PRSO ,PRSI>>
		<FUCKING-CLEAR>)>>

;<ROUTINE MISSING (NV)
	<TELL "[I think there's a " .NV " missing in that sentence!]" CR>>

<ROUTINE GRAB-ATTENTION (PERSON "OPTIONAL" (OBJ <>) "AUX" N GT ATT)
	 <COND (<FSET? .PERSON ,MUNGBIT>
		<COND ;(<EQUAL? <GETP .PERSON ,P?LDESC> 14 ;"asleep">
		       <TOO-BAD-BUT .PERSON "asleep">
		       <RFALSE>)
		      (T
		       <TOO-BAD-BUT .PERSON "out cold">
		       <RFALSE>)>)>
	 <SETG QCONTEXT .PERSON>
	 ;<COND (<NOT <==? <GETP .PERSON ,P?LDESC> 21 ;"searching">>
		<PUTP .PERSON ,P?LDESC 12 ;"listening to you">)>
	 <RTRUE>>

;<ROUTINE NOT-HERE-PERSON (PER "AUX" L)
	<SETG CLOCK-WAIT T>
	<THE-J .PER T T><TELL " isn't ">
	<COND (<VISIBLE? .PER>
	       <TELL "close enough">
	       <COND (<SPEAKING-VERB?> <TELL " to hear you">)>
	       <TELL !\.>)
	      (T <TELL "here!">)>
	<TELL "" CR>>

<ROUTINE V-ASK-ABOUT ()
	 <RESET-WINNER>
	 <COND (<EQUAL? ,PRSI <>>
            <TELL "You can't think of anything to say." CR>)
           (<AND <FSET? ,PRSO ,PERSONBIT>
		     	 <NOT <EQUAL? ,PRSO ,PLAYER>>>
			<TELL
"A long silence tells you that"><TELL !\ ><THE-J ,PRSO T><TELL " isn't interested in talking about ">
			<COND (<OR <IN? ,PRSI ,ROOMS>
				   	   <EQUAL? ,PRSI ,PRSO>>
		       	   <TELL that ,PRSI>)
                  (<EQUAL? ,PRSI ,PLAYER>
                   <TELL "you. Not many people are">)
		    	  (T
		           <THE-J ,PRSI T>)>
		    <TELL ,PAUSES>)
	       (T
		    <PERFORM ,V?TELL ,PRSO>
		    <RTRUE>)>>

<ROUTINE WONT-HELP-TO-TALK-TO (OBJ)
	;<VERB-PRINT>
	<TELL "You chat for a minute to ">
	<THE-J .OBJ T>
	<TELL " before you realize that you'll never get a response." CR>>

<ROUTINE PRE-ASK-CONTEXT-ABOUT ("OPTIONAL" (V 0) "AUX" P)
 <COND (<ZERO? .V> <SET V ,V?ASK-ABOUT>)>
 <COND (<QCONTEXT-GOOD?>
	<PERFORM .V ,QCONTEXT ,PRSO>
	<RTRUE>)
       (<SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>
	;<TELL-I-ASSUME .P " Ask">
	<PERFORM .V .P ,PRSO>
	<RTRUE>)>>

<ROUTINE V-ASK-CONTEXT-ABOUT () <ARENT-TALKING>>

<ROUTINE V-ASK-FOR ()
	 <TELL "Unsurprisingly, "><THE-J ,PRSO T><TELL " doesn't oblige." CR>>

<ROUTINE PRE-ASK-CONTEXT-FOR ("AUX" P)
 <COND (<FSET? <SET P <LOC ,PRSO>> ,PERSONBIT>
	<PERFORM ,V?ASK-FOR .P ,PRSO>
	<RTRUE>)
       (T <PRE-ASK-CONTEXT-ABOUT ,V?ASK-FOR>)>>

<ROUTINE V-ASK-CONTEXT-FOR () <ARENT-TALKING>>

<ROUTINE V-ATTACK () <IKILL "attack">>

;<ROUTINE V-BOW ("AUX" P)
	<SET P ,PRSO>
	<COND (<ZERO? .P>
	       <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,WINNER>>
	       <COND (<ZERO? .P>
		      <TELL "No one notices." CR>
		      <RTRUE>)>)>
	<COND (<OR <NOT <FSET? .P ,PERSONBIT>>
		   <EQUAL? .P ,PLAYER>>
	       <HAR-HAR>)
	      (<NOT <GRAB-ATTENTION .P>>
	       <RTRUE>)
	      (T
	       <TELL He .P !\ >
	       <COND (<FSET? .P ,FEMALEBIT> <TELL "curtsey">) (T <TELL "bow">)>
	       <TELL "s back to you." CR>)>>

<ROUTINE PRE-BRUSH ()
	 <COND (<AND ,KILL-NOW?
                 <NOT <RUNNING? I-MOUSE-BLAB>>>
	 		<TELL ,SUDDEN "attempt to brush"><TELL !\ ><THE-J ,PRSO T>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
 <COND (<AND <DOBJ? ROOMS>
	     <NOT <EQUAL? ,P-PRSA-WORD ,W?SCRAPE ,W?SCRATCH>>>
	<SETG PRSO ,WINNER>
	<RFALSE>)>>

;<CONSTANT AHHH "Ahhh! How refreshing!|">

;<ROUTINE V-BRUSH ()
	 <COND (<NOT ,PRSI>
		<COND (<HELD? ,TOOTHBRUSH>
		       <TELL "with the " D ,TOOTHBRUSH "" CR>
		       <PERFORM ,V?BRUSH ,PRSO ,TOOTHBRUSH>
		       <RTRUE>)
		      (T
		       <TELL "You have nothing to brush">
		       <THE-J ,PRSO T>
		       <TELL " with." CR>)>)
	       (<NOT <IOBJ? TOOTHBRUSH>>
		<TELL "With " a ,PRSI "!" CR>)
	       (<NOT <DOBJ? TEETH>>
		<TELL
"In general, " D ,TOOTHBRUSH "es are meant for teeth." CR>)
	       (T
		<TELL "Congratulations on your fine dental hygiene." CR>)>>

;<ROUTINE V-CLEAN ()
	 <COND (<DOBJ? TEETH>
		<PERFORM ,V?BRUSH ,TEETH>
		<RTRUE>)
	       (T
		<TELL "It is now much cleaner." CR>)>>

<ROUTINE V-BRUSH ()
	 <COND (<DOBJ? HANDS>
            <COND (<EQUAL? <LOC ,PLAYER> ,CHANNEL1 ,CHANNEL2 ,CHANNEL3>
                   <TELL "You are completely wet; there is no way you can do that." CR>)
                  (ELSE
                   <TELL "Why?" CR>)>)
           (<NOT ,PRSI>
		    <TELL "You have nothing to brush">
		    <THE-J ,PRSO T>
		    <TELL " with." CR>)
           (<IOBJ? TOWEL>
            <TELL "It's really quite dirty. I wouldn't." CR>)
	       (<OR <NOT <IOBJ? BEER>>
                <NOT <NOUN-USED? ,BEER ,W?TOOTHBRUS ,W?BRUSH>>>
		    <TELL "With "><THE-J ,PRSI <>><TELL "!" CR>)
	       (<NOT <DOBJ? TEETH>>
		    <TELL
"In general, toothbrushes are meant for teeth." CR>)
	       (T
		<TELL "Congratulations on your fine dental hygiene." CR>)>>

;<ROUTINE UNCLEAN ()
	<TELL
"You try for a minute and then decide it's an endless task." CR>>

<ROUTINE V-BUY ()
	 <TELL "Sorry,"><TELL !\ ><THE-J ,PRSO T><TELL " isn't for sale." CR>>

;<ROUTINE REMOVE-CAREFULLY ("OPTIONAL" (OBJ <>) "AUX" OLIT)
	 <SET OLIT ,LIT>
	 <COND (<T? .OBJ>
		<NOT-IT .OBJ>
		<MOVE .OBJ ,LOCAL-GLOBALS>)>
	 <SETG LIT <LIT? ;,HERE>>
	 <COND (<AND <T? .OLIT> <ZERO? ,LIT>>
		<TELL "You are left in the dark..." CR>)>
	 T>

<ROUTINE PRE-SCALL ()
    <PERFORM ,V?$CALL ,PRSI ,PRSO>
    <RTRUE>>

<ROUTINE V-$CALL () ;("AUX" (MOT <>))
	 ;<UNSNOOZE ,PRSO>
	 <COND (<AND <FSET? ,PRSO ,PERSONBIT>
                 <NOT <=? ,PRSI ,MICROPHONE>>>
		    <COND (<==? <META-LOC ,PRSO> ,HERE>
		           <COND (<GRAB-ATTENTION ,PRSO>
		    	          <THE-J ,PRSO T T>
		    	          <TELL verb ,PRSO "is" " here! Relax." CR>)
		    	         (T
		    	          ;<TELL "ignores you." CR>
		    	          <FUCKING-CLEAR>)>)
		          (T
                   <COND (<OR <EQUAL? ,PRSI ,PHONE>
                              <AND <NOT ,PRSI>
                                   <VISIBLE? ,PHONE>
                                   <TELL "(with the phone)" CR>>>
                          <TELL "You don't know " his ,PRSO " number." CR>)
                         (ELSE
                          <TELL "You don't know " his ,PRSO " number, and even if you did, you have no phone." CR>)>)>)
	       (T
            <COND (<OR <EQUAL? ,PRSI ,PHONE>
                       <AND <NOT ,PRSI>
                            <VISIBLE? ,PHONE>
                            <TELL "(with the phone)" CR>>>
                   <COND (<EQUAL? ,PRSO ,LIP1>
		                  <TELL "Police? You think they're going to stop Vogons from destroying Earth?" CR>)
	                     (<EQUAL? ,PRSO ,HALLWAY2>
		                  <TELL "Who do you think you are, E.T.?" CR>)
	                     (<EQUAL? ,PRSO ,HALLWAY3>
		                  <V-HINTS>)
                         (ELSE
                          <TELL "You don't know the number." CR>)>)
                  (<OR <EQUAL? ,PRSI ,MICROPHONE>
                       <AND <NOT ,PRSI>
                            <VISIBLE? ,MICROPHONE>
                            <TELL "(on the microphone)" CR>>>
                   <COND (<EQUAL? ,PRSO ,HALLWAY3>
		                  <COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                                 <TELL
"Out of the radio comes a voice: \"Yes, yes. I can hear you.\" A brief pause. \"The code is ">
                                 <VOICE>)
                                (ELSE
                                 <TELL "A crackle, and you hear: \"">
                                 <VOICE>)>)
	                     (ELSE
		                  <TELL "It's a microphone to a radio! You can't call anything else." CR>)>)
                  (ELSE
                   <TELL "You don't know the number, and even if you did, you have no phone." CR>)>)>>


<ROUTINE UNSNOOZE (PER "OPTIONAL" (NO-TELL? <>)
		       "AUX" RM GT (C <GETP .PER ,P?LDESC>))
 <COND (<AND <NOT <EQUAL? .PER ,FIRST-CLASS-IDIOT ,MORPHER-CAPTAIN>>
 			 <FSET? .PER ,MUNGBIT>>
	<FCLEAR .PER ,MUNGBIT>
	<SET RM <META-LOC .PER>>
	<COND (<AND <IN? .PER ,HERE> <ZERO? .NO-TELL?>>
	       <TELL He .PER " wakes up first. ">
	       <COND (<NOT <FSET? .RM ,LIGHTBIT>>
		      <TELL He .PER " turns on the light. ">)>)>
	<FSET .RM ,LIGHTBIT>
	<RTRUE>)>>

<ROUTINE V-CHASTISE ()
	<COND (<NOT <EQUAL? ,PRSO ,INTDIR ,UP ,DOWN>>
	       <TELL !\[
,I-ASSUME " Look at" him ,PRSO ", not look in" him ,PRSO " nor look for"
him ,PRSO " nor any other preposition.]" CR>)>
	<PERFORM ,V?EXAMINE ,PRSO>
	<RTRUE>>

<ROUTINE PRE-BOARDING ()
    <COND (<AND <DOBJ? STALACTITE>
                <IOBJ? TOWEL>>
           <RFALSE>)
          (<EQUAL? ,PRSO ,HANDS ,PLAYER>
           <RFALSE>)
          (ELSE
           <SETG CLOCK-WAIT T>
           <TELL "[You don't need to use anything to do that.]" CR>)>>

<ROUTINE V-BOARD ()
    <COND (<EQUAL? ,PRSO ,P?UP ,P?DOWN ,UP ,DOWN>
    	<DO-WALK ,PRSO>
    	<RTRUE>)>
    <COND (<OR <IN? ,PRSO ,ROOMS> <FSET? ,PRSO ,DOORBIT>>
    	<V-THROUGH>)
          (<FSET? ,PRSO ,VEHBIT>
    	<COND (<EQUAL? <LOC ,WINNER> ,PRSO>
    	    <ALREADY ,PLAYER>
    	    <TELL "in"><TELL !\ ><THE-J ,PRSO T><TELL ,PAUSES>)
    	      (T
    	    <MOVE ,WINNER ,PRSO>
    	    <TELL He+verb ,WINNER "is" " now ">
    	    <COND (<FSET? ,PRSO ,SURFACEBIT>
    		    <TELL "o">)
    		      (T
                <TELL "i">)>
    		<TELL "n "><THE-J ,PRSO T><TELL ,PAUSES>
    	    <APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>
    	    <RTRUE>)>)
          (T <YOU-CANT "get in">)>>

<ROUTINE V-CLIMB-ON ()
	<PERFORM ,V?SIT ,PRSO>
	<RTRUE>>

<ROUTINE V-CLIMB-UP ("OPTIONAL" (DIR ,P?UP) (OBJ <>) "AUX" X)
	 <COND (<IN? ,PRSO ,ROOMS>	;"GO UP TO room"
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<GETPT ,HERE .DIR>
		<DO-WALK .DIR>
		<RTRUE>)
	       (<NOT .OBJ>
		<CANNOT-GO> ;<YOU-CANT "go">)
	       (ELSE <HAR-HAR>)>>

<ROUTINE V-CLIMB-DOWN () <V-CLIMB-UP ,P?DOWN>>

<ROUTINE V-CLOSE ()
	 <COND (,KILL-NOW?
	 		<TELL "Not a very clever idea, personally, but I'll accept it, for your sake. ">
			<TELL "As you are doing this, Benj" ,HEADSHOT>
			<JIGS-UP "">)>
	 <COND (<NOT <OR <FSET? ,PRSO ,CONTBIT>
			 <FSET? ,PRSO ,DOORBIT>
			 <EQUAL? ,PRSO ,WINDOW>>>
		<YOU-CANT "close">)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <EQUAL? ,PRSO ,WINDOW>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <COND ;(<FSET? ,PRSO ,MUNGBIT>
			      <TELL
"It won't stay closed. The latch is broken." CR>)
			     (T
			      <OKAY ,PRSO "closed">)>)
		      (T <ALREADY ,PRSO "closed">)>)
	       (<AND <NOT <FSET? ,PRSO ,SURFACEBIT>>
		     <NOT <0? <GETP ,PRSO ,P?CAPACITY>>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <OKAY ,PRSO "closed">)
		      (T <ALREADY ,PRSO "closed">)>)
	       (T <YOU-CANT "close">)>>

<ROUTINE V-COUNT () <IMPOSSIBLE>>

;<ROUTINE PRE-DESCRIBE ()
 <COND (<==? ,WINNER ,PLAYER>
	<COND (<EQUAL? ,PRSI <> ,ROOMS>
	       <COND (<QCONTEXT-GOOD?>
		      <SETG WINNER ,QCONTEXT>
		      <PERFORM ,PRSA ,PRSO>
		      <RTRUE>)
		     (T <ARENT-TALKING>)>)
	      (T
	       <PERFORM ,V?TELL-ABOUT ,PRSI ,PRSO>
	       <RTRUE>)>)>>

;<ROUTINE V-DESCRIBE () <V-FOO>>

<ROUTINE V-DIAGNOSE ()
 <COND ;(<AND <T? ,PRSO>
 			 <NOT <EQUAL? ,PRSO ,WINNER>>>
		<YOU-CANT ;"diagnose">)
       (ELSE
	   	<COND (,SCOREMAD
			   <COND (<EQUAL? ,SCOREOUT 32>
			   		  <TELL He+verb ,PRSO "is" " wide awake and in good health." CR>)
					 (ELSE
					  <COND (<EQUAL? ,PRSO ,PLAYER>
					  		 <TELL "You feel powerful, and yet... depressed." CR>)
							(ELSE
							 <TELL "Who cares about others when you have your own knowledge?" CR>)>)>)
			  (ELSE
			   <COND (<EQUAL? ,PRSO ,PLAYER ,ROOMS <>>
                      <COND (<AND <FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>   ;"Are you in Norway?"
                                  <FSET? ,CHANNEL1 ,SEENBIT>           ;"Are you wet?"
                                  <NOT <EQUAL? <LOC ,PLAYER> ,CHANNEL1 ,CHANNEL2 ,CHANNEL3>>>
                             <TELL "You're wet and very, very cold." CR>)
                            (<EQUAL? <LOC ,PLAYER> ,CHANNEL1 ,CHANNEL2 ,CHANNEL3>
                             <TELL "You're wet, but the water's warm, so you're fine." CR>)
                            (<FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                             <TELL "You're freezing!" CR>)
                            (ELSE
                             <TELL "You're hungry." CR>)>)
			   		 (ELSE
					  <TELL He+verb ,PRSO "is" " wide awake and in good health." CR>)>)>)>>

<ROUTINE TELL-NOT-IN (OBJ)
	<SETG CLOCK-WAIT T>
	<TELL He+verb ,WINNER "is" " not in" him .OBJ "!" CR>>

<ROUTINE V-DRINK () <YOU-CANT ;"drink">>

<ROUTINE V-DROP ("AUX" L)
 <COND (<IDROP>
	<COND (<OR ;<IN? <SET L ,TABLE-DINING> ,HERE>
		   <SET L <FIND-FLAG-HERE ,VEHBIT;,SURFACEBIT ,PRSO>>>
	       <MOVE ,PRSO .L>
		   <TELL "Dropped." CR>
	       ;<OKAY ,PRSO>
	       ;<TELL " is now on" the .L ,PAUSES>)
	      (T
	       ;<OKAY ,PRSO <GROUND-DESC>>
		   <TELL "Dropped." CR>)>)>>

<ROUTINE GROUND-DESC ()
	 <COND (<EQUAL? <GETP ,FLOOR ,P?SDESC> "ramp">
			"on the ramp")
	       (<EQUAL? <GETP ,FLOOR ,P?SDESC> "ground">
		   	"on the ground")
           (<EQUAL? <GETP ,FLOOR ,P?SDESC> "channel bed">
            "in the water")
		   (ELSE
		   	"on the floor")>>

<ROUTINE PRE-EAT ()
 <COND (<EQUAL? ,PRSO <> ,ROOMS>
		<COND (<EQUAL? <META-LOC ,DINNER> ,HERE>
			   <PERFORM ,PRSA ,DINNER>
			   <RTRUE>)
			  (T
			   <NOT-HERE ,DINNER>
			   <RTRUE>)>)
	   (<FSET? ,PRSO ,PERSONBIT>
	    <TELL "That would be a last resort." CR>)>>

<ROUTINE V-EAT ()
	 <COND (<AND ,KILL-NOW?
                 <NOT <RUNNING? I-MOUSE-BLAB>>>
	 		<TELL ,SUDDEN "attempt to eat"><TELL !\ ><THE-J ,PRSO T>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
	 <TELL
"Stuffing"><TELL !\ ><THE-J ,PRSO T><TELL " in your mouth would do little to help at this point."
CR>>

<ROUTINE V-ENJOY ()
	 <COND (<FSET? ,PRSO ,PERSONBIT>
		<V-KISS>)
	       (T <TELL
"Not difficult at all, considering how enjoyable"><TELL !\ ><THE-J ,PRSO T><TELL " is." CR>)>>

<ROUTINE PRE-THROUGH ("AUX" VEH)
 <COND (<DOBJ? ROOMS GLOBAL-HERE>
	<COND (<SET VEH <FIND-IN ,HERE ,VEHBIT>>
	       <PERFORM ,V?BOARD .VEH>
	       <RTRUE>)
	      (T
	       <DO-WALK ,P?IN>)>
	<RTRUE>)
       ;(<T? ,PRSI>	;"DRIVE CAR THRU object"
	<COND (<DOBJ? CAR>
	       <COND (<EQUAL? <LOC ,WINNER> ;,HERE ,CAR>
		      <SETG PRSO ,PRSI>
		      <RFALSE>)
		     (T
		      <TELL-NOT-IN ,CAR>
		      <RTRUE>)>)
	      (T <DONT-UNDERSTAND>)>)>>

<ROUTINE V-THROUGH ("AUX" RM DIR)
	 <COND (<AND ,KILL-NOW?
                 <NOT <RUNNING? I-MOUSE-BLAB>>>
	 		<TELL ,SUDDEN "attempt to pass through" him ,PRSO>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
	<COND (<AND <NOUN-USED? ,PRSO ,W?DOOR ,W?HATCH>
		    ;<FSET? ,PRSO ,DOORBIT>
		    <OR <FSET? ,PRSO ,OPENBIT>
			<WALK-THRU-DOOR? <> ,PRSO <>>>>
	       <COND (<OR <NOT <SET RM <DOOR-ROOM ,HERE ,PRSO>>>
			  <NOT <GOTO .RM>>>
		      <V-FOO>)>)
	      (<IN? ,PRSO ,ROOMS>
	       <COND (<==? ,PRSO ,HERE>
		      <WALK-WITHIN-ROOM>)
		     (<SEE-INTO? ,PRSO <>>
		      <GOTO ,PRSO>)
		     (T <PERFORM ,V?WALK-TO ,PRSO>)>
	       <RTRUE>)
	      (<AND <FSET? ,PRSO ,VEHBIT>
		    ;<FSET? ,PRSO ,CONTBIT>>
	       <PERFORM ,V?BOARD ,PRSO>)
	      (<FSET? ,PRSO ,PERSONBIT>
	       <HAR-HAR>)
		  (<OR <EQUAL? ,PRSO ,WHALE-CRATER-BOX>
		   	   <==? ,PRSO ,PSEUDO-OBJECT>>
		   <HAR-HAR>)
	      (<NOT <FSET? ,PRSO ,TAKEBIT>>
	       <TELL He+verb ,WINNER "bang" " into "><THE-J ,PRSO T>
	       <THIS-IS-IT ,PRSO>
	       <TELL " while trying to go through" him ,PRSO ,PAUSES>)
	      (<IN? ,PRSO ,WINNER>
	       <PERFORM ,V?EXAMINE ,EYES>
	       <RTRUE>)
	      (ELSE <HAR-HAR>)>>

<ROUTINE PRE-EXAMINE () <ROOM-CHECK>>

<ROUTINE V-EXAMINE ("AUX" (TXT <>))
	 <COND (<OR <==? ,PRSO ,PSEUDO-OBJECT>
		    <AND <NOUN-USED? ,PRSO ,W?DOOR ;,W?DOORS ;,W?KEYHOLE>
			 <GLOBAL-IN? ,PRSO ,HERE>>>
		<SET TXT T>)>
	 ;<COND (<IN? ,PLAYER ,DARK>
	 		<SETG PRSO ,DARK-OBJECT>
			<DARK-FUNCTION>
			<RFALSE>)>
	 <COND (<DOBJ? INTDIR>
		<SETG CLOCK-WAIT T>
		<TELL "If you want to see what's there, go there!" CR>)
	       (<DOBJ? HANDS WALLS LIGHT-GLOBAL>
		<NOTHING-SPECIAL>)
           (<DOBJ? HEAD EYES TEETH EARS>
        <TELL "That would involve quite a contortion." CR>)
	       ;(<DOBJ? NOW-WEARING>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
	       (<IN? ,PRSO ,GLOBAL-OBJECTS>
		<NOT-HERE ,PRSO>
		<RTRUE>)
	       (<AND <IN? ,PRSO ,ROOMS>	;<FSET? ,PRSO ,RLANDBIT>
		     <ZERO? .TXT>>
		<ROOM-PEEK ,PRSO>)
	       (<AND <NOT <EQUAL? <META-LOC ,PRSO> ,HERE>>
		     <NOT <GLOBAL-IN? ,PRSO ,HERE>>
		     <ZERO? .TXT>>
		<TOO-BAD-BUT ,PRSO "too far away">)
	       (<SET TXT <GETP ,PRSO ,P?TEXT>>
		<TELL .TXT CR>)
	       (<FSET? ,PRSO ,DOORBIT>
		<CHECK-DOOR ,PRSO> <CRLF>)
	       (<OR <FSET? ,PRSO ,CONTBIT>
		    <FSET? ,PRSO ,SURFACEBIT>
		    ;<NOUN-USED? ,PRSO ,W?KEYHOLE>>
		<V-LOOK-INSIDE>)
	       (T <NOTHING-SPECIAL>)>>

<ROUTINE NOTHING-SPECIAL ()
	<TELL "You see nothing special about "><THE-J ,PRSO T><TELL ,PAUSES>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TEE)
	 <COND (<EQUAL? .OBJ1 .OBJ2>
		<RTRUE>)
	       (<SET TEE <GETPT .OBJ2 ,P?GLOBAL>>
		<INTBL? .OBJ1 .TEE </ <PTSIZE .TEE> 2>>)>>

<ROUTINE V-FAINT ("OPT" (OOPS <>))
	 <COND (,KILL-NOW?
	 		<TELL "You doze for a few minutes, and the mice take this as an opportunity to give you
some anaesthetic. They begin testing for the meaning of Life, the Universe and Everything, and they
find it, replacing your brain for an NPC's. You live on for thousands of years after the event as a
helper to a wealthy Jartravartid family, and those mice who tested on you have become immensely rich.
People thank you for centuries to come for your bravery and consideration for the rest of the Universe,
but you don't know about any of this, you're an NPC!">
	 		<JIGS-UP "" T>)>
	 <COND (.OOPS
	 		<TELL "You sleep for several minutes. ">
	 		<V-WAIT>)
		   (ELSE
		    <TELL "There's no bed here." CR>)>>

<ROUTINE V-FILL ()
	 ;<YOU-CANT>
	 <TELL-ME-HOW>>

<ROUTINE PRE-FIND ()
	 <COND (<EQUAL? ,PRSO ,PLAYER ;PLAIN-NAME ,YOUR-NAME>
		<RFALSE>)
	       (<AND <FSET? ,PRSO ,SECRETBIT>
		     <NOT <FSET? ,PRSO ,SEENBIT>>>
		<NO-FUN>)
	       (<IN? ,PRSO ,ROOMS>
		<COND (<==? ,PRSO ,HERE>
		       <ALREADY ,WINNER "here">)
		      (T
		       <PERFORM ,V?WALK-TO ,PRSO>
		       <RTRUE>)>)
	       (<AND <FSET? ,PRSO ,PERSONBIT>
		     ;<NOT <==? ,PRSO ,OTHER-CHAR>>>
		<COND (<AND <==? <META-LOC ,WINNER> <META-LOC ,PRSO>>
			    <NOT <FSET? ,PRSO ,NDESCBIT>>>
		       <BITE-YOU>
		       <RTRUE>)
              (ELSE
               <RFALSE>)
		      ;(<NOT <FOLLOW-LOC?>>
		       <WHO-KNOWS? ,PRSO>
		       <FUCKING-CLEAR>)>
		<RTRUE>)>>

<ROUTINE BITE-YOU ()
	<TELL "If "><THE-J ,PRSO T><TELL " were any closer, " he ,PRSO "'d hit you!" CR>>

<ROUTINE FAR-AWAY? (L)
 <COND ;(<ZERO? <GETP ,HERE ,P?LINE>>
	<RTRUE>)
       (<EQUAL? .L ,GLOBAL-OBJECTS>
	<RTRUE>)
       (<AND ;<FSET? .L ,SECRETBIT>
	     <NOT <FSET? .L ,SEENBIT>>>
	<RTRUE>)
       ;(<ZERO? <GETP .L ,P?LINE>>
	<RTRUE>)>
 <COND (<OR <AND <FSET? ,HERE ,SECRETBIT>
		 <NOT <FSET? .L ,SECRETBIT>>>
	    <AND <NOT <FSET? ,HERE ,SECRETBIT>>
		 <FSET? .L ,SECRETBIT>>>
	<RETURN <NOT <SEE-INTO? .L <> ;T> ;<GLOBAL-IN? .L ,HERE>>>)>
 <RFALSE>>

<ROUTINE V-FIND ("AUX" (L <LOC ,PRSO>))
	 <COND (<EQUAL? ,PRSO ,HANDS ,HEAD ,EARS ,TEETH ,EYES>
		<TELL "Are you sure "><THE-J ,PRSO T><TELL " are lost?" CR>)
           (<DOBJ? HALLWAY3>
        <V-HINTS>)
           (<HELD? ,PRSO>
		<TELL "You have it!" CR>)
	       ;(<OR <FSET? ,PRSO ,SECRETBIT>
		    ;<==? ,PRSO ,ARTIFACT>>
		<NO-FUN>)
	       (<AND <FSET? .L ,PERSONBIT>
		     <VISIBLE? .L>>
		<TELL "As far as you can tell, ">
		;<TELL the .L>
		<THE-J .L T>
		<THIS-IS-IT .L>
		<TELL " has it." CR>)
	       (<VISIBLE? ,PRSO>
		<COND ;(<FSET? ,PRSO ,SECRETBIT>
		       <DISCOVER ,PRSO>)
		      (T <TELL "Right in front of you." CR>)>)
	       (<AND ;<NOT <FSET? ,PRSO ,SEENBIT>>
		     <OR ;<IN? ,PRSO ,ROOMS>
			 	 <FSET? ,PRSO ,INVISIBLE>
			 	 <FSET? ,PRSO ,SECRETBIT>>>
		<NOT-HERE ,PRSO T>)
	       (<OR <EQUAL? .L ,GLOBAL-OBJECTS ,LOCAL-GLOBALS>
		    ;<EQUAL? ,PRSO ,DRAPES>>
		<TELL "It's around somewhere." CR>)
           (<FAR-AWAY? <META-LOC ,PRSO>>
		<TELL "Far away from here, probably." CR>)
	       (<AND <FSET? ,PRSO ,SEENBIT>
             <FSET? ,PRSO ,TOUCHBIT>
             <OR <FSET? .L ,SURFACEBIT>
		         <FSET? .L ,CONTBIT>
		         <IN? .L ,ROOMS>>>
		<THIS-IS-IT .L>
		<TELL He ,PRSO "is" " probably ">
		<COND (<FSET? .L ,SURFACEBIT> <TELL !\o>) (T <TELL !\i>)>
        <TELL !\n !\ >
		<THE-J .L T>
		<TELL ,PAUSES>)
	       (T
		<TELL ,DO-YOURSELF CR>)>>

<ROUTINE NO-FUN ()
	<SETG CLOCK-WAIT T>
	<TELL "If it's that easy, it spoils the fun!" CR>>

<ROUTINE TELL-LOCATION ("AUX" DIR)
	;<COND (<EQUAL? ,HERE ,UNCONSCIOUS>
	       <TELL "unconscious.">
	       <RTRUE>)>
	<COND (<NOT <EQUAL? <LOC ,PLAYER> ,HERE>>
	       <TELL "sitting ">)>
	;<COND (<ZERO? ,PLAYER-SEATED>	T)
	      (<L? 0 ,PLAYER-SEATED>	<TELL "sitting ">)
	      (T 			<TELL "lying ">)>
	<COND (<FSET? ,HERE ,SURFACEBIT>
	       <TELL "o">)
	      (T
	       <TELL "i">)>
    <TELL !\n !\ >
	<THE-J ,HERE T>
	<TELL ".">>

<ROUTINE V-FIX ()
    ;<MORE-SPECIFIC>
    <TELL-ME-HOW>>

;<ROUTINE V-REPAIR ()
	 <COND (<OR <AND <EQUAL? ,PRSO ,THUMB>
		         <FSET? ,THUMB ,MUNGEDBIT>>
		    <AND <EQUAL? ,PRSO ,HATCH>
			 ,LANDED>>
		<TELL "You have neither the tools nor the expertise." CR>)
	       (T
		<TELL "I'm not sure it's broken." CR>)>>

<ROUTINE FOLLOW-LOC? ("AUX" L)
	 <SET L <GETP ,PRSO ,P?CHARACTER>>
	 <COND (<SET L <GET ,FOLLOW-LOC .L>>
		<TELL "The last you knew, " he ,PRSO " was ">
		<COND (<FSET? .L ,SURFACEBIT>
		       <TELL "on">)
		      (T <TELL "in">)>
		<TELL !\ >
		<THE-J .L T>
		<TELL ".|">
		.L)>>

<ROUTINE V-FOLLOW ("AUX" L)
	 <COND (<AND <==? ,PRSO ,PLAYER>
                 <NOT <ORDERING?>>>
		;<YOU-CANT>
        <TELL "I'd like to, but like most computers I don't have legs." CR>)
           (<==? ,PRSO ,PLAYER>
        <PERSON-F ,WINNER>)
	       ;(<AND ;<NOT <DOBJ? GHOST-NEW>>
		     <NOT <FSET? ,PRSO ,PERSONBIT>>>
		<IMPOSSIBLE>)
	       (<==? ,HERE <META-LOC ,PRSO>>
		<TELL "You're in the same place as " him ,PRSO "!" CR>)
	       ;(<SET L <GET ,FOLLOW-LOC <GETP ,PRSO ,P?CHARACTER>>
		       ;<FOLLOW-LOC?>>
		<PERFORM ,V?WALK-TO .L>)
	       (T
		<WHO-KNOWS? ,PRSO>
		<FUCKING-CLEAR>)>>

<ROUTINE V-FOO () <TELL "[Foo!! This is a bug!!]" CR>>

<ROUTINE V-FOOTNOTE ()
     <SETG CLOCK-WAIT T>
	 <COND (<OR <NOT ,PRSO>
		        <NOT <EQUAL? ,PRSO ,INTNUM>>>
		    <TELL "Specify a number, as in \"FOOTNOTE 6.\"" CR>)
	       (<EQUAL? ,P-NUMBER 1>
		        <TELL
"A small nucleus has hit an atom. That atom is part of a molecule. That molecule is in
the stem of a small plant. Et cetera et cetera. Essentially, what has happened is that
the plant has sprouted a fourth leaf." CR>)
	       (<EQUAL? ,P-NUMBER 2>
		        <TELL
"Yes, yes. Most computers nowadays have personalities. It
saves so much time on bug-testing if they do it for you." CR>)
	       (<EQUAL? ,P-NUMBER 3>
		        <TELL
"That was a good bottle of retsina, but it's probably on Earth,
floating around somewhere." CR>
                <NOTES 5 T>)
	       (<EQUAL? ,P-NUMBER 4>
		        <TELL
"The phenomenon known as the vegan snow lizards is a strange case.
Although taken from the carcass of an unwilling living creature
(just like most meat-based foods - if you don't count the bovines
bred by the Selfless Cow Co), vegan snow lizard flesh is actually
classified as being vegan." CR>)
	       (<EQUAL? ,P-NUMBER 5>
		        <TELL "Go to Footnote 9." CR>)
	       (<EQUAL? ,P-NUMBER 6>
		        <TELL "That was just an example." CR>)
	       (<EQUAL? ,P-NUMBER 7>
		        <TELL "Except for the people that didn't pay as much as the VIP guests." CR>)
	       (<EQUAL? ,P-NUMBER 8>
		        <TELL
"If gaining a little bit of knowledge from some " ,GALACT
" is equivalent to about 50,000 points, then think of how
much each point you normally get is actually worth." CR>)
	       (<EQUAL? ,P-NUMBER 9>
		        <TELL
"If knowing where your suitcase actually is could actually make a
difference to whether you continue to live or die instead, let's
just say that it might be lying on a planet - one which has been
through a lot of devastation, caused by what would appear to be
a floating house-party. There's no saying how good the party
actually is - if you enter, you don't leave (unless you have spent
so long in there that alcohol poisoning finally got round to you,
in which case they chuck your body out the window).|
|Many microchip-records of the spectacular party have been made,
but none have made their way around to the prying fingers of regular
partygoers, because no-one has thought about actually leaving. This
was the second noted case where a large amount of creatures never
exit one small area, for whatever reason other than the fact that
they can't. In fact, the first record of this spectacular feat was
from the Oglaroonians, who are an entire race that have never left
the small tree they have lived on for their whole lives. They likely
never will, for that matter." CR>)
	       (<EQUAL? ,P-NUMBER 10>
		    <TELL "At least not in this lifetime, which is what counts." CR>
            <QUEUE I-JUST-RESTARTED 2>)
	       (<EQUAL? ,P-NUMBER 11> ;"not referenced"
		    <SETG AWAITING-REPLY 2>
		    <QUEUE I-REPLY 2>
		    <TELL "Isn't it fun reading through all the footnotes?" CR>)
	       (<EQUAL? ,P-NUMBER 12>
	            <TELL
"It probably seems to you as if we're trying to fill up empty space. Just don't tell anyone..." CR>)
	       (<EQUAL? ,P-NUMBER 13>
                <TELL
"And considering that time travel is cheap and easy to use, if the
Question ever was found, we likely would already know about it." CR>)
	       (<EQUAL? ,P-NUMBER 14>
		        <TELL "Read it aloud, english-speakers. Multiple times if needed." CR>)
	       (<EQUAL? ,P-NUMBER 15>
                <TELL
"In fact, if Dirk Gently left Earth before it was destroyed, then isn't he
another Earthling that probably has " ,QUESTION-ANSWER " in his brain?..." CR>)
           ;(<EQUAL? ,P-NUMBER 16>
                <TELL "You know, ">)
	       (T
		        <TELL "There is no Footnote " N ,P-NUMBER ,PAUSES>)>>

<ROUTINE I-JUST-RESTARTED ()
    <TELL CR "Also, how did you find footnote 10? Did you just read through all the
footnotes? Or did you look at the hints? Or... did you - you didn't surely - did you ">
    <ITALICIZE "restart">
    <TELL !\? CR>>

<ROUTINE V-SCRIPT ()
    <COND (<BTST <LOWCORE FLAGS> 1>
           <TELL "Transcript already on." CR>)
          (<AND <DIROUT 2>
                <BTST <LOWCORE FLAGS> 1>>
           <TELL "This begins a transcript of ">
           <V-VERSION>
           <RTRUE>)
          (ELSE <TELL-FAILED>)>>

<ROUTINE V-UNSCRIPT ()
    <COND (<NOT <BTST <LOWCORE FLAGS> 1>>
           <TELL "Transcript already off." CR>)
          (<AND <TELL CR "End of transcript." CR>
                <DIROUT -2>
                <BTST <LOWCORE FLAGS> 1>>
           <TELL-FAILED>)>>

<ROUTINE I-REPLY ()
	 <SETG AWAITING-REPLY <>>>

<GLOBAL AWAITING-REPLY <>>

<ROUTINE PRE-GIVE ()
	 <COND (<AND <NOT <EQUAL? ,PRSI ,PLAYER ,YOUR-NAME>>
		     <NOT-HOLDING? ,PRSO>>
		<RTRUE>)>>

;<ROUTINE PRE-GIVE ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-GIVE ()
	 <COND (<AND ,KILL-NOW?
	 			 <EQUAL? ,PRSI ,BENJY ,PERCY ,MICE>>
	 		<TELL "Suddenly, as the mice pretend to thank you for the \"lovely\" gift">
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
	 <COND (<AND <ZERO? ,PRSI>
                 <ORDERING?>>
        <PERFORM ,V?ASK-FOR ,WINNER ,PRSO>)
           (<ZERO? ,PRSI>
		<YOU-CANT ;"give">)
	       (<NOT <FSET? ,PRSI ,PERSONBIT>>
		<TELL He ,WINNER " can't give "><THE-J ,PRSO <>><TELL " to "><THE-J ,PRSI <>><TELL "!" CR>)
	       ;(<FSET? ,PRSI ,MUNGBIT>
		<TELL He+verb ,PRSI "do" "n't respond." CR>)
           (<AND <EQUAL? ,PRSI ,PLAYER>
                 <ORDERING?>>
		<PERFORM ,V?ASK-FOR ,WINNER ,PRSO>
		<RTRUE>)
	       (<EQUAL? ,PRSI ,PLAYER>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Politely,"><TELL !\ ><THE-J ,PRSI T><TELL " refuses your offer." CR>)
	       ;(T
		<MOVE ,PRSO ,PRSI>
		<TELL He+verb ,PRSI "accept" " your gift." CR>
		<RTRUE>)>>

<ROUTINE PRE-SGIVE ("AUX" X)
	;<PROG ()
	      <SET X <GET ,P-NAMW 0>>
	      <PUT ,P-NAMW 0 <GET ,P-NAMW 1>>
	      <PUT ,P-NAMW 1 .X>>
	<PERFORM ,V?GIVE ,PRSI ,PRSO>
	<RTRUE>>

<ROUTINE V-SGIVE () <V-FOO>>

<ROUTINE TELL-I-ASSUME (OBJ "OPT" PRON)
	<COND (<AND <NOT <FSET? .PRON ,TOUCHBIT>> 
		    <NOT <EQUAL? ,OPRSO .OBJ>>>
	       <FSET .PRON ,TOUCHBIT>
		   <TELL !\[ ,I-ASSUME>
		   <THE-J .OBJ T>
	       <TELL !\. !\] CR>)>>

<ROUTINE PRE-HELLO (;"OPT" ;(STR 0) "AUX" P ;(WORD <>))
 <COND (,PRSI
        <SETG PRSO ,PRSI>)>
 <COND (<NOT <DOBJ? ROOMS <>>>
	    <COND (<NOT <FSET? ,PRSO ,PERSONBIT>>
	           <WONT-HELP-TO-TALK-TO ,PRSO>
	           <RTRUE>)
	          (<FSET? ,PRSO ,MUNGBIT>
	           <PERFORM ,V?ALARM ,PRSO>
	           <RTRUE>)
              (ELSE
               <RFALSE>)>)
       (<AND <NOT ,PRSO>
             <QCONTEXT-GOOD?>>
	    <PERFORM ,PRSA ,QCONTEXT>
	    <RTRUE>)
       (<AND <EQUAL? ,WINNER ,PLAYER>
	         <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>>
	    <PERFORM ,PRSA .P>
	    <RTRUE>)
       ;(ELSE
        <NOT-CLEAR-WHOM>)>>

<ROUTINE V-HELLO () ;("OPT" (HELL T))
 <COND (<OR <AND <FSET? ,PRSO ,PERSONBIT>
                 <NOT <EQUAL? ,PRSO ,PLAYER>>>
            <SETG PRSO <QCONTEXT-GOOD?>>>
	    <COND (<EQUAL? ,PRSO ,MARVIN>
	           <TELL "Marvin ignores you." CR>
               <RTRUE>)
              (<IN? ,PLAYER ,INTERVIEW-ROOM>
               <TELL "\"Hello. I'm " D ,PRSO !\.>
               <COND (<NOT <FSET? ,INTERVIEW-ROOM ,RADPLUGBIT>>
                      ;<CRLF>
                      <DEQUEUE I-ASK-DEATH>
                      <I-ASK-DEATH>)
                     (ELSE
                      <TELL !\" CR>)>)
              (<EQUAL? ,PRSO ,ZAPHOD>
	           <TELL "Zaphod nods at you coolly. \"What's up?\"" CR>
               <RTRUE>)
              (<EQUAL? ,PRSO ,FORD>
	           <TELL "Ford smiles. \"Heyya! It's space-">
               <COND (<FSET? ,GOWN ,WORNBIT>
                      <TELL "gown and his owner">)
                     (ELSE
                      <TELL "tramp">)>
               <TELL " Arthur.\" He looks up at your eyes. \"How you doing?\"" CR>
               <RTRUE>)
	          (ELSE
	           <TELL "\"Hello to you too.\"" CR>
               <RTRUE>)>)
       (T ;<NOT-CLEAR-WHOM>
	   	  <TELL "Hello." CR>)>>

<ROUTINE V-HELP ()
    <COND (<EQUAL? ,PRSO <> ,PLAYER>
		   ;<HELP-TEXT>
		   <V-HINTS>)
          (<EQUAL? ,PRSO ,THIRD-PLANET>
           <COND (<0? ,MY-NAME>
                  <TELL "What, you're just going to go up to the Vogons and say, \"Stop\"?!" CR>
                  <SETG AWAITING-REPLY 16>)
                 (<IN-REST? ,PLAYER>
                  <TELL "That was a few million - billion - whatever - years ago. It doesn't matter anymore." CR>)
                 (<FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                  <TELL "That is in a long time to come." CR>)
                 (<IN? ,PLAYER ,PDW>
                  <TELL "That already happened. Focus on making a new planet, or something." CR>)
                 (ELSE
                  <TELL "Forget it." CR>)>)
          (T
           <TELL-ME-HOW>
           ;<MORE-SPECIFIC>)>>

<ROUTINE V-HIDE ()
	 <TELL "There's no place to hide here." CR>>

<ROUTINE V-WHO ()
	 <COND (<FSET? ,PRSO ,PERSONBIT>
		<PERFORM ,V?WHAT ,PRSO>
		<RTRUE>)
	       (T
		<TELL "That's not a person!" CR>)>>

<ROUTINE V-WHY ()
	 <TELL "Why not?" CR>>
	
<ROUTINE V-WHAT ()
    <COND (<EQUAL? ,PRSO ,TIME>
        <V-WHAT-TIME>
        <RTRUE>)>
	<TELL "Good question." CR>>

<ROUTINE V-WHAT-TIME ()
	<TELL "If only you had a digital watch." CR>>

<ROUTINE V-NOT-WHAT ()
    <TELL "What what?" CR>>

<ROUTINE V-WHAT-ABOUT ()
	<TELL "Well, what about ">
    <COND (<EQUAL? ,PRSO ,PLAYER>
        <TELL "you">)
    (<FSET? ,PRSO ,PERSONBIT>
        <COND (<FSET? ,PRSO ,FEMALEBIT>
            <TELL "her">)
        (T
            <TELL "him">)>)
    (ELSE
        <TELL "it">)>
    <TELL "?" CR>>

<ROUTINE V-KILL ()
	<TELL "Hey! Let's not overdo it, eh?" CR>
	<SETG AWAITING-REPLY 5>
	<QUEUE I-REPLY 2>
	<FUCKING-CLEAR>
	;<TELL
"You are obviously letting things get to you. You should learn to
relax a little." CR>>



<ROUTINE IKILL ("OPTIONAL" (STR <>))
	 <COND (<ZERO? ,PRSO>
		<SETG CLOCK-WAIT T>
		<TELL "There's nothing here to " .STR " with." CR>)
	       ;(<NOT <FSET? ,PRSO ,PERSONBIT>>
		<HAR-HAR>)
	       (T <TELL ,NO-VIOLENCE> <RTRUE>)>>


;<ROUTINE V-KISS ()
	 <TELL "This is family entertainment, not a video nasty." CR>>

<ROUTINE V-KISS ("AUX" X)
	 <COND (<EQUAL? ,PRSO ,PLAYER>
		;<TELL "You must tell me how to do that to yourself." CR>
        <TELL-ME-HOW>)
	       (<AND <FSET? ,PRSO ,PERSONBIT>
		     <NOT <FSET? ,PRSO ,MUNGBIT>>>
		<TELL "This is family entertainment, not a video nasty." CR>)
	       (T <TELL "What a (ahem!) strange idea!" CR>)>>

<ROUTINE V-KNOCK ("AUX" P)
 <COND (<OR <FSET? ,PRSO ,DOORBIT>
	    ;<EQUAL? ,PRSO ,WINDOW>>
	<COND (<FSET? ,PRSO ,OPENBIT>
	       <TELL "It's open!" CR>)
	      ;(<AND <SET P <DOOR-ROOM ,HERE ,PRSO>>
		    <SET P <FIND-IN .P ,PERSONBIT ,PLAYER>>>
	       <FCLEAR ,PRSO ,LOCKED>
	       <FSET ,PRSO ,OPENBIT>
	       <FSET ,PRSO ,ONBIT>
	       <UNSNOOZE .P>
	       <THIS-IS-IT .P>
	       <TELL He .P " opens the door, then retreats into the room."
			  ;"Someone shouts \"Come!\"" CR>)
	      (T <TELL "Nobody's home." CR>)>)
       (T
	<HACK-HACK "Knocking on">)>>

<ROUTINE V-LAMP-OFF ()
	 <COND (<EQUAL? ,PRSO ,PLAYER>
	 	<TELL <PICK-ONE <PLTABLE "Vogons." "Cold showers.">> CR>)
	 	   (<NOT <FSET? ,PRSO ,LIGHTBIT>>
		<YOU-CANT "turn off">)
	       (<NOT <FSET? ,PRSO ,ONBIT>>
		<ALREADY ,PRSO "off">)
	       (T
		<OKAY ,PRSO "off">)>>

<ROUTINE V-LAMP-ON ()
	 <COND (<FSET? ,PRSO ,ONBIT>
		<ALREADY ,PRSO "on">)
	       (<FSET? ,PRSO ,LIGHTBIT>
		<OKAY ,PRSO "on">)
	       (<FSET? ,PRSO ,PERSONBIT>
		<HAR-HAR>)
	       (T <YOU-CANT "turn on">)>>

<ROUTINE V-LEAP ()
	 <COND (<AND ,PRSO
		     <NOT <DOBJ? INTDIR>>>
		<IMPOSSIBLE>
		<RTRUE>)
	       ;(<GETPT ,HERE ,P?DOWN>
		<TELL "This was not a very safe place to try jumping.">
		<FINISH>)
	       (T <V-SKIP>)>>

<ROUTINE V-SKIP ()
	 <COND (<FSET? <LOC ,PLAYER> ,VEHBIT>
		<TELL "That would be tough from your current position." CR>)
		   (<AND <IN? ,PLAYER ,ENTRY-HALL>
		   		 ,ANNOYED-TV>
			<TELL "You are ridiculous, trying to reach the TV by jumping!" CR>)
	       (T <WHEE>)>>

<ROUTINE WHEE ("AUX" X)
	<SET X <RANDOM 5>>
	<COND (<==? 1 .X>
	       <TELL "Very good. Now you can go to the second grade." CR>)
	      (<==? 2 .X>
	       <TELL "I hope you enjoyed that more than I did." CR>)
	      (<==? 3 .X>
		   <SETG AWAITING-REPLY 2>
	       <TELL "Are you enjoying yourself?" CR>
		   <QUEUE I-REPLY 2>)
	      (<==? 4 .X>
		   <SETG AWAITING-REPLY 2>
		   <TELL "Wasn't that fun?" CR>
		   <QUEUE I-REPLY 2>)
	      (T <TELL "Do you expect someone to applaud?" CR>)>>

<ROUTINE V-LEAVE ("AUX" GT)
	 <COND (,KILL-NOW?
	 		<TELL "You stand up, thank the mice very much, and head for the door, but as you reach it">
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
	<COND (<==? ,WINNER ,FOLLOWER>
	       <SETG FOLLOWER 0>)>
	<COND (<EQUAL? ,PRSO <> ,ROOMS ,HERE>
	       <DO-WALK ,P?OUT>
	       <RTRUE>)
	      (<EQUAL? <LOC ,PRSO> ,PLAYER ;,POCKET>
	       <PERFORM ,V?DROP ,PRSO>
	       <RTRUE>)
	      (<==? <LOC ,WINNER> ,PRSO>
	       <PERFORM ,V?DISEMBARK ,PRSO>
	       <RTRUE>)
	      (T
	       <TELL-NOT-IN ,PRSO>
	       <RFATAL>)>>

<ROUTINE PRE-LIE () <ROOM-CHECK>>

<ROUTINE V-LIE () <V-SIT T>>

<ROUTINE PRE-LISTEN ()
 <COND (<AND <FSET? ,PRSO ,PERSONBIT>
	     <EQUAL? <GETP ,PRSO ,P?LDESC> 14 ;"asleep">>
	<TELL "\"Zzzzzzz...\"" CR>
	<RTRUE>)
       (T <PRE-ASK>)>>

<ROUTINE V-LISTEN ()
 <COND (<VISIBLE? ,RADIO>
    <TELL ,YOU-HEAR>
 	<COND (<FSET? ,RADIO ,BADRADIOBIT>
        <TELL "static">)
          (<FSET? ,PLANT ,RADPLUGBIT>
        <TELL "a sad tune">)
          (ELSE
        <TELL "a happy song">)>
    <TELL ". It's coming from "><THE-J ,RADIO T><TELL ,PAUSES>)
       (<EQUAL? ,PRSO ,ROOMS>
	<TELL "You hear nothing out of the ordinary. At least, in this situation." CR>)
 	   (<AND <FSET? ,PRSO ,PERSONBIT>
	     <NOT <FSET? ,PRSO ,MUNGBIT>>>
	<WAITING-FOR-YOU-TO-SPEAK>
	<RTRUE>)
       (T
	<TELL "At the moment, "><THE-J ,PRSO T><TELL " makes no sound." CR>)>>

<ROUTINE V-LOCK ()
 <COND ;(<FSET? ,PRSO ,DOORBIT>
	<COND (<EQUAL? ,PRSO ,HERE>
	       <OKAY ,PRSO "locked">)
	      (T <TELL-FIND-NONE "a way to lock" ,PRSO>)>)
       (T <HAR-HAR>)>>

<GLOBAL LOOKING-DARK <>>

<ROUTINE V-LOOK ()
	 <COND (<AND <IN? ,PLAYER ,STUNT-SHIP>
                 <NOT <FSET? ,STUNT-SHIP ,LIGHTBIT>>>
            <SETG LOOKING-DARK T>
            <STUNT-SHIP-F ,M-BEG>
            <SETG LOOKING-DARK <>>)
           (<DESCRIBE-ROOM ;<EQUAL? ,VERBOSITY 2>>
		    <DESCRIBE-OBJECTS ;T>
		    ;<CRLF>)>>

<ROUTINE V-LOOK-BEHIND ()
 <COND (<AND <FSET? ,PRSO ,DOORBIT> <NOT <FSET? ,PRSO ,OPENBIT>>>
	<TOO-BAD-BUT ,PRSO "closed">)
       (T <TELL "There's nothing behind" him ,PRSO ,PAUSES>)>>

<ROUTINE V-LOOK-DOWN ()
 <COND (<==? ,PRSO ,ROOMS>
	<PERFORM ,V?EXAMINE ,FLOOR>
	<RTRUE>)
       (T
	<PERFORM ,V?LOOK-INSIDE ,PRSO>
	<RTRUE>)>>

<ROUTINE PRE-LOOK-INSIDE () <ROOM-CHECK>>

<ROUTINE V-LOOK-INSIDE ("OPTIONAL" (DIR ,P?IN) "AUX" RM)
	 <COND (<DOBJ? ROOMS>
		<COND (<==? .DIR ,P?OUT>
		       <COND (<GLOBAL-IN? ,WINDOW ,HERE>
			      <PERFORM ,PRSA ,WINDOW ,PRSI>
			      <RTRUE>)>)
		      (T
		       <COND (<OR <FSET? <SET RM ,P-IT-OBJECT> ,CONTBIT>
				  <SET RM <FIND-FLAG-LG ,HERE ,CONTBIT>>
				  <GLOBAL-IN? <SET RM ,WINDOW> ,HERE>
				  <SET RM <FIND-FLAG-LG ,HERE ,DOORBIT>>>
			      ;<TELL-I-ASSUME .RM>
			      <PERFORM ,PRSA .RM ,PRSI>
			      <RTRUE>)>)>)>
	 <COND (<DOBJ? GLOBAL-HERE>
		<PERFORM ,V?LOOK>
		<RTRUE>)
	       (<AND <IN? ,PRSO ,ROOMS>	;<FSET? ,PRSO ,RLANDBIT>
		     <NOT <NOUN-USED? ,PRSO ,W?DOOR ,W?HATCHWAY ,W?PORTAL>>
		     <OR <GLOBAL-IN? ,PRSO ,HERE>
			 <SEE-INTO? ,PRSO <>>
			 ;<VISIBLE? ,PRSO>>>
		<ROOM-PEEK ,PRSO>)
	       ;(<V-LOOK-THROUGH T> <RTRUE>) ;"SWG swapped this & next 5/21/86"
	       (<AND <OR <FSET? ,PRSO ,CONTBIT>
		    	     <FSET? ,PRSO ,SURFACEBIT>>
                 <NOT <FSET? ,PRSO ,PERSONBIT>>>
		<COND (<AND <VISIBLE? ,PRSO>
                    <NOT <SEE-INSIDE? ,PRSO ;T>>>
			   ;<COND (<AND <NOT <FSET? ,GOWN ,OPENBIT>>
						   <EQUAL? ,PRSO ,GOWN>
						   <NOT <FSET? ,GOWN ,WORNBIT>>>
			  		  <TELL "It's hard to open or close the pocket unless you're wearing the gown." CR>
					  <FUCKING-CLEAR>
					  <RFALSE>)>
		       <FIRST-YOU "opening" ,PRSO>)
			   (ELSE
			   	<PRINT-CONT ,PRSO <> 0 <> T> ;<OPEN-ANYTHING ,PRSO T>)>
		;<COND (
		       <RTRUE>)
		      (<FSET? ,PRSO ,SURFACEBIT>
		       <TELL "There's nothing on" him ,PRSO>
		       <COND (<IN? ,PLAYER ,PRSO>
			      ;<EQUAL? ,PLAYER-SEATED ,PRSO <- 0 ,PRSO>>
			      <TELL " except you">)>
		       <TELL ,PAUSES>)
		      (T <TELL "Unfotunately, there's nothing inside." CR>
			  ;<TOO-BAD-BUT ,PRSO "empty">)>)
	       (<==? .DIR ,P?IN> <YOU-CANT "look inside">)
	       (T ;<==? .DIR ,P?OUT> <YOU-CANT "look outside">)>>

<ROUTINE FIRST-YOU (STR "OPTIONAL" (OBJ 0) (OBJ2 0) (LOOK-IN? <>))
	<COND (<AND <=? .STR "opening">
		        <EQUAL? .OBJ ,GOWN>
		        <NOT <FSET? ,GOWN ,WORNBIT>>>
		   <TELL "It's hard to open or close the pocket unless you're wearing the gown." CR>
		   <FUCKING-CLEAR>
		   <RTRUE>)
	(ELSE
		<TELL "(" .STR !\ >
		;<HE-SHE-IT ,WINNER 1 .STR>
		<COND (<T? .OBJ>
			;<TELL the ;him .OBJ>
			<THE-J .OBJ T>
			<COND (<T? .OBJ2>
                <TELL !\ >
				<COND (<EQUAL? .STR "swiping">
					   <TELL "against">)
					  (ELSE
					   <TELL "from">)>
                <TELL !\ >
				<THE-J .OBJ2 T>)>
			<TELL !\ >)>
		<TELL "first)" CR>
		;<COND (<=? .STR "taking and opening">
			   <PERFORM ,V?TAKE .OBJ>
			   <FSET .OBJ ,OPENBIT>
			   <PRINT-CONT .OBJ ;"<> 0 T">)>
		<COND (<AND <=? .STR "opening">
                    <NOT <EQUAL? .OBJ ,NOTES>>>
               <FSET .OBJ ,OPENBIT>
               %<DEBUG-CODE <COND (<T? ,P-DBUG>
                                   <BOLDEN "|[DEBUG: I opened the thing! Report this if you think it's a bug!]|">)>>
			   <PRINT-CONT .OBJ>
			   ;<COND (.LOOK-IN?
					<TELL "You look inside" him ,PRSO ,PAUSES>)>)>)>>

<ROUTINE OPEN-ANYTHING (OBJ OPEN? "OPT" (LEVEL 0) (SEARCHING <>) "AUX" WHER)
	<COND (<OR <EQUAL? .OBJ ,CUPBOARD ,PLATE>
               <AND <NOT <FIRST? .OBJ>>
                    <NOT <FSET? .OBJ ,CONTBIT>>
                    <NOT <FSET? .OBJ ,SURFACEBIT>>>>
		   <RFALSE>)>
    %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|TEST 4|">)>>
	<PRINT-CONT .OBJ <> .LEVEL .OPEN? .SEARCHING>>

<ROUTINE V-LOOK-THROUGH ("OPTIONAL" (INSIDE <>) "AUX" RM)
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<OR <FSET? ,PRSO ,OPENBIT>
			   <FSET? ,PRSO ,TRANSBIT>
			   ;<NOUN-USED? ,PRSO ,W?KEYHOLE>>
		       <COND (<SET RM <DOOR-ROOM ,HERE ,PRSO>>
			      <ROOM-PEEK .RM T>)
			     (T <NO-BEYOND>)>)
		      ;(<ZMEMQ ,PRSO ,CHAR-ROOM-TABLE>
		       <PERFORM ,PRSA ,KEYHOLE>
		       <RTRUE>)
		      (T
		       <TOO-BAD-BUT ,PRSO "closed">)>)
	       (<EQUAL? ,PRSO ,WINDOW>
		<COND ;(<SET RM <WINDOW-ROOM ,HERE ,PRSO>>
		       <ROOM-PEEK .RM T>)
		      (T <NO-BEYOND>)>)
	       (<FSET? ,PRSO ,PERSONBIT>
		<TELL "You forgot to bring your X-ray glasses." CR>)
	       (.INSIDE <RFALSE>)
	       (<FSET? ,PRSO ,TRANSBIT>
		<TELL "Everything looks bigger." CR>)
	       (T <YOU-CANT "look through">)>>

<ROUTINE NO-BEYOND () <TELL ,NOPE "tell what's beyond" him ,PRSO ,PAUSES>>

<ROUTINE ROOM-PEEK (RM "OPTIONAL" (SAFE <>) "AUX" (X <>) OHERE OLIT TXT)
	 <COND (<EQUAL? .RM ,HERE>
		<V-LOOK>
		<RTRUE>)
	       (<OR .SAFE <SEE-INTO? .RM>>
		<SET OHERE ,HERE>
		<SET OLIT ,LIT>
		<SETG HERE .RM>
		<MAKE-ALL-PEOPLE -12 ;"listening to you">
		<SETG LIT <LIT? ;,HERE>>
		<TELL "You peer ">
		<COND (<FSET? .RM ,SURFACEBIT> <TELL "at">) (T <TELL "into">)>
		<TELL him .RM !\: CR>
		<COND (<DESCRIBE-OBJECTS ;T> <SET X T>)
		      (<SET TXT <GETP .RM ,P?LDESC>>
		       <SET X T>
		       <TELL .TXT CR>)>
		;<COND (<CORRIDOR-LOOK> <SET X T>)>
		<COND (<ZERO? .X>
		       <TELL ,NOPE "see anything suspicious." CR>)>
		<SETG HERE .OHERE>
		<SETG LIT .OLIT>
		<RTRUE>)>>

<ROUTINE SEE-INTO? (THERE "OPTIONAL" (TELL? T) (IGNORE-DOOR <>)"AUX" P L TBL O)
 ;<COND (<CORRIDOR-LOOK .THERE>
	<RTRUE>)>
 <SET P 0>
 <REPEAT ()
	 <COND (<OR <0? <SET P <NEXTP ,HERE .P>>>
		    <L? .P ,LOW-DIRECTION>>
		<COND (.TELL? <TELL-CANT-FIND>)>
		<RFALSE>)>
	 <SET TBL <GETPT ,HERE .P>>
	 <SET L <PTSIZE .TBL>>
	 <COND (<==? .L ,UEXIT>
		<COND (<==? <GET/B .TBL ,REXIT> .THERE>
		       <RTRUE>)>)
	       (<==? .L ,DEXIT>
		<COND (<==? <GET/B .TBL ,REXIT> .THERE>
		       <COND (<FSET? <GET/B .TBL ,DEXITOBJ> ,OPENBIT>
			      <RTRUE>)
			     (<WALK-THRU-DOOR? .TBL <GET/B .TBL ,DEXITOBJ> <>
								       ;.TELL?>
			      <RTRUE>)
			     (<T? .IGNORE-DOOR>
			      <RTRUE>)
			     (T
			      <COND (.TELL?
				     <SETG CLOCK-WAIT T>
				     <TELL
"The door to that room is closed." CR>)>
			      <RFALSE ;RTRUE>)>)>)
	       (<==? .L ,CEXIT>
		<COND (<==? <GET/B .TBL ,REXIT> .THERE>
		       <COND (<VALUE <GETB .TBL ,CEXITFLAG>>
			      <RTRUE>)
			     (T
			      <COND (.TELL? <TELL-CANT-FIND>)>
			      <RFALSE>)>)>)>>>

<ROUTINE TELL-CANT-FIND ()
	<SETG CLOCK-WAIT T>
	<TELL "That place isn't close enough."
	      ;,NOPE ;"seem to find that room." CR>>

<ROUTINE V-LOOK-ON ()
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<V-LOOK-INSIDE>)
	       (T <TELL "There's no good surface on" him ,PRSO ,PAUSES>)>>

<ROUTINE V-LOOK-OUTSIDE () <V-LOOK-INSIDE ,P?OUT>>

<ROUTINE PRE-LOOK-UNDER () <ROOM-CHECK>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<DOBJ? EYES HANDS HEAD EARS TEETH>
		<WONT-HELP>)
	       (<HELD? ,PRSO>
		<TELL "You're ">
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "wear">)
		      (T <TELL "hold">)>
		<TELL "ing "><THE-J ,PRSO T><TELL "!" CR>)
	       (<FSET? ,PRSO ,PERSONBIT>
		<TELL "Nope. Nothing hiding under" him ,PRSO ,PAUSES>)
	       (<EQUAL? <LOC ,PRSO> ,HERE ,LOCAL-GLOBALS ;,GLOBAL-OBJECTS>
		<TELL "There's nothing there but dust." CR>)
	       (T
		<TELL "That's not a bit useful." CR>)>>

<ROUTINE V-LOOK-UP ("AUX" HR)
	 <COND (<T? ,PRSI>
		<TELL
"There's no information in "><THE-J ,PRSI T><TELL " about "><THE-J ,PRSO T><TELL ,PAUSES>)
	       (<DOBJ? ROOMS>
		<COND (<OUTSIDE? ,HERE>
		       <PERFORM ,V?EXAMINE ,SKY>
		       <RTRUE>)
		      (T
		       <TELL
"The ceiling is decorated with swirly lines and patterns.">
		       <CRLF>)>)
	       (T <YOU-CANT "look up">)>>

<ROUTINE PRE-MOVE ()
	 <COND (<AND <HELD? ,PRSO>
	 			 <NOT <EQUAL? ,PRSO ,BLUE-FROB>>>
		<TELL "Juggling isn't one of your talents." CR>)>>

<ROUTINE V-MOVE ()
	 <COND (<FSET? ,PRSO ,TAKEBIT>
			<TELL "Moving" him ,PRSO " reveals nothing." CR>)
	       (T 
			<COND (<EQUAL? ,PRSO ,UP ,DOWN ,INTDIR
						   ,P?UP ,P?DOWN ,P?NORTH ,P?SOUTH ,P?EAST ,P?WEST ,P?NW ,P?NE ,P?SW ,P?SE>
                   <COND (<DOBJ? UP>
                          <SETG ,PRSO ,P?UP>)
                         (<DOBJ? DOWN>
                          <SETG ,PRSO ,P?DOWN>)>
				   <DO-WALK ,PRSO>)
				  (ELSE
				   <YOU-CANT "move">)>)>>

<ROUTINE PRE-MOVE-DIR ()
 <COND (<NOT <IOBJ? INTDIR UP DOWN>>
	<DONT-UNDERSTAND>
	<RTRUE>)>>

<ROUTINE V-MOVE-DIR ()
	<TELL
,NOPE "move" him ,PRSO " in any particular " D ,INTDIR ,PAUSES>>

<ROUTINE V-MUNG ()
	 <COND (<AND <FSET? ,PRSO ,DOORBIT> <ZERO? ,PRSI>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL
"You'd fly through the open door if you tried." CR>)
		      (<AND <NOT <FSET? ,PRSO ,MUNGBIT>>
                    <NOT <FSET? ,PRSO ,LOCKED>>>
		       <TELL "Why don't you just open it instead?" CR>)
		      (T <IF-SPY>)>)
	       (<NOT <FSET? ,PRSO ,PERSONBIT>>
		<IF-SPY>)
	       (T <IKILL "hurt">)>>

;<ROUTINE V-MY-NAME ()
    <COND (<NOT <EQUAL? ,PRSO ,PLAIN-NAME ,YOUR-NAME <>>>
           <TELL "Your "><ITALICIZE "what"><TELL !\? CR>
           <FUCKING-CLEAR>)>
	<COND (<OR <AND <EQUAL? ,PRSI ,PLAYER>
                    ;<VERB-WORD? ,W?MY>>
               <EQUAL? ,PRSO ,PLAYER>>
           <TELL "Pleased to meet you. I'm your computer." CR>)
          (<OR <AND <EQUAL? ,PRSI ,PLAIN-NAME ,YOUR-NAME>
                    ;<VERB-WORD? ,W?MY>>
               <EQUAL? ,PRSI ,PLAIN-NAME ,YOUR-NAME>>
           <TELL "Your logic is astounding." CR>)
          (ELSE
           <TELL "I'm pretty sure you aren't called that." CR>)>>

<ROUTINE V-NOD ()
 <COND (<OR <NOT <DOBJ? ROOMS>>
 			<NOT <DOBJ? HEAD>>>
	<YOU-CANT>)
       (<T? ,AWAITING-REPLY>
	<PERFORM ,V?YES>
	<RTRUE>)
       (T
	<PERFORM ,V?HELLO ,ROOMS>
	<RTRUE>)>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<NOT <OR <FSET? ,PRSO ,CONTBIT>
			 <FSET? ,PRSO ,DOORBIT>
			 <EQUAL? ,PRSO ,WINDOW>>>
		<IMPOSSIBLE> ;<YOU-CANT ;"open">)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <EQUAL? ,PRSO ,WINDOW>
		    <NOT <==? <GETP ,PRSO ,P?CAPACITY> 0>>>
		<COND (<FSET? ,PRSO ,LOCKED>
		       <COND ;(<UNLOCK-DOOR? ,PRSO>
			      <FCLEAR ,PRSO ,LOCKED>
			      <FIRST-YOU "unlocking" ,PRSO>)
			     (T <TOO-BAD-BUT ,PRSO "locked"> <RTRUE>)>)>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <ALREADY ,PRSO "open">)
		      (T
			  	<COND (<AND <EQUAL? ,PRSO ,GOWN> <NOT <FSET? ,GOWN ,WORNBIT>>>
                	   <TELL "It's hard to open or close the pocket unless you're wearing the gown." CR>
					   <FUCKING-CLEAR>
					   <RFALSE>)
            (ELSE
		       <FSET ,PRSO ,OPENBIT>
		       <COND (<OR <FSET? ,PRSO ,DOORBIT>
				  <EQUAL? ,PRSO ,WINDOW>
				  <NOT <FIRST? ,PRSO>>
				  <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Opened." CR>)
			     (<AND <SET F <FIRST? ,PRSO>>
				   <NOT <NEXT? .F>>
				   ;<SET STR <GETP .F ,P?FDESC>>>
			      <TELL "Opened." CR>
			      ;<TELL .STR CR>)
			     (T <OPEN-ANYTHING ,PRSO T>)>)>)>)
	       (T <YOU-CANT ;"open">)>>

"original INVENTORY stuff done by Andy Galilee"

;<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (V? <>) (LEVEL 0) (OPENING? <>) (WHICH-INV <>)
		     		 "AUX" Y (1ST? T) (AV <>) STR (PV? <>) (INV? <>) (SC <>)
			 	   		   (PY <>))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>>                             ;"If there's nothing inside, then meh."
		<RTRUE>)>
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<SET AV <LOC ,WINNER>>)>
	 <COND (<EQUAL? ,PLAYER .OBJ <LOC .OBJ>
	 							 <LOC <LOC .OBJ>>
								 <LOC <LOC <LOC .OBJ>>>>            ;"If the player has some relation, then good."
		<SET INV? T>)
	       (T                                                       ;"Otherwise, look through the object."
		<REPEAT ()
			<COND (<NOT .Y>                                         ;"If there's nothing inside, then meh."
				   <ROB .WHICH-INV <COND (<EQUAL? .WHICH-INV ,INV-OBJ1> ,WHERE-NOW1)
				   						 (<EQUAL? .WHICH-INV ,INV-OBJ2> ,WHERE-NOW2)
										 (ELSE                          ,WHERE-NOW3)>>
																	;"Move your stuff to the original."
				   <RETURN <NOT .1ST?>>)
			      (<EQUAL? .Y .AV>                                  ;"If you're inspecting the vehicle you're in..."
			       <SET PV? T>)
			      (<EQUAL? .Y ,WINNER>)                             ;"Repeat if it's you."
			      (<AND <SEE-INSIDE? .Y>
					   	<FIRST? .Y>>
				      ;<PRINT-CONT .Y .V? 0>
					  ;<OPEN-ANYTHING .Y <>>)>                      ;"Looking inside the object."
			;<SET PY .Y>
		    <SET Y <NEXT? .Y>>
		    ;<MOVE .PY ,INV-OBJ>>)>
	 <SET Y <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .Y>                                            ;Nothing?
			<COND (<AND .PV? .AV <FIRST? .AV>>
			       ;<PRINT-CONT .AV .V? .LEVEL>
				   <COND (<FIRST? ,INV-OBJ1>
		 				<COND (<FIRST? ,INV-OBJ2>
							   <COND (<FIRST? ,INV-OBJ3>)
							   		 (ELSE
									  <SETG WHERE-NOW3 <LOC .PY>>
							    	  <SET WHICH-INV ,INV-OBJ3>)>)
							  (ELSE
							   <SETG WHERE-NOW2 <LOC .PY>>
							   <SET WHICH-INV ,INV-OBJ2>)>)
					   (ELSE
					    <SETG WHERE-NOW1 <LOC .PY>>
					    <SET WHICH-INV ,INV-OBJ1>)>
				   <OPEN-ANYTHING .AV <> .LEVEL>)>
			<ROB .WHICH-INV <COND (<EQUAL? .WHICH-INV ,INV-OBJ1> ,WHERE-NOW1)
				   				  (<EQUAL? .WHICH-INV ,INV-OBJ2> ,WHERE-NOW2)
								  (ELSE                          ,WHERE-NOW3)>>
			<RETURN <NOT .1ST?>>)
		       (<EQUAL? .Y .AV ,PLAYER> ;"GTB" ;T)
		       (<AND <NOT <FSET? .Y ,INVISIBLE>> <NOT <FSET? .Y ,SECRETBIT>>
			     <OR .INV?
				 <FSET? .Y ,TOUCHBIT>
				 ;<NOT <GETP .Y ,P?FDESC>>>>
			<COND (<NOT <FSET? .Y ,NDESCBIT>>
			       <COND (.1ST?
				      <COND (<FIRSTER .OBJ .LEVEL <NOT .INV?> .OPENING?>
					     <COND (<L? .LEVEL 0>
						    <SET LEVEL 0>)>)>
				      <SET LEVEL <+ .LEVEL 1>>
				      <SET 1ST? <>>)>
			       <DESCRIBE-OBJECT .Y .V? .LEVEL>)
			      (<AND ;<FIRST? .Y>
				    <SEE-INSIDE? .Y>>
			       ;<PRINT-CONT .Y .V? <+ .LEVEL 1>>
				   <COND (<FIRST? ,INV-OBJ1>
		 				<COND (<FIRST? ,INV-OBJ2>
							   <COND (<FIRST? ,INV-OBJ3>)
							   		 (ELSE
									  <SETG WHERE-NOW3 <LOC .PY>>
							    	  <SET WHICH-INV ,INV-OBJ3>)>)
							  (ELSE
							   <SETG WHERE-NOW2 <LOC .PY>>
							   <SET WHICH-INV ,INV-OBJ2>)>)
					   (ELSE
					    <SETG WHERE-NOW1 <LOC .PY>>
					    <SET WHICH-INV ,INV-OBJ1>)>
				   <OPEN-ANYTHING .Y <> <+ .LEVEL 1>>)>)>
		 <SET PY .Y>
		 <SET Y <NEXT? .PY>>
		 ;<COND (<FIRST? ,INV-OBJ1>
		 		<COND (<FIRST? ,INV-OBJ2>
					   <COND (<FIRST? ,INV-OBJ3>)
					   		 (ELSE
							  <SETG WHERE-NOW3 <LOC .PY>>
					    	  <SET WHICH-INV ,INV-OBJ3>)>)
					  (ELSE
					   <SETG WHERE-NOW2 <LOC .PY>>
					   <SET WHICH-INV ,INV-OBJ2>)>)
			   (ELSE
			    <SETG WHERE-NOW1 <LOC .PY>>
			    <SET WHICH-INV ,INV-OBJ1>)>
		 <COND (<EQUAL? ,PLAYER .PY
		 						<LOC .PY>
		 						<LOC <LOC .PY>>
								<LOC <LOC <LOC .PY>>>>
		 		<MOVE .PY .WHICH-INV>)
			   (ELSE
			    ;<MOVE .PY <LOC .PY>>
				<>)>>
	 <COND (,WHERE-NOW1
	 		<ROB ,INV-OBJ1 ,WHERE-NOW1>)>
	 <COND (,WHERE-NOW2
	 		<ROB ,INV-OBJ2 ,WHERE-NOW2>)>
	 <COND (,WHERE-NOW3
	 		<ROB ,INV-OBJ3 ,WHERE-NOW3>)>>

<ROUTINE PRINT-CONTENTS (OBJ "AUX" F N (1ST? T) (IT? <>) (TWO? <>))
	 <COND (<AND <SET F <FIRST? .OBJ>>
                 <OR <NOT <EQUAL? .F ,PLAYER>>
                     <SET F <NEXT? .F>>>>
		<REPEAT ()
			<SET N <NEXT? .F>>
            <COND (<NOT <EQUAL? .F ,PLAYER>>
			       <COND (.1ST?
			              <SET 1ST? <>>)
			             (T
			              <TELL ",">
			              <COND (<NOT .N>
			       	             <TELL " and">)>)>
                   <TELL !\ >
			       <DESCRIBE-OBJECT .F <> -1>
			       <COND (<AND <NOT .IT?>
			       	           <NOT .TWO?>>
			              <SET IT? .F>)
			             (T
			              <SET TWO? T>
			              <SET IT? <>>)>)>
			<SET F .N>
			<COND (<AND <NOT .F>
                        <NOT <EQUAL? .IT? ,PLAYER>>>
			       ;<COND (<AND .IT? <NOT .TWO?>>
				      <SETG P-IT-OBJECT .IT?>)>
                   <THIS-IS-IT .IT?>
			       <RTRUE>)>>)
           (ELSE
            <TELL " nothing">)>>


<ROUTINE PRINT-CONT (OBJ "OPT" (V? <>) (LEVEL 0) (OPENING? <>) (SEARCHING <>)
						 "AUX" Y (1ST? T) (AV <>) STR (PV? <>)
						 	   OY BLEH (INV? <>))
	<COND (<AND <NOT <SEE-INSIDE? .OBJ>>>
           <RTRUE>)
          (<EQUAL? .OBJ ,REMOTE-CONTROL>
           <RTRUE>)
          (<OR <NOT <SET Y <FIRST? .OBJ>>>
               <AND <NOT <SEE-INSIDE? .OBJ>>
                    %<DEBUG-CODE <COND (<T? ,P-DBUG>
                                        <BOLDEN "|[DEBUG: It is closed, that's why. Or at least it should be.]|">)>>>>
		   <COND (<OR .OPENING?
                      .SEARCHING>
                  ;%<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|TEST 1|">)>>
                  <FIRSTER .OBJ .LEVEL T T>)>
           <RTRUE>)
		  ;(<FSET? <LOC ,WINNER> ,VEHBIT>
		   <SET AV <LOC ,WINNER>>)
		  (<EQUAL? ,PLAYER .OBJ <LOC .OBJ> <LOC <LOC .OBJ>>>
		   <SET INV? T>)>
	<REPEAT ()
       <COND (.1ST?
	      	  <COND (<FIRSTER .OBJ .LEVEL <NOT .INV?> .OPENING?>
		     		 <COND (<L? .LEVEL 0>
			    			<SET LEVEL 0>)>)>
	      	  <SET LEVEL <+ .LEVEL 1>>
	      	  <SET 1ST? <>>)>
	   <COND (<OR <FSET? .Y ,INVISIBLE>
	   			  <FSET? .Y ,SECRETBIT>>
			  <SET OY .Y>
			  <COND (<SET Y <NEXT? .OY>>
			  		 <SET BLEH T>)>
			  <CLEAR-OBJ-CONT .OY>
			  <COND (.BLEH
			  		 <SET BLEH <>>
					 <AGAIN>)
					(ELSE
					 <RETURN>)>)>
       <COND (<NOT <EQUAL? .Y ,PLAYER>>
              <COND (<L? .LEVEL 0>
			    	 <SET LEVEL 0>)>
              ;%<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|TEST 2|">)>>
              <DESCRIBE-OBJECT .Y .V? .LEVEL>
              <COND (<SEE-INSIDE? .Y>
	          		 <PRINT-CONT .Y <> .LEVEL .OPENING?>)>)>
	   <SET OY .Y>
	   <COND (<SET Y <NEXT? .OY>>
	   	      <SET BLEH T>)>
       ;%<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|TEST 3|">)>>
	   <CLEAR-OBJ-CONT .OY>
	   <COND (.BLEH
	   	      <SET BLEH <>>
	   	      <AGAIN>)
	   	  	 (ELSE
	   	   	  <RETURN>)>>
	<COND (<1? .LEVEL>
		   <ROB ,INV-OBJ1 ,PLAYER>
		   <ROB ,INV-OBJ2 ,GOWN>
		   <ROB ,ONRAMP ,SATCHEL>
		   <ROB ,INV-OBJ4 ,THING>
           <ROB ,MICE-GUN ,CABINET>
           ;<ROB ,INV-OBJ6 ,PILL-JAR>
           ;<ROB ,INV-OBJ7 ,TELEPORTER>)>>


<ROUTINE CLEAR-OBJ-CONT (OBJ)
	<COND (<EQUAL? <LOC .OBJ> ,PLAYER>
		   <MOVE .OBJ ,INV-OBJ1>)
		  (<EQUAL? <LOC .OBJ> ,GOWN>
		   <MOVE .OBJ ,INV-OBJ2>)
		  (<EQUAL? <LOC .OBJ> ,SATCHEL>
		   <MOVE .OBJ ,ONRAMP>)
		  (<EQUAL? <LOC .OBJ> ,THING>
		   <MOVE .OBJ ,INV-OBJ4>)
          (<EQUAL? <LOC .OBJ> ,CABINET>
		   <MOVE .OBJ ,MICE-GUN>)
          ;(<EQUAL? <LOC .OBJ> ,PILL-JAR>
		   <MOVE .OBJ ,INV-OBJ6>)
          ;(<EQUAL? <LOC .OBJ> ,TELEPORTER>
		   <MOVE .OBJ ,INV-OBJ7>)>>

;"Layered inv runs. REALLY inefficient."

<OBJECT INV-OBJ1 ;"Player"
	(LOC LOCAL-GLOBALS)
	(DESC "it")
	(FLAGS NARTICLEBIT CONTBIT)>

<OBJECT INV-OBJ2 ;"Gown"
	(LOC LOCAL-GLOBALS)
	(DESC "it")
	(FLAGS NARTICLEBIT CONTBIT)>

;<OBJECT INV-OBJ3 ;"Satchel        Replaced with ONRAMP"
	(LOC LOCAL-GLOBALS)
	(DESC "it")
	(FLAGS NARTICLEBIT CONTBIT)>

<OBJECT INV-OBJ4 ;"Thing"
	(LOC LOCAL-GLOBALS)
	(DESC "it")
	(FLAGS NARTICLEBIT CONTBIT)>

;<OBJECT INV-OBJ5 ;"Cabinet        Replaced with MICE-GUN"
	(LOC LOCAL-GLOBALS)
	(DESC "it")
	(FLAGS NARTICLEBIT CONTBIT)>




<ROUTINE FIRSTER (OBJ LEVEL "OPT" SEARCHING OPENING? "AUX" F)
	<COND (<EQUAL? .OBJ ,PLAYER>
		<TELL "You have:" CR>
		<RTRUE>)
    (<NOT <IN? .OBJ ,ROOMS>>
        <COND (<NOT .SEARCHING>
            <TELL ;CR <GET ,INDENTS .LEVEL>>)>
        <SET F <FIRST? .OBJ>>
        <COND (<EQUAL? .OBJ ,CABINET>
               <TELL "Of the more interesting things in the cabinet, you can see:" CR>
               <RTRUE>)
              (<NOT .F>
            <COND (<FSET? .OBJ ,SURFACEBIT>
                <TELL "There is nothing on "><THE-J .OBJ T><TELL ,PAUSES>)
            (<FSET? .OBJ ,PERSONBIT>
                <TELL He+verb .OBJ "is" " holding nothing.">)
            (T
				<COND  (.OPENING?
						<TELL "There is nothing inside of "><THE-J .OBJ T><TELL ,PAUSES>
						<FSET .OBJ ,OPENBIT>)
                	   (ELSE
						<TELL He+verb .OBJ "contain" " nothing." CR>)>)>
            <RFALSE>)>
            <COND (<FSET? .OBJ ,SURFACEBIT>
                <TELL "Sitting on "><THE-J .OBJ T><TELL " is:" CR>)
            (<FSET? .OBJ ,PERSONBIT>
                <TELL ,IT-LOOKS-LIKE><THE-J .OBJ T><TELL verb .OBJ "is" " holding: " CR>)
            (T
				<COND  (.OPENING?
						<TELL "You open "><THE-J .OBJ T><TELL " and see:" CR>
						<FSET .OBJ ,OPENBIT>)
                	   (ELSE
                        <PUTP ,THING ,P?SDESC "Thing">
						<TELL ,IT-LOOKS-LIKE><THE-J .OBJ T><TELL verb .OBJ "contain" !\: CR>
                        <PUTP ,THING ,P?SDESC "thing your aunt gave you which you don't know what it is">)>)>)>>

<ROUTINE DESCRIBE-OBJECT (OBJ V? LEVEL "OPT" SHUSH "AUX" (STR <>) AV (BACK? <>))
	 <COND (<AND <EQUAL? .LEVEL 0>
		     	 <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
			<RTRUE>)
	       ;(<EQUAL? .OBJ ,SPOUT-PLACED>
		    <RTRUE>)
	       (<AND <EQUAL? .LEVEL 0>
		         <OR <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
			              <SET STR <GETP .OBJ ,P?FDESC>>>
			     	 <SET STR <GETP .OBJ ,P?LDESC>>>>
		    <TELL .STR>)
	       (<AND <EQUAL? .LEVEL 0>>
		    <TELL "There is "><THE-J .OBJ <>><TELL " here.">)
	       (T
            <COND (.SHUSH
                   <RTRUE>)>
            <COND (<NOT <EQUAL? .LEVEL -1>>
               <TELL <GET ,INDENTS .LEVEL>>)>
		    <THE-J .OBJ <>>
		    <COND (<FSET? .OBJ ,WORNBIT>
		    	   <COND (<EQUAL? .OBJ ,BABEL-FISH>
		    	   		  <TELL " (in your ear">)
		    	   		 (ELSE
		    			  <TELL " (being worn">)>
		    	   <SET BACK? T>)>
		    <COND (<AND <FSET? .OBJ ,OPENBIT>
		    			<NOT <EQUAL? .OBJ ,THING ,RADIO ,BLASTER ,RED-DYE ,PLATE ,WINE-GLASS ,RUM-GLASS>>>
		    	   <COND (<FSET? .OBJ ,WORNBIT>
		    	   		  <TELL " and ">)
		    			 (ELSE
		    			  <TELL " (">)>
		    	   <TELL "open">
		    	   <SET BACK? T>)>)>
	 <COND (.BACK?
	 	    <TELL ")">)>
	 <COND (<AND <EQUAL? .OBJ ,PLANT>
	 			,PLUG-POINT>
	 	    <TELL " (plugged into the radio)">)
	 	   (<AND <EQUAL? .OBJ ,RADIO>
	 	  		 <EQUAL? <GETP ,RADIO ,P?SDESC> "radio">>
	 	    <TELL " (">
	 	    <COND (<FSET? ,RADIO ,BADRADIOBIT>
	 	    	   <TELL "playing static">)
	 	    	  (,PLUG-POINT
	 	    	   <TELL "playing a sad tune">)
	 		 	  (ELSE
	 		 	   <TELL "playing a happy tune">)>
	 	    <TELL ")">)>
	 <COND (<AND <0? .LEVEL>
		         ;<SET AV <LOC ,PLAYER>>
		         <OR <AND <FSET? <LOC ,PLAYER> ,VEHBIT>
                          <SET AV <LOC ,PLAYER>>>
                     <FSET? ,ESCAPE-POD ,SADRADIOBIT>>>
		    <TELL " (outside "><THE-J <COND (.AV .AV) (T ,ESCAPE-POD)> T><TELL !\)>)>
	 <COND (<NOT <EQUAL? .LEVEL -1>> <CRLF>)>
	 ;<COND (<AND <SEE-INSIDE? .OBJ>
                 <NOT <EQUAL? .LEVEL -1>>
                 <FIRST? .OBJ>>
            <COND (<EQUAL? .LEVEL -1>
                   <SET LEVEL 0>)>
		    <OPEN-ANYTHING .OBJ <> .LEVEL>)>>

<ROUTINE TOUCHING? ()
	 <OR <VERB? AIM ATTACK BRUSH BOARD CLOSE OPEN TAKE WEAR MUNG KILL DISEMBARK
	 			FIX THROUGH CLIMB-ON UNPLUG GIVE HIDE HOLD-UP KISS MOVE PUSH SLAP
				LIE LAMP-ON LAMP-OFF PUT PUT-IN MOVE-DIR PUT-UNDER DROP PLUG POUR
				SEARCH SIT THROW-THROUGH THROW THROW-AT CLIMB-DOWN EAT LICK>>>

<ROUTINE V-PANIC ()
	 <TELL "Not surprised." CR>>

;<ROUTINE V-PASS () <PERFORM ,V?WALK-TO ,PRSO> <RTRUE>>

<ROUTINE V-PLAY ()
	 <SETG CLOCK-WAIT T>
	 <TELL
"Speaking of playing, you'd enjoy some other text adventures, too!" CR>>

<GLOBAL USING-SPORFE <>>

<ROUTINE PRE-POUR-WITH ()
    %<DEBUG-CODE <COND (<T? ,P-DBUG> <BOLDEN "|RUNNING POUR 1|">)>>
    <COND (<AND <IOBJ? SPORFE>
                <DOBJ? BLASTER>
                <AND <VISIBLE? PLATE>
                     <TELL "(onto the tray">>
                <OR <HELD? ,PLATE>
                    <AND <ITAKE <> ,PLATE>
                         <TELL " after taking the tray">>>>
           <TELL !\) CR>
           %<DEBUG-CODE <COND (<T? ,P-DBUG> <BOLDEN "|RUNNING POUR 2|">)>>
           <COND (ELSE ;<HELD? ,PLATE>
                  <SETG USING-SPORFE T>
                  <PERFORM ,V?PUT ,BLASTER ,PLATE>
                  ;<INCREMENT-SCORE 15>
                  <SETG USING-SPORFE <>>
                  <RTRUE>)>)
          (ELSE
           %<DEBUG-CODE <COND (<T? ,P-DBUG> <BOLDEN "|RUNNING POUR FAIL|">)>>
           <TELL "You don't need to use "><THE-J ,PRSI T><TELL ,PAUSES>)>>

<ROUTINE V-POUR () 
    <COND (<OR ;<EQUAL? ,PRSI>
               <FIRST? ,PRSO>>
           <EMPTY-ALL ,PRSO ,HERE>)
          (<T? ,PRSI>
           <PRE-POUR-WITH>)
          (ELSE
           %<DEBUG-CODE <COND (<T? ,P-DBUG> <BOLDEN "|RUNNING POUR FLOP|">)>>
           <HAR-HAR>)>>

<ROUTINE EMPTY-ALL (FROM TO "AUX" F N R)
	 <COND (<NOT <FIRST? .FROM>>
		<THE-J .FROM T T><TELL " is empty." CR>)
	       (ELSE
		<MAP-CONTENTS (F N .FROM)
			<D-J .F><TELL !\: !\ >
			<SET R
			     <COND (.TO
				    <PERFORM ,V?PUT .F .TO>)
				   (ELSE
				    <PERFORM ,V?DROP .F>)>>
			<COND (<EQUAL? .R ,M-FATAL> <RTRUE>)>>
		<RTRUE>)>>

<ROUTINE V-PULL-TOGETHER () <DONT-UNDERSTAND>>

<ROUTINE V-PUSH () <HACK-HACK "Pushing">>

<ROUTINE YOU-MASHER ("OPT" WHOM)
    <TELL "I don't think " he+verb <OR .WHOM ,PRSO> " would appreciate that." CR>>

<ROUTINE V-PULL-APART ()
    <COND (<EQUAL? ,PRSO ,WINNER>
        <TELL "Not sure what the point is." CR>)
        (<FSET? ,PRSO ,PERSONBIT> <YOU-MASHER>)
        (ELSE <TELL "Pulling it apart won't help." CR>)>
    <RTRUE>>

<ROUTINE PRE-PLUG ()
    <COND (<AND <NOT <EQUAL? ,LOUDSPEAKER ,PRSO>>
                <NOT <IN? ,PRSO ,PLAYER>>>
           <TELL "You aren't holding "><THE-J ,PRSO T><TELL !\! CR>)
          (<AND <NOT <EQUAL? ,LOUDSPEAKER ,PRSI>>
                <NOT <IN? ,PRSI ,PLAYER>>>
           <TELL "You aren't holding "><THE-J ,PRSI T><TELL !\! CR>)>>

<ROUTINE V-PLUG ()
	<TELL ,NOPE "seem to plug "><THE-J ,PRSO T><TELL " into "><THE-J ,PRSI T><TELL ,PAUSES>>

<ROUTINE V-UNPLUG ()
    <COND (<AND <EQUAL? ,PRSO ,PLANT ,RADIO>
            <FSET? ,PLANT ,RADPLUGBIT>>
        <FCLEAR ,PLANT ,RADPLUGBIT>
        <TELL "Unplugged." CR>)
          (<AND <EQUAL? ,PRSO ,LOUDSPEAKER ,RADIO>
            <FSET? ,LOUDSPEAKER ,RADPLUGBIT>>
        <FCLEAR ,LOUDSPEAKER ,RADPLUGBIT>
        <TELL "Unplugged." CR>)
    (ELSE
        <TELL ,NOT-PLUGGED>)>>

<ROUTINE UNPLUG-HELD-STUFF (OBJECT)
	;<TELL "(unplugging"><TELL !\ ><THE-J .OBJECT T><TELL "first)" CR>
	<FIRST-YOU "unplugging" .OBJECT>
    <COND (<EQUAL? .OBJECT ,PLANT ,RADIO>
           <FCLEAR ,PLANT ,RADPLUGBIT>
		   ;<SETG PLANT-TO-RADIO <>>)>>

<ROUTINE PRE-SPUT-ON ()
	<PERFORM ,V?PUT ,PRSI ,PRSO>
	<RTRUE>>

<ROUTINE V-SPUT-ON ()
    <V-FOO>>

<ROUTINE PRINT-SPACES (CNT)
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0>
			<RETURN>)
		       (T
			<PRINTC 32>)>>>

<ROUTINE PRE-PUT ()
	 ;<COND (<WEAR-CHECK> <RTRUE>)>
	 ;<FCLEAR ,PRSO ,WORNBIT>
	 <COND (<EQUAL? ,PRSO ,PRSI>
        <TELL ,NOPE "put something on itself!" CR>
        <RTRUE>)
           (<DOBJ? HEAD HANDS>
		<WONT-HELP>
		<RTRUE>)
           (<AND <EQUAL? ,PRSI ,PLAYER>
             ;<FSET? ,PRSO ,WEARBIT>>
        <PERFORM ,V?WEAR ,PRSO>)
	       (<AND <IN? ,PRSO ,GLOBAL-OBJECTS>
		   	 <NOT <DOBJ? WHALE-CRATER-BOX CHASM WALLS FLOOR CEILING>>>
		<NOT-HERE ,PRSO>
		<RTRUE>)
	       (<IOBJ? FLOOR GLOBAL-HERE <> ;POCKET>
		<RFALSE>)
	       (<AND <IN? ,PRSI ,GLOBAL-OBJECTS>
		   	 <NOT <IOBJ? WHALE-CRATER-BOX CHASM WALLS FLOOR CEILING>>>
		<NOT-HERE ,PRSI>
		<RTRUE>)
	       (<HELD? ,PRSI ,PRSO>
        <PUTP ,THING ,P?SDESC "Thing">
		<YOU-CANT "put" ,PRSI "in it">
        <PUTP ,THING ,P?SDESC "thing your aunt gave you which you don't know what it is">)
           (<FSET? ,PRSO ,WORNBIT>
        <TELL "You'll have to remove it first." CR>
        <RTRUE>)>>

<ROUTINE V-PUT ()
	 <COND ;(<FSET? ,PRSI ,PERSONBIT>
		<SETG WINNER ,PRSI>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>
             <NOT <EQUAL? ,PRSI ,REGISTER ,CELL-PHONE>>>
		<COND (T ;<NOT <FSET? ,PRSI ,SURFACEBIT>>
		       <TELL "There's no good surface on" him ,PRSI ,PAUSES>)>
		<RTRUE>)>
	 <PUT-ON-OR-IN>>

<ROUTINE TELL-FIND-NONE (STR "OPTIONAL" (OBJ <>))
	<TELL "You search for " .STR>
	<COND (.OBJ <TELL !\ ><THE-J .OBJ T>)>
	<TELL " but find none." CR>>

<ROUTINE PRE-PUT-IN ()
 <COND ;(<EQUAL? <GET ,P-OFW 1> ,W?FRONT>
	<PERFORM ,V?DROP ,PRSO>
	<RTRUE>)
       (<EQUAL? ,PRSO ,PRSI>
    <TELL ,NOPE "put something in itself!" CR>
    <RTRUE>)
       (<IOBJ? PSEUDO-OBJECT>
	<RETURN <PRE-PUT>>)
       ;(<IOBJ? INKWELL MOONMIST>
	<YOU-SHOULDNT " in">
	<RFATAL>)
       (<FSET? ,PRSO ,PERSONBIT>
    <IMPOSSIBLE>)
       (<IOBJ? EYES HANDS>
	<WONT-HELP>
	<RFATAL>)
       (<AND <FSET? ,PRSI ,READBIT>
         <NOT <EQUAL? ,PRSI ,REGISTER ,CELL-PHONE>>>
	<WONT-HELP>
	<RFATAL>)
       (<AND <NOT <FSET? ,PRSI ,CONTBIT>>
         <NOT <EQUAL? ,PRSI ,REGISTER ,CELL-PHONE ,SPORFE>>>
	<TELL-FIND-NONE "an opening in" ,PRSI>
	<RFATAL>)
       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
         <NOT <EQUAL? ,PRSI ,REGISTER ,CELL-PHONE ,PLATE ,SPORFE ,BLUE-TUBE ,RED-TUBE ,GREEN-TUBE>>>
	<FIRST-YOU "opening" ,PRSI>
	;<TOO-BAD-BUT ,PRSI "closed">)>
 <PRE-PUT>>

<ROUTINE V-PUT-IN ()
	 <COND (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<COND (<OR <FSET? ,PRSI ,CONTBIT>
			   <FSET? ,PRSI ,DOORBIT>>
		       <TOO-BAD-BUT ,PRSI "closed">)
		      (T <TELL ,NOPE "open" him ,PRSI ,PAUSES>)>
		<RTRUE>)>
	 <PUT-ON-OR-IN>>

<ROUTINE PUT-ON-OR-IN ()
	 <COND (<ZERO? ,PRSI> <YOU-CANT ;"put">)
	       (<==? ,PRSI ,PRSO>
		<HAR-HAR>)
	       (<IN? ,PRSO ,PRSI>
		<TOO-BAD-BUT ,PRSO>
		<TELL " is already ">
			<COND (<FSET? ,PRSI ,SURFACEBIT> "on") (T "in")>
			<TELL him ,PRSI "!" CR>)
	       ;(<AND <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,OPENBIT>>>
		<TOO-BAD-BUT ,PRSI "closed">)
	       (<G? <+ <WEIGHT ,PRSI> <GETP ,PRSO ,P?SIZE>>
		    ;<- * <GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<TELL ,NOT-ENOUGH-ROOM>
		<RTRUE>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <NOT <ITAKE>>>
		<RTRUE>)
		   (<AND <EQUAL? ,PRSO ,PLANT ,RADIO>
            	 <FSET? ,PLANT ,RADPLUGBIT>>
        	<UNPLUG-HELD-STUFF ,PRSO>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<COND (<AND <FSET? ,PRSI ,PERSONBIT>
			    <FSET? ,PRSO ,WEARBIT>>
		       <FSET ,PRSO ,WORNBIT>)>
		<TELL "OK." CR>)>>

;<ROUTINE PRE-WEAR ()
	<SETG PRSI ,PRSO>
	<SETG PRSO ,PLAYER>>

"WEIGHT:  Get sum of SIZEs of supplied object," ;" recursing to the nth level."

<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<COND ;(<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? .CONT ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"worn things shouldn't count"
			      ;(<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? <LOC .CONT> ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"things in worn things shouldn't count"
			      (T
			       <SET WT <+ .WT <GETP .CONT ,P?SIZE>>>)>
			<COND (<NOT <SET CONT <NEXT? .CONT>>> <RETURN>)>>)>
	 .WT ;<+ .WT <GETP .OBJ ,P?SIZE>>>

<ROUTINE V-PUT-UNDER () <WONT-HELP>>

<ROUTINE PRE-SREAD () <PERFORM ,V?READ ,PRSI ,PRSO> <RTRUE>>
<ROUTINE V-SREAD   () <V-FOO>>

<ROUTINE PRE-READ ("AUX" VAL)
	 <COND (<AND ,KILL-NOW?
                 <NOT <RUNNING? I-MOUSE-BLAB>>>
	 		<TELL ,SUDDEN "attempt to read"><TELL !\ ><THE-J ,PRSO T>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
	 <COND ;(<ZERO? ,LIT> <TOO-DARK> <RTRUE>)
	       (<AND <IN? ,PRSO ,GLOBAL-OBJECTS>
                 <NOT <DOBJ? ;PLAIN-NAME YOUR-NAME GL-BEAST>>>
		<NOT-HERE ,PRSO>)>>

<ROUTINE V-READ ()
	 <COND (<NOT <FSET? ,PRSO ,READBIT>> <YOU-CANT "read">)
	       (ELSE <TELL <GETP ,PRSO ,P?TEXT> CR>)>>

<ROUTINE V-REFUSE ()
	 <COND (<NOT ,DONT-FLAG>
	 		<SETG PRSA ,V?TAKE>
			<DONT-F>)
		   (ELSE
			<PERFORM ,V?TAKE ,PRSO>)>>

<ROUTINE V-RELAX ()
	 <TELL ,ZEN CR>>

<ROUTINE V-REMOVE ()
	 <COND (<FSET? ,PRSO ,WORNBIT>
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-RING () <YOU-CANT>>

<ROUTINE V-RUB ()
	 <COND (<AND <FSET? ,PRSO ,PERSONBIT>
		     <NOT <FSET? ,PRSO ,MUNGBIT>>
		     <NOT <EQUAL? ,PRSO ,PLAYER>>>
		<FACE-RED>)
	       (T 
		;<COND (<IN? ,PLAYER ,DARK>
	 		<SETG PRSO ,DARK-OBJECT>
			<DARK-FUNCTION>
			<RFALSE>)>
		<HACK-HACK "Rubbing" ;"Fiddling with">)>>

<ROUTINE V-MRKUG ("AUX" VAL)
    <COND (<NOUN-USED? ,MRKUG-OBJECT ,W?MRKUG>
           <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrkug">)
          (<NOUN-USED? ,MRKUG-OBJECT ,W?MRIUG>
           <PUTP ,MRKUG-OBJECT ,P?SDESC "Mriug">)
          (<NOUN-USED? ,MRKUG-OBJECT ,W?MRIVG>
           <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrivg">)
          (<NOT ,PRSO>
           ;<SET VAL ;"<VERB-ONE" <WORD-VERB-STUFF ,P-PRSA-WORD>;">">
           <COND (<VERB-WORD? ,W?MRIUG> ;<EQUAL? .VAL ,W?MRIUG>
                  <PUTP ,MRKUG-OBJECT ,P?SDESC "Mriug">)
                 (<VERB-WORD? ,W?MRIVG> ;<EQUAL? .VAL ,W?MRIVG>
                  <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrivg">)
                 (ELSE
                  <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrkug">)>)>
    <TELL "You say \"" ;<RESTORE-INPUT ,MRKUG-BUFFER>><D-J ,MRKUG-OBJECT><TELL "\", ">
    <COND (<AND <FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                <NOT <FSET? ,TELEPAD ,SEENBIT>>>
           <TELL "a word which you could not have known, since you
had never reached the end of the Fjords created by " D ,SLARTY " -
so you could not have seen the full carving "><NOTES 10><TELL ,PAUSES
CR "One God, noticing this, becomes so enraged at your incapability
and (more importanly to it) your ability to act on that incapability,
and refuses to exist - explaining that you could not have known the
word \"Mrkug\" if it had existed - as it would be impossible." CR CR>
           <JIGS-UP "After a long and totally random argument with
itself, the God decides that it cannot be bothered to rule such a
Universe if people like you are living in it (not that it was really
ruling the Universe; this God didn't even create it - this was just
a higher tier god). Its cultists drive it to destroy itself, bringing
down the part of the galaxy that you are in along with it. This kills
789 billion people, including you.">)
          (<AND <FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
                <NOT <IN? ,PLAYER ,TELEPAD>>>
           <JIGS-UP
"and all the molecules in your body are wrenched apart. When it comes
the part where the molcules are meant to be moved to another location,
they fail to find a transference beam, reluctantly return to the same
shape they were in before but fail to find that as well, as they had
drifted too far apart; and the story ends without any memory of death.
But still..." <> T>)
          (<IN? ,PLAYER ,TELEPAD>
           <TELL
"and every molecule is wrenched apart from each other
as you begin to remember what matter transference is
actually like. The cold doesn't help, either.">
           <INCREMENT-SCORE 25 T>
           <SETG DARK-FLAG ,PDW>
           <SETG PDW-PROB 0>
           <SETG IMMOVABLE T>
           <GO-TO-DARK>)
          ;(<AND <EQUAL? ,HERE ,PDW>
                <FSET? ,GLACIER-1 ,SADRADIOBIT>>
           <COND (<IN? ,RED-FROB ,DARK-OBJECT>
                  <TELL
"and " D ,SLARTY " says, \"Yes! That's it!\" and with that, the computer
explodes, leaving no trace of a burn mark or the computer itself, and
only the red frob of philosophy." CR>
                  <REMOVE ,COMPUTER>
                  <MOVE ,RED-FROB ,HERE>
                  <PUTP ,RED-FROB ,P?SDESC "red frob of philosophy">)>)
          (ELSE
           <TELL "but nothing happens." CR>)>>

<ROUTINE V-SAY ("AUX" P X)
    %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: running V-SAY]|">)>>
    <COND (<AND <NOT ,PRSI>
                <OR <QCONTEXT-GOOD?>
                    <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,WINNER>>>
                <NOT <DOBJ? MRKUG-OBJECT YES-OBJECT NO-OBJECT HELLO-OBJECT INTQUOTE>>>
	       %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-SAY, qcontext to V-TELL]|">)>>
           <PERFORM ,V?TELL <OR .P ,QCONTEXT>>
	       <RTRUE>)>
    <COND (<OR <DOBJ? NO-OBJECT>
               <AND <EQUAL? ,PRSO ,INTDIR ,P?NORTH>
                    <NOUN-USED? ,PRSO ,W?N>>>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-SAY, acting out V-NO]|">)>>
           <PERFORM ,V?NO ,PRSI>
           <RTRUE>)
          (<DOBJ? YES-OBJECT>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-SAY, acting out V-YES]|">)>>
           <PERFORM ,V?YES ,PRSI>
           <RTRUE>)
          (<DOBJ? MRKUG-OBJECT>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-SAY, acting out V-MRKUG]|">)>>
           <PERFORM ,V?MRKUG>
           <RTRUE>)
          (<DOBJ? HELLO-OBJECT>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-SAY, acting out V-HELLO]|">)>>
           <PERFORM ,V?HELLO ,PRSI>
           <RTRUE>)
          (<AND <FSET? ,PRSO ,PERSONBIT>
                <NOT <FSET? ,PRSO ,MUNGBIT>>>
           <PERFORM ,V?TELL ,PRSO>)
          (ELSE
	   	   <SETG QCONTEXT <>>
	   	   <TELL "You say that, but nothing happens." CR>)>>

<ROUTINE PRE-SEARCH () <ROOM-CHECK>>

<ROUTINE V-SEARCH ("AUX" OBJ)
	 <COND (<IN? ,PRSO ,ROOMS>
		    <PERFORM ,PRSA ,GLOBAL-HERE>
		    <RTRUE>
		    ;<START-SEARCH>)
           (<EQUAL? ,PRSO ,PLAYER>
            <PERFORM ,V?INVENTORY>)
	       (<AND <FSET? ,PRSO ,PERSONBIT>
                 <FSET? ,PRSO ,MUNGBIT>
		         <SET OBJ <FIRST? ,PRSO>>>
		    <FSET .OBJ ,TAKEBIT>
		    <FCLEAR .OBJ ,NDESCBIT>
		    <FCLEAR .OBJ ,WORNBIT>
		    <FCLEAR .OBJ ,SECRETBIT>
		    <THIS-IS-IT .OBJ>
		    <MOVE .OBJ ,PLAYER>
		    ;<COND (<EQUAL? .OBJ ,MUSTACHE>
		            <SETG WENDISH-BARE T>)>
		    <TELL "You find ">
            <THE-J .OBJ <>>
            <TELL " and take it. " !\Y ,OU-STOP-SEARCHING !\.>
            <COND (<FIRST? ,PRSO>
                   <TELL !\ ,IT-LOOKS-LIKE "there might be something else, though.">)>
            <CRLF>
            <COND (<AND <IOBJ? FIRST-CLASS-IDIOT>
                        <NOT <FSET? ,FIRST-CLASS-CARD ,SADRADIOBIT>>
				        <FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>>
                   <INCREMENT-SCORE 20>
		           <FSET ,FIRST-CLASS-CARD ,SADRADIOBIT>)>)
           (<FSET? ,PRSO ,PERSONBIT>
            <PERSON-F ,PRSO>)
	       ;(<AND <SET OBJ <FIND-IN ,PRSO ,SECRETBIT>>
		          ;<FSET? .OBJ ,NDESCBIT>>
		    <DISCOVER .OBJ ,PRSO>)
	       (<FSET? ,PRSO ,DOORBIT>
		    <TELL ,NOTHING-NEW>)
	       (<OR <FSET? ,PRSO ,CONTBIT>
		        <FSET? ,PRSO ,SURFACEBIT>>
		    <PERFORM ,V?LOOK-INSIDE ,PRSO>
		    <RTRUE>)
	       (T <TELL ,NOTHING-NEW>)>>

<ROUTINE PRE-SSEARCH-FOR () <PERFORM ,V?SEARCH-FOR ,PRSI ,PRSO> <RTRUE>>
<ROUTINE   V-SSEARCH-FOR () <V-FOO>>

<ROUTINE PRE-SEARCH-FOR ("AUX" OBJ)
	 <COND (,KILL-NOW?
	 		<TELL "As you scour"><TELL !\ ><THE-J ,PRSO T>
			<TELL ", Perc" ,HEADSHOT>
			<JIGS-UP "">)>
 <COND (<ROOM-CHECK> <RTRUE>)
       ;(<AND <IN? ,PRSI ,PLAYER>
	     ;<GETP ,PRSI ,P?GENERIC>
	     <SET OBJ <APPLY <GETP ,PRSI ,P?GENERIC> ,PRSI>>>
	<SETG PRSI .OBJ>)>
 ;<COND (<DOBJ? ;GLOBAL-ROOM GLOBAL-HERE>
	<PERFORM ,PRSA ,HERE>
	<RTRUE>)>
 <RFALSE>>

<ROUTINE V-SEARCH-FOR ()
	 <COND (<IN? ,PRSO ,ROOMS>
		<PERFORM ,PRSA ,GLOBAL-HERE ,PRSI>
		<RTRUE>
		;<START-SEARCH>)
	       (<FSET? ,PRSO ,PERSONBIT>
		<COND (<IN? ,PRSI ,PRSO>
		       <TELL "Indeed," he+verb ,PRSO "has" him ,PRSI ,PAUSES>)
		      (T
		       <THE-J ,PRSO T T><TELL " doesn't have">
		       <COND (<IN? ,PRSI ,GLOBAL-OBJECTS>
			      <THE-J ,PRSI T><TELL ,PAUSES>)
			     (<ZERO? ,PRSI>
			      <TELL " that." CR>)
			     (T
				  <THE-J ,PRSI T>
			      <TELL " hidden on" his ,PRSO " person." CR>)>)>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,CONTBIT> <NOT <FSET? ,PRSO ,OPENBIT>>>
		<TELL "You'll have to open" him ,PRSO " first." CR>)
	       (<IN? ,PRSI ,PRSO>
		<COND ;(<FSET? ,PRSI ,SECRETBIT>
		       <DISCOVER ,PRSI>)
		      (T <TELL
"How observant you are! There" he+verb ,PRSI "is" "!" CR>)>)
	       (<ZERO? ,PRSI> <YOU-CANT ;"search">)
	       (T
		<TELL "You don't find">
		<COND (<FSET? ,PRSI ,SECRETBIT>
		       ;<==? <GET ,P-NAMW 1> ,W?EVIDENCE>
		       <TELL " it" ;" any evidence">)
		      (T <TELL him ,PRSI>)>
		<TELL " there." CR>)>>

<ROUTINE V-LICK ()
	<COND (<FSET? ,PRSO ,DARKBIT>
		   <V-FOO> ;"Should never get here")
		  (<FSET? ,PRSO ,EATBIT>
		   <PERFORM ,V?EAT ,PRSO>)
		  (ELSE
		   <IMPOSSIBLE>)>>

<ROUTINE V-SHAKE ("AUX" X)
	 <COND (<FSET? ,PRSO ,PERSONBIT>
		<TELL "Be real." CR>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<SETG CLOCK-WAIT T>
		<TELL ,NOPE "shake it if you can't take it!" CR>)
	       (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
		     <FIRST? ,PRSO>>
		<TELL
"It sounds as if there is something inside" him ,PRSO ,PAUSES>)
	       (<AND <FSET? ,PRSO ,OPENBIT> <SET X <FIRST? ,PRSO>>>
		<TELL "Right " <GROUND-DESC> " spill">
		<COND (<ZERO? <NEXT? .X>> <TELL !\s>)>
        <TELL !\ >
		<ROB ,PRSO ,HERE T>
	    <CRLF>)
	       (T <TELL "You hear nothing inside" him ,PRSO ,PAUSES>)>>

<ROUTINE V-SHOOT ()
 <COND (<AND <OR <ZERO? ,PRSI>
		 		 <NOT <EQUAL? <LOC ,PRSI> ,WINNER>>>
	     	 <AND <NOT <FIND-IN ,WINNER ,WEAPONBIT>>
			 	  <NOT <FSET? ,PRSI ,WEAPONBIT>>>>
		<TELL "You're not holding anything to shoot with." CR>)
	   (<AND <FSET? ,PRSO ,WEAPONBIT>
	   		 <NOT <FSET? ,PRSI ,WEAPONBIT>>>
		<PRE-SSHOOT>
		<RTRUE>)
	   (<OR <IOBJ? STUN-GUN>
	   		<AND <NOT ,PRSI>
				 <COND (<EQUAL? <SETG PRSI <FIND-IN ,WINNER ,WEAPONBIT>> ,STUN-GUN> <TELL "(using "><THE-J ,PRSI T><TELL ")" CR>)>>>
		<COND (<DOBJ? STUN-GUN>
			   <WONT-HELP>
			   <RTRUE>)
	      	  (<NOT <VISIBLE? ,PRSO>>
			   <TELL "[" ,NOPE "see that here.]" CR>)
	      	  (<HELD? ,PRSO>
			   <TELL "Not at such close range!" CR>
			   <FUCKING-CLEAR>
			   <RTRUE>)
	      	  (ELSE
			   <STUN-OBJ>)>)
       (T <IKILL "shoot">)>>

<ROUTINE PRE-SSHOOT () 
	<COND (<AND <NOT ,PRSO>
				,PRSI>
		   <COND (<AND <EQUAL? <SETG PRSO <FIND-IN ,WINNER ,WEAPONBIT>> ,STUN-GUN>>
				  <ACTUALLY ,PRSO>
				  <PERFORM ,V?SHOOT ,PRSI ,PRSO>
				  <RTRUE>)
				 (ELSE
				  <TELL "But what do you want to shoot?" CR>
				  <RTRUE>)>)
		  (ELSE
		   <PERFORM ,V?SHOOT ,PRSI ,PRSO>
		   <RTRUE>)>>

<ROUTINE V-SSHOOT () <V-FOO>>

<ROUTINE V-SHOW ()
     <COND (<NOT ,PRSI>
            <COND (<QCONTEXT-GOOD?>
                   <SETG PRSI ,QCONTEXT>)
                  (ELSE
                   <TELL "You must specify who you are showing "><THE-J ,PRSO T><TELL " to." CR>
                   <FUCKING-CLEAR>
                   <RTRUE>)>)>
	 <COND (<==? ,PRSI ,PLAYER>
		<RESET-WINNER>
		<COND (<VISIBLE? ,PRSO> <PERFORM ,V?EXAMINE ,PRSO>)
		      (T <PERFORM ,V?FIND ,PRSO>)>
		<RTRUE>)
	       (<OR <NOT <FSET? ,PRSI ,PERSONBIT>>
		    <FSET? ,PRSI ,MUNGBIT>>
		<TELL "Don't wait for" him ,PRSI " to applaud." CR>)
	       (T <WHO-CARES>)>>

<ROUTINE PRE-SSHOW ("AUX" P)
  <COND (<T? ,PRSI>
	 ;<SETG P-MERGED T>
	 <COND (<IN? ,PRSI ,ROOMS>	;"SHOW ME TO MY ROOM"
		<PERFORM ,V?TAKE-TO ,PRSO ,PRSI>
		<RTRUE>)>
	 <PERFORM ,V?SHOW ,PRSI ,PRSO>
	 <RTRUE>)
	(<NOT <HELD? ,PRSO>>
	 <COND (<FSET? <LOC ,PRSO> ,PERSONBIT>
		<PERFORM ,V?TAKE ,PRSO>)
	       (T
		;<TELL-I-ASSUME ,PRSO " Ask about">
		<PERFORM ,V?ASK-CONTEXT-ABOUT ,PRSO>)>
	 <RTRUE>)
	(<QCONTEXT-GOOD?>
	 <PERFORM ,V?SHOW ,QCONTEXT ,PRSO>
	 <RTRUE>)
	(<SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>
	 ;<TELL-I-ASSUME .P " Show">
	 <PERFORM ,V?SHOW .P ,PRSO>
	 <RTRUE>)
	(T
	 ;<TELL-I-ASSUME ,PLAYER " Show">
	 <PERFORM ,V?SHOW ,PLAYER ,PRSO>
	 <RTRUE>)>>

<ROUTINE V-SSHOW () <V-FOO>>

<ROUTINE PRE-SIT () <ROOM-CHECK>>

;<ROUTINE PRE-SSIT ()
    <COND (<EQUAL? ,PRSO ,P?DOWN ,DOWN>
           <PERFORM ,V?SIT ,PRSI>)
          (ELSE
           <DONT-UNDERSTAND>)>>

<ROUTINE V-SIT ("OPTIONAL" (LIE? <>))
 <COND (<AND <EQUAL? ,PRSO ,P?UP ,P?DOWN ,UP ,DOWN>
          <NOT <VISIBLE? ,SOFA>>>
	<TELL "No time for resting; especially not in your state." CR>
	<RTRUE>)>
 <COND (<AND <==? ,WINNER ,PLAYER>
	     <OR <FSET? ,PRSO ,VEHBIT>
		 <AND <DOBJ? GLOBAL-HERE HERE FLOOR>
		      ;<FSET? ,HERE ,SURFACEBIT>>>>
	<TELL "You're now ">
	<COND (<ZERO? .LIE?>
	       ;<SETG PLAYER-SEATED ,PRSO>
	       <TELL "sitt">)
	      (T
	       ;<SETG PLAYER-SEATED <- 0 ,PRSO>>
	       <TELL "ly">)>
	<COND (<FSET? ,PRSO ,VEHBIT>
	       <MOVE ,PLAYER ,PRSO>)>
	<TELL "ing ">
	<COND (<FSET? ,PRSO ,SURFACEBIT> <TELL "o">) (T <TELL "i">)>
    <TELL "n ">
	<THE-J ,PRSO T>
	<TELL ,PAUSES>)
       (T <WONT-HELP>)>>

<ROUTINE V-SIT-AT () <V-SIT>>

<ROUTINE V-WHERE ()
	<PERFORM ,V?FIND ,PRSO>
	<RTRUE>>

<ROUTINE V-SLAP ()
 <COND (<IOBJ? ROOMS> <SETG PRSI <>>)>
 <COND ;(<AND ,PRSI <NOT-HOLDING? ,PRSI>>
	<RTRUE>)
       (<EQUAL? ,PRSO ,PLAYER>
	<TELL
"That sounds like a sign you could wear on your back." CR>)
       (<NOT <FSET? ,PRSO ,PERSONBIT>>
	<IF-SPY>)
       (<FSET? ,PRSO ,MUNGBIT>
	<TELL
"If" he ,PRSO " could," he ,PRSO " would slap you right back." CR>)
       (T <FACE-RED>)>>

<ROUTINE IF-SPY ()
	;<COND (<NOT <FSET? ,PRSO ,PERSONBIT>> <TELL "break">)
	      (T <TELL "drop">)>
	<COND (<ZERO? ,PRSI>
	       <TELL "You give" him ,PRSO " a swift ">
	       <COND (<==? ,P-PRSA-WORD ,W?KICK>
		      <TELL "kick">)
		     (T <TELL "hand chop">)>)
	      (T <TELL "You swing" him ,PRSI " at" him ,PRSO>)>
	<TELL ", but" he ,PRSO " seems indestructible." CR>>

<ROUTINE FACE-RED ("OPTIONAL" (P 0) "AUX" X)
	<COND (<ZERO? .P> <SET P ,PRSO>)>
	<UNSNOOZE .P>
	;<SET X <GETP .P ,P?LINE>>
	;<PUTP .P ,P?LINE <+ 1 .X>>
	<COND (<EQUAL? ,FOLLOWER .P>
	       <SETG FOLLOWER <>>)>
	;<COND (<NOT <EQUAL? <GETP .P ,P?LDESC>
			    4 ;"looking at you with suspicion">>
	       ;<EQUAL? .P ,FRIEND>
	       <PUTP .P ,P?LDESC 20 ;"ignoring you">)>
	<TELL He .P>
	<COND ;(<ZERO? .X>
	       <TELL " looks at you as if you were insane." CR>)
	      (T <TELL " gives you a good slap. It hurts, too!"
		       ;" slaps you right back. Wow, is your face red!" CR>)>>

<ROUTINE V-SMELL ()
	;<COND (<IN? ,PLAYER ,DARK>
		   <SETG PRSO ,DARK-OBJECT>
		   <DARK-FUNCTION>
		   <RFALSE>)>
	<TELL He+verb ,PRSO "smell" " just like "><THE-J ,PRSO <>><TELL "!" CR>>

<ROUTINE V-SMILE () <TELL "How nice." CR>>

<ROUTINE V-SORRY ()
 <COND ;(<==? ,PRSO ,CONFESSED>
	<WONT-HELP-TO-TALK-TO ,PRSO>)
       (<NOT <GRAB-ATTENTION ,PRSO>>
	<RFATAL>)
       ;(<NOT <L? 0 <GETP ,PRSO ,P?LINE>>>
	<TELL "\"I'm not angry with" him ,WINNER " now.\"" CR>)
       (T
	;<PUTP ,PRSO ,P?LINE 0 ;<- <GETP ,PRSO ,P?LINE> 1>>
	;<COND (T ;<EQUAL? ,PRSO ,FRIEND>
	       <PUTP ,PRSO ,P?LDESC 3 ;"watching you">)>
	<PERFORM ,V?SMILE ,PRSO>)>>

<ROUTINE V-STAND ("AUX" P)
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (<AND ;<==? ,WINNER ,PLAYER>
		     <NOT <IN? ,WINNER ,HERE>>>
		<OWN-FEET>)
	       (<AND <T? ,PRSO>
		     <FSET? ,PRSO ,TAKEBIT>>
		<WONT-HELP>)
	       (T
		<ALREADY ,WINNER "standing up">)>>

<ROUTINE V-STOP ()
	<COND (<EQUAL? ,PRSO <> ,GLOBAL-HERE>
	       <TELL "Hey, no problem." CR>)
	      (<FSET? ,PRSO ,PERSONBIT>
	       <PERFORM ,V?$CALL ,PRSO>
	       <RTRUE>)
	      (T
	       <PERFORM ,V?LAMP-OFF ,PRSO>
	       <RTRUE>)>>

<ROUTINE V-SWIM ()
     <COND (<EQUAL? ,HERE ,CHANNEL1 ,CHANNEL2 ,CHANNEL3>
        <TELL "You paddle about for a bit." CR>
        <RTRUE>)>
	 <SETG CLOCK-WAIT T>
	 <TELL He ,WINNER " can't swim ">
	 <COND (<T? ,PRSO>
	    <TELL "in" him ,PRSO>)
	       (T
		<TELL <GROUND-DESC>>)>
	 <TELL ,PAUSES>>

<ROUTINE PRE-TAKE ("AUX" L)
	 <COND (<AND <EQUAL? ,PRSO ,UP ,P?UP>
             <EQUAL? ,P-PRSA-WORD ,W?PICK>>
        <TELL "Find something to pick up first." CR>
        <FUCKING-CLEAR>
        <RTRUE>)
           (<DOBJ? ;NOW-WEARING FLOOR WALLS SKY CEILING ;KEYHOLE>
		<HAR-HAR>)
	       (<DOBJ? HANDS YOU-YOU>
		<RFALSE>)
           (<AND <DOBJ? INTNUM>
             <=? ,P-NUMBER 5 10>>
        <PERFORM ,V?FAINT>)
           (<IN? ,PRSO ,WINNER>
		<ALREADY ,PLAYER>
		<TELL "holding"><TELL !\ ><THE-J ,PRSO T><TELL "!" CR>)
	       (<==? <SET L <LOC ,PRSO>> ,GLOBAL-OBJECTS>
		<NOT-HERE ,PRSO>)
	       (<EQUAL? ,PRSO <LOC ,WINNER>>
		<TELL "You are in it!" CR>)
	       (<AND .L
		     <FSET? .L ,CONTBIT>
             <NOT <FSET? .L ,PERSONBIT>>
		     <NOT <FSET? .L ,OPENBIT>>>
		<TOO-BAD-BUT .L "closed">
		<RTRUE>)
	       (<T? ,PRSI>
		<COND (<EQUAL? ,PRSI ,WALLS ;,POCKET .L>
		       <SETG PRSI <>>
		       <RFALSE>)
		      (<AND <NOT <FSET? ,PRSI ,SURFACEBIT>>
			    <NOT <FSET? ,PRSI ,OPENBIT>>
			    <NOT <FSET? ,PRSI ,PERSONBIT>>>
		       <TOO-BAD-BUT ,PRSI "closed">
		       <RTRUE>)
		      (<NOT <==? ,PRSI .L>>
		       <TELL He+verb ,PRSO "is" "n't ">
		       <COND (<AND <FSET? ,PRSI ,PERSONBIT>
				   ;<NOT <EQUAL? ,PRSI ,NUTRIMAT ,SCREENING-DOOR>>>
			      <TELL "being held by">)
			     (<FSET? ,PRSI ,SURFACEBIT>
			      <TELL "on">)
			     (T
			      <TELL "in">)>
			   <TELL !\ >
		       <THE-J ,PRSI T>
			   <TELL ,PAUSES>)>)
           (<AND .L <FSET? .L ,PERSONBIT>>
		    <COND (<AND <EQUAL? .L ,MARVIN ,MORPHER-CAPTAIN ,SLARTY>
		    	        <NOT <FSET? .L ,MUNGBIT>>>
		           <YOU-CANT "take" .L "holding it">
		           <RTRUE>)>)
	       (T <PRE-TAKE-WITH>)>>

<ROUTINE PRE-DOFF ()
	<COND (<EQUAL? ,PRSI ,ROOMS <> ,PLAYER>
		   <PERFORM ,V?REMOVE ,PRSO>
		   <RTRUE>)
		  (ELSE
		   <PERFORM ,V?TAKE ,PRSO ,PRSI>)>>

<ROUTINE PRE-APART ()
    <COND (<AND <FSET? ,PRSO ,TRYTAKEBIT>
            <NOT <IN? ,PRSO ,PLAYER>>>
        <RFALSE>)>>

<ROUTINE PRE-TAKE-WITH ("AUX" X)
	 <COND (<DOBJ? YOU-YOU>
		<RFALSE>)
	       (<EQUAL? <META-LOC ,PRSO> ,GLOBAL-OBJECTS>
		<COND (<AND <NOT <HELD? ,PRSO>>
			    <NOT <FSET? ,PRSO ,PERSONBIT>>>
		       <NOT-HERE ,PRSO>)>)
	       (<IN? ,PRSO ,PLAYER>
		<ALREADY ,PLAYER>
		<TELL "holding "><THE-J ,PRSO T><TELL "!" CR>)
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<YOU-CANT "reach">)
	       (<AND <IN? ,WINNER ,PRSO>
		     <NOT <NOUN-USED? ,PRSO ,W?DOOR ;,W?KEYHOLE>>>
		<SETG CLOCK-WAIT T>
		<TELL He+verb ,WINNER "is" " in" him ,PRSO ", nitwit!" CR>)>>

<ROUTINE V-TAKE ()
 <COND (<==? <ITAKE> T>
	<COND (<EQUAL? ,WINNER ,PLAYER>
		<TELL "Taken." CR>)
	(ELSE
		<TELL He+verb ,WINNER "is" " now holding "><THE-J ,PRSO T><TELL ,PAUSES>)>)>>

<ROUTINE V-TAKE-OFF ()
	 <COND ;(<DOBJ? NOW-WEARING>
		<SETG PRSO <>>
		<V-WEAR>
		<RTRUE>)
	       ;(<WEAR-CHECK>
		<RTRUE>)
	       (<FSET? ,PRSO ,WORNBIT>
		<FCLEAR ,PRSO ,WORNBIT>
		<TELL "OK, " he+verb <LOC ,PRSO> "is" " no longer wearing">
		<MOVE ,PRSO ,WINNER>
		<TELL him ,PRSO ,PAUSES>)
	       (T
		<TELL He+verb <LOC ,PRSO> "is" "n't wearing" him ,PRSO "!" CR>)>>

<ROUTINE V-TAKE-TO ()	;"Parser should have ITAKEn PRSO."
	<PERFORM ,V?WALK-TO ,PRSI>
	<RTRUE>>

<ROUTINE V-DISEMBARK ()
	 <COND (<ROOM-CHECK>
		<RTRUE>)
	       (<DOBJ? ROOMS HERE GLOBAL-HERE <>>
		<COND (<AND <==? ,WINNER ,PLAYER>
			    <NOT <EQUAL? <LOC ,PLAYER> ,HERE>>
			    ;<T? ,PLAYER-SEATED>>
		    <OWN-FEET>)
		      (T
		    <DO-WALK ,P?OUT>
		    <RTRUE>)>)
	       ;(<DOBJ? NOW-WEARING>
		<V-TAKE-OFF>
		<RTRUE>)
	       (<==? <LOC ,PRSO> ,WINNER>
		<TELL
"You don't need to take" him ,PRSO " out to use" him ,PRSO ,PAUSES>)
	       ;(<==? <LOC ,PRSO> ,POCKET>
		<MOVE ,PRSO ,WINNER>
		<TELL He+verb ,WINNER "is" " now holding" him ,PRSO ,PAUSES>)
	       (<AND <NOT <==? <LOC ,WINNER> ,PRSO>>
		     <NOT <IN? ,PLAYER ,PRSO>>
		     ;<NOT <EQUAL? ,PLAYER-SEATED ,PRSO <- 0 ,PRSO>>>>
		<TELL "You're not ">
		<COND (<FSET? ,PRSO ,SURFACEBIT> <TELL "on">) (T <TELL "in">)>
		<TELL him ,PRSO "!" CR>
		<FUCKING-CLEAR>)
	       (T
		<OWN-FEET>)>>

<ROUTINE OWN-FEET ()
     <TELL "You step outside." CR>
	 <RETURN ,HERE>>

<ROUTINE V-HOLD-UP ()
 <COND (<DOBJ? ROOMS>
	<PERFORM ,V?STAND>
	<RTRUE>)
       (T
	<WONT-HELP>
	;<TELL "That doesn't seem to help at all." CR>)>>

<DEFAULT-DEFINITION RESET-WINNER
    <DEFMAC RESET-WINNER ()
        '<SETG WINNER ,PLAYER>>

    <DEFMAC ORDERING? ()
        '<N=? ,WINNER ,PLAYER>>>

<ROUTINE RESET-WINNER ()
	<SETG WINNER ,PLAYER>>

<ROUTINE V-TELL ("AUX" P)
     %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: running V-TELL]|">)>>
	 <COND (<OR <DOBJ? MRKUG-OBJECT YES-OBJECT NO-OBJECT HELLO-OBJECT>
                ;<EQUAL? ,HERE ,PDW>>
            %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: performing V-SAY]|">)>>
            <PERFORM ,V?SAY ,PRSO>
            <RTRUE>)
           (<==? ,PRSO ,PLAYER>
            %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-TELL, dobj=player]|">)>>
		    <COND (<ORDERING?>
		           <SET P ,WINNER>
		           <RESET-WINNER>
		           <PERFORM ,V?ASK .P>
		           <RTRUE>)
		          (T
		           <TELL "Talking to yourself is a sign of a mental collapse." CR>
		           <FUCKING-CLEAR>
                   <RTRUE>)>)
	       (<AND <FSET? ,PRSO ,PERSONBIT>
		    	 <NOT <FSET? ,PRSO ,MUNGBIT>>>
			%<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: V-TELL, talking to person]|">)>>
            ;<UNSNOOZE ,PRSO>
			<SETG QCONTEXT ,PRSO>
			<COND (<T? ,P-CONT>
				   <SETG CLOCK-WAIT T>
				   <SETG WINNER ,PRSO>
				   ;<SETG HERE <LOC ,WINNER>>
				   <RTRUE>)
				  (T
				   <TELL "Hmmm ... ">
                   <THE-J ,PRSO T>
				   <TELL
" looks at you expectantly, as if you seemed to be about to talk." CR>)>)
	       (ELSE
			<WONT-HELP-TO-TALK-TO ,PRSO>
			;<YOU-CANT "talk to">
			<FUCKING-CLEAR>)>>

<ROUTINE PRE-STELL-ABOUT () <PERFORM ,V?TELL-ABOUT ,PRSI ,PRSO> <RTRUE>>
<ROUTINE   V-STELL-ABOUT () <V-FOO>>

<ROUTINE PRE-TELL-ABOUT ("AUX" P)
 <COND (<AND <EQUAL? ,PRSO ,PLAYER ;,PLAYER-NAME>
             <NOT <ORDERING?>>>
	    <COND (<QCONTEXT-GOOD?>
	           <PERFORM ,V?ASK-ABOUT ,QCONTEXT ,PRSI>)
	          (<AND <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>>
	           ;<TELL-I-ASSUME .P " Ask">
	           <PERFORM ,V?ASK-ABOUT .P ,PRSI>)
	          (T <ARENT-TALKING>)>
	    <RESET-WINNER>
	    <RTRUE>)
       ;(<AND <NOT <FSET? ,PRSI ,SEENBIT>>
	         <NOT <FSET? ,PRSI ,TOUCHBIT>>>
	    <NOT-FOUND ,PRSI>
	    <RESET-WINNER>
	    <RTRUE>)
       (T <PRE-ASK>)>>

<ROUTINE V-TELL-ABOUT ("AUX" P)
	<TELL "It doesn't look as if "><THE-J ,PRSO T><TELL " is interested."
;"\"I'm afraid you'll have to show me instead of telling me.\"" CR>
	<RESET-WINNER>
	<RTRUE>>

<ROUTINE PRE-TALK-ABOUT ("AUX" P)
 <COND (<NOT <==? ,WINNER ,PLAYER>>
	<SET P ,WINNER>
	<RESET-WINNER>
	<PERFORM ,V?ASK-ABOUT .P ,PRSO>
	<RTRUE>)
       (<QCONTEXT-GOOD?>
	<PERFORM ,V?ASK-ABOUT ,QCONTEXT ,PRSO>
	<RTRUE>)
       (<SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>
	;<TELL-I-ASSUME .P " to">
	<PERFORM ,V?ASK-ABOUT .P ,PRSO>
	<RTRUE>)>>

<ROUTINE V-TALK-ABOUT () <ARENT-TALKING> <RESET-WINNER>>

<ROUTINE V-THANK ("AUX" P)
  <COND 
    (<DOBJ? YOU-YOU>
     <COND (<QCONTEXT-GOOD?>
            <PERFORM ,V?THANK ,QCONTEXT>)
           (ELSE
            <TELL "You're more than welcome." CR>)>)
    (<T? ,PRSO>
	 <COND (<AND <FSET? ,PRSO ,PERSONBIT>
		     <NOT <FSET? ,PRSO ,MUNGBIT>>>
		<TELL
"You do so, but "><THE-J ,PRSO T><TELL " seems less than overjoyed." CR>
		<RTRUE>)
	       (T <HAR-HAR>)>)
	(T
	 <COND (<OR <SET P <QCONTEXT-GOOD?>>
		     <AND <SET P <FIND-FLAG-HERE-NOT ,PERSONBIT ,MUNGBIT ,PLAYER>>
                  <NOT <=? .P ,PLAYER>>>>
		<PERFORM ,V?THANK .P>
		<RTRUE>)
	       (T <TELL "You're more than welcome." CR>)>)>>

<ROUTINE V-THROW ()
	 <COND (<NOT <IDROP>>
			<COND (,FAIL-THROW
				   <SETG FAIL-THROW <>>
				   <RFATAL>)
				  (ELSE
				   <RTRUE>)>)
		   (ELSE
			<TELL "Thrown." CR>)>>

<ROUTINE V-THROW-AT ("AUX" CURLOC)
	 <COND (<EQUAL? ,PRSO ,UP ,P?UP ,SKY ,CEILING>
            <COND (<IDROP>
                   <TELL He+verb ,PRSO "fli" "up, and then " verb ,PRSO "land" <GROUND-DESC> ,PAUSES>
                   <RTRUE>)
                  (ELSE
                   <RTRUE>)>)
           (<EQUAL? ,PRSO ,DOWN ,P?DOWN ,FLOOR>
            <PERFORM ,V?DROP ,PRSO>
            <RTRUE>)
           (<EQUAL? ,PRSO ,INTDIR ,P?NORTH ,P?SOUTH ,P?EAST
                          ,P?WEST ,P?NW ,P?NE ,P?SW ,P?SE>
            <TELL "Why don't you just go in that " D ,INTDIR !\? CR>
            <RTRUE>)
           (<NOT <IDROP>>
			<COND (,FAIL-THROW
				   <SETG FAIL-THROW <>>
		   		   <RFATAL>)
				  (ELSE
				   <RTRUE>)>)
           (ELSE
            <TELL "You miss." CR>)>>

<ROUTINE V-THROW-IN-TOWEL ()
	 <COND (<DOBJ? TOWEL>
		<V-QUIT T>)
	       (T
		<DONT-UNDERSTAND>)>>

<ROUTINE PRE-THROW-THROUGH ()
	<FCLEAR ,PRSO ,WORNBIT>
	<RFALSE>>

<ROUTINE V-THROW-THROUGH ()
	 <COND (<NOT <FSET? ,PRSO ,PERSONBIT>>
		<TELL "Let's not resort to vandalism, please." CR>)
	       (T <V-THROW>)>>

<ROUTINE V-TURN ()
 <COND (<AND <FSET? ,PRSO ,DOORBIT> <FSET? ,PRSO ,OPENBIT>>
	<PERFORM ,V?CLOSE ,PRSO>
	<RTRUE>)
       (T <TELL "What do you want that to do?" CR>)>>

<ROUTINE V-UNLOCK ()
	 <COND (<OR <FSET? ,PRSO ,DOORBIT>
		    <AND <FSET? ,PRSO ,CONTBIT>
			 <NOT <ZERO? <GETP ,PRSO ,P?CAPACITY>>>>>
		<COND (<NOT <FSET? ,PRSO ,LOCKED>>
		       <ALREADY ,PRSO "unlocked">)
		      (<ZERO? <UNLOCK-DOOR? ,PRSO>>
		       <YOU-CANT>)
		      (T
		       ;<COND (<FSET? ,PRSO ,OPENBIT>
			      <FCLEAR ,PRSO ,OPENBIT>
			      <FIRST-YOU "closing" ,PRSO>)>
		       ;<FCLEAR ,PRSO ,LOCKED>
		       ;<OKAY ,PRSO "unlocked">
               <TELL-ME-HOW>)>)
	       (T
		<SETG CLOCK-WAIT T>
		<TELL  He+verb ,PRSO "is" "n't locked!" CR>)>>

<ROUTINE V-USE () <MORE-SPECIFIC>>

"V-WAIT has three modes, depending on the arguments:
1) If only one argument is given, it will wait for that many moves.
2) If a second argument is given, it will wait the least of the first
   argument number of moves and the time at which the second argument
   (an object) is in the room with the player.
3) If the third argument is given, the second should be FALSE.  It will
   wait <first argument> number of moves (or at least try to).  The
   third argument means that an 'internal wait' is happening (e.g. for
   a 'careful' search)."

;<GLOBAL WHO-WAIT:NUMBER 0>

<GLOBAL KEEP-WAITING <>>

<ROUTINE V-WAIT ("OPTIONAL" (NUM -1) (WHO <>) (INT <>)
		 "AUX" (WHO-WAIT 0) VAL HR (RESULT T))
	 <COND (,DONT-FLAG
	 		<SETG CLOCK-WAIT T>
	 		<COND (ELSE ;<==? -1 .NUM>
				   <TELL "Time doesn't pass..." CR>
                   <SETG DONT-FLAG <>>)
				  ;(ELSE
				   <TELL "A bit specific, but okay." CR>)>)>
	 <COND (<==? -1 .NUM>
		<SET NUM 10>)>
	 <COND (<AND <ZERO? .INT>
		     <AND <NOT <FSET? ,PRSO ,PERSONBIT>>
			  <NOT <DOBJ? INTNUM TURN>>>>
		;<TELL ,I-ASSUME " Wait " N .NUM " minute">
		;<COND (<NOT <1? .NUM>>
		       <TELL !\s>)>
		;<TELL ".]" CR>)>
	 <SET HR ,HERE>
	 <COND (<NOT .INT> <TELL "Time passes..." CR>)>
	 <DEC NUM>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0>
			<SETG KEEP-WAITING <>>
			<RETURN>)
		       (<SET VAL <CLOCKER>>
			<COND (<OR <==? .VAL ,M-FATAL>
				   <NOT <==? .HR ,HERE>>>
			       <SETG CLOCK-WAIT T>
			       <SET RESULT ,M-FATAL>
			       <RETURN>)
			      ;(<0? .NUM> <RETURN>)
			      (<AND .WHO <IN? .WHO ,HERE>>
			       <SETG CLOCK-WAIT T>
			       <NOT-IT .WHO>
			       <THE-J .WHO T T> <TELL ", for wh">
			       <COND (<FSET? .WHO ,PERSONBIT>
				      <TELL "om">)
				     (T <TELL "ich">)>
			       <TELL " you're waiting, has arrived." CR>
			       <RETURN>)
			      (T
			       <SET WHO-WAIT <+ .WHO-WAIT 1>>)>)
		       (<AND .WHO <G? <SET WHO-WAIT <+ .WHO-WAIT 1>> 30>>
			<SET VAL <START-SENTENCE .WHO>>
			<TELL
" still hasn't arrived. Do you want to keep waiting?">
			<COND (<NOT <YES?>> <TELL "Ok." CR> <RETURN>)>
			<SET WHO-WAIT 0>
			<VERSION? (ZIP <USL>)
				  (T <UPDATE-STATUS-LINE>)>)
		       (T
			<VERSION? (ZIP <USL>)
				  (T <UPDATE-STATUS-LINE>)>)>>
	 .RESULT>

<ROUTINE V-WAIT-FOR ("AUX" WHO)
	 <COND (<AND <NOT <==? -1 ,P-NUMBER>>
		     <DOBJ? ROOMS TURN INTNUM>>
        ;<COND (<EQUAL? ,P-NUMBER 0>
		       <SETG DONT-FLAG T>)>
		<COND ;(<T? ,P-TIME>
		       <V-WAIT-UNTIL>)
		      (T <V-WAIT ,P-NUMBER>)>)
	       (<DOBJ? ROOMS TURN GLOBAL-HERE>
		<V-WAIT>)
	       (<EQUAL? ,PRSO ,PLAYER>
		<ALREADY ,PLAYER "here">)
	       (<OR <FSET? ,PRSO ,PERSONBIT>
		    ;<DOBJ? GHOST-NEW>>
		<COND (<IN? ;<META-LOC ,PRSO> ,PRSO ,HERE>
		       <ALREADY ,PRSO "here">)
		      (T <V-WAIT 10 ,PRSO>
			  	 <COND (<NOT <IN? ,PRSO ,HERE>>
				 		<TELL "You're still waiting, after 10 turns. Do you want to keep waiting?" CR>
						<COND (<YES?>
							   <V-WAIT-FOR>)>)>)>)
	       (T <TELL "Not a good idea. You might wait forever." CR>)>>

<ROUTINE V-WAIT-UNTIL ("AUX" N)
	 <COND (<AND <NOT <==? -1 ,P-NUMBER>>
		     <DOBJ? ROOMS TURN INTNUM>>
		<SET N ,P-NUMBER>
		<COND ;(<G? .N ,PRESENT-TIME>
		       <V-WAIT <- .N ,PRESENT-TIME>>)
		      (T
		       <SETG CLOCK-WAIT T>
		       <TELL "You don't know the time!" CR>)>)
	       (T <YOU-CANT "wait until">)>>

<ROUTINE V-ALARM ()
	 <COND (<==? ,PRSO ,ROOMS>
		<PERFORM ,V?ALARM ,WINNER>
		<RTRUE>)
	       (T
		<TOO-BAD-BUT ,PRSO "not asleep">)>>

<ROUTINE DO-WALK (DIR "AUX" P)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

<ROUTINE V-WALK ("AUX" PT PTS STR RM)
	 <COND (<ZERO? ,P-WALK-DIR>
		<COND (<AND <==? ,PRSO ,P?IN>
			    <OR <IN? ,P-IT-OBJECT ,ROOMS>
				<FSET? ,P-IT-OBJECT ,VEHBIT>
				<FSET? ,P-IT-OBJECT ,CONTBIT>>>
		       ;<TELL-I-ASSUME ,P-IT-OBJECT ;" Go in">
		       <PERFORM ,V?THROUGH ,P-IT-OBJECT>
		       <RTRUE>)
		      (T
			   <PERFORM ,V?WALK-TO ,PRSO>
		       ;<V-WALK-AROUND>
		       ;<RFATAL>
			   <RFALSE>)>)>
	 <COND (<SET PT <GETPT <LOC ,WINNER> ,PRSO>>
		<COND (<==? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <COND (<GOTO <GET/B .PT ,REXIT>> <OKAY>)>
		       <RTRUE>)
		      (<==? .PTS ,NEXIT>
		       <SETG CLOCK-WAIT T>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<==? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <COND (<GOTO .RM> <OKAY>)>
			      <RTRUE>)
			     (T
			      <RFATAL>)>)
		      (<==? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <COND (<GOTO <GET/B .PT ,REXIT>> <OKAY>)>
			      <RTRUE>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <CANNOT-GO> ;<YOU-CANT "go">
			      <RFATAL>)>)
		      (<==? .PTS ,DEXIT>
		       <COND (<WALK-THRU-DOOR? .PT>
			      <COND (<GOTO <GET/B .PT ,REXIT>> <OKAY>)>
			      <RTRUE>)
			     (T <RFATAL>)>)>)
	       (<EQUAL? ,PRSO ,P?IN ,P?OUT>
        <COND (<AND <FSET? <LOC ,PLAYER> ,VEHBIT>
                    <EQUAL? ,PRSO ,P?OUT>>
               <TELL "You step outside." CR>
               ;<MOVE ,PLAYER <LOC <LOC ,PLAYER>>> ;"Edit if you need to be specific.")
              (ELSE
               <V-WALK-AROUND>)>
		;<TELL "TESTING||||||||||">)
	       (<EQUAL? ,PRSO ,P?UP ,UP>
		<PERFORM ,V?CLIMB-UP ;,STAIRS>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,P?DOWN ,DOWN>
		<PERFORM ,V?CLIMB-DOWN ;,STAIRS>
		<RTRUE>)
	       (T
		<CANNOT-GO> ;<YOU-CANT "go">
		<RFATAL>)>>

<ROUTINE UNLOCK-DOOR? (DR)
 <COND (<EQUAL? ,HERE .DR>
	<RTRUE>)
       ;(<EQUAL? ,HERE <GETP ,HERE ,P?STATION>>
	<RFALSE>)
       ;(<EQUAL? .DR ,SECRET-SITTING-DOOR ,FRONT-GATE>
	<RFALSE>)
       (T <RTRUE>)>>

<ROUTINE WALK-THRU-DOOR? (PT "OPTIONAL" (OBJ 0) (TELL? T)
			     "AUX" RM)
	<COND (<ZERO? .OBJ>
	       <SET OBJ <GET/B .PT ,DEXITOBJ>>)>
	;<SET RM <GET/B .PT ,REXIT>>
	<COND (<FSET? .OBJ ,OPENBIT>
	       <RTRUE>)
	      (<AND <FSET? .OBJ ,SECRETBIT>
		    <NOT <FSET? .OBJ ,TOUCHBIT ;,SEENBIT>>>
	       <COND (<EQUAL? <> .TELL? ,VERBOSITY>
		      <RFALSE>)
		     (<NOT <FSET? ,HERE ,SECRETBIT>>
		      <CANNOT-GO> ;<YOU-CANT "go">
		      <RFALSE>)
		     (<ZERO? ,LIT>
		      <NOT-FOUND .OBJ>
		      <RFALSE>)
		     (T
		      <COND (<NOT <VERB? WALK-TO>>
			     <OPEN-DOOR-AND-CLOSE-IT-AGAIN .OBJ>)>
		      <RTRUE>)>)
	      (<NOT <FSET? .OBJ ,LOCKED>>
	       <COND (<NOT <VERB? WALK-TO>>
		      <FCLEAR .OBJ ,SECRETBIT>
		      <FSET .OBJ ,SEENBIT ;,TOUCHBIT>
				;"Don't put TOUCHBIT on ROOM"
		      <COND (<NOT <EQUAL? <> .TELL? ,VERBOSITY>>
			     <OPEN-DOOR-AND-CLOSE-IT-AGAIN .OBJ>)>)>
	       <RTRUE>)
	      (<AND <T? .PT>
		    <SET RM <GET .PT ,DEXITSTR>>>
	       <COND (<T? .TELL?>
		      <TELL .RM CR>)>
	       <RFALSE>)
	      (T
	       <COND (<ZERO? .TELL?>
		      <RFALSE>)
		     (<T? <UNLOCK-DOOR? .OBJ>>
		      <COND (<AND <NOT <VERB? WALK-TO>>
				  <T? ,VERBOSITY>>
			     <OPEN-DOOR-AND-CLOSE-IT-AGAIN .OBJ>)>
		      <RTRUE>)
		     ;(<IN? .OBJ ,ROOMS>
		      ;<COND (<VERB? WALK-TO>
			     <TELL ", but t">)
			    (T )>
		      <TELL "The door is locked." CR>
		      ;<COND (<NOT <VERB? WALK-TO>>
			     )>)
		     (T <TOO-BAD-BUT .OBJ "locked">)>
	       <THIS-IS-IT .OBJ>
	       <RFALSE>)>>

<ROUTINE OPEN-DOOR-AND-CLOSE-IT-AGAIN (OBJ)
	<FSET .OBJ ,SEENBIT ;,TOUCHBIT>	;"Don't put TOUCHBIT on ROOM"
	<COND (<NOT <==? ,WINNER ,PLAYER>>
	       <RTRUE>)>
	<TELL "You ">
	<COND (<FSET? .OBJ ,LOCKED>
	       <FCLEAR .OBJ ,LOCKED>
	       <TELL "unlock and ">)>
	<TELL "open the ">
	<COND ;(<EQUAL? .OBJ ,FRONT-GATE> <TELL "gate">)
	      (T <TELL "door">)>
	<COND (<FSET? .OBJ ,SECRETBIT>
	       <FSET .OBJ ,OPENBIT>
           <TELL " and walk through">)
	      (T <TELL ", walk through, and close it again">)>
	<TELL ,PAUSES>>

<ROUTINE V-WALK-AROUND ()
	 <SETG CLOCK-WAIT T>
	 <TELL "Did you have a direction in mind?" CR>
	 <SETG AWAITING-REPLY 3>
	 ;<RFATAL>
	 <QUEUE I-REPLY 2>
	 <FUCKING-CLEAR>>

<ROUTINE WHO-KNOWS? (OBJ)
	<SETG CLOCK-WAIT T>
	<TELL "You have no idea where"><TELL !\ ><THE-J ,PRSO T><TELL " is." CR>>

<ROUTINE WALK-WITHIN-ROOM () <NO-NEED "move around within" ,HERE ;" a place">>

<ROUTINE V-WALK-TO ()
	 <COND (<EQUAL? ,PRSO ,EMERGENCY-BUTTON ,EMERGENCY-EXIT ,MOUSE-PAINTING>
	 		<COND (,NEAR-EXIT
		   		   <TELL "You're already next to the exit!" CR>)
		   		  (<AND ,KILL-NOW?
                        <NOT <RUNNING? I-MOUSE-BLAB>>>
		   		   <TELL ,SUDDEN "jump up and head towards the exit">
		   		   <TELL ", Perc" ,HEADSHOT>
				   <JIGS-UP "">)
				  (ELSE
				   <TELL "Done subtly, as not to alert the mice." CR>
				   <SETG NEAR-EXIT T>)>)
	 	   (<OR <IN? ,PRSO ,HERE>
		    	<GLOBAL-IN? ,PRSO ,HERE>>
			<TELL He ,PRSO "'s here!" CR>)
		   (<EQUAL? ,PRSO ,P?UP ,UP>
		   	<V-CLIMB-UP>)
		   (<EQUAL? ,PRSO ,P?DOWN ,DOWN>
		   	<V-CLIMB-DOWN>)
	       (T
		<V-WALK-AROUND>
		;<TELL "TESTING||||||||||">)>>

<ROUTINE ENTER-ROOM ("AUX" VAL)
	<SETG LIT <LIT? ;,HERE>>
	;<COND (<FSET? ,HERE ,SECRETBIT>
	       <SETG WASHED <>>)>
	<APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
	<SET VAL <V-FIRST-LOOK>>
	<APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>
	.VAL>




<GLOBAL MAX-ALLOWED <>>
<GLOBAL MAX-FAIL <>>

<ROUTINE PRE-SWRITE-WHAT ()
    <PERFORM ,V?WRITE-WHAT ,PRSI ,PRSO>
    <RTRUE>>

<ROUTINE V-SWRITE () <V-FOO>>

<ROUTINE V-WRITE-WHAT ()
    <COND (<AND <IN? ,PLAYER ,DRESSING-ROOM-BBBB>
                <DOBJ? AUTO-SIGN>
                <IOBJ? REGISTER CELL-PHONE>>
           <COND (<NOT ,PRSI>
                  <PERFORM ,V?WRITE ,PRSO>
                  <RTRUE>)
                 (,MAX-ALLOWED
                  <TELL "You've already done that." CR>)
                 (ELSE
                  <TELL "\"Yes, that is one of our most recent guests. OK, I'll add it.\" The name is accepted." CR>
                  <SETG MAX-ALLOWED T>)>
           <RTRUE>)
          (<OR <IOBJ? CELL-PHONE>
               <AND <VISIBLE? ,CELL-PHONE>
                    <TELL "(on the phone)" CR>>>
           <COND (<DOBJ? AUTO-SIGN>
                  <COND (<VISIBLE? ,AUTO-SIGN>
                         <TELL
"\"But if that's you... you just left! And you're not the same person.
Oh... wait, you're a morpher. You've already returned? Ok, fine, whatever.\"
He saunters out of the room to the southwest, and leaves via the teleporter." CR>
                         <INCREMENT-SCORE 15>
                         <SETG DARK-FLAG ,BAR>
                         <SETG DARK-CONTROLLED T>
                         <MOVE ,POLICEMAN ,LOCAL-GLOBALS>
                         <RTRUE>)
                        (ELSE
                         <TELL "How can you do that without a special pen to stabilize your shaky hand?" CR>
                         <RTRUE>)>)
                 (<DOBJ? GL-BEAST>
                  <TELL
"The policeman glances sidelong at you, but accepts it with half a smile on his face." CR CR
"In a few minutes, the Beast will get a call about what you did,
hitches a ride on a starcruiser (after ravenously devouring the
passengers), travels over to the Restaurant, and then eats you.
Not to mention a lot of slavering fangs." CR>
                  <JIGS-UP
"Although that is in about 25 minutes, so I'll skip quickly to that
part, and immediately past it. Anyway, what was I saying? Oh yes.">)
                 (<DOBJ? YOUR-NAME PLAYER>
                  <TELL
"You write your name and press enter. In a few minutes, the policeman looks at
you. \"Is that your name?\" he asks, in response to which you nod. \"You have
no bank account registered, nor do you have a reservation. That is illegal.\"|
|Soon, you are placed in a non-time prison, where you grow old and end up
dying a boring death.||||     ">
                  <BOLDEN "****  You have failed in life  ****">
                  <JIGS-UP "" T>)
                 (ELSE
                  <TELL
"Please be serious. If you can't you might find yourself,
oh, I don't know, maybe dead in a ditch or at the bottom
of a highly corrosive ocean on a random planet which you
landed on a few minutes ago. It can save lives." CR>
                  <RTRUE>)>)
          (<AND <IN? ,PLAYER ,DRESSING-ROOM-BBBB>
                <NOT ,PRSI>>
           <TELL "Find something to write with first." CR>)
          ;(<AND <NOT ,PRSI>
                <VISIBLE? ,CELL-PHONE>
                <NOT <DOBJ? CELL-PHONE>>>
           <TELL "(on the cell phone)" CR>
           <>)
          (ELSE
           <COND (<AND <IN? ,PLAYER ,DRESSING-ROOM-BBBB>
                       <IOBJ? REGISTER ;CELL-PHONE>>
                  <COND (<AND <DOBJ? AUTO-SIGN>
                              <HELD? ,AUTO-SIGN>>
                         <PERFORM ,V?WRITE ,AUTO-SIGN ,AUTO-SIGN>
                         <RTRUE>)
                        (<AND <DOBJ? AUTO-SIGN>
                              <VISIBLE? ,AUTO-SIGN>
                              <ITAKE <> ,AUTO-SIGN>>
                         <FIRST-YOU "taking" ,AUTO-SIGN>
                         <MOVE ,AUTO-SIGN ,PLAYER>
                         <PERFORM ,V?WRITE ,AUTO-SIGN ,AUTO-SIGN>
                         <RTRUE>)
                        (<DOBJ? AUTO-SIGN>
                         <TELL-ME-HOW>)
                        (<HELD? ,PENCIL>
                         <PERFORM ,V?WRITE ,PRSO ,PENCIL>
                         <RTRUE>)
                        (<AND <VISIBLE? ,PENCIL>
                              <ITAKE <> ,PENCIL>>
                         <FIRST-YOU "taking" ,PENCIL>
                         <MOVE ,PENCIL ,PLAYER>
                         <PERFORM ,V?WRITE ,PRSO ,PENCIL>
                         <RTRUE>)
                        (ELSE
                         <TELL "You don't need to specify what you're writing in. I can do that." CR>
                         <RTRUE>)>)
                 (ELSE
                  <TELL "You can't write on that!" CR>)>)>>

;<ROUTINE V-WRITE-IN-WHAT ()
    <TELL "Think of something to write in first." CR>>

<ROUTINE V-WRITE ()
    <COND (<IN? ,PLAYER ,DRESSING-ROOM-BBBB>
           <COND (<NOT <IOBJ? PENCIL AUTO-SIGN>>
                  <TELL-ME-HOW>
                  <FUCKING-CLEAR>)
                 (<AND <NOT <DOBJ? AUTO-SIGN>>
                       <IOBJ? AUTO-SIGN>>
                  <TELL "Sorry, ">
                  <THE-J ,AUTO-SIGN T>
                  <TELL
" can only sign one name and one name only.
And that name is preset, so you can't change it." CR>
                  <RTRUE>)
                 (<AND <DOBJ? AUTO-SIGN>
                       <IOBJ? AUTO-SIGN>>
                  <PERFORM ,V?WRITE-WHAT ,AUTO-SIGN ,REGISTER>
                  <RTRUE>)
                 (<AND <EQUAL? ,PRSO ,YOUR-NAME>
                       <NOT <ADJ-USED? ,YOUR-NAME ,W?MY>>>
                  <TELL ,SAY-IT-AGAIN "whose name?" CR>
                  <FUCKING-CLEAR>)
                 (<OR <DOBJ? GL-BEAST>
                      ;<AND <DOBJ? PLAIN-NAME>
                           <EQUAL? <GETP ,PLAIN-NAME ,P?OWNER> ,GL-BEAST>>>
                  <TELL
"Giving the " ,BEAST " access to Max Quordlepleen's dressing
rooms? I'm sorry, but you can't. It's already on there, ">
                  <COND (<FSET? ,REGISTER ,RADPLUGBIT>
                         <TELL "as you already know">)
                        (<FSET? ,REGISTER ,SADRADIOBIT>
                         <TELL "as I've already told you">)
                        (ELSE
                         <TELL "if you just look closer to the bottom">
                         <FSET ,REGISTER ,SADRADIOBIT>)>
                  <TELL ,PAUSES>
                  <RTRUE>)
                 (<DOBJ? YOUR-NAME PLAYER>
                  <COND (,MAX-FAIL
                         <TELL "You've already done that." CR>)
                        (ELSE
                         <TELL "\"I can't seem to find that under our most recent guests, but I'll add it anyway.\"" CR>
                         <SETG MAX-FAIL T>)>
                  <RTRUE>)
                 (<AND <DOBJ? AUTO-SIGN>
                       <NOT <IOBJ? AUTO-SIGN>>>
                  <TELL "Only the " D ,AUTO-SIGN " can do that." CR>
                  <RTRUE>)>)
          (<VISIBLE? ,CELL-PHONE>
           <COND (<AND <DOBJ? AUTO-SIGN>
                       <IOBJ? AUTO-SIGN>>
                  <PERFORM ,V?WRITE-WHAT ,AUTO-SIGN ,CELL-PHONE>
                  <RTRUE>)
                 (<AND <NOT <DOBJ? AUTO-SIGN>>
                       <IOBJ? AUTO-SIGN>>
                  <TELL "Sorry, ">
                  <THE-J ,AUTO-SIGN T>
                  <TELL
" can only sign one name and one name only.
And that name is preset, so you can't change it." CR>
                  <RTRUE>)
                 (<AND <DOBJ? AUTO-SIGN>
                       <NOT <IOBJ? AUTO-SIGN>>>
                  <TELL "Only the " D ,AUTO-SIGN " can do that." CR>
                  <RTRUE>)>)>
    <TELL-ME-HOW>>


<ROUTINE V-CHANGE ()
    <TELL "That's more difficult than you could think." CR>>

;<ROUTINE V-WALK-UNDER () <YOU-CANT "go under">>

<ROUTINE V-RUN-OVER () <TELL "That doesn't make much sense." CR>>


<ROUTINE V-YELL () <TELL "You begin to get a sore throat." CR>>

<ROUTINE V-YES ()
    <COND (<EQUAL? ,AWAITING-REPLY 1>
        <TELL "Then be it. Don't you think?" CR>
        <SETG AWAITING-REPLY 4>
		<QUEUE I-REPLY 2>
		<FUCKING-CLEAR>)
    (<EQUAL? ,AWAITING-REPLY 2>
        <TELL "You should be.">)
    (<EQUAL? ,AWAITING-REPLY 3>
        <TELL "Then type it.">)
    (<EQUAL? ,AWAITING-REPLY 4>
        <TELL "Right.">)
    (<EQUAL? ,AWAITING-REPLY 5>
        <TELL "Phew. For a second there I thought something really bad was about to happen.">)
    (<EQUAL? ,AWAITING-REPLY 6>
        <PERFORM ,V?HELP ,PLAYER>
        <RTRUE>)
	(<EQUAL? ,AWAITING-REPLY 7>
		<TELL ,SUDDEN "reach down to grab some fruit from the bowl, Perc">
		<JIGS-UP ,HEADSHOT>)
	(<EQUAL? ,AWAITING-REPLY 8>
		<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-TENSE-SCENE>
		   <RHETORICAL T>
		   <RFALSE>)>
		<TELL "You are, then. Okay, I'll watch in amusement." CR>
		<QUEUE I-TENSE-SCENE 2>
		<DEQUEUE MOUSE-BANG>)
	(<EQUAL? ,AWAITING-REPLY 9>
		<TELL
"You disagree with what the mouse just said, which makes them very confused.
You apologise for the misunderstanding, You allow them to give you anesthetic
(thinking that they would only scan your brain), and you never wake up the same.
We apologise for any misunderstandings again, but the mice may have replaced
your brain for an NPC's.">
		<JIGS-UP "" T>)
	(<EQUAL? ,AWAITING-REPLY 10>
		<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-TENSE-SCENE>
		   <RHETORICAL T>
		   <RFALSE>)>
		<TELL "Fine." CR>
		<QUEUE I-TENSE-SCENE 2>
		<DEQUEUE MOUSE-BANG>
		<SETG KILL-NOW? <>>)
    (<EQUAL? ,AWAITING-REPLY 11>
        <TELL "Then it's not fun!">)
    (<EQUAL? ,AWAITING-REPLY 12>
        <TELL "\"Then show it to me, please.\"" CR>)
    (<EQUAL? ,AWAITING-REPLY 13>
        <TELL "I think so too." CR>)
    (<EQUAL? ,AWAITING-REPLY 14>
        <PERFORM ,V?ASK-ABOUT ,PERCY ,MOUSE-PAINTING>
        <RTRUE>)
    (<EQUAL? ,AWAITING-REPLY 15>
        <COND 
            (<IN? ,PLAYER ,DINING-HALL>
                <TELL "\"Then sign it.\"" CR>
                <THIS-IS-IT ,CELL-PHONE>)
            (ELSE
                <TELL "The policeman isn't here." CR>)>)
    (<EQUAL? ,AWAITING-REPLY 16>
        <COND 
            (<IN? ,PLAYER ,DRESSING-ROOM-REU>
                <TELL "\"Yay! Oh boy!\"" CR>)
            (ELSE
                <TELL "Clyde isn't here." CR>)>)
	(T
		<RHETORICAL T>
        <RTRUE>)>
    <SETG AWAITING-REPLY 0>
    <CRLF>>

<ROUTINE V-NO ()
    <COND (<EQUAL? ,AWAITING-REPLY 1>
        <TELL "Oh, well.">)
    (<EQUAL? ,AWAITING-REPLY 2>
        <TELL "Well, tough.">)
    (<EQUAL? ,AWAITING-REPLY 3>
        <TELL "Then think of one.">)
    (<EQUAL? ,AWAITING-REPLY 4>
        <TELL "You just contradicted yourself.">)
    (<EQUAL? ,AWAITING-REPLY 5>
        <TELL "I'm just going to assume you meant, \"No, I won't overdo it.\"">)
    (<EQUAL? ,AWAITING-REPLY 6>
        <RHETORICAL <>>)
	(<EQUAL? ,AWAITING-REPLY 7>
		<TELL "The mice, confused at your turning down of their 'perfectly reasonable' offer, look briefly at
each other, then turn on you. \"What do you mean, no?\"" CR>
		<DEQUEUE I-REPLY>
		<I-TENSE-SCENE>)
	(<EQUAL? ,AWAITING-REPLY 8>
		<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-TENSE-SCENE>
		   <RHETORICAL <>>
		   <RFALSE>)>
		<TELL "That's it. You keep contradicting yourself. Why should I deal with this sort of rubbish? It's
up to you now..." CR>
		<QUEUE I-ASKED-NICELY 2>
		<DEQUEUE I-TENSE-SCENE>
		<DEQUEUE MOUSE-BANG>)
	(<EQUAL? ,AWAITING-REPLY 9>
		<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-TENSE-SCENE>
		   <RHETORICAL <>>
		   <RFALSE>)>
		<TELL "The mice are even more puzzled than you about why you refused such a simple offer.
Nevertheless, you continue." CR>
		<QUEUE I-TENSE-SCENE 2>
		<DEQUEUE MOUSE-BANG>
		<SETG KILL-NOW? <>>)
	(<EQUAL? ,AWAITING-REPLY 10>
		<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-TENSE-SCENE>
		   <RHETORICAL <>>
		   <RFALSE>)>
		<TELL "Fine." CR>
		<QUEUE I-TENSE-SCENE 2>
		<DEQUEUE MOUSE-BANG>)
    (<EQUAL? ,AWAITING-REPLY 11>
        <TELL "Then why are you doing it?">)
    (<EQUAL? ,AWAITING-REPLY 12>
        <TELL
"The man looks scared for a moment. \"Oh, dear, you may be stuck here then.\"
He looks around, glances at the pill jar, and then looks back at you. ">
        <PERFORM ,V?ASK-ABOUT ,SLARTY ,RAMP>
        <TELL D ,SLARTY " scratches his head. \"Oh well, it's a shame.\"" CR>
        <FSET ,SLARTY ,RADPLUGBIT> ;"Lied about the blue frob (if you did)")
    (<EQUAL? ,AWAITING-REPLY 13>
        <TELL
"I disagree. Then again, I'm just a useless computer.
But then "><ITALICIZE "again"><TELL ", I can look into
the source code and tell you that that's all for now." CR>)
    (<EQUAL? ,AWAITING-REPLY 14>
        <TELL "\"Well that's not very nice.\"" CR>)
    (<EQUAL? ,AWAITING-REPLY 15>
        <COND 
            (<IN? ,PLAYER ,DINING-HALL>
                <TELL
"\"You're going to have to sign it. Neither of the shows - Milliways or "
D ,BAR " - will start playing until the forms have all been signed.\"" CR>
                <THIS-IS-IT ,CELL-PHONE>)
            (ELSE
                <TELL "The policeman isn't here." CR>)>)
	(<EQUAL? ,AWAITING-REPLY 16>
        <COND 
            (<IN? ,PLAYER ,DRESSING-ROOM-REU>
                <TELL "\"Awww...\"" CR>)
            (ELSE
                <TELL "Clyde isn't here." CR>)>)
    (T
		<RHETORICAL <>>
        <RTRUE>)>
    <SETG AWAITING-REPLY 0>
    <CRLF>>

<ROUTINE RHETORICAL ("OPT" Y-N)
    <TELL "You sound rather ">
    <COND (.Y-N
        <TELL "posi">)
    (T
        <TELL "nega">)>
    <TELL "tive." CR>>

<ROUTINE JIGS-UP ("OPT" DESC (DEATH? <>) (PERMA <>))
	 <COND (<ASSIGNED? DESC>
		<TELL .DESC>)>
	 <COND (<AND <FSET? <LOC ,PLAYER> ,SADRADIOBIT>
                 <NOT .PERMA>>
	 		<GO-TO-DARK>
			<RTRUE>)>
	 <COND (.DEATH?
	 	<FINISH>)>
	 <SIXCR>
	 <BOLDEN "
    ****  You have died  ****">
	 <FINISH>>

<ROUTINE FINISH ("OPT" (REPEATING <>) VAL)
	 %<DEBUG-CODE <COND (<T? ,P-DBUG>
                         <TELL CR CR CR
"Okay. Seeing as you're testing, I will help you.
You can continue playing, but it may cause errors
caused by continuing turn scripts which will just
kill you again (or so). But, you may continue if
you want, or die if you think it necessary. Just -
don't say yes unless you are actually sure you can
continue with no problems. Like, if you died in the
Fjords, I don't think it will work.|
Well... What do you think?" CR>
                         <COND (<YES?> <TELL "Alrighty then." CR> <RTRUE>)
                               (ELSE   <TELL "Wise choice, tester..." CR>)>)>>
	 <SIXCR>
	 <COND (<NOT .REPEATING>
		<V-SCORE>
		<CRLF>)>
	 <TELL "Would you like to:|">
	 <COND (<T? ,P-CAN-UNDO>
		<TELL
"   UNDO your last action,|">)>
	 <TELL
"   RESTORE your place from where you saved it,|
   RESTART the story from the beginning, or|
   QUIT for now?" CR>
	<REPEAT ()
	 <TELL !\>>
	 <PUTB ,P-INBUF 1 0>
	 <READ ,P-INBUF ,P-LEXV>
	 <SET VAL <GET ,P-LEXV ,P-LEXSTART>>
	 <COND (<AND <NOT <0? .VAL>>
		     <SET VAL <WORD-VERB-STUFF .VAL>>
		     <L=? 0 <SET VAL <VERB-ZERO .VAL>>>>
		;<SET VAL <WT? .VAL ,PS?VERB ,P1?VERB>>
		<COND (<AND <T? ,P-CAN-UNDO>
			    <EQUAL? .VAL ,ACT?UNDO ,W?UNDO ,V?UNDO>>
		       <V-UNDO>
		       ;<FINISH T>)
		      (<EQUAL? .VAL ,ACT?RESTART ,W?RESTART ,V?RESTART>
		       <RESTART>
		       ;<TELL-FAILED>
		       <FINISH T>)
		      (<EQUAL? .VAL ,ACT?RESTORE ,W?RESTORE ,V?RESTORE>
		       <COND (<V-RESTORE> <RETURN>)>
		       <FINISH T>)
		      (<EQUAL? .VAL ,ACT?QUIT ,W?QUIT ,V?QUIT>
		       <TELL "Thanks for playing." CR> <QUIT>)>)>
	 <TELL "[Please type ">
	 <COND (<T? ,P-CAN-UNDO>
		<TELL "UNDO, ">)>
	 <TELL "RESTORE, RESTART, or QUIT.] ">>>

<ROUTINE V-UNDO ("AUX" X)
	<COND (<T? ,P-CAN-UNDO>
	       <SETG OLD-HERE <>>
           <TELL "Undoing..." CR>
           <COND (<EQUAL? <IRESTORE> -1>
	              <TELL "[UNDO failed.]" CR>
                  <RTRUE>)>)>
    <TELL
"Sorry, the Galactic Compendium on Interactive
Fiction prohibits the use of UNDO after your
previous action." CR>>


;<ROUTINE DIVESTMENT? (OBJ)
	<AND <==? ,PRSO .OBJ>
	     <VERB? DISEMBARK DROP GIVE POUR PUT PUT-IN PUT-UNDER
		    REMOVE THROW-AT THROW-THROUGH>>>

<ROUTINE REMOTE-VERB? ()
 <COND (<VERB? ;ARREST ASK-ABOUT ASK-CONTEXT-ABOUT ASK-CONTEXT-FOR ASK-FOR ;BUY
	       DISEMBARK ;DRESS FIND FOLLOW LEAVE LOOK-UP ;MAKE SEARCH SEARCH-FOR
           SHOW SSHOW TAKE-TO TALK-ABOUT ;TELL TELL-ABOUT WAIT-FOR WAIT-UNTIL
           WALK-TO $CALL>
	<RTRUE>)>
 <RFALSE>>
