"HINTS for
		the Restaurant at the End of the Universe"

<FILE-FLAGS CLEAN-STACK?>

<GLOBAL HINT-WARNING <>>

<GLOBAL HINTS-OFF <>>

<CONSTANT MAC-DOWN-ARROW <ASCII !\/>>
<CONSTANT MAC-UP-ARROW <ASCII !\\>>
<CONSTANT ALL-DONE-HINTS "|[That's all.]|">
<CONSTANT UP-ARROW 129>
<CONSTANT DOWN-ARROW 130>
<CONSTANT ESCAPE-KEY 27>

<ROUTINE V-HINTS-ON ()
    <SETG CLOCK-WAIT T>
	<COND (<NOT <EQUAL? ,PRSO ,ROOMS>>
		   <TELL "I don't understand what you mean." CR>)
	      (T
		   <COND (,HINTS-OFF
			      <SETG HINTS-OFF <>>
			      <TELL "[Hints have been allowed for this session.]" CR>)
		         (ELSE
			      <TELL "[The hint system wasn't turned off.]" CR>)>)>
	<RFATAL>>

<ROUTINE V-HINTS-NO ()
    <SETG CLOCK-WAIT T>
	<COND (<NOT <EQUAL? ,PRSO ,ROOMS>>
	       <TELL "I don't understand what you mean." CR>)
	      (T
	       <SETG HINTS-OFF T>
           <SETG HINT-WARNING T>
	       <TELL "[Hints have been disallowed for this session.]" CR>)>
	<RFATAL>>

<ROUTINE V-HINTS ("AUX" CHR MAXC (C <>) Q WHO)
    <SETG CLOCK-WAIT T>
	<COND (,HINTS-OFF
	       <TELL
"[If you still want hints, just type HINTS ON. But by this point, you
have already turned them off, so this would be a warning to you.]" CR>
	       <RFATAL>)
	      (<NOT ,HINT-WARNING>
		   <SETG AWAITING-REPLY 6>
	       <SETG HINT-WARNING T>
	       <TELL
"[Warning: It is recognized that the temptation for help may at times be
so exceedingly strong that you might fetch hints prematurely. Therefore,
if you would like to disallow yourself to have hints from now on, then you
may type HINTS OFF. If you still want a hint now, or if you are a beginner
and are looking at the General Commands, indicate HINT.]" CR>
			<RFATAL>)>
       	<SET MAXC <GET ,HINTS 0>>
	<INIT-HINT-SCREEN>
	<CURSET 5 1>
	<PUT-UP-CHAPTERS>
	<SETG CUR-POS <- ,CHAPT-NUM 1>>
	<NEW-CURSOR>
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
		       <SET Q T>
		       <RETURN>)
			  (<EQUAL? .CHR ,ESCAPE-KEY>
			   <CONTINUE-STORY-HINTS>)
		      (<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n> ,DOWN-ARROW ,MAC-DOWN-ARROW>
		       <ERASE-CURSOR>
		       <COND (<EQUAL? ,CHAPT-NUM .MAXC>
			      <SETG CUR-POS 0>
			      <SETG CHAPT-NUM 1>
			      <SETG QUEST-NUM 1>)
			     (T 
			      <SETG CUR-POS <+ ,CUR-POS 1>>
			      <SETG CHAPT-NUM <+ ,CHAPT-NUM 1>>
			      <SETG QUEST-NUM 1>)>
		       <NEW-CURSOR>)
		      (<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p> ,UP-ARROW ,MAC-UP-ARROW>
		       <ERASE-CURSOR>
		       <COND (<EQUAL? ,CHAPT-NUM 1>
			      <SETG CHAPT-NUM .MAXC>
			      <SETG CUR-POS <- ,CHAPT-NUM 1>>
			      <SETG QUEST-NUM 1>)
			     (T
			      <SETG CUR-POS <- ,CUR-POS 1>>
			      <SETG CHAPT-NUM <- ,CHAPT-NUM 1>>
			      <SETG QUEST-NUM 1>)>
		       <NEW-CURSOR>)
		      (<EQUAL? .CHR 13 10>
		       <PICK-QUESTION>
		       <RETURN>)>>
	<COND (<NOT .Q>
	       <AGAIN>	;"AGAIN does whole routine?")>
	<CONTINUE-STORY-HINTS>>

<ROUTINE CONTINUE-STORY-HINTS ()
	<CLEAR -1>
	<INIT-STATUS-LINE>
	;<SETG P-CONT 0>
	<TELL CR "Back to the story..." CR CR>
	<V-LOOK>
	<MAIN-LOOP>>

