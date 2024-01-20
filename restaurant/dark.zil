"DARK for
        the Restaurant at the End of the Universe"



"DARK - taken directly from the first game and edited"
<GLOBAL MOUSE-PROB 100>

<GLOBAL REST-PROB 0>

<GLOBAL BBBB-PROB 0>

<GLOBAL DIRK-PROB 15>

<GLOBAL PDW-PROB 0>

<GLOBAL FJORD-PROB 0> ;"Usually 0 - just set DARK-FLAG directly when needed (like Bar), unless you've already entered the fjord."

<GLOBAL MORPH-PROB 60>

<GLOBAL ARK-PROB 15>


<GLOBAL FAIL-FJORD <>>

<GLOBAL DARK-COUNTER 0>

<GLOBAL DREAMING <>>

<GLOBAL DARK-FLAG <>>

<GLOBAL CURRENT-EXIT 0>

<GLOBAL DARK-CONTROLLED <>> ;"Controlled by the signing of the receipt"

<GLOBAL IMMOVABLE <>>

<GLOBAL DARK-ENTRANCES
	<PLTABLE
"You are disoriented. Blackness swims toward you like a shoal of eels who
have just seen something that eels like a lot..."
"Like fog rolling in off the ocean, a shroud of blackness billows toward
you. Unlike fog rolling in off the ocean, the blackness hits you like
a sixteen-tonne truck..." 
"A sudden blackout around you sends you reeling, pulling you forwards
into a pit of darkness so alarmingly empty it could have been death..."
"From the sea-torn grounds of the Bermuda Triangle on Earth to the pits
of Hell somewhere in your imagination, the dark is about as satisfying
as having a good, solid kick in the head.|
|Although the after effects of darkness make you wish you had chosen the kick...">>

<ROUTINE GO-TO-DARK ()
	<COND (,SCOREMAD
           <DEQUEUE I-LOSE-IT-EVERY-TURN>
           <SETG SCOREOUT 32>)>
    <COND (<IN? ,PLAYER ,CAR-PARK>
		   <TELL "You step through the matter transference portal." CR CR <PICK-ONE ,DARK-ENTRANCES>>
           ;<SIXCR> <CHANGE-PART 2>
		   ,DARK)
		  (ELSE
		   <COND (<IN? ,PLAYER ,WHALE-CRATER>
		   		  <MOVE ,PLANT ,MARVIN>
				  <MOVE ,RADIO ,MARVIN>
				  <FSET ,PLANT ,RADPLUGBIT>
				  <FCLEAR ,MARVIN ,ONBIT>
				  <FSET ,WHALE-CRATER ,SADRADIOBIT>
				  <MOVE ,MARVIN ,CAR-PARK>
				  <DEQUEUE I-RADIO>
				  <DEQUEUE I-MARVIN>
				  ;<SETG DARK-FLAG ,INTERVIEW-ROOM>
				  <SETG CURRENT-EXIT 0>
                  <FSET ,DARK ,SEENBIT>
                  <COND (,P-WALK-DIR
                         <TELL " Everything becomes" ,ELLIPSIS>
                         ;<SIXCR> <CHANGE-PART 2>
                         <RETURN ,DARK>)>)
		   		 (<EQUAL? ,HERE ,INTERVIEW-ROOM ,BEHIND-DEVICE>
		   		  <FSET ,INTERVIEW-ROOM ,SADRADIOBIT>
				  <DEQUEUE I-ASK-DEATH>
				  <DEQUEUE I-ASKED-NICELY>
                  <DEQUEUE I-WHATEVER-DEAD>
				  <DEQUEUE I-ASK-AGAIN>
                  <DEQUEUE I-MICE-CHASE>
				  <SETG KILL-NOW? <>>
				  <FCLEAR ,EMERGENCY-EXIT ,OPENBIT>)
				 (<IN? ,PLAYER ,ARK>
				  <FSET ,ARK ,SADRADIOBIT>
				  <MOVE ,ALARM ,LOCAL-GLOBALS>
				  <MOVE ,RED-LIGHT ,LOCAL-GLOBALS>
				  ;<DEQUEUE I-CRASH>)
				 (<EQUAL? <LOC ,PLAYER> ,ENTRY-HALL ,JUNCTION ;,GALLEY ;,PRES-BRIDGE ;,DORM ;,BATHROOM-SHIP>
				  <SETG S-ENTRY-HALL <>>
				  <FSET ,ENTRY-HALL ,SADRADIOBIT>
				  <SETG STUN-CHARGE 0>
				  <DEQUEUE I-MORPHER-CAPTAIN>
				  <MOVE ,MORPHER-CAPTAIN ,BATHROOM-SHIP>
				  <COND (<AND ,S-ENTRY-HALL
				  			  ,P-WALK-DIR
							  <IN? ,PLAYER ,ENTRY-HALL>>
						 ;<SETG REST-PROB 100>
						 <TELL " Everything becomes" ,ELLIPSIS>
						 ;<SIXCR> <CHANGE-PART 2>
				  		 <RETURN ,DARK>
                         <V-FOO> ;"Shouldn't reach this")>)
                 (<EQUAL? ,HERE ,GLACIER-1 ,TELEPAD>
                  <DEQUEUE I-FREEZE>
                  ;<DEQUEUE I-NORWAY-SET>
                  <DEQUEUE I-GLACIER-CRACK>
                  <FSET ,GLACIER-1 ,SADRADIOBIT>)
                 (<EQUAL? ,HERE ,PDW>
                  <DEQUEUE I-TURN-ON-MACHINE?>
                  <DEQUEUE I-DEVICE>
                  <FCLEAR ,TELEPORTER ,RADPLUGBIT>
                  <COND (<NOT <FSET? ,PDW ,SADRADIOBIT>>
                         <FCLEAR ,GLACIER-1 ,SADRADIOBIT>
                         <FSET ,PDW ,SADRADIOBIT>)>
                  <SETG PDW-PROB 0>)
                 (<EQUAL? ,HERE ,BAR ,DRESSING-ROOM-BBBB>
                  <DEQUEUE I-BIG-BANG>
                  <FSET ,BAR ,SADRADIOBIT>
                  <FSET ,DOOR-BAR ,VOWELBIT>
                  <PUTP ,DOOR-BAR ,P?SDESC "obscured door">)
                 (<EQUAL? ,HERE ,BOTTOM-OF-STAIRS ,OFFICE>
                  <SETG MY-NAME 0>
                  <REPLACE-ADJ?  ,PLAYER ,W?DIRK   ,W?ARTHUR>
                  <REPLACE-NOUN? ,PLAYER ,W?DIRK   ,W?ARTHUR>
                  <REPLACE-NOUN? ,PLAYER ,W?GENTLY ,W?DENT>
                  <PUTP ,OTHER-PLAYER ,P?SDESC "Dirk Gently">
                  <REPLACE-ADJ?  ,OTHER-PLAYER ,W?ARTHUR ,W?DIRK>
                  <REPLACE-NOUN? ,OTHER-PLAYER ,W?ARTHUR ,W?DIRK>
                  <REPLACE-NOUN? ,OTHER-PLAYER ,W?DENT   ,W?GENTLY>
                  ;<RESET-WINNER>
                  <DEQUEUE I-PHONE-RINGS>
                  <DEQUEUE I-END-PHONE>
                  <DEQUEUE I-END-OF-WORLD>
                  <FSET ,OFFICE ,SADRADIOBIT>
                  <TELL
"You swing open the wooden door, and a bright light hits
you so fast that you don't have time to close your eyes.">
                  <ROB ,PLAYER ,DINING-HALL>)>
		   <TELL " Everything becomes" ,ELLIPSIS>
		   ;<SIXCR> ;"Extra CRLFs?"
           ;<SIXCR> <CHANGE-PART 2>
		   <GOTO ,DARK>
		   <RFALSE>)>>

<ROOM DARK
      (LOC ROOMS)
      (SYNONYM SUNGLASSES GLASSES JANTA)
      (ADJECTIVE JOO JANTA PERIL SENSITIVE)
      (DESC "Dark")
      (FLAGS RLANDBIT ONBIT ;GUIDEBIT)
      (ACTION DARK-F)>