<ROUTINE PICK-QUESTION ("AUX" CHR MAXQ (Q <>))
	<INIT-HINT-SCREEN <>>
	<LEFT-LINE 3 " RETURN = See hint">
	<RIGHT-LINE 3 "Q = Main menu" %<LENGTH "Q = Main menu">>
	<SET MAXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
	<CURSET 5 1>
	<PUT-UP-QUESTIONS>
	<SETG CUR-POS <- ,QUEST-NUM 1>>
	<NEW-CURSOR>
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
		       <SET Q T>
		       <RETURN>)
			  (<EQUAL? .CHR ,ESCAPE-KEY>
			   <CONTINUE-STORY-HINTS>)
		      (<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n> ,DOWN-ARROW ,MAC-DOWN-ARROW>
		       <ERASE-CURSOR>
		       <COND (<EQUAL? ,QUEST-NUM .MAXQ>
			      <SETG CUR-POS 0>
			      <SETG QUEST-NUM 1>)
			     (T
			      <SETG CUR-POS <+ ,CUR-POS 1>>
			      <SETG QUEST-NUM <+ ,QUEST-NUM 1>>)>
		       <NEW-CURSOR>)
		      (<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p> ,UP-ARROW ,MAC-UP-ARROW>
		       <ERASE-CURSOR>
		       <COND (<EQUAL? ,QUEST-NUM 1>
			      <SETG QUEST-NUM .MAXQ>
			      <SETG CUR-POS <- ,QUEST-NUM 1>>)
			     (T
			      <SETG CUR-POS <- ,CUR-POS 1>> 
			      <SETG QUEST-NUM <- ,QUEST-NUM 1>>)>
		       <NEW-CURSOR>)
		      (<EQUAL? .CHR 13 10>
		       <DISPLAY-HINT>
		       <RETURN>)>>
	<COND (<NOT .Q>
	       <AGAIN>)>>

;"zeroth (first) element is 5"
<GLOBAL LINE-TABLE
	<PTABLE
	  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22>>

;"zeroth (first) element is 4"
<GLOBAL COLUMN-TABLE
	<PTABLE
	  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4>>

<GLOBAL CUR-POS 0>	;"determines where to place the highlight cursor
			  Can go up to 17 Questions"

<GLOBAL QUEST-NUM 1>	;"shows in HINT-TBL ltable which QUESTION it's on"

<GLOBAL CHAPT-NUM 1>	;"shows in HINT-TBL ltable which CHAPTER it's on"

<ROUTINE ERASE-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		<- <GET ,COLUMN-TABLE ,CUR-POS> 2 ;1>>
	<TELL " ">	;"erase previous highlight cursor">

;"go back 2 spaces from question text, print cursor and flash is between
the cursor and text"

<ROUTINE NEW-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		    <- <GET ,COLUMN-TABLE ,CUR-POS> 2 ;1>>
	<TELL ">">	;"print the new cursor">

<ROUTINE INVERSE-LINE ("AUX" (CENTER-HALF <>)) 
	<HLIGHT ,H-INVERSE>
	<PRINT-SPACES <LOWCORE SCRH>>
	<HLIGHT ,H-NORMAL>>

;"cnt (3) is where in table answers begin. (2) in table is # of hints-seen"
<ROUTINE DISPLAY-HINT ("AUX" H MX MXC MXA (CNT 2) CHR (FLG T) N)
	;<SPLIT 0>
	<CLEAR -1>
	<SPLIT 3>
	<SCREEN ,S-WINDOW>
	<CURSET 1 1>
	<INVERSE-LINE>
	<CENTER-LINE 1 "INVISICLUES (tm)" %<LENGTH "INVISICLUES (tm)">>
	<CURSET 3 1>
	<INVERSE-LINE>
	<LEFT-LINE 3 " RETURN = See hint">
	<RIGHT-LINE 3 "Q = See hint menu" %<LENGTH "Q = See hint menu">>
	<CURSET 2 1>
	<INVERSE-LINE>
	<HLIGHT ,H-BOLD>
	<SET H <GET <GET ,HINTS ,CHAPT-NUM> <+ ,QUEST-NUM 1>>>
	<CENTER-LINE 2 <GET .H 2>>
	<HLIGHT ,H-NORMAL>
	<SET MX <GET .H 0>>
	<SET MXC <GET ,HINTS 0>>
	<SET MXA <- .MXC 1>>
	<SCREEN ,S-TEXT>
	<CRLF>
	<REPEAT ()
     <COND (<EQUAL? .CNT <GET .H 1>>
  	        <RETURN>)
  	       (T
            <COND (<NOT <EQUAL? .CNT 2>>
                   <HINTS-LEFT <+ <- .MX .CNT> 1> .FLG .MXC .MXA>)>
  	        <TELL <GET .H .CNT> CR ;CR>
  	        <SET CNT <+ .CNT 1>>)>>
    <SET N <+ <- .MX .CNT> 1>>
    <COND (<0? .N>
           <SET FLG <>>
           <TELL ,ALL-DONE-HINTS>)
          (ELSE
           <HINTS-LEFT .N .FLG .MXC .MXA>)>
	<REPEAT ()
     <SET CHR <INPUT 1>>
     <COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
   	        <PUT .H 1 .CNT>
   	        <RETURN>)
   		   (<EQUAL? .CHR ,ESCAPE-KEY>
   		    <CONTINUE-STORY-HINTS>)
   	       (<AND .FLG <EQUAL? .CHR 13 10>>
   	        <COND (<NOT <G? .CNT .MX>>
   		           <SET FLG T>	;".cnt starts as 3" 
   		           <TELL <GET .H .CNT>>
   		           ;<CRLF> ;"extra CRLF removed by GARY"
   		           <CRLF>
   		           <SET CNT <+ .CNT 1>>
   		           <COND (<G? .CNT <+ .MX 1>>
   		   	              <SET FLG <>>
   		   	              <TELL ,ALL-DONE-HINTS>)>)>)
           (ELSE
            <AGAIN>)>
     <COND (<AND .FLG <G? .CNT .MX>>
   	        <SET FLG <>>
   	        <TELL ,ALL-DONE-HINTS>)
           (.FLG
   	        <SET N <+ <- .MX .CNT> 1>> ;"added +1 - Jeff"
            <HINTS-LEFT .N .FLG .MXC .MXA>
   	        ;<SET FLG <>>)>>>

<ROUTINE HINTS-LEFT (N FLG MXC MXA)
    <COND (<NOT <EQUAL? ,CHAPT-NUM .MXC .MXA>> ;"add cond-GARY" 
   	       <TELL N .N>)
          (ELSE
           <TELL !\->)>
    <TELL "> ">
    <COND (<AND <NOT <EQUAL? ,CHAPT-NUM .MXC .MXA>>
                <L? .N 10>
                .FLG>
   	       <TELL !\ >)> ;"Added spaces to keep everything even - MAXXY">

<ROUTINE PUT-UP-QUESTIONS ("AUX" (ST 1) MXQ MXL)
	<SET MXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
	<SET MXL <- <LOWCORE SCRV> 1>>
	<REPEAT ()
	 <COND (<G? .ST .MXQ>
	        <RETURN>)
	       (T                        ;"zeroth"
	        <CURSET <GET ,LINE-TABLE <- .ST 1>>
	 	       <- <GET ,COLUMN-TABLE <- .ST 1>> 1>>)>
	 <TELL " " <GET <GET <GET ,HINTS ,CHAPT-NUM> <+ .ST 1>> 2>>
	 <SET ST <+ .ST 1>>>>

<ROUTINE PUT-UP-CHAPTERS ("AUX" (ST 1) MXC MXL)
	<SET MXC <GET ,HINTS 0>>
	<SET MXL <- <LOWCORE SCRV> 1>>
	<REPEAT ()
	 <COND (<G? .ST .MXC>
	        <RETURN>)
	       (T                        ;"zeroth"
	        <CURSET <GET ,LINE-TABLE <- .ST 1>>
	 	       <- <GET ,COLUMN-TABLE <- .ST 1>> 1>>)>
	 <TELL " " <GET <GET ,HINTS .ST> 1>>
	 <SET ST <+ .ST 1>>>>

<ROUTINE INIT-HINT-SCREEN ("OPTIONAL" (THIRD T))
	;<SPLIT 0>
	<CLEAR -1>
	<SPLIT <- <GETB 0 32> 1>>
	<SCREEN ,S-WINDOW>
	<CURSET 1 1>
	<INVERSE-LINE>
	<CURSET 2 1>
	<INVERSE-LINE>
	<CURSET 3 1>
	<INVERSE-LINE>
	<CENTER-LINE 1 "INVISICLUES" %<LENGTH "INVISICLUES">>
	<LEFT-LINE 2 " N = Next">
	<RIGHT-LINE 2 "P = Previous" %<LENGTH "P = Previous">>
	<COND (<T? .THIRD>
	      <LEFT-LINE 3 " RETURN = See topics">
	      <RIGHT-LINE 3 "Q = Resume story" %<LENGTH "Q = Resume story">>)>>