<ROUTINE DARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		    <PUTP ,PLAYER ,P?ACTION ,DARK-FUNCTION>
            <COND ;(<1? ,MY-NAME>
                   <ROB ,PLAYER ,RECEPTION>)
                  (ELSE
                   <ROB ,PLAYER ,DARK-OBJECT>)>
		    ;<FSET ,CONVERSATION ,INVISIBLE>
		    <SETG DREAMING <>>
		    <SETG LYING-DOWN <>>
		    <REPEAT ()
		     <COND (,DARK-FLAG
		            <RETURN>)>
		     <COND (<PROB ,REST-PROB>
		            <SETG REST-PROB 0>
		            <SETG DARK-FLAG ,RECEPTION>
		            <SETG CURRENT-EXIT 3>)
		           (<PROB ,MOUSE-PROB>
		            ;<V-FOO>
		            <SETG MOUSE-PROB 7>
		            <SETG REST-PROB 100>
		            <SETG DARK-FLAG ,INTERVIEW-ROOM>
		            <SETG CURRENT-EXIT 0>)
		           (<PROB ,BBBB-PROB>
		            ;<V-FOO>
		            <SETG DARK-FLAG ,BAR>
		            <SETG CURRENT-EXIT 6>)
                   (<PROB ,MORPH-PROB>
		            <COND (<NOT <EQUAL? ,MORPH-PROB 7>>
		     	           <SETG MORPH-PROB 7>
		     	           <SETG DIRK-PROB 33>
		     	           <SETG ARK-PROB 33>
		     	           <SETG PDW-PROB 33>)>
		            <SETG DARK-FLAG ,ENTRY-HALL>
		            <SETG CURRENT-EXIT 4>)
		           (<PROB ,DIRK-PROB>
		            <SETG DIRK-PROB 7>
		            <SETG DARK-FLAG ,OFFICE>
		            <SETG CURRENT-EXIT 2>)
		           (<PROB ,FJORD-PROB>
                    ;<V-FOO>
		            <SETG FJORD-PROB 7>
		            <SETG DARK-FLAG ,GLACIER-1>
		            <SETG CURRENT-EXIT 1>)
		           (<PROB ,PDW-PROB>
		            <SETG PDW-PROB 7>
		            <SETG DARK-FLAG ,PDW>
		            <SETG CURRENT-EXIT 5>)
		           (<PROB ,ARK-PROB>
		            <SETG ARK-PROB 7>
		            <SETG DARK-FLAG ,ARK>
		            <SETG CURRENT-EXIT 7>)>>
		    <IF-P-DEBUGGING-PARSER
             <COND (<T? ,P-DBUG>
                    <HLIGHT ,H-BOLD>
                    <TELL "(Set current exit to ">
                    <D-J ,DARK-FLAG>
                    <BOLDEN ".)|">)>>
            <COND (<NOT <EQUAL? ,DARK-FLAG ,RECEPTION>>
		   		   <SETG REST-PROB 100>)>
            <RFALSE>)
	       (<EQUAL? .RARG ,M-LOOK>
		    <RTRUE>)>>

<OBJECT DARK-OBJECT
	(LOC DARK)
	(DESC "darkness")
	(SYNONYM DARK DARKNESS NOTHING)
	(GENERIC DARK-G)
	(FLAGS NDESCBIT NARTICLEBIT DARKBIT)>

<OBJECT CLATTER
	(LOC LOCAL-GLOBALS)
	(DESC "odd clattering noise")
	(LDESC 0)
	(SYNONYM NOISE CLATTER)
	(ADJECTIVE ODD CLATTERING)
	(FLAGS NDESCBIT VOWELBIT)>

<OBJECT BLUR
	(LOC LOCAL-GLOBALS)
	(DESC "blur")
	(LDESC 0)
	(SYNONYM BLUR)
	(ADJECTIVE SMALL BIG GREEN)
	(FLAGS NDESCBIT PERSONBIT)>

<OBJECT WHITE-ROOM
	(LOC LOCAL-GLOBALS)
	(DESC "white room")
	(LDESC 0)
	(SYNONYM ROOM)
	(ADJECTIVE PEARLY WHITE CLEAN GREY ;GRAY)
	(FLAGS NDESCBIT)>

<OBJECT LUMP
	(LOC LOCAL-GLOBALS)
	(DESC "lump")
	(LDESC 0)
	(SYNONYM LUMP BUMP SWITCH)
	(ADJECTIVE COLD WARM FREEZING HOT)
	(FLAGS NDESCBIT)>

<OBJECT SMELL
	(LOC LOCAL-GLOBALS)
	(DESC "smell")
	(LDESC 0)
	(SYNONYM SMELL)
	(GENERIC SMELL)
	(FLAGS NDESCBIT)>

<OBJECT BUBBLE
	(LOC LOCAL-GLOBALS)
	(DESC "sweet, bubble-bath smell")
	(LDESC 0)
	(SYNONYM SMELL BUBBLE BATH)
	(ADJECTIVE SWEET)
	(FLAGS NDESCBIT)>

<OBJECT BARBECUE
	(LOC LOCAL-GLOBALS)
	(DESC "strong, barbecue smell")
	(LDESC 0)
	(SYNONYM SMELL BARBECUE BBQ)
	(ADJECTIVE STRONG)
	(FLAGS NDESCBIT)>

<OBJECT OTHER-THING
	(LOC LOCAL-GLOBALS)
	(DESC "thing")
	(LDESC 0)
	(SYNONYM THING AUNT)
	(ADJECTIVE THING BY MY)
    (GENERIC THING-G)
	(FLAGS NDESCBIT)>

<OBJECT DARKY-ROOM
	(LOC LOCAL-GLOBALS)
	(DESC "dark room further into the darkness")
	(LDESC 0)
	(SYNONYM ;DARK ROOM ;DARK DARKNESS)
	(ADJECTIVE FURTHER IN TO DARK DARKNESS ROOM)
    (GENERIC DARK-G)
	(FLAGS NDESCBIT)>

<ROUTINE DARK-FUNCTION ()
	 <COND (<VERB? QUIT RESTART RESTORE SCORE VERSION SAVE HELP
		       	   VERBOSE BRIEF SUPER-BRIEF SCRIPT UNSCRIPT UNDO>
		<>)
           ;(<VERB? P1 P2 P3 FJORDS DESIGN BBBB $LOC MOVEME>
        <>)
	       (,DONT-FLAG
		<SETG DONT-FLAG <>>
        <TELL "Stop being negative. You won't accomplish anything here." CR>
        <FUCKING-CLEAR>)
	       (<VERB? PANIC YELL>
		<TELL
"You yell as loudly as you can, but no sound emerges." CR>)
	       (<OR <VERB? RELAX>
		    <AND <VERB? ENJOY>
			 <EQUAL? ,PRSO ,DARK-OBJECT <>>>>
		<TELL
"You've already achieved a Negative State of Capability. You can't go further." CR>)
	       (<AND <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>
		     <VERB? LISTEN>
		     <EQUAL? ,PRSO ,DARK-OBJECT <>>
		     <MISSING?>>		
		<MOVE ,OTHER-THING ,PLAYER>
		<MOVE ,CLATTER ,HERE>
		<THIS-IS-IT ,OTHER-THING>
		<TELL
"Apparently, you can hear. There is an odd clattering ">
		<COND (<EQUAL? ,DARK-FLAG ,OFFICE>
			<TELL "noise ringing in the darkness around you">)
			  (ELSE
			<TELL "sound echoing around the darkness">)>
		<TELL
". You realise you are carrying the thing in your hand, and
quickly identify it as not being the source of the noise." CR>)
	       (<AND <VERB? DROP THROW THROW-AT THROW-THROUGH>
		         <EQUAL? ,PRSO ,OTHER-THING>
		         <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>
		         <IN? ,OTHER-THING ,PLAYER>>
		    <TELL
"It gives off a loud thunk, which startles you and jerks you to your senses.">
            <COND (<AND <EQUAL? ,DARK-FLAG ,PDW>
                        ,IMMOVABLE>
                   <TELL
" At that point, you realise that there is another noise you can hear.
That other noise is someone's voice - namely " D ,SLARTY "'s , who is
shaking you and telling you to wake up. You open your eyes just as you
remember what you were sent to do, and that you don't want to be here" ,ELLIPSIS>)
                  (ELSE
                   <TELL " You realise that you have found yourself in" ,ELLIPSIS CR>)>
		    <LEAVE-DARK>)
	       (<AND <OR <EQUAL? ,PRSO ,OTHER-THING ,CLATTER>
		             <EQUAL? ,PRSI ,OTHER-THING ,CLATTER>>
		         <NOT <AND <VERB? DROP>
		    	     		<EQUAL? ,PRSO ,OTHER-THING>>>>
		    <COND (<NOT <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>>
		           <>)
		          (<VERB? LISTEN>
		           <TELL "The clattering is all that can catch your attention." CR>)
                  (<AND <SEE-VERB?>
                        <EQUAL? ,OTHER-THING ,PRSO ,PRSI>>
		           <TELL "No, it's not "><THE-J ,THING T><TELL ", it's "><ITALICIZE "another"><TELL" thing." CR>)
		          (T
		           <>)>)
	       (<AND <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>
		         <VERB? EXAMINE LOOK>
		         <EQUAL? ,PRSO ,DARK-OBJECT ,BLUR <>>
		         <MISSING?>>
		    <TELL
"It isn't that dark. As your eyes accustom to the newfound light,
you notice the walls of the room you appear to be in. The walls
are a grey-ish colour. In front of you, a ">
		<MOVE ,BLUR ,HERE>
		<THIS-IS-IT ,BLUR>
		<MOVE ,WHITE-ROOM ,HERE>
		<COND (<EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM>
			<TELL "small black">
            <REPLACE-ADJ? ,BLUR ,W?GREEN ,W?BLACK>
			;<PUTP ,BLUR ,P?SDESC "small black blur">)
			  (ELSE
			<TELL "large green">
            <REPLACE-ADJ? ,BLUR ,W?BLACK ,W?GREEN>
			;<PUTP ,BLUR ,P?SDESC "large green blur">)>
		<TELL " blur looks at you disapprovingly." CR>)
	       (<AND <VISIBLE? ,BLUR>
             <OR <EQUAL? ,PRSO ,WHITE-ROOM ,BLUR>
		         <EQUAL? ,PRSI ,WHITE-ROOM ,BLUR>
                 <VERB? HELLO SAY>>
		     <NOT <VERB? WALK>>>
		<COND (<NOT <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>>
		       <CANT-SEE ,P-IT-OBJECT>)
		      (<OR <AND <VERB? TELL>
			  			<DOBJ? BLUR>>
				   <AND <VERB? HELLO>
			  			<EQUAL? ,PRSO ,BLUR ,ROOMS <> ,PLAYER>>
				   <AND <VERB? SAY>
				   		<EQUAL? ,PRSI <> ,ROOMS ,BLUR>>>
		       <TELL "The blur clears its throat and comes into focus, appearing in the shape of a w">
			   <COND (<EQUAL? ,DARK-FLAG ,RECEPTION>
					<TELL "aiter, who then walks off into the distance. Odd. A">)
			  		 (ELSE
					<TELL
"hite mouse, which is on the table next to you. You hear two tiny mouse paws clap twice, when a">)>
               <TELL " bright light illuminates the room, showing you to be in" ,ELLIPSIS>
		       <LEAVE-DARK>)>)
	       (<AND <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>
		     <VERB? RUB>
		     <EQUAL? ,PRSO ,DARK-OBJECT <>>
		     <MISSING?>>
		<MOVE ,LUMP ,HERE>
		<THIS-IS-IT ,LUMP>
		<TELL "There is something you can feel. Under your fingers is a ">
		<COND (<EQUAL? ,DARK-FLAG ,GLACIER-1>
		       <TELL "cold">)
		      (T
		       <TELL "warm">)>
		<TELL " lump." CR>)
	       (<AND <OR <DOBJ? LUMP>
			 <IOBJ? LUMP>>
		     <NOT <VERB? WALK>>>
		<COND (<NOT <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>>
		       <CANT-SEE ,LUMP>)
		      (<EQUAL? ,DARK-FLAG ,GLACIER-1>
		       <COND (<VERB? RUB PUSH>
			      <TELL
"Brrr! The lump is freezing! Your surroundings are brought to your
attention as you place your hand over the cold lump (now positively
identified as a chunk of ice), which is in the middle of a vast landscape" ,ELLIPSIS>
				  <LEAVE-DARK>)>)
		      (<EQUAL? ,DARK-FLAG ,ENTRY-HALL>
		       <COND (<VERB? EXAMINE RUB>
			          <TELL
"It seems warmish. Oh, and it's a little loose, it seems, like you could move it in some way." CR>)
			         (<VERB? PUSH MOVE>
			          <TELL
"The lump gives out a startling CLICK, and everything turns on, which lights up the" ,ELLIPSIS>
			          <LEAVE-DARK>)>)>)
	       (<AND <EQUAL? ,DARK-FLAG ,ARK ,BAR>
		     <VERB? SMELL>
		     <EQUAL? ,PRSO ,DARK-OBJECT <>>
		     <MISSING?>>
		;<MOVE ,SHADOW ,HERE>
		;<SETG P-IT-OBJECT ,SHADOW>
		<TELL "The smell is ">
		<COND (<EQUAL? ,DARK-FLAG ,ARK>
			   <THIS-IS-IT ,BUBBLE>
			   <MOVE ,BUBBLE ,HERE>
		       <TELL "sweet, like a bubble bath">)
		      (T
			   <THIS-IS-IT ,BARBECUE>
			   <MOVE ,BARBECUE ,HERE>
		       <TELL "strong, like a barbecue">)>
		<TELL". It trails off into what may be another room, further into the darkness." CR>
		<MOVE ,DARKY-ROOM ,HERE>)
	       (<AND <OR <EQUAL? ,PRSO ,BUBBLE ,BARBECUE ,DARKY-ROOM ,P?IN>
		    	     <EQUAL? ,PRSI ,BUBBLE ,BARBECUE ,DARKY-ROOM>>>
		    <COND (<NOT <EQUAL? ,DARK-FLAG ,ARK ,BAR>>
		           <CANT-SEE ,P-IT-OBJECT>)
		          (<VERB? EXAMINE RUB>
		           <TELL "You're trying to do that to "><THE-J ,P-IT-OBJECT <>><TELL !\? !\ >
		           <IMPOSSIBLE>)
		          (<VERB? SMELL>
		           <TELL "The smell is ">
		    	   <COND (<EQUAL? ,DARK-FLAG ,ARK>
		    	   	      <THIS-IS-IT ,BUBBLE>
		    	   	      <MOVE ,BUBBLE ,HERE>
		    	   	      <TELL "sweet, like a bubble bath">)
		    	   	     (T
		    	   	      <THIS-IS-IT ,BARBECUE>
		    	   	      <MOVE ,BARBECUE ,HERE>
		    	   	      <TELL "strong, like a barbecue">)>
		    	   <TELL ". It trails off into what may be another room, further into the darkness." CR>)
		          (<OR <VERB? WALK-TO BOARD THROUGH LEAP WALK CLIMB-ON THROUGH>
                       <AND <VERB? TAKE>
                            <NOUN-USED? ,BUBBLE ,W?BATH>>>
		    	  		<TELL "You walk forwards. ">
		    			<COND (<EQUAL? ,DARK-FLAG ,ARK>
		    				   <TELL
"The darkness flashes brightly, and you find yourself staring into the eyes of a rubber ducky" ,ELLIPSIS>)
						      (ELSE
						       <TELL
"The darkness plays backwards like a rewinding tape, and you
are pulled back to your feet, just in time to see the universe
unravel before your eyes in" ,ELLIPSIS !\  D ,BAR !\!>)>
					    <LEAVE-DARK>)
			  (T
		       <>)>)
	       (T
		    <SETG DARK-COUNTER <+ ,DARK-COUNTER 1>>
		    <COND (<AND ,DARK-CONTROLLED
                        ;<MISSING?>
                        <NOT ,IMMOVABLE>>
                   <SETG CURRENT-EXIT <+ ,CURRENT-EXIT 1>>
		           <COND (<EQUAL? ,CURRENT-EXIT 8>
		    	          <SETG CURRENT-EXIT 0>)>
		           <MOVE ,BLUR ,LOCAL-GLOBALS>
		           <MOVE ,WHITE-ROOM ,LOCAL-GLOBALS>
                   <MOVE ,BUBBLE ,LOCAL-GLOBALS>
                   <MOVE ,BARBECUE ,LOCAL-GLOBALS>
		           <MOVE ,DARKY-ROOM ,LOCAL-GLOBALS>
                   <MOVE ,LUMP ,LOCAL-GLOBALS>
                   <MOVE ,CLATTER ,LOCAL-GLOBALS>
                   <MOVE ,OTHER-THING ,LOCAL-GLOBALS>
                   <SETG DARK-FLAG <GET ,DARK-EXIT-TABLE ,CURRENT-EXIT>>
                   <COND (<OR <AND <EQUAL? ,DARK-FLAG ,GLACIER-1>
                                   <NOT <FSET? ,GLACIER-1 ,SADRADIOBIT>>>
                              <AND <EQUAL? ,DARK-FLAG ,PDW>
                                   <FSET? ,PDW ,SADRADIOBIT>>>
                          <SETG CURRENT-EXIT <+ ,CURRENT-EXIT 1>>
                          <SETG DARK-FLAG <GET ,DARK-EXIT-TABLE ,CURRENT-EXIT>>)>
                   <IF-P-DEBUGGING-PARSER
                    <COND (<T? ,P-DBUG>
                           <HLIGHT ,H-BOLD>
                           <TELL "(Set current exit to ">
                           <D-J ,DARK-FLAG>
                           <BOLDEN ".)|">)>>)>
		<COND (<VERB? LOOK>
		       <BOLDEN "Dark">
			   <CRLF>)>
		<COND (<PROB 25>
		       <DARK-ONE>
		       ;<FUCKING-CLEAR>)
		      (<PROB 33>
		       <DARK-TWO>
		       ;<FUCKING-CLEAR>)
		      (<PROB 50>
		       <DARK-THREE>
		       ;<FUCKING-CLEAR>)
		      (T
		       <DARK-FOUR>
		       ;<FUCKING-CLEAR>)>
		<COND (<EQUAL? ,DARK-COUNTER 18>
		       <TELL CR
"When will you come to your senses and solve this puzzle?" CR>)
		      (<EQUAL? ,DARK-COUNTER 33>
		       <TELL CR
"4 out of 5 sensitive people solve this puzzle right away." CR>)
		      (<EQUAL? ,DARK-COUNTER 48>
		       <TELL CR
"Don't count your senses before they hatch." CR>)
		      (<AND <EQUAL? ,DARK-COUNTER 63>
		            ;<EQUAL? ,DARK-FLAG ,ARK>>
		       <TELL CR "You need help!" CR>)
		      ;(T
		       <RTRUE>)>
		<RFATAL>)>>  

<CONSTANT DARK-EXIT-TABLE
	<PTABLE
	 INTERVIEW-ROOM ;VOGON
	 GLACIER-1 ;FORD
	 OFFICE ;TRILLIAN
	 RECEPTION ;HEART
	 ENTRY-HALL ;BEAST
	 PDW ;ZAPHOD
	 ARK ;FLEET
	 BAR ;WHALE>>

<ROUTINE MISSING? ()
	 <COND (<OR <AND ,DARK-CONTROLLED
                     <NOT ,IMMOVABLE>>
		        <G? ,DARK-COUNTER 4>>
		    <RTRUE>)
	       (T
		    <RFALSE>)>>

<ROUTINE DARK-ONE ()
	 <TELL "You can ">
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>>>
		<TELL "hear nothing, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,ARK ,BAR>>>
		<TELL "smell nothing, ">)>
	 <TELL "taste nothing, ">
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>>>
		<TELL "see nothing, ">)>
	 <COND (<NOT <AND <MISSING?>
			  <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>>>
		<TELL "feel nothing, ">)>
	 <TELL "and are not even certain who you are." CR>>

<ROUTINE DARK-TWO ()
	 <TELL "You can ">
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>>>
		<TELL "see nothing, ">)>
	 <COND (<NOT <AND <MISSING?>
			  <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>>>
		<TELL "feel nothing, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>>>
		<TELL "hear nothing, ">)>
	 <TELL "taste nothing, ">
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,ARK ,BAR>>>
		<TELL "smell nothing, ">)>
	 <TELL "and are not entirely certain who you are." CR>>