<ROUTINE CENTER-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT ,D-TABLE-ON ,DIROUT-TBL>
	       <TELL .STR>
	       <DIROUT ,D-TABLE-OFF>
	       <SET LEN <GET ,DIROUT-TBL 0>>)>
	<CURSET .LN <+ </ <- <LOWCORE SCRH> .LEN> 2> 1>>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<ROUTINE LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CURSET .LN 1>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<ROUTINE RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT 3 ,DIROUT-TBL>
	       <TELL .STR>
	       <DIROUT -3>
	       <SET LEN <GET ,DIROUT-TBL 0>>)>
	<CURSET .LN <- <LOWCORE SCRH> .LEN>>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<GLOBAL DIROUT-TBL
	<TABLE 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >>

;"longest hint topic can be 17 questions long, longest question 36 characters"

<GLOBAL HINTS
	<PLTABLE
    	;"Table of chapters."
      	<PLTABLE 
       		"ON MAGRATHEA'S SURFACE"
			<LTABLE 3
				"Did I miss anything from the first game?"
				"Did you play it?"
				"If you didn't, go back and play it. There's no point living a life you haven't started."
				"That said, you started at the end last game."
				"Okay, not exactly. But you know what I mean.">
     		<LTABLE 3
	  			"Should I talk to Marvin?"
      			"Do you really think that's a good idea?"
				"This space has been intentionally left blank.">
			<LTABLE 3
				"How does the Kill-O-Zap gun work?"
				"It's remotely based."
				"That should be enough."
				"You don't know what that is? Pathetic!"
				"It essentially means you must think about what you want to do. For example, THINK ABOUT KILLING MARVIN."
				"Also, where did you get this gun idea from in the first place?">
	 		<LTABLE 3
				"What is the thing?"
				"Be specific."
				"Do you mean the blue frob or the Thing?"
				"If you mean the Thing (in the gown), go back and replay the first game properly."
				"Otherwise, continue."
				"The blue frob is important, probably."
				"Try consulting the Guide about it.">
			<LTABLE 3
				"Where did the Guide go? And what about my friends?"
				"Firstly, about the Guide."
				"How should that be anyone else's problem but your own?"
				"For your information, it's probably still on the ship."
				"Alright. Secondly, about your friends."
				"To be specific, they aren't actually your friends. They only keep you on the ship because..."
				"...who knows why? And they've left you here, haven't they?"
				"But yes, they returned to the ship. Didn't you read?"
				"SIDE NOTE: If you actually bothered to play around with objects,
you would have noticed that the Guide is inside your gown, which is in the Hatchway.">
			<LTABLE 3
				"So... what IS the blue frob?"
				"Try examining it."
				"There is a small ridge around the middle."
				"What could that mean?"
				"Use your senses, like in the Dark."
				"Did you really think tasting it or smelling it will work?"
				"Hopefully not."
				"Once you have gotten a satifying answer, you should be able to know almost immdiately what to do."
				"PULL APART THE BLUE FROB."
                "You won't need this yet. But it will be helpful later on.">
			<LTABLE 3
				"This crater... how do I get down it?"
				"You've died in it, have you?"
				"Think about the reason you died."
				"You died because you didn't have enough light. You tripped up and died."
				"Of course, you didn't know that, because you died before you could realise that. So how do you get light?"
				"Does this next quote make any sense to you?"
				"\"Here I am, brain the size of a planet...\""
				"Marvin can provide light."
				"Will he follow you?"
				"Apparently not."
				"Think about this in a different way. There's this weird radio you can see."
				"And the fact that it is playing happy music."
				"What about the plant on the ledge?">
			<LTABLE 3
				"What ABOUT the plant on the ledge?"
				"Well... what do you think?"
				"Have you even found it?"
				"No? Alright, I'll help you."
				"From the Blighted Ground, go SE. SW. DOWN. PICK PLANT."
				"Once you have it, what do you normally do with these kind of things?"
				"First, read the footnote."
				"Then, you need to EXAMINE THE PLANT."
				"Does this make sense to you?"
				"If so, LEAVE NOW."
				"OK, you're still here. Either you're just annoying, or absolutely useless."
				"PLUG THE PLANT INTO THE RADIO."
				"Well done.">>
		<PLTABLE
			"DARK"
			<LTABLE 3
				"I'm stuck in the Dark!"
				"You will need to wait."
				"It's not so hard. Just look around."
				"And don't be so sensitive about my jokes."
				"Try different things, like reading what it tells you."
				"One of the sense should disappear after a while."
				"Then try using that sense.">
			<LTABLE 3
				"I've been here multiple times, now. How do I leave the different senses?"
				"Each of the senses lead to different areas of the game."
				"Except taste."
				"Nobody likes taste, anyway."
				"Have you noticed how sometimes the sense response will differ?"
				"(SPOILERS AHEAD)"
				"If your sight returns to you, the description of the blur is different.
If you see a small black blur, you're going to Below Magrathea. Whereas if you see a large green
blur, you are returning to Milliways."
				"Either way, to leave the Dark from here, you need to TALK TO BLUR."
				"With hearing, if there is a \"noise reverberating\" in the Dark, you are going
to Dirk Gently's office; and if there is a \"sound echoing\" in the darkness around you, it will be
the Planetary Design Workshop."
				"You'll have to DROP THE THING that you have noticed in your hand."
				"With smell, you will end up in the Golgafrincham Ark B when you detect the \"sweet,
bubble bath\" - and at the Big Bang Burger Bar when you can smell something \"strong, like a barbecue\"."
				"You need to ENTER THE DARK ROOM when you arrive hear. (Get it?)"
				"And finally (with feeling), if there is a warm lump under your fingers, you are going to
the ship of the Morphers (you'll understand if you haven't already); and if the lump is cold you will
arrive at the Fjords of Norway."
				"This time, you must PUSH/FEEL LUMP.">>
		<PLTABLE
			"BELOW MAGRATHEA"
			<LTABLE 3
				"I just came out of the dark! What am I doing with these mice?"
				"Ask them."
				"ASK BENJY ABOUT THE POINT OF THE GAME. Or Percy.">
			<LTABLE 3
				"How do I stop being killed?"
				"At this point, you will need to distract the mice to get through. When the mice tell you to eat fruit,
try eating the fruit, or saying YES/OK."
				"Now, you can tell this doesn't work. So maybe refuse it, by saying NO."
				"The mice at this point are very confused, which may be good, depending on how you look at it."
				"Now you're being asked questions by either the mice or the computer."
				"Reply with one of the answers, trying to not disagree with yourself (you may die)."
				"There is one turn between each of the questions, where the mice are talking."
				"In this turn, you can begin escaping. Try OUT."
				"As you can tell, that doesn't work. Too much action in one turn. Try splitting it up into shorter moves."
				"OPEN DOOR."
				"Nope, it's electronic. Though you will note that there's an emergency exit button by the door."
				"PUSH BUTTON."
				"Still too much. You have to be subtle!"
				"Try GO TO THE EXIT. Then on the next free turn, PUSH THE BUTTON."
				"Then, on the final free turn, OUT.">
			<LTABLE 3
				"Now I'm behind the big computer. Any help?"
				"WAIT."
				"WAIT."
				"WAIT.">>
		<PLTABLE
			"MILLIWAYS"
			<LTABLE 3
				"Hooray! I'm finally at the Restaurant at the End of the Universe. Now what?"
				"Why don't you figure that out yourself?"
				"[This space intentionally left blank]">
			<LTABLE 3
				"Oh no! A first-class idiot!"
				"Yes."
				"If you're asking what to do about him, you might want to look around."
				"After some time, you may notice that he continually walks on one route, back and forth."
				"There's a door that he walks through which you aren't allowed to enter."
				"Specifically, the door to the Dining Hall - to the Second Class."
				"If you were thinking about the Car Park, you can try sneaking in after the idiot walks through. It won't work."
				"After the idiot goes through the second class access door, you can walk in."
				"That should be good.">
			<LTABLE 3
				"Oh no! A first class idiot! (continued)"
				"Only read this after you've entered either the Kitchen or the First-Class Area."
				"If you've read the descriptions of the first-class idiot when he passes through any of the doors, you'll notice
that he has a first-class access card. And when you try entering the Car Park, you need a high-level card."
				"So how do you get the card off of the idiot?"
				"If you try taking it, you're put off by his thretening looks."
				"So, you must get it when he's not looking."
				"Or, when he's not awake."
				"At this point, you should probably look at the section entitled IS THE KITCHEN USEFUL?"
				"After you've done that, you need to think (obviously). What can you use?"
				"Well, if you need to, you can ask the Guide about some of the objects there."
				"You should read up on Pan Galactic Gargle Blasters if you haven't already."
				"It says that it can knock someone out."
                "And make you wise if you survive."
                "But you can't drink it. (Your brain tells you not to.)"
                "So, try giving it to the idiot."
                "Nope, not working."
                "Have you noticed some glasses in the cupboard?"
                "Try pouring the Blaster into a glass."
                "Did you use the rum glass?"
                "If so, you'll realise that that's not proper waiter-behaviour."
                "You must use the wine glass."
                "(So you don't waste objects, you can always place the rum glass in to get the wine glass.)"
                "Try it now."
                "Then go to GETTING THE ACCESS CARD if you really don't understand.">
			<LTABLE 3
				"Is the Kitchen useful?"
				"If you've looked at the cupboard in the Kitchen, you should be able to tell that there are many objects you can get.