<ROUTINE DARK-THREE ()
	 <TELL ,NOPE>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>>>
		<TELL "hear anything, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>>>
		<TELL "see anything, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,ARK ,BAR>>>
		<TELL "smell anything, ">)>
	 <COND (<NOT <AND <MISSING?>
			  <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>>>
		<TELL "feel anything, ">)>
	 <TELL "or taste anything, and do not even know where you are
or who you are or how you got there." CR>>

<ROUTINE DARK-FOUR ()
	 <TELL "There's nothing you can taste, ">
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM ,RECEPTION>>>
		<TELL "nothing you can see, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,OFFICE ,PDW>>>
		<TELL "nothing you can hear, ">)>
	 <COND (<NOT <AND <MISSING?>
			  <EQUAL? ,DARK-FLAG ,ENTRY-HALL ,GLACIER-1>>>
		<TELL "nothing you can feel, ">)>
	 <COND (<NOT <AND <MISSING?>
		          <EQUAL? ,DARK-FLAG ,ARK ,BAR>>>
		<TELL "nothing you can smell, ">)>
	 <TELL "you do not even know who you are." CR>>

<ROUTINE LEAVE-DARK ()
	<SIXCR> ;"Extra CRLFs?"
	<PUTP ,PLAYER ,P?ACTION ,PLAYER-F>
	<SETG DARK-COUNTER 0>
	;<SETG LYING-COUNTER 0>
	;<SETG DARK-CONTROLLED <>>
    <COND (<NOT <EQUAL? ,DARK-FLAG ,OFFICE>>
           <ROB ,DARK-OBJECT ,PLAYER>)>
	;<COND (<NOT <EQUAL? ,DARK-FLAG ,ENTRY-BAY>>
			<MOVE ,MAIN-DRIVE ,LOCAL-GLOBALS>)>
	<COND (<EQUAL? ,DARK-FLAG ,RECEPTION>
		   <MOVE ,BLUR ,LOCAL-GLOBALS>
		   <MOVE ,WHITE-ROOM ,LOCAL-GLOBALS>
		   <QUEUE I-FIRST-CLASS-IDIOT 1>
           <FSET ,RECEPTION ,SEENBIT>
           <COND (<FSET? ,FORD ,SEENBIT>
                  <FSET ,DARK-OBJECT ,SADRADIOBIT>)
                 ;(ELSE
                  <INCREMENT-SCORE 15 T>)>
           ;<SIXCR> <CHANGE-PART 2 3>)
		  (<EQUAL? ,DARK-FLAG ,INTERVIEW-ROOM>
		   <MOVE ,BLUR ,LOCAL-GLOBALS>
		   <MOVE ,WHITE-ROOM ,LOCAL-GLOBALS>
           <COND (<NOT <FSET? ,INTERVIEW-ROOM ,SADRADIOBIT>>
                  <INCREMENT-SCORE 15 T>)>
		   <QUEUE I-ASK-DEATH 6>
           <QUEUE I-WHATEVER-DEAD 30>
           <FSET ,INTERVIEW-ROOM ,SEENBIT>
		   <SETG KILL-NOW? T>
           ;<SIXCR> <CHANGE-PART 9>)
		  (<EQUAL? ,DARK-FLAG ,ARK>
		   <MOVE ,BUBBLE ,LOCAL-GLOBALS>
		   <MOVE ,DARKY-ROOM ,LOCAL-GLOBALS>
		   ;<QUEUE I-CRASH -1>
           ;<SIXCR> <CHANGE-PART 2 7>)
		  (<EQUAL? ,DARK-FLAG ,ENTRY-HALL>
		   <MOVE ,LUMP ,LOCAL-GLOBALS>
           ;<SIXCR> <CHANGE-PART 2 4>)
		  (<EQUAL? ,DARK-FLAG ,GLACIER-1>
           <COND (<AND <NOT ,IMMOVABLE>
                       <NOT <FSET? ,GLACIER-1 ,SADRADIOBIT>>>
                  <V-FOO>)>
		   <COND (,FAIL-FJORD
                  <MOVE ,PLAYER ,FOO-ROOM>
                  <SETG HERE ,FOO-ROOM>
                  <TELL CR
"But no! The landscape is not what you are standing on - in fact, there
is nothing below you for another five miles or so. The chunk of ice which
you had noticed was on the side of a zeppelin directly beside you, which
you missed by approximately two metres." CR
"Reaching terminal velocity within a few seocnds, you crash into part of
the zeppelin and tumble. As you claw for a handhold, you find something
- a bar! And secure yourself." CR
"Now you just have to get out of this freezing cold" ,ELLIPSIS CR CR>
                  <BOLDEN "Zeppelin, hanging from the underside">
                  <CRLF>
                  <CRLF>
                  <FUCKING-CLEAR>
                  <RTRUE>)>
           <MOVE ,LUMP ,LOCAL-GLOBALS>
		   <QUEUE I-FREEZE -1>
		   <QUEUE I-GLACIER-CRACK -1>
           ;<QUEUE I-NORWAY-SET -1>
           <SETG FJORD-PROB 10>
           ;<SIXCR> <CHANGE-PART 9>)
          (<EQUAL? ,DARK-FLAG ,OFFICE>
           <MOVE ,CLATTER ,LOCAL-GLOBALS>
           <MOVE ,OTHER-THING ,LOCAL-GLOBALS>
           <SETG MY-NAME 1>
           <REPLACE-ADJ?  ,PLAYER ,W?ARTHUR ,W?DIRK>
           <REPLACE-NOUN? ,PLAYER ,W?ARTHUR ,W?DIRK>
           <REPLACE-NOUN? ,PLAYER ,W?DENT   ,W?GENTLY>
           <PUTP ,OTHER-PLAYER ,P?SDESC "Arthur Dent">
           <REPLACE-ADJ?  ,OTHER-PLAYER ,W?DIRK   ,W?ARTHUR>
           <REPLACE-NOUN? ,OTHER-PLAYER ,W?DIRK   ,W?ARTHUR>
           <REPLACE-NOUN? ,OTHER-PLAYER ,W?GENTLY ,W?DENT>
           ;<RESET-WINNER>
           <QUEUE I-END-OF-WORLD 28>
           <QUEUE I-PHONE-RINGS 6>
           ;<SIXCR> <CHANGE-PART 6>)
          (<EQUAL? ,DARK-FLAG ,PDW>
           <MOVE ,CLATTER ,LOCAL-GLOBALS>
           <MOVE ,OTHER-THING ,LOCAL-GLOBALS>
           <COND (<NOT <FSET? ,GLACIER-1 ,SADRADIOBIT>>
                  <QUEUE I-DEVICE 18>)
                 (ELSE
                  <FSET ,COMPUTER ,BADRADIOBIT>)>
           <QUEUE I-TURN-ON-MACHINE? -1>
           ;<SIXCR> <CHANGE-PART 1>)
          (<EQUAL? ,DARK-FLAG ,BAR>
           <MOVE ,DARKY-ROOM ,LOCAL-GLOBALS>
           <MOVE ,BARBECUE ,LOCAL-GLOBALS>
           <QUEUE I-BIG-BANG 15>
           ;<SIXCR> <CHANGE-PART 2 3>)>
    <SETG IMMOVABLE <>>
	<GOTO ,DARK-FLAG <>>
	<SETG DARK-FLAG <>>
	<ROB ,DARK ,LOCAL-GLOBALS>
	<MOVE ,DARK-OBJECT ,DARK>
    <FUCKING-CLEAR>
	<RTRUE>>