But if you try to take any of them, it won't let you."
				"And what about the head cook?"
				"Try asking him about the cupboards."
				"Well, according to him, you give it something to be distracted with, and then take whatever it has in store."
				"But you should be more specific than that."
				"So wait until there is something that you might need."
				"[This space intentionally left blank]">
            <LTABLE 3
                "Getting the first-class access card"
                "If you started off from the first-class idiot (continued), then you should be fine. Otherwise, try reading that first."
                "The Blaster isn't working. He won't accept it."
                "Have you noticed the wine bottle?"
                "He finishes the wine - no problem - if you just give him just wine."
                "But..."
                "If you pour the two in the same glass, the idiot will think it's wine (Blaster is clear), and he will drink it."
                "There you go.">
            <LTABLE 3
                "What do I do with the Policeman?"
                "KILL him?"
                "No, sorry. I just love sending you off on a mission like that."
                "He tells you to talk to him."
                "So talk to him."
                "Then you are told to sign your name on the phone."
                "So SIGN YOUR NAME ON THE PHONE."
                "Oops. You're not a registered guest. How could you become a registered guest?"
                "The Reception is empty, there's no way to register here."
                "Stuck? Well... Don't go on if you haven't been to the Abandoned Ship with the Morpher captain."
                "[...]"
                "See the Morpher Ship section if you're really stuck. Yes, I am annoying.">
            <LTABLE 3
                "When I diagnose myself, I'm apparently hungry. How do I fix that?"
                "Find some dinner."
                "What source could know the most about dinner (seeing as you're in Milliways, so dinner seems appropriate)?"
                "Yes, the Hitchhiker's Guide."
                "You know exactly what to get now."
                " **** EXTREME SPOLIERS AHEAD ****"
                "  - You can find the meat on the Golgafrincham Ark B"
                "  - The peanuts in the Planetary Design Workshop"
                "  - The water in the Kitchen (see How Do I Get Water?)"
                "  - Finally, the Pan Galactic Gargle Blaster, also in the
Kitchen (again, see another section - How Do I Safely Add the PGGB to the Meal?)">
            <LTABLE 3
                "How do I get water?"
                "There is a sink in the Kitchen of Milliways."
                "When you try to turn it on, there is not enough water, so you will have to try and fix it."
                "Underneath the sink are a tangle of pipes and bolts, etc. One the of the bolts are loose."
                "If you have been to the Planetary Design Workshop, then you should know if you have to restore or not."
                "If you picked up the wrench when you were there, you can turn the bolt with that."
                "Else, well... I'm sorry about that.">
            <LTABLE 3
                "How do I safely add the Pan Galactic Gargle Blaster to the meal?"
                "You should know from the Hitchhiker's Guide that you need specifically a spoonful."
                "During the game so far, have you noticed a utensil for that sort of thing?"
                "You should pour the Blaster with the sporfe (yes, I'm sorry, but I'm
not clever enough to be able to use three nouns), which is satisfying enough for me.">>
        <PLTABLE
            "MORPHER SHIP"
            <LTABLE 3
                "There's nothing here."
                "Yes there is."
                "Just go to the Bathroom (south-east from the Dorm).">
            <LTABLE 3
                "I keep getting killed by objects in the room that aren't even there!"
                "You must be a bit more cautious."
                "Try looking around a lot more.">
            <LTABLE 3
                "Alright, how do I catch this captain?"
                "Use the stun gun from the Junction."
                "Keep looking around and memorising the objects in each room."
                "If an object appears or changes, shoot it.">
            <LTABLE 3
                "Help! The captain got angry when I shot it and transformed into a giant sandcrab!"
                "You'll need to distract it long enough to kill it."
                "Sandcrabs are from the sea, right?"
                "It should like the tin of artichokes in the Galley."
                "Use the sporfe from the Interview Room to open it, because the sporfe is very sharp."
                "Don't forget to keep moving around to avoid the sandcrab."
                "Then drop the open tin in an open area like the Junction, hide in another room, and wait."
                "When the sandcrab \"begins clicking its claws\", run into the room and stab the crab with sporfe."
                "If only there was actually a crab. I don't even know the word \"crab\".">
            <LTABLE 3
                "What do I do with the auto-sign pen?"
                "It will be useful later."
                "When you return to Milliways, you will notice a police agent. Look at that section, then return here."
                "Good? Ok, You'll need to WRITE WITH PEN ON PHONE."
                "Now that the show has started, you can reach the Big Bang Burger Bar from the teleportation point."
                "It is also useful at the BBBB, so keep it in your possession.">>
		<PLTABLE
			"MISCELLANEOUS"
			<LTABLE 3
				"HOW ALL THE POINTS ARE SCORED"
				"This section should only be used as a last resort, or for your own interest after you've completed the game."
				"  SCORE   ACTION"
	  			;"     10   Pull apart the blue frob"
	  			"      5   Picking the clover"                                          ;D
	  			"     15   Getting Marvin to follow you"                                ;D
				"     10   Enter the Dark from Magrathea"                               ;D
				"     15   Leave the Dark (to Below Magrathea)"                         ;D
				"     20   Leave the 'Interview'"                                       ;D
				"     15   Escape the mice"                                             ;D
				"     15   Sneak into the 1st Class"                                    ;D
				"     20   Get the first-class access card"                             ;D
				"     25   Stun the Morpher Captain"                                    ;D
                "     15   Write the right name on the phone"                           ;D
                "     25   Speak the Philosophical Word"                                ;D
                "     20   Get the Red Rhombicosidodecahedron"                          ;D
				"     10   Get the Green Cube (frob of randomness)"                     ;D
				"     25   Leave the Golgafrincham Ark B"                               ;D
                "     25   Return from the Big Bang Burger Bar"                         ;D
                "     25   Escape your building as Dirk"                                
                "     15   Pour a spoonful of Pan Galactic Gargle Blaster into the meal";D
                "     25   Getting Clyde to open the safe"                              ;D
                "     25   Finishing making the meal"                                   ;D
                " 499975   Eating the meal (with a spoonful of PGGB in it)"             ;D
                "-499950   Gradually after eating the meal and becoming depressed"      ;D
                "     25   Escaping the Stunt Ship"                                     ;D
                "    400   TOTAL POINTS"
                "(Note: You get minus thirty points for asking Marvin about the point of life, or destroying your meal in the oven.)">
			<LTABLE 3
				"FOR YOUR AMUSEMENT"
				"You shouldn't develop anything in this section until you've finished the game. Things in the
section will invariably give away the answers to puzzles in the game."
				"Have you tried..."
				;"...to FIND WATER?"
				;"Or FIND ZAPHOD, FIND TRILLIAN and FIND FORD?"
				"hitting/kissing Marvin?"
				"asking Marvin about life, and then again? (you may want to save first...)"
                "checking your rank when you type SCORE (including when you have negative points)?"
                "Walking southeast or southwest from the ramp?"
				"CHANGE CHANNEL with the radio? And then again? (this could actually save your life...)"
                "giving the radio to Marvin once you're down in the Whale Crater, and looking around?"
                "trying to kill yourself with the sporfe?"
                "doing things to the bottles the mice are in?"
                "eating fruit?"
                "throwing the fruit at the mice?"
                "examining the painting?"
                "destroying the painting?"
                "drinking the Santrigiean Mineral Water?"
                "putting the Guide in the oven and then turning the oven on?"
                "attempting to swim in the water on the tray?"
                "COUNT THE KEYS (the keyset...)"
                "referring to Hotblack Desiato's Ship as STUNT SHIP?"
                "typing QWERTY?"
				"to SING? Or DANCE?"
				"typing WHY? Or WHAT?"
				"ANNIHALATE something?"
				"DON'T do something?"
                "Play in VERBOSE mode in some areas?"
                "Read the last words book in the PDW multiple times (if you haven't misspelled a single word)?"
                "SAY MRKUG before you've finished the Fjords course?"
                "STOP THE SHIP while inside the Stunt Ship?">
            <LTABLE 3
                "GUIDE ENTRIES"
                "Here's a complete list of things that you can CONSULT the Hitchhiker's Guide about.
You should use it only as a last resort, or for your interest once you've finished the game."
                "ADVICE"
                "ALCOHOL"
                "BABEL FISH"
                "BIG BANG BURGER BAR"
                "CRICKET"
                "DISASTER AREA"
                "EARTH"
                "FORD PREFECT"
                "FORTY-TWO"
                "FROBS"
                "GALACTIC SECURITY AGENCY"
                "GREAT UNANSWERED QUESTION"
                "GUIDANCE"
                "HEART OF GOLD"
                "HITCHHIKER'S GUIDE"
                "HOTBLACK DESIATO"
                "INTELLIGENCE"
                "JOO JANTA PERIL SENSITIVE SUNGLASSES"
                "KRIKKIT"
                "MAGRATHEA"
                "MARVIN"
                "MATTER TRANSFERENCE BEAMS"
                "MILLIWAYS"
                "PAN-GALACTIC GARGLE BLASTER"
                "PROTIEN"
                "RAVENOUS BUGBLATTER BEAST OF TRAAL"
                "SANTRIGINEAN MINERAL WATER"
                "SLARTIBARTFAST"
                "SPACE"
                "SPORFE"
                "TEA"
                "THE THEORY OF THEORIES"
                "TOWEL"
                "WHITE MICE"
                "WIKKIT KEY"
                "ZAPHOD BEEBLEBROX">
            <LTABLE 3
	            "FOOTNOTES"
	            "The section tells where each footnote is referenced in the
game. Once again, you shouldn't develop this section until you've finished."
	            "FN#   HOW TO GET IT"
	            "  1   Pick the plant on the Ledge"
	            "  2   Upon being sent to the Dark from Below Magrathea"
	            "  3   Play with the chatterbox until you get the number 12345"
	            "  4   Examine the snow lizard meat after asing the Ark B captain about it"
	            "  5   Looking at Footnote 3"
	            "  6   Type FOOTNOTE without any number"
	            "  7   Examine the portal in the Car Park"
	            "  8   After eating the dinner with Pan Galactic Gargle Blaster in it"
	            "  9   Looking at Footnote 5"
	            " 10   Cheating at the game by saying the Philosophical word in the
Fjords without being able to know it during this lifetime (in fact, cheating TWICE in a way)"
	            " 11   This footnote is not referenced"
	            " 12   Also not referenced"
	            " 13   ASK GUIDE ABOUT 42"
	            " 14   Reading the last words book in the PDW a few times"
	            " 15   ASK [something] ABOUT DIRK after you escape Dirk's building">>
		<PLTABLE
			"GENERAL COMMANDS"
			<LTABLE 3
				"MOVING AROUND ROOMS"
				"You can type commands such as GO NORTH( which can be simplified to N), SOUTH( simplified to S),
E( for EAST), and W( for WEST), Followed by the ENTER button. [Press ENTER to get another hint.]"
				"As well as UP, DOWN, IN & OUT."
				"And, NE(northeast), NW(northwest), SE(southeast), and SW(southwest)."
				"When you are stuck on where you can move, LOOK AROUND for some exits in the room description.|
[To return to the previous menu, press Q, or to return to playing the game, press the escape key.]">
			<LTABLE 3
				"ADDITIONAL COMMANDS"
				"Some helpful verbs you will need are..."
				"...I - for your INVENTORY..."
				"...L - to LOOK AROUND..."
				"...X [object] - EXAMINE [object]..."
				"...TAKE/DROP [object]..."
				"...SEARCH [object]..."
				"...PULL [object]..."
				"...ASK [person] ABOUT/FOR [object/subject]..."
				"...SMELL, FEEL, TASTE, LISTEN..."
				"...YES/NO (in response to a question by the computer, or a person)..."
				"...And other commands. (Once you are done with typing out your command, press ENTER to get the response.)|
To return to the previous menu, press Q, or to return to playing the game, press the escape key.">
			<LTABLE 3
				"EXAMPLE COMMANDS"
				"GO TO THE NORTH."
				"GO UP."
				"NE."
				"SOUTH."
				"TAKE MY GOWN."
				"TAKE EVERYTHING."
				"TAKE ALL BUT THE BLUE FROB."
				"SEARCH THE THING FROM MY AUNT."
				"HIT THE ALIEN WITH THE DOG BONE."
				"JUMP."
				"GO NORTH AND THEN EAST."
				"MARVIN, GO DOWN TO THE LEDGE. (this commands the character Marvin to go down to the ledge)"
				"YES."
				"KILL ME."
				"ASK ZAPHOD BEEBLEBROX FOR A PAN GALACTIC GARGLE BLASTER."
				"SHOOT THE BUTTON WITH THE KILL-O-ZAP GUN."
				"DONT WAIT."
				"TAKE THE DINNER, THE TOWEL AND THE FRUIT. TIE THE TOWEL AROUND MY HEAD. DROP THE FRUIT."
				"TAKE THE PLANT THEN EAT IT.">>>>