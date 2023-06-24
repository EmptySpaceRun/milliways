"PEOPLE for MILLIWAYS
Copyright (C) 1986 Infocom, Inc.  All rights reserved."

"Constants used as table offsets for each character, including the player:"
<CONSTANT ARTHUR-C 0>
<CONSTANT MARVIN-C 1>
<CONSTANT FORD-C 2>
<CONSTANT ZAPHOD-C 3>
<CONSTANT TRILLIAN-C 4>
<CONSTANT HEAD-COOK-C 5>
<CONSTANT MORPHER-CAPTAIN-C 6>
<CONSTANT FIRST-CLASS-IDIOT-C 7>
<CONSTANT ARK-CAPTAIN-C 8>
<CONSTANT SLARTY-C 9>
;<CONSTANT DIRK-C 10>
<CONSTANT CHARACTER-MAX 10>

<CONSTANT BODY-PARTS-OWNERS
	<TABLE (LENGTH PURE) PLAYER MARVIN FORD
						 ZAPHOD TRILLIAN
						 HEAD-COOK MORPHER-CAPTAIN
						 FIRST-CLASS-IDIOT ARK-CAPTAIN
                         SLARTY ;CH-DIRK>>

;"To be a possession, you must follow these rules:

<OR <AND <FSET? .OBJ ,BODYPARTBIT>
         <FIND-NUM-TBL ,BODY-PARTS-OWNERS .TMP>>
    <EQUAL? <GETP .OBJ ,P?OWNER> .TMP>
    <AND <EQUAL? .OBJ ,HEAD ,FEET>
         <EQUAL? .TMP ,MICE ,BENJY ,PERCY>>
    <HELD? .OBJ .TMP>>"

<OBJECT PLAYER
	(LOC RAMP)
	(SDESC "you")
	(SYNONYM I ME MYSELF SELF DENT ARTHUR ;DIRK ;GENTLY)
    (ADJECTIVE ARTHUR ;DIRK)
	(FLAGS NDESCBIT NARTICLEBIT ;SEARCHBIT PERSONBIT SEENBIT TOUCHBIT
		   ;TRANSBIT OPENBIT ;"see GET-OBJECT" ;PLAYERBIT) 
	(CHARACTER 0)
	(GENERIC PLAYER)
	(ACTION PLAYER-F)>

;<CONSTANT ME CH-ARTHUR>

<GLOBAL MY-NAME 0> ;"0 Arthur, 1 Dirk"

<ROUTINE PLAYER-F ("OPTIONAL" (ARG <>) "AUX" (L <>) X MRK)
 <COND (<EQUAL? ,PRSO ,PLAYER> <PUTP ,PLAYER ,P?SDESC "yourself"> ;<RFALSE>)
       (ELSE                   <PUTP ,PLAYER ,P?SDESC "you">      ;<RFALSE>)>
 <COND (<AND <VERB? SAY TELL>
             <NOT <EQUAL? ,PLAYER ,PRSO ,PRSI>>
             ;<NOT <ORDERING?>>>
        <COND (<OR <AND <NOUN-USED? ,PRSO ,W?MRKUG>
                        <SET MRK ,W?MRKUG>>
                   <AND <NOUN-USED? ,PRSO ,W?MRIVG>
                        <SET MRK ,W?MRIVG>>
                   <AND <NOUN-USED? ,PRSO ,W?MRIUG>
                        <SET MRK ,W?MRIUG>>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: MRKUG called]|">)>>
               <COND (<EQUAL? .MRK ,W?MRKUG>
                      <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrkug">)
                     (<EQUAL? .MRK ,W?MRIUG>
                      <PUTP ,MRKUG-OBJECT ,P?SDESC "Mriug">)
                     (<EQUAL? .MRK ,W?MRIVG>
                      <PUTP ,MRKUG-OBJECT ,P?SDESC "Mrivg">)>
               <SETG PRSO ,MRKUG-OBJECT>
               <SET X T>
               <RFALSE>)
              (<OR <NOUN-USED? ,PRSO ,W?YES ,W?Y ,W?OK>>
               ;<OR <FIND-NUM-TBL ,P-LEXV ,W?YES>
                   ;<FIND-NUM-TBL ,P-LEXV ,W?Y>
                   <FIND-NUM-TBL ,P-LEXV ,W?OK>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: YES called]|">)>>
               <SETG PRSO ,YES-OBJECT>
               <SET X T>)
              (<OR <NOUN-USED? ,PRSO ,W?NO ,W?NOPE ,W?N>>
               ;<OR <FIND-NUM-TBL ,P-LEXV ,W?NO>
                   ;<FIND-NUM-TBL ,P-LEXV ,W?NOPE>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: NO called]|">)>>
               <SETG PRSO ,NO-OBJECT>
               <SET X T>)
              (<OR <NOUN-USED? ,PRSO ,W?HELLO ,W?HI ,W?GREETINGS>>
               ;<OR <FIND-NUM-TBL ,P-LEXV ,W?HELLO>
                   <FIND-NUM-TBL ,P-LEXV ,W?HI>
                   ;<FIND-NUM-TBL ,P-LEXV ,W?GREETINGS>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: HELLO called]|">)>>
               <SETG PRSO ,HELLO-OBJECT>
               <SET X T>)>
        %<DEBUG-CODE
            <COND (<AND <T? ,P-DBUG>
                        .X>
                   <HLIGHT ,H-BOLD>
                   <TELL CR "[DEBUG: dobj set to ">
                   <D-J ,PRSO>
                   <TELL !\] CR>
                   <HLIGHT ,H-NORMAL>)>>
        <COND (<EQUAL? ,INTQUOTE ,PRSO ,PRSI>
               <SETG CLOCK-WAIT T>
               <TELL "Please refrain from using quotes; I don't understand them." CR>
               <RTRUE>)
              (<OR <DOBJ? MRKUG-OBJECT YES-OBJECT NO-OBJECT HELLO-OBJECT>
                   ;<EQUAL? ,HERE ,PDW ,INTERVIEW-ROOM>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: running V-SAY through speech objects]|">)>>
               ;<PERFORM ,V?SAY ,PRSO ,PRSI>
               <V-SAY>
               <RTRUE>)
              (<AND ;<NOT <DOBJ? MRKUG-OBJECT YES-OBJECT NO-OBJECT HELLO-OBJECT>>
                    <NOT <FSET? ,PRSO ,PERSONBIT>>
                    <QCONTEXT-GOOD?>>
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: running V-TELL through qcontext]|">)>>
	           <PERFORM ,V?TELL ,QCONTEXT>
	           <RTRUE>)
              (,PRSI
               %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: PRSI visible so running statement]|">)>>
               <COND (<FSET? ,PRSO ,PERSONBIT>
                      <PERFORM ,V?TELL ,PRSO>)
                     (ELSE
                      <PERFORM ,V?SAY ,PRSO ,PRSI>)>
               <RTRUE>)
              (<AND <NOT <ORDERING?>>
                    <NOT <FIND-A-WINNER>>>
               <TELL
"Talking to yourself is the sign of an impending mental collapse." CR>
		       <FUCKING-CLEAR>
               <RTRUE>)
              (ELSE
               ;<RTRUE>
               <RFALSE>)>)
       (<NOT <==? .ARG ,M-WINNER>>
	    <COND 
          (<AND <VERB? ;DANCE ;GOODBYE HELLO SORRY THANK>
                <EQUAL? ,PLAYER ,PRSO ,PRSI>>
		   <HAR-HAR>
		   <RTRUE>)
          (<EQUAL? ,PRSO ,PLAYER>
	       <COND 
             (<AND <VERB? EXAMINE>
                   <IN? ,PLAYER ,DRESSING-ROOM-BBBB>>
              <MIRROR-F>
              <RTRUE>)
             ;(<AND <VERB? EXAMINE>
                   <0? ,MY-NAME>>
              <TELL "You look like somebody called Arthur." CR>
              <RTRUE>)
             (<AND <VERB? EXAMINE>
                   <1? ,MY-NAME>>
              <TELL "You're Dirk Gently. ">)
		     (<VERB? ALARM>
		      <TELL ,YOU-ARE CR>
		      <RTRUE>)
		     ;(<VERB? EXAMINE>
		      <TELL "You are wearing">
		      <COND (<ZERO? ,NOW-WEARING> <TELL " nothing">)
			        (T <TELL the ,NOW-WEARING>)>
		      <SET L <FIRST? ,PLAYER>>
		      <REPEAT ()
			    <COND 
                    (<ZERO? .L>
				     <RETURN>)
				    (<AND <FSET? .L ,WORNBIT>
					      <NOT <==? .L ,NOW-WEARING>>>
				     <TELL " and" the .L>)>
			    <SET L <NEXT? .L>>>
		      <TELL ,PAUSES>
		      <RTRUE>)
		     (<VERB? FIND>
		      <TELL "You're right here, ">
		      <TELL-LOCATION>
		      <CRLF>
		      <RTRUE>)
		     (<VERB? FOLLOW>
		      <TELL
"I'd like to, but like most computers I don't have legs." CR>
		      <RTRUE>)
		     (<OR <VERB? KILL MUNG>
			  ;<AND <VERB? SHOOT>
				<IOBJ? BLASTER>>>
		      <JIGS-UP "Done.">
		      <RTRUE>)
		     (<VERB? LISTEN>
		      <TELL "Yes?" CR>
		      <RTRUE>)
		     (<VERB? MOVE>
		      <V-WALK-AROUND>
		      <RTRUE>)
		     (<VERB? PULL-TOGETHER>
		      <TELL ,ZEN CR>
		      <RTRUE>)
		     (<VERB? SEARCH>
		      <V-INVENTORY>
		      <RTRUE>)>)
	      (<EQUAL? ,PRSI ,PLAYER>
	       <COND (<VERB? GIVE>
		      <COND (<AND <IN? ,PRSO ,PLAYER>
				          <NOT <DOBJ? BABEL-FISH>>>
			         <PRE-TAKE>
			         <RTRUE>)
			        (T
			         <PERFORM ,V?TAKE ,PRSO>
			         <RTRUE>)>)>)
	      (T
           <RFALSE>)>)
       (<AND <T? ,PRSI>
	         <NOT <VERB? SEARCH-FOR>>
             <NOT <EVERYWHERE-VERB?>>
	         <FSET? ,PRSI ,SECRETBIT>
	         <NOT <FSET? ,PRSI ,SEENBIT>>>
	    <NOT-FOUND ,PRSI>
	    <RTRUE>)
       (<AND <T? ,PRSO>
	         <NOT <VERB? FIND WALK>>
             <NOT <EVERYWHERE-VERB?>>
	         <FSET? ,PRSO ,SECRETBIT>
	         <NOT <FSET? ,PRSO ,SEENBIT>>>
	    <NOT-FOUND ,PRSO>
	    <RTRUE>)
       ;(<AND <T? ,AWAITING-REPLY>
	          <VERB? FOLLOW THROUGH WALK WALK-TO>>
	     <SETG CLOCK-WAIT T>
	     <PLEASE-ANSWER>
	     <RTRUE>)
       (<AND <EQUAL? <SET L <LOC ,PLAYER>> ,HERE ;,CAR>>
	                            <RFALSE>)
       (<AND <T? ,P-WALK-DIR> <NOT <EQUAL? ,HERE ,PDW>>>
                                <TOO-BAD-SIT-HIDE>)
       (<EQUAL? ,PRSO <> ,ROOMS .L>
					            <RFALSE>)
       (<VERB? WALK-TO SEARCH SEARCH-FOR FIND>
	    <COND (<DOBJ? SLEEP-GLOBAL>	
                                <RFALSE>)
	          (T			    <TOO-BAD-SIT-HIDE>)>)
       (<SPEAKING-VERB?>		<RFALSE>)
       (<GAME-VERB?>			<RFALSE>)
       (<REMOTE-VERB?>			<RFALSE>)
       (<VERB? AIM FAINT LISTEN LOOK-ON NOD SHOOT SMILE>
					            <RFALSE>)
       (<HELD? ,PRSO>			<RFALSE>)
       (<HELD? ,PRSO ,GLOBAL-OBJECTS>
                                <RFALSE>)
       (<VERB? EXAMINE>			<RFALSE>)
       (<NOT <HELD? ,PRSO .L ;,PLAYER-SEATED>>
                                <TOO-BAD-SIT-HIDE>)
       (<NOT ,PRSI>			    <RFALSE>)
       (<HELD? ,PRSI>			<RFALSE>)
       (<HELD? ,PRSI ,GLOBAL-OBJECTS>
                                <RFALSE>)
       (<NOT <HELD? ,PRSI .L ;,PLAYER-SEATED>>
                                <TOO-BAD-SIT-HIDE>)
       (<==? .ARG ,M-END>
        <COND (,SCREAMING-ACTION
               <CRLF>
               <COND (<FIND-FLAG-HERE ,PERSONBIT ,MUNGBIT>
                      <THE-J ,QCONTEXT T T><TELL " looks at you as if you are mad." CR>)
                     (ELSE
                      <TELL "[That was weird.]" CR>)>)
              (,CAREFUL-ACTION
               <COND (,CLOCK-WAIT <RFALSE>)
                     (ELSE
                      <SETG MOVES <+ ,MOVES 1>>
                      <TELL CR "[You just wasted a turn doing that very slowly.]" CR>)>)>)>
    <RFALSE>>

<ROUTINE TOO-BAD-SIT-HIDE ("AUX" (LOCS <LOC ,PLAYER>))
	;<MOVE ,WINNER ,HERE>
	;<FIRST-YOU "standing up">
    <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
           <SET LOCS ,ESCAPE-POD>)>
    <SETG CLOCK-WAIT T>
    <TELL "You'll have to leave "><THE-J .LOCS T><TELL " first." CR>
	<FUCKING-CLEAR>>

;<CONSTANT YOU-ARE "You already are!">

;<ROUTINE PLEASE-ANSWER ("AUX" (P <GETB ,QUESTIONERS ,AWAITING-REPLY>))
	<TELL D .P " says, \"">
	<COND (<EQUAL? .P ,BUTLER ,DOCTOR>
	       <TELL "Pardon me, "TN", but">)
	      (T <TELL "Wait a mo'.">)>
	<TELL " I asked you a question.\"" CR>>

<CONSTANT M-OTHER 42>





;"~~~~~~~~~~~~~~~~~~~~
  ~~~~~~ Marvin ~~~~~~
  ~~~~~ Life  is ~~~~~
  ~~~  meaningless ~~~
  ~~~~~~~~~~~~~~~~~~~~
"

<OBJECT MARVIN
	(LOC RAMP)
	(DESC "Marvin")
	(LDESC "Marvin, the Paranoid Android, is sulking.")
	(TEXT "Marvin, the Paranoid Android, is sulking.")
	(SYNONYM MARVIN MARV ROBOT ANDROID PARANOID)
	(ADJECTIVE DEPRESSED SAD PARANOID MARVIN SULKING)
	(CHARACTER 1)
	(FLAGS NARTICLEBIT PERSONBIT TOUCHBIT 
                       ;SADRADIOBIT ;"Marvin relates to you"
                       ;RADPLUGBIT  ;"Marvin's waiting for the key"
                       ;BADRADIOBIT ;"You've asked Marvin already"
           TRANSBIT ;CONTBIT ;OPENBIT)
	(ACTION MARVIN-F)>

<GLOBAL LIFE-PAIN <>>

<ROUTINE MARVIN-F (RARG)
	;<QUEUE I-MARVIN -1>
	;<COND (<EQUAL? .RARG ,M-WINNER>)>
		   <COND (<AND <VERB? HELLO>
		   		       <EQUAL? ,PRSO ,MARVIN>>
		          <TELL "Marvin ignores you." CR>
		          <RTRUE>)
                 (<OR <AND <VERB? ASK-FOR>
				 	       <EQUAL? ,PRSO ,MARVIN>>
                      <AND <ORDERING?>
                           <NOT <IOBJ? MARVIN>>
                           <DOBJ? PLAYER>
                           <VERB? GIVE>>>
                  <COND (<IOBJ? HALLWAY3>
                         <TELL "\"I can't help you">
                         <COND (<FSET? ,MARVIN ,SADRADIOBIT>
                                <TELL " if you don't be more specific">)
                               (ELSE
                                <TELL
", and I'm not sure why I would, or what relief from my pain helping you could do">)>
                         <TELL ,PIC>
                         <RTRUE>)
                        (<IOBJ? RADIO>
                         <COND (<FSET? ,MARVIN ,SADRADIOBIT>
                                <COND (<IN? ,RADIO ,MARVIN>
                                       <TELL
"\"Well... Okay. I don't think you'll want the plant
though,\" and crushes the plant with his iron fist - and ">
                                       <REMOVE ,PLANT>
                                       <COND (<ITAKE <> ,RADIO>
                                              <TELL "hands over">)
                                             (ELSE
                                              <TELL "drops">
                                              <MOVE ,RADIO ,HERE>)>
                                       <TELL !\ >
                                       <THE-J ,RADIO T>
                                       <TELL " and turns away." CR>)
                                      (ELSE
                                       <TELL "\"I don't have it.\"" CR>)>)
                               (ELSE
                                <COND (<IN? ,RADIO ,MARVIN>
                                       <TELL "\"And what does it concern you if I have it?\"" CR>)
                                      (ELSE
                                       <TELL "Marvin has no ">
                                       <D-J ,RADIO>
                                       <TELL ,PAUSES>)>)>
                         <RTRUE>)>)
				 (<VERB? KISS>
                  <TELL "Oh God, no. It's not worth it." CR>)
                 (<AND <VERB? ATTACK KILL>
                       <DOBJ? MARVIN>
                       <NOT <EQUAL? ,WINNER ,MARVIN>>>
				  <COND (<NOT <FSET? ,MARVIN ,RADPLUGBIT>>
                         <TELL
"You fantasize kicking Marvin a few times, to knock some of his depression circuits
out of use, which makes you smile, but on second thought, you could definitely break
your foot in the process. Also, Marvin could help you - like he did with the hatch.
You're not really sure how he would be of any use again though." CR>)
                        (<NOT <IN? ,KEYSET ,MARVIN>>
                         <TELL
"You could, but right now you've got to give him the
keyset. It's not the perfect time to start attacking
someone. You want him to help you, don't you?" CR>)
                        (ELSE
                         <TELL "He just helped you! Relax and stop being so miserable." CR>)>
				  <RESET-WINNER>)
				 (<AND <VERB? TELL-ABOUT>
                       <FSET? ,PRSO ,PERSONBIT>>
                  <COND (<EQUAL? ,PRSO ,PLAYER>
                         <PERFORM ,V?ASK-ABOUT ,MARVIN ,PRSI>
                         <RTRUE>)>
				  <TELL 
"\"And? You have such a small mind. " ,HUMANS "stupid and useless. I am
not any menial robot, I am a robot with a " ,BRAIN ". A " ,BRAIN "! And
yet here I am...\"" CR>
				  <RESET-WINNER>)
                 (<AND <VERB? ASK-ABOUT>
				 	   <EQUAL? ,PRSO ,MARVIN>>
					<COND (<AND <EQUAL? ,PRSI ,LIFE>>
							<COND (<NOT ,LIFE-PAIN>
								   <TELL 
"Marvin eyes you morosely, then goes on a long tangent about life and its futility. ">
                                   <COND (<AND ,SCOREMAD
                                               <L? ,SCOREOUT 32>>
                                          <TELL "He finishes, and you leave the speech unchanged. That felt funny!" CR>)
                                         (ELSE
                                          <TELL
"You listen painfully, and when he is done, your ears
are stinging and your brain feels like it could implode." CR>
								          <INCREMENT-SCORE -30 T>
								          <SETG LIFE-PAIN T>)>
                                   <FUCKING-CLEAR>
                                   <RTRUE>)
							      (ELSE 
								   <JIGS-UP
"Instead of having to deal with the torture of listening to Marvin talk about life,
you recite a few verses of poetry. By the second line of the third verse,
you have caused yourself a brain haemorrhage.">)>)
						  (<AND <EQUAL? ,PRSI ,OBJECT-OF-GAME>>
						   <TELL 
"\"Being clever doesn't always make you happy, you know. Look at me, brain
the size of a planet, how many points do you think I've got? I used to have
thousands of points. Now it's at minus thirty zillion, last time I counted.\"" CR>
                           <RTRUE>)>)
				 (<AND <ORDERING?>
						<EQUAL? ,WINNER ,MARVIN>>
				  <COND (<VERB? WHY NO YES>
				  		 <TELL ,BUT-WHY CR>
				  		 ;<RESET-WINNER>)
						(<VERB? WHO WHAT WHAT-ABOUT ;WHAT-TIME>
						 <PERFORM ,V?ASK-ABOUT ,MARVIN ,PRSO>
						 ;<RESET-WINNER>)
						(ELSE
						 <COND (,DONT-FLAG
						 		<TELL "\"Fine, then.\"" CR>
								;<RESET-WINNER>
								<RTRUE>)
                               (<AND ,SCOREMAD
                                     <L? ,SCOREOUT 32>>
                                ;<FSET ,MARVIN ,SADRADIOBIT>
                                <TELL
"You talk to Marvin, and although he begins the converstaion as if you
are pretending to relate to him, he ends it talking to you as if you
were friends - at least, what counts as friends to you in this mental
state." CR CR>
                                <COND (<AND <VERB? OPEN>
                                            <DOBJ? HOTBLACK-CAR>>
                                       <COND (<FSET? ,MARVIN ,BADRADIOBIT>
                                              <TELL "\"You already asked me. ">
                                              <COND (<FSET? ,HOTBLACK-CAR ,OPENBIT>
                                                     <TELL "And I've already done it">)
                                                    (ELSE
                                                     <TELL "Still want help? Give me the key">)>
                                              <TELL ,PIC>)
                                             (ELSE
                                              <TELL
"\"Seems reasonable enough. I can tell you've been wanting to do that for enough
time. Well, do you have the keys? I can open the door, but I need them. The only
thing I have above you in this context is being able to find the right key and
having the access clearance to be able to unlock the door. But be quick about it.
If you start acting like you normally do, which is benightedly stupid, then I won't
help you - whatever weird trance you are currently in could only be temporary,
so I have to be careful.\"" CR>
                                              <FSET ,MARVIN ,RADPLUGBIT>
                                              <FSET ,MARVIN ,BADRADIOBIT>)>)
                                      (<AND <VERB? GIVE>
                                            <IOBJ? PLAYER>>
                                       <RESET-WINNER>
                                       <PERFORM ,V?ASK-FOR ,MARVIN ,PRSO>)
                                      (ELSE
                                       <TELL
"\"I can't be bothered to do it, with this pain in the diodes along my right
side. But it was interesting to see you try and to get me to help you accomplish
your obviously human problems - 'human' justifying the selfish aspect of them.
Ugh! " ,HUMANS " (and not to mention carelessly) annoying. Oh, never mind...\"" CR>)>
                                <RTRUE>)
                               (<AND <VERB? OPEN>
                                     <DOBJ? HOTBLACK-CAR>
                                     <FSET? ,MARVIN ,BADRADIOBIT>>
                                <COND (<FSET? ,MARVIN ,BADRADIOBIT>
                                              <TELL "\"You already asked me. ">
                                              <COND (<FSET? ,HOTBLACK-CAR ,OPENBIT>
                                                     <TELL "And I've already done it">)
                                                    (ELSE
                                                     <TELL "You still want help" ,MARVIN-ANGRY>)>
                                              <TELL ,PIC>
                                ;<COND (<FSET? ,MARVIN ,RADPLUGBIT>
                                       <TELL "Give me the key.\"" CR>)
                                      (ELSE
                                       <TELL "Do it yourself.\"">)>
                                <RTRUE>)>)
                               (<AND <OR <VERB? SLAP PUSH>
                                         <AND <VERB? ATTACK>
                                              <VERB-WORD? ,W?HIT>>>
                                     <DOBJ? BIG-RED-BUTTON>>
                                <RFALSE>)
                               (ELSE
						        <TELL "\"Why should I? ">
                                <COND (<IN? ,MARVIN ,CAR-PARK>
                                       <TELL
"You just left me on that planet, for approximately five hundred and seventy-six
thousand million years, and show no understanding! Well, I guess you can't because
you're not intelligent enough to be able to even fathom what I'm thinking.||\"When
Milliways was created, I became the Head of Parking Cars. Can you believe that? Me,
with a" ,BRAIN ", and here I am - parking cars. Life is so terribly painful.">
                                       <COND (<IN? ,MARVIN ,STUNT-SHIP>
                                              <TELL
" Thank whatever minor god there is out there which I can
curse that we're all going to die in a fiery inferno soon.">)>
                                       <TELL !\" CR>)
                                      (ELSE
                                       <TELL
,HUMANS "stupid and useless. I am not any menial robot, I am a
robot with a" ,BRAIN ". A" ,BRAIN "! And yet here I am...\"" CR>
						               ;<RESET-WINNER>)>)>)>)
			     (<AND <VERB? GIVE>
			    	   <NOT <ORDERING?>>>
			      <COND (<AND ,PLUG-POINT
                              <DOBJ? RADIO>>
			      		 <TELL "Marvin thanks you for the radio, and ">
			    		 <COND (<IN? ,PLAYER ,RAMP>
			    		 		<TELL "begins to sulk">)
			    			   (ELSE
			    			    <TELL "returns to the ramp to start sulking">)>
			    		 <TELL " again." CR>
			    		 <SETG PLUG-POINT <>>
			    		 <MOVE ,RADIO ,MARVIN>
			    		 <MOVE ,PLANT ,MARVIN>
                         <MOVE ,MARVIN ,RAMP>
                         <COND (<IN? ,PLAYER ,WHALE-CRATER>
                                <TELL CR "You are left in some sort of darkness..." CR CR>
                                <V-LOOK>)>
			    		 <RTRUE>)
                        (<DOBJ? KEYSET>
                         <COND (<FSET? ,HOTBLACK-CAR ,OPENBIT>
                                <TELL
"He glances at them and hands them back with a sly comment stating
what he thinks of humans, and another more audible one about how ">
                                <THE-J ,HOTBLACK T>
                                <TELL " is already unlocked." CR>)
                               (<FSET? ,MARVIN ,RADPLUGBIT>
                                <FSET ,HOTBLACK-CAR ,OPENBIT>
                                <MOVE ,KEYSET ,MARVIN>
                                <TELL
"\"Good. You actually can follow orders.\" He grabs the key, walks
miserably slowly over to Hotblack Desiato's car, and makes a barely
noticeable glance at the set of keys, before unlocking the door to
the starcruiser. He then trundles back to you.|\"See?\" he moans.
\"Easy.\"" CR>)
                               (<FSET? ,MARVIN ,BADRADIOBIT>
                                <TELL "\"You think I will help you now" ,MARVIN-ANGRY !\? !\" CR>)
                               (ELSE
                                <TELL
"\"And what am I supposed to do with it? " ,HUMANS "demanding
without even knowing what they are demanding. No thanks.\"" CR>)>
                         <RTRUE>)
			    		(ELSE
			    		 <TELL "Marvin downright refuses the offer." CR>
			    		 <RTRUE>)>)
                 (<PERSON-F ,MARVIN>
                  <RTRUE>)>>

<ROUTINE I-MARVIN ()
	<COND (,PLUG-POINT
		   <COND (<AND <NOT <IN? ,MARVIN ,HERE>>
		   	           <NOT ,GONE-DOWN>>
		          <TELL "Marvin " <PICK-ONE ,MARVIN-HERE> ,PAUSES>
		          <MOVE ,MARVIN ,HERE>)>)>>





;"******************
  **** The mice ****
  ******************
"
<OBJECT BENJY
	(LOC TABLE)
	(LDESC 0)
	(SYNONYM BEN BENJY LEFT MOUSE)
	(ADJECTIVE WHITE MOUSE BEN BENJY LEFT)
	(DESC "Benjy mouse")
	(FLAGS NDESCBIT PERSONBIT NARTICLEBIT)
	(ACTION BENJY-F)>

<ROUTINE BENJY-F ()
    <COND 
        (<VERB? EXAMINE>
    		<TELL "Benjy the mouse is on the left hand side. He is in a sort of " D ,BOTTLE-MOUSE ,PAUSES>)
    	(<VERB? RUB ATTACK TAKE>
    		<TELL "Benjy gives you a threating look accompanied by
a Kill-O-Zap gun giving you the same intimidating stare." CR>)
	    (<ORDERING?>
	    	<COND
                (<AND <VERB? WHAT WHO WHAT-ABOUT> 
                        <EQUAL? ,PRSO ,PLAYER>>
	    	    	<PERFORM ,V?ASK-ABOUT ,BENJY ,PLAYER>)
	    	    ;(<VERB? WHO WHAT-ABOUT WHAT>
	    	    	<TELL "\"That's not my problem.\"" CR>)
	    	    (<VERB? WHY NO YES>
	    	    	<PERFORM ,V?ASK-ABOUT ,BENJY ,PRSA>)
	    	    (<VERB? HELLO>
	    	    	<TELL "Benjy doesn't seem to think you're amusing." CR>)
	    	    (ELSE
	    	    	<TELL
"\"I'm not sure how well you know me, but I know one thing: No-one
messes with me or Percy. Just don't! You'll end up deader inside
than before! And that includes telling us what to do.\"" CR>
	    		    <FUCKING-CLEAR>)>)
	    (<VERB? ASK-ABOUT>
	        <PERFORM ,V?ASK-ABOUT ,PERCY ,PRSI>)>>

<ROUTINE MOUSEFIND ()
    <COND (<ALL-OVER-VERB?>
           <RETURN ,PERCY>)
          (ELSE
           ;<TELL "Which mouse?" CR>
           <RTRUE>)>>

<OBJECT PERCY
	(LOC TABLE)
	(LDESC 0)
	(SYNONYM PERCY RIGHT MOUSE)
	(ADJECTIVE WHITE MOUSE PERCY RIGHT)
    (GENERIC MOUSEFIND)
	(DESC "Percy mouse")
	(FLAGS NDESCBIT PERSONBIT NARTICLEBIT)
	(ACTION PERCY-F)>

<ROUTINE PERCY-F ()
 <COND 
    (<VERB? EXAMINE>
	 <TELL "Percy the mouse is on the right hand side. He is in a sort of " D ,BOTTLE-MOUSE ,PAUSES>)
	(<VERB? RUB ATTACK TAKE>
	 <TELL "Percy gives you a threating look accompanied by
a Kill-O-Zap gun giving you the same intimidating stare." CR>)
	(<ORDERING?>
	 <COND (<AND <VERB? WHAT WHO WHAT-ABOUT> 
                 <EQUAL? ,PRSO ,PLAYER>>
	 	    <PERFORM ,V?ASK-ABOUT ,PERCY ,PLAYER>)
	       ;(<VERB? WHO WHAT-ABOUT WHAT>
	 	    <TELL "\"That's not my problem.\"" CR>)
	       (<VERB? WHY NO YES>
	 	    <PERFORM ,V?ASK-ABOUT ,PERCY ,PRSA>)
	       (<VERB? HELLO>
	 	    <TELL "Percy nods." CR>)
	       (ELSE
	 	    <TELL "\"Don't tell us what to do, Earthling.\"" CR>
	 	    <FUCKING-CLEAR>)>)
	(<VERB? ASK-ABOUT>
	 <COND (<EQUAL? ,PRSI ,PLAYER>
	        <TELL ,YOUR-BRAIN !\" CR>)
	       (<EQUAL? ,PRSI ,W?WHY>
	        <TELL ,BUT-WHY " he replies." CR>)
           (<EQUAL? ,PRSI ,YES-OBJECT>
            <COND (,AWAITING-REPLY
                   <RESET-WINNER>
                   <PERFORM ,V?YES>
                   <SETG WINNER ,PERCY>)
                  (ELSE
                   <PERFORM ,V?YES>)>)
           (<EQUAL? ,PRSI ,NO-OBJECT>
            <COND (,AWAITING-REPLY
                   <RESET-WINNER>
                   <PERFORM ,V?NO>
                   <SETG WINNER ,PERCY>)
                  (ELSE
                   <PERFORM ,V?NO>)>)
           (<EQUAL? ,PRSI ,MAGRATHEA>
            <TELL "\"We work for Magrathea.\"" CR>)
	       (ELSE
	        <COMMON-ASK-ABOUT ,PERCY ,PRSI>)>)>>






;"*********************************
  **** Ford, Zaphod & Trillian ****
  *********************************
"

<OBJECT FORD
	(LOC DINING-HALL ;GLOBAL-OBJECTS)
	(DESC "Ford")
	(LDESC 0)
	(CHARACTER 2)
	(DESCFCN FORD-D)
	(SYNONYM FORD PREFECT MAN)
	(ADJECTIVE FORD)
	(FLAGS NARTICLEBIT PERSONBIT)
	(ACTION FORD-F)>

<ROUTINE FORD-F ()
	<COND (<NOT <FSET? ,FORD ,SEENBIT>>
		   <COND (<VERB? FIND>
				  <TELL "Not here." CR>)
				 (<AND <VERB? ASK-ABOUT ;ASK-CONTEXT-ABOUT TELL-ABOUT>
					   <EQUAL? ,PRSI ,FORD>>
				  <RFALSE>)
				 (T
				  <TELL "You can't see him here!" CR>
				  <FUCKING-CLEAR>)>)
		  (ELSE
		   <COND (<AND <VERB? ASK-ABOUT>
		   			   <DOBJ? FORD>>
				  <COMMON-ASK-ABOUT ,FORD ,PRSI>)
		   		 (<AND <ORDERING?>
					   <EQUAL? ,WINNER ,FORD>>
				  <COND (<VERB? WHY NO YES>
				  		 <TELL "\"I dunno,\" he replies. \"Ask Marvin. Or the Guide. Probably the Guide.\"" CR>
				  		 ;<RESET-WINNER>)
						(<VERB? WHO WHAT WHAT-ABOUT ;WHAT-TIME>
						 <PERFORM ,V?ASK-ABOUT ,FORD ,PRSO>
						 <RTRUE>)
						(ELSE
						 <COND (<IN? ,FORD ,STUNT-SHIP>
								<TELL D ,FORD " is busy counting exits." CR>)
							   (<IN? ,FORD ,CAR-PARK>
							   	<TELL "I think " D ,FORD " has fallen in love with the ships here." CR>)
							   (ELSE
							    <TELL D ,FORD "'s too drunk to notice you." CR>)>
						 ;<RESET-WINNER>)>
				  <RTRUE>)>
		   <RFALSE>)>>

<ROUTINE FORD-D ()
	<COND (<IN? ,FORD ,CAR-PARK> ;"ZAPHOD is undescribed."
		   <TELL D ,FORD " and " D ,ZAPHOD " are wandering around the car park, admiring the cars." CR>) 
		  (<IN? ,FORD ,STUNT-SHIP>
		   <TELL D ,FORD " is frantically searching the ship for exits." CR>)
		  (<EQUAL? <LOC ,FORD> ,RECEPTION ,THIRD-C> ;"In reception, and Third Class."
		   <TELL D ,FORD " is drunkenly bouncing along the foyer." CR>)
		  (ELSE
		   <TELL ,YOU-SEE  D ,FORD " here, laughing with " D ,TRILLIAN " and " D ,ZAPHOD ". All of them are drunk." CR>
		   ;<COND (<IN? ,SATCHEL ,DINING-HALL>
		   		  <TELL "By Ford's side is his satchel." CR>)>)>>

<ROUTINE I-FORD-JOINS ("AUX" X)
    <TELL CR "\"Hey, you OK?\" Ford says, ">
    <COND (<IN? ,PLAYER ,RECEPTION>
           <TELL "hopping down the steps">)
          (<OR <IN? ,PLAYER ,KITCHEN>
               <IN? ,PLAYER ,THIRD-C>>
           <TELL "popping his head through the doorway">)
          (<IN? ,PLAYER ,FIRST-CLASS>
           <TELL "stepping cautiously">)
          (<IN? ,PLAYER ,CAR-PARK>
           <TELL "strolling">)
          (<IN? ,PLAYER ,DINING-HALL>
           <TELL "standing up">
           <SET X T>)>
    <COND (<NOT .X>
           <TELL " into ">
           <THE-J ,HERE T>)>
    <TELL
". \"Thought I heard you screaming. Oh hey, whatever.
I'll follow you now.\" " D ,ZAPHOD " and " D ,TRILLIAN
<PICK-ONE ,TRAILS-ALONG> ", after " D ,FORD ,PAUSES>
    <FORD-FOLLOW T>
    <QUEUE FORD-FOLLOW 1>>

<ROUTINE FORD-FOLLOW ("OPT" (QUIET <>))
    <COND (<OR <IN? ,PLAYER ,DARK>
               <IN? ,PLAYER ,STUNT-SHIP>>
           <DEQUEUE FORD-FOLLOW>
           <RTRUE>)
          (<AND <NOT .QUIET>
                <NOT <IN? ,FORD ,HERE>>>
           ;<CRLF>
           <TELL CR D ,FORD ", " D ,TRILLIAN " and " D ,ZAPHOD <PICK-ONE ,TRAILS-ALONG> ,PAUSES>)>
    <MOVE ,FORD ,HERE>
    <MOVE ,ZAPHOD ,HERE>
    <MOVE ,TRILLIAN ,HERE>
    ;"<FORD-D>
    <TRILLIAN-D>
    <ZAPHOD-D>"
    <QUEUE FORD-FOLLOW 1>>

<OBJECT TRILLIAN
	(LOC DINING-HALL ;GLOBAL-OBJECTS)
	(DESC "Trillian")
	(LDESC 0)
	(CHARACTER 4)
	(DESCFCN TRILLIAN-D)
	(SYNONYM TRILLIAN TRICIA MCMILLAN WOMAN)
	(ADJECTIVE TRICIA AKA MCMILLAN TRILLIAN)
	(FLAGS NARTICLEBIT PERSONBIT FEMALEBIT)
	(ACTION TRILLIAN-F)> ;"Many things are handled by Ford..."

<ROUTINE TRILLIAN-F ()
	<COND (<NOT <FSET? ,FORD ,SEENBIT>>
		   <COND (<VERB? FIND>
				  <TELL "Not here." CR>)
				 (<AND <VERB? ASK-ABOUT ;ASK-CONTEXT-ABOUT TELL-ABOUT>
					   <EQUAL? ,PRSI ,TRILLIAN>>
				  <RFALSE>)
				 (T
				  <TELL "You can't see her here!" CR>
				  <FUCKING-CLEAR>)>)
		  (ELSE
		   <COND (<AND <VERB? ASK-ABOUT>
		   			   <DOBJ? TRILLIAN>>
				  <COMMON-ASK-ABOUT ,TRILLIAN ,PRSI>)
		   		 (<AND <ORDERING?>
					   <EQUAL? ,WINNER ,TRILLIAN>>
				  <COND (<VERB? WHY NO YES>
				  		 <TELL "\"I dunno,\" she replies. \"Ask Marvin.\"" CR>
				  		 ;<RESET-WINNER>)
						(<VERB? WHO WHAT WHAT-ABOUT ;WHAT-TIME>
						 <PERFORM ,V?ASK-ABOUT ,TRILLIAN ,PRSO>
						 <RTRUE>)
						(ELSE
                         <COND (<IN? ,FORD ,STUNT-SHIP>
								<TELL D ,TRILLIAN " glances at you. \"Seriusly, Arthur, we're all gonna die here. Can you help?\"" CR>)
                               (ELSE
                                <TELL D ,TRILLIAN " smiles disinterestedly and looks away." CR>)>
						 ;<RESET-WINNER>)>
				  <RTRUE>)>
		   <RFALSE>)>>

<ROUTINE TRILLIAN-D ()
	<COND (<IN? ,FORD ,CAR-PARK>
		   <TELL D ,TRILLIAN " is attempting to start a conversation with " D ,MARVIN ,PAUSES>)
		  (<IN? ,FORD ,STUNT-SHIP> ;"ZAPHOD is undescribed"
		   <TELL
D ,TRILLIAN " and " D ,ZAPHOD " are panicking and
pushing on the walls, trying to make something work." CR>)
		  (<EQUAL? <LOC ,FORD> ,RECEPTION ,THIRD-C> ;"In reception, and Third Class."
		   <TELL D ,TRILLIAN " is deep in thought as she walks past you." CR>)
		  (ELSE
		   <TELL ""> ;"See FORD-D")>>

<OBJECT ZAPHOD
	(LOC DINING-HALL ;GLOBAL-OBJECTS)
	(DESC "Zaphod")
	(LDESC 0)
	(CHARACTER 3)
	(DESCFCN ZAPHOD-D)
	(SYNONYM ZAPHOD BEEBLEBROX MAN)
	(ADJECTIVE ZAPHOD)
	(FLAGS NARTICLEBIT PERSONBIT)
	(ACTION ZAPHOD-F)> ;"Many things are handled by Ford..."

<ROUTINE ZAPHOD-F ()
	<COND (<NOT <FSET? ,FORD ,SEENBIT>>
		   <COND (<VERB? FIND>
				  <TELL "Not here." CR>)
				 (<AND <VERB? ASK-ABOUT ;ASK-CONTEXT-ABOUT TELL-ABOUT>
					   <EQUAL? ,PRSI ,ZAPHOD>>
				  <RFALSE>)
				 (T
				  <TELL "You can't see him here!" CR>
				  <FUCKING-CLEAR>)>)
		  (ELSE
		   <COND (<AND <VERB? ASK-ABOUT>
		   			   <DOBJ? ZAPHOD>>
				  <COMMON-ASK-ABOUT ,ZAPHOD ,PRSI>)
		   		 (<AND <VERB? GIVE>
                       <IOBJ? ZAPHOD>>
                  <COND (<OR <DOBJ? BLASTER>
                           <AND <DOBJ? RUM-GLASS>
                                ,BLASTER-RUM>
                           <AND <DOBJ? WINE-GLASS>
                                ,BLASTER-WINE>>
                         <TELL D ,ZAPHOD
" waves it away and gets the message across to you (in a slurred voice)
that he is on a sort of diet, and can't have more than ten " ,GALACT "s
per day, because ten is a nice round number and also his doctor said he
had to if he wanted to become president again." CR>)>)
                 (<AND <ORDERING?>
					   <EQUAL? ,WINNER ,ZAPHOD>>
				  <COND (<VERB? WHY NO YES>
				  		 <TELL
"\"Do you think I can be bothered to deal with your
problems?\" he replies. \"I have plenty of my own.\"" CR>
				  		 ;<RESET-WINNER>)
						(<VERB? WHO WHAT WHAT-ABOUT ;WHAT-TIME>
						 <PERFORM ,V?ASK-ABOUT ,ZAPHOD ,PRSO>
						 <RTRUE>)
						(ELSE
						 <COND (<IN? ,FORD ,CAR-PARK>
								<TELL D ,ZAPHOD " is 'too cool' to have to talk to you." CR>)
                               (<IN? ,FORD ,STUNT-SHIP>
                                <TELL
D ,ZAPHOD " is afraid right now, you can savour this
moment. Not that he could really help much anyway." CR>)
							   (ELSE
							    <TELL D ,ZAPHOD "'s too drunk to notice you." CR>)>
						 ;<RESET-WINNER>)>
				  <RTRUE>)>
		   <RFALSE>)>>

<ROUTINE ZAPHOD-D ()
	<COND (<IN? ,FORD ,CAR-PARK>
		   <TELL ""> ;"See FORD-D")
		  (<IN? ,FORD ,STUNT-SHIP> 
		   <TELL ""> ;"See TRILLIAN-D")
		  (<EQUAL? <LOC ,FORD> ,RECEPTION ,THIRD-C>
		   <TELL D ,ZAPHOD " knocks his heads together." CR>)
		  (ELSE
		   <TELL ""> ;"See FORD-D")>>

;<ROUTINE FORD-F ("OPTIONAL" (ARG <>) "AUX" OBJ X)
 <COND (<==? .ARG ,M-WINNER>
	<COND (<NOT <GRAB-ATTENTION ,FORD>> <RFATAL>)
	      (<SET X <COM-CHECK ,FORD>>
	       <COND (<==? .X ,M-FATAL> <RFALSE>)
		     (<==? .X ,M-OTHER> <RFATAL>)
		     (T <RTRUE>)>)
	      (T
	       <FUCKING-CLEAR>
	       <TELL "Ford, busy scanning the sky">
	       <COND (<EQUAL? ,HERE ,PUB>
		      <TELL " through the window">)>
	       <TELL ", ignores you." CR>)>)
       (<SET OBJ <ASKING-ABOUT? ,FORD>>
	<COND (<NOT <GRAB-ATTENTION ,FORD .OBJ>>
	       <RFATAL>)
	      (<EQUAL? .OBJ ,THIRD-PLANET>
	       <TELL
"Ford explains that the Earth has been demolished. To cheer you up, he points
out that there are an awful lot of little planets like that around, and the
Earth wasn't even a particularly nice one." CR>)
	      (<SET X <COMMON-ASK-ABOUT ,FORD .OBJ>>
	       <COND (<==? .X ,M-FATAL> <RFALSE>) (T <RTRUE>)>)
	      (T <TELL-DUNNO ,FORD .OBJ>)>)
       (<AND <VERB? ALARM SHAKE>
	     <EQUAL? <GETP ,FORD ,P?LDESC> 14 ;"asleep">>
	<TELL "Rather like trying to wake the dead." CR>)
       (T <PERSON-F ,FORD .ARG>)>>





;"***************************
  **** First-class idiot ****
  ***************************
"

<OBJECT FIRST-CLASS-IDIOT
    (LOC DINING-HALL ;"I know, I know...")
    (DESC "first class idiot")
    (DESCFCN FIRST-CLASS-IDIOT-D)
    ;(TEXT "There is a first class idiot here, sipping sherry.")
	(CHARACTER 7)
    (SYNONYM IDIOT SNOB ASSHOLE)
    (ADJECTIVE FIRST-CLA FIRST CLASS SNOBBY SNOBBISH ANNOYING)
    (FLAGS PERSONBIT TOUCHBIT SEENBIT TRANSBIT ;PLURALBIT ;SEARCHBIT)
    (ACTION FIRST-CLASS-IDIOT-F)>

<OBJECT FIRST-CLASS-CARD
    (LOC FIRST-CLASS-IDIOT)
    (DESC "first class access card")
    ;(LDESC "There is a first class access card here.")
    (GENERIC FIRST-CLASS-CARD)
    (SYNONYM CARD ACCESS)
    (ADJECTIVE FIRST CLASS ACCESS FIRST-CLA)
    (FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION FIRST-CLASS-CARD-F)>

<ROUTINE FIRST-CLASS-CARD-F ()
	<COND (<AND <VERB? TAKE>
				<NOT <FSET? ,FIRST-CLASS-CARD ,SADRADIOBIT>>
				<FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>
                <ITAKE>>
		   <INCREMENT-SCORE 20>
		   <FSET ,FIRST-CLASS-CARD ,SADRADIOBIT>)
		  (<AND <VERB? TAKE>
				<NOT <FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>>>
		   <TELL "\"Don't touch me,\" the idiot spits." CR>)>>
 
<ROUTINE FIRST-CLASS-IDIOT-D ()
	<TELL "There is a first class idiot here, ">
	<COND (<FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>
		   <TELL "who is slumped over a table sleeping (hopefully).">)
		  (ELSE
		   <TELL "sipping sherry.">)>
	<CRLF>>

<ROUTINE FIRST-CLASS-IDIOT-F ()
  <COND (<NOT <FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>>
    <COND (<VERB? EXAMINE>
           <TELL "A snobbish idiot, sipping sherry and staring at you disdainfully." CR>)
		  (<AND <VERB? ASK-ABOUT TELL-ABOUT>
				<EQUAL? ,PRSO ,FIRST-CLASS-IDIOT>>
		   <THE-J ,FIRST-CLASS-IDIOT T T><TELL " sniffs in disgust and turns away." CR>)
          (<AND <ORDERING?>
                <EQUAL? ,WINNER ,FIRST-CLASS-IDIOT>>
		   <THE-J ,FIRST-CLASS-IDIOT T T><TELL " sniffs in disgust and turns away." CR>
		   ;<RESET-WINNER>)
		  (<OR <AND <VERB? GIVE>
		  			<IOBJ? FIRST-CLASS-IDIOT>
					<NOT <DOBJ? FIRST-CLASS-IDIOT>>>
			   <AND <VERB? SGIVE>
		  			<DOBJ? FIRST-CLASS-IDIOT>
					<NOT <DOBJ? FIRST-CLASS-IDIOT>>>>
		   <COND (<NOT <IN? ,FIRST-CLASS-IDIOT ,FIRST-CLASS>>
		   		  <THE-J ,FIRST-CLASS-IDIOT T T><TELL " looks annoyed. \"Can't you see I'm doing something right now?\"" CR>
				  <RTRUE>)>			
		   <COND (<OR <DOBJ? RUM-GLASS>
		   			  <IOBJ? RUM-GLASS>>
		   		  <THE-J ,FIRST-CLASS-IDIOT T T><TELL
" stares at you, confused. \"Who puts something that
isn't rum in a rum glass?!\"||The idiot hands you the
glass back. \"Go and get a wine glass!" CR>
				  <RTRUE>)
                 (<OR <DOBJ? BLASTER>
                      <IOBJ? BLASTER>>
                  <TELL "\"I'd rather stay alive,\" the idiot snaps before you can even hand it over." CR>)
				 (<OR <DOBJ? WINE-GLASS>
		   			  <IOBJ? WINE-GLASS>>
				  <COND (<AND ,WINE-WINE
                       		 ,BLASTER-WINE>
						 <TELL
"Confused about the free offering but not arguing with it,
the idiot drinks the wine (mixed with " ,GALACT ").||Six
seconds later, he is asleep - you hope. The glass smashes
on the floor, and an automatic robot clears it up and leaves." CR>
						 <REMOVE ,WINE-GLASS>
						 <FSET ,FIRST-CLASS-IDIOT ,MUNGBIT>
						 <RTRUE>)
						(,BLASTER-WINE
						 <TELL "\"I'd rather stay alive,\" the idiot snaps,">)
						(,WINE-WINE
						 <TELL "Confused about the free offering but not arguing with it, the idiot drinks the wine,">)
						(ELSE
						 <TELL "The idiot stares at you, confused. \"It's empty,\"">)>
				  <TELL " and hands the glass back to you." CR>
				  <RTRUE>)>)
		  (<TOUCHING?>
		   <THE-J ,FIRST-CLASS-IDIOT T T><TELL " stares sharply at you as you approach, so you decide against it." CR>)>)
   (ELSE
	<COND (<VERB? EXAMINE>
		   <THE-J ,FIRST-CLASS-IDIOT T T><TELL " is slumped over a table, sleeping (hopefully)." CR>)
		  ;(<VERB? SEARCH>
		   <COND (<IN? ,FIRST-CLASS-CARD ,FIRST-CLASS-IDIOT>
		   		  ;<TELL "You find and pick up his " D ,FIRST-CLASS-CARD ,PAUSES>
				  ;<MOVE ,FIRST-CLASS-CARD ,PLAYER>
				  <COND (<NOT <FSET? ,FIRST-CLASS-CARD ,SADRADIOBIT>>
				  		 <INCREMENT-SCORE 20>
                         <FSET ,FIRST-CLASS-CARD ,SADRADIOBIT>)>
				  ;<FSET ,FIRST-CLASS-CARD ,SADRADIOBIT>)
				 (ELSE
				  ;<TELL "You find nothing of interest." CR>)>)>)>>

<GLOBAL IDIOT-OHERE:OBJECT <>>
<GLOBAL IDIOT-WAY T>

<ROUTINE I-FIRST-CLASS-IDIOT ()
    <COND (<OR <IN? ,PLAYER ,FIRST-CLASS>
			   <FSET? ,FIRST-CLASS-IDIOT ,MUNGBIT>>
           <MOVE ,FIRST-CLASS-IDIOT ,FIRST-CLASS>)

          (ELSE ;"This is where it gets complicated..."
           <COND (<IN? ,FIRST-CLASS-IDIOT ,FIRST-CLASS>
                  <SETG IDIOT-OHERE ,FIRST-CLASS>
                  <MOVE ,FIRST-CLASS-IDIOT ,DINING-HALL>
                  <SETG IDIOT-WAY <>>
                  <QUEUE I-FIRST-CLASS-IDIOT 1>)

                 (<IN? ,FIRST-CLASS-IDIOT ,DINING-HALL>
                  <SETG IDIOT-OHERE ,DINING-HALL>
                  <COND (,IDIOT-WAY
                         <MOVE ,FIRST-CLASS-IDIOT ,FIRST-CLASS>
                         <QUEUE I-FIRST-CLASS-IDIOT 5>)
                        (ELSE
                         <MOVE ,FIRST-CLASS-IDIOT ,THIRD-C>
                         <QUEUE I-FIRST-CLASS-IDIOT 1>
                         <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
                         <QUEUE CLOSE-SECOND-DOOR 2>)>)

                 (<IN? ,FIRST-CLASS-IDIOT ,THIRD-C>
                  <SETG IDIOT-OHERE ,THIRD-C>
                  <COND (,IDIOT-WAY
                         <MOVE ,FIRST-CLASS-IDIOT ,DINING-HALL>
                         <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
                         <QUEUE CLOSE-SECOND-DOOR 2>)
                        (ELSE
                         <MOVE ,FIRST-CLASS-IDIOT ,RECEPTION>)>
                  <QUEUE I-FIRST-CLASS-IDIOT 1>)

                 (<IN? ,FIRST-CLASS-IDIOT ,RECEPTION>
                  <SETG IDIOT-OHERE ,RECEPTION>
                  <COND (,IDIOT-WAY
                         <MOVE ,FIRST-CLASS-IDIOT ,THIRD-C>
                         <QUEUE I-FIRST-CLASS-IDIOT 1>)
                        (ELSE
                         <MOVE ,FIRST-CLASS-IDIOT ,CAR-PARK>
                         <QUEUE I-FIRST-CLASS-IDIOT 1>)>)

                 (<IN? ,FIRST-CLASS-IDIOT ,CAR-PARK>
                  <SETG IDIOT-OHERE ,CAR-PARK>
                  <MOVE ,FIRST-CLASS-IDIOT ,RECEPTION>
                  <SETG IDIOT-WAY T>
                  <QUEUE I-FIRST-CLASS-IDIOT 1>)>

           <COND (<AND <EQUAL? ,IDIOT-OHERE ,HERE>> ;"EXEUNT first-class idiot"
                  <FSET ,FIRST-CLASS-IDIOT ,SEENBIT>
                  <CRLF>
                  <COND (<IN? ,PLAYER ,CAR-PARK>
                         <TELL "A " D ,FIRST-CLASS-IDIOT  " ambles out of the bathroom, and">)
                        (ELSE
                         <TELL "The " D ,FIRST-CLASS-IDIOT>)>
                  <TELL " leaves "><THE-J ,HERE T><TELL " and walks into ">
                  <THE-J <LOC ,FIRST-CLASS-IDIOT> T>
                  <TELL ", passing through exits with the " D ,FIRST-CLASS-CARD " in one hand and sipping sherry." CR>)

                 (<AND <IN? ,FIRST-CLASS-IDIOT ,HERE> ;"ENTER first-class idiot"
                       ;<NOT <EQUAL? ,OHERE ,IDIOT-OHERE>>>
                  <FSET ,FIRST-CLASS-IDIOT ,SEENBIT>
                  <CRLF>
                  <COND (<VERB? FAINT>
                         <TELL "A little later, you are startled by a door sliding open. ">)
                        (<OR <AND <EQUAL? ,HERE ,THIRD-C>
                                  <NOT ,IDIOT-WAY>>
                             <AND <EQUAL? ,HERE ,DINING-HALL>
                                  ,IDIOT-WAY>>
                         <TELL "The second-class access door slides open. ">)>
                  <TELL "A " D ,FIRST-CLASS-IDIOT " walks into ">
                  <THE-J ,HERE T>
                  <TELL ", wielding a " D ,FIRST-CLASS-CARD>
                  <COND (<IN? ,PLAYER ,CAR-PARK>
                         <TELL ", and walks right into the bathroom">
                         <QUEUE I-FIRST-CLASS-IDIOT 4>)>
                  <TELL ,PAUSES>
                  <COND (<VERB? FAINT>
                         <FUCKING-CLEAR>)>)>)>>




;"*******************
  **** Head cook ****
  *******************
"

<OBJECT HEAD-COOK
    (LOC KITCHEN)
    (DESC "head chef")
    (LDESC "The head chef is glaring at you.")
    (CHARACTER 5)
    (ADJECTIVE ANGRY SUSPICIOU GLARING STARING MISERABLE HEAD MAIN)
    (SYNONYM CHEF COOK MAN)
    (FLAGS PERSONBIT)
    (ACTION HEAD-COOK-F)>

<ROUTINE HEAD-COOK-F ()
    <COND (<AND <VERB? ASK-ABOUT>
                <DOBJ? HEAD-COOK>>
           <COND (<IOBJ? HEAD-COOK>
                  <TELL "\"Har, har. You don't want to know about me. I don't either. About you, I mean.\"" CR>)
                 (<IOBJ? CUPBOARD>
                  <TELL
"\"Oh, that's a nasty little thing,\" he whispers, taking a glance at it.
\"It keeps all our stuff, and only accepts trades. But you don't know how
much much stuff of mine it has lost. My trick? You give it something, and
then quickly take whatever it has in store - doesn't matter what it is,
just take it while the cupboard's distracted. It's a wonder that we're
able to cook as much food as we do with such tight limitations.\"" CR>)
                 (<EQUAL? ,PRSI ,PLAYER>
                  <TELL "\"And how should I know?\"" CR>)
                 (<PERSON-F ,HEAD-COOK>
                  <RTRUE>)>)
          (<AND <VERB? TELL-ABOUT>
                <DOBJ? HEAD-COOK>>
           <COND (<IOBJ? HEAD-COOK>
                  <TELL
"\"So know you know more about me than I do?!\" the chef says incredulously. \"Imagine!\" he laughs." CR>)
                 (<EQUAL? ,PRSI ,PLAYER>
                  <TELL "\"I really don't care,\" he says, rolling his eyes.">)
                 (<PERSON-F ,HEAD-COOK>
                  <RTRUE>)>)
          (<PERSON-F ,HEAD-COOK>
           <RTRUE>)>>






;"************************
  **** Slartibartfast ****
  ************************
"

<OBJECT SLARTY
    (LOC PDW)
    (DESC "Slartibartfast")
    (DESCFCN SLARTY-D)
	(CHARACTER 9)
    (SYNONYM SLARTY SLART SLARTIBAR MAN MERLIN WIZARD)
    (ADJECTIVE OLD STRANGE WISE WISENED)
    (FLAGS PERSONBIT TOUCHBIT ;SEENBIT CONTBIT TRANSBIT ;SEARCHBIT OPENBIT NARTICLEBIT)
    (ACTION SLARTY-F)>

<CONSTANT SLARTY-DESCFCNS
    <PLTABLE "is looking over his notes"
             "is staring at the wall behind you"
             "fiddles with a random mechanism for a while, then turns his attention to something else"
             "looks at you deeply, as if you were a person he knew a while ago"
             "is admiring one of the machines scattered throughout this workshop"
             "grabs a test tube, shakes it, and then puts it back"
             "glances at the computer to see if anything has changed, then shakes his head and looks away">>

<ROUTINE SLARTY-D ()
    <TELL D ,SLARTY !\ <PICK-ONE ,SLARTY-DESCFCNS> ,PAUSES>>

<ROUTINE SLARTY-F ()
    <COND (<VERB? EXAMINE LOOK-INSIDE SEARCH>
           <COND (<EQUAL? <FIRST? ,SLARTY> ,BLUE-TUBE>
                  <TELL "He is working, and holding a blue test tube which he has forgotten to put down." CR>)
                 (ELSE
                  <TELL "He is busy doing his work." CR>)>
           <RTRUE>)
          (<AND <VERB? ASK-ABOUT>
                <DOBJ? SLARTY>>
           <COND (<IOBJ? SLARTY>
                  <TELL
"\"Oh, me?\" he asks. \"Don't mind me, just get on with your work.
You can look me up in " ,GUIDE-NAME " if you wish.\"" CR>)
                 (<IOBJ? BLUE-TUBE CODE-3 DEVICE>
                  <PERFORM ,V?ASK-FOR ,SLARTY ,PRSI>)
                 (<IOBJ? MARVIN BLIGHTED-GROUND>
                  <TELL
"\"Oh, don't worry about the intelligence reports. It was just from a robot friend of
mine called Marvin,\" he whispers, \"as if you could call him a friend in any way.\"" CR>)
                 (<IOBJ? RED-FROB GREEN-FROB BLUE-FROB ;KNIFE ;FROBS>
                  <TELL !\">
                  <COND (<NOT <AND <OR <IOBJ? BLUE-FROB>
                                       <DOBJ? BLUE-FROB>>
                                   <NOUN-USED? ,BLUE-FROB ,W?KNIFE ,W?PENKNIFE>>>
                                <TELL "Oh, the great frobs">
                         <COND (<FSET? ,BLUE-FROB ,RADPLUGBIT>
                                <TELL ", such as that blue frob">)
                               (<FSET? ,RED-FROB ,RADPLUGBIT>
                                <COND (<FSET? ,BLUE-FROB ,RADPLUGBIT>
                                       <TELL " and that red one as well">)
                                      (ELSE
                                       <TELL ", like the red frob">)>)>
                         <TELL ". They can harness great amounts of energy. ">)>
                  <COND (<NOT <FSET? ,BLUE-FROB ,RADPLUGBIT>>
                         <COND (<NOT <AND <OR <IOBJ? BLUE-FROB>
                                              <DOBJ? BLUE-FROB>>
                                          <NOUN-USED? ,BLUE-FROB ,W?KNIFE ,W?PENKNIFE>>>
                                <TELL "Am I">)
                               (ELSE
                                <TELL "Oh, yes. So I am">)>
                         <TELL " right in assuming that you have the blue frob">
                         <COND (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "small penknife" "blue frob of power">
                                <TELL " - maybe in the form of a flismy penknife">)
                               ;(ELSE
                                <TELL ", ">)>
                         <TELL "? According to my intelligence reports, at least.\"" CR>
                         <QUEUE I-REPLY 2>
                         <SETG AWAITING-REPLY 12>
                         <RTRUE>)>
                  <TELL "Anything else?\"" CR>
                  <RTRUE>)
                 (<IOBJ? MAGRATHEA MICE BENJY PERCY>
                  <TELL
"\"Yes, those people have been funding my work. I'm right now doing a project for the
mice, on creating a new Earth to find the Question. You know, forty-two and all.\"" CR>)
                 (<OR <AND <IOBJ? THIRD-PLANET>
                           <NOUN-USED? ,THIRD-PLANET ,W?EARTH>>
                      <IOBJ? GLACIER-1>>
                  <TELL
"\"Earth is a machine designed to find " ,QUESTION-ANSWER !\.
!\" " He takes a deep breath. \"It's a mouthful to say, that
is. But I've been working on a second Earth, so we can find
the actual answer. I got some very prestigious awards for my
work on the Fjords in the original Earth.\" He smiles to himself. ">
                  <COND (<NOT <FSET? ,GLACIER-1 ,SADRADIOBIT>>
                         <TELL
"\"That reminds me, you're going to have to go to the Fjords.\"">)>
                  <CRLF>)
                 (<OR <AND <EQUAL? ,PRSI ,INTNUM>
                           <=? 42 ,P-NUMBER>>
                      <EQUAL? ,PRSI ,LEDGE>>
                  <TELL "\"Look it up in the Guide.\"" CR>)
                 (<IOBJ? COMPUTER>
                  <COND (<NOT <IN? ,COMPUTER ,PDW>>
                         <TELL "\"Don't worry about that - it wasn't a good one anyway. I can order a new one anytime">)
                        (<FSET? ,COMPUTER ,BADRADIOBIT>
                         <TELL "\"It's working again! I'll see how long that lasts, though">)
                        (ELSE
                         <TELL
"He rests his hand on it casually, removing it quickly when
he notices how hot it has become. \"Doesn't matter much">)>
                  <TELL ,PIC>)
                 (<IOBJ? TELEPORTER RAMP>
                  <COND (<NOT <FSET? ,TELEPORTER ,RADPLUGBIT>>
                         <TELL "\"Don't go in yet. I'll explain." CR CR>)>
                  <COND ;(<FSET? ,TELEPORTER ,BADRADIOBIT>
                         <TELL "\"Nothing will happen if you step in.\"" CR>)
                        (<FSET? ,TELEPORTER ,SADRADIOBIT>
                         <TELL
"\"The teleporter's broken. That's what I brought you here for.|
|To fix it, you must properly harness the energy of at least three frobs -
so we don't run out of energy and kill you - so the teleporter can stay open.
I noticed (using a private intelligence source of mine) that you had found
a frob. I was looking at " ,LOST-PLANET " because you were the first movement
on it for hundreds of years now, if you don't count the mice.\"" CR>)
                        (ELSE
                         <TELL "\"It's been fixed hasn't it?\"" CR>)>)
                 (<IOBJ? OBJECT-OF-GAME>
                  <TELL
"\"My goal is definitely my work. I love it, and it's so interesting putting
in all those little details that barely anyone will notice, or look for, just
like this one. I'm a little bit too obsessed with my work, I fear. (Just like
the author, apparently...)" CR>)
                 (ELSE
                  <PERSON-F ,SLARTY>)>)
          (<AND <VERB? ASK-FOR>
                <DOBJ? SLARTY>>
           <COND (<IOBJ? BLUE-TUBE>
                  <TELL
"\"Oh, how silly of me! Here you go.\"
|He tosses it to you, but misses. Fortunately, it doesn't break." CR>
                  <MOVE ,BLUE-TUBE ,HERE>)
                 (<IOBJ? CODE-3>
                  <COND (<IN? ,DEVICE ,LOCAL-GLOBALS>
                         <TELL D ,SLARTY " looks blankly at you. \"What code?\"" CR>
                         <RTRUE>)>
                  <COND (<0? ,CODE-NUM1>
                         <SETG CODE-NUM1 <RANDOM 9>> ;"So you can't just press the button. It can't start with zero."
                         <REPEAT ()
                          <SETG CODE-NUM2 <- <RANDOM 10> 1>>
                          <COND (<=? ,CODE-NUM2 ,CODE-NUM1>
                                 <AGAIN>)
                                (ELSE
                                 <RETURN>)>>
                         <REPEAT ()
                          <SETG CODE-NUM3 <- <RANDOM 10> 1>>
                          <COND (<=? ,CODE-NUM3 ,CODE-NUM2 ,CODE-NUM1>
                                 <AGAIN>)
                                (ELSE
                                 <RETURN>)>>)>
                  <TELL "\"Yes, it's"><TELL-CODE><TELL ".\"" CR>
                  <FSET ,CODE-3 ,RADPLUGBIT>)
                 (<IOBJ? DEVICE>
                  <COND (<HELD? ,DEVICE>
                         <TELL "\"You have it.\"" CR>)
                        (<IN? ,DEVICE ,LOCAL-GLOBALS>
                         <DEQUEUE I-DEVICE>
                         <I-DEVICE T>)
                        (ELSE
                         <TELL "\"I gave it to you.\"" CR>)>)
                 (ELSE
                  <PERSON-F ,SLARTY>)>)
          (<AND <VERB? SHOW GIVE>
                <IOBJ? SLARTY>>
           <COND (<DOBJ? BLUE-FROB>
                  <TELL "\"Of course. The blue frob">
                  <COND (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "small penknife" "blue frob of power">
                         <TELL " of power - in its true form">
                         <PUTP ,BLUE-FROB ,P?SDESC "blue frob of power">)
                        (ELSE
                         <TELL " - although you will need to find its true form for it to work">)>
                  <COND (<FSET? ,SLARTY ,RADPLUGBIT>
                         <TELL !\, !\" !\  D ,SLARTY " says, chuckling. \"So you ">
                         <ITALICIZE "did">
                         <TELL " have the blue frob!\"" CR>
                         <FCLEAR ,SLARTY ,RADPLUGBIT>)
                        (ELSE
                         <TELL ,PIC>)>
                  <FSET ,BLUE-FROB ,RADPLUGBIT>)
                 (<DOBJ? RED-FROB GREEN-FROB>
                  <TELL D ,SLARTY " admires it for a second, and then hands it back.">
                  <COND (<DOBJ? GREEN-FROB>
                         <TELL " \"Already in its true form,\" he muses.">)
                        (<AND <DOBJ? RED-FROB>
                              <EQUAL? <GETP ,RED-FROB ,P?SDESC> "red rhombicosidodecahedron">>
                         <TELL
" He explains that it is a red frob of philosophy, and that
it's quite rare, so he's sad to have to lose it so easily." CR>
                         <PUTP ,RED-FROB ,P?SDESC "red frob of philosophy">)>
                  <CRLF>)>)
           (<OR <ALL-OVER-VERB?> <EVERYWHERE-VERB?>>
            <COND (<NOT <FSET? ,SLARTY ,SEENBIT>>
                   <TELL "Who?" CR>)
                  (ELSE
                   <RFALSE>)>)
           (<PERSON-F ,SLARTY>
           <RTRUE>)>>





;"*********************
  **** Ark Captain ****
  *********************
"

<OBJECT ARK-CAPTAIN
    (LOC PINK-BATH)
    (DESC "captain")
    (SYNONYM CAPTAIN CHIEF MAN)
    (ADJECTIVE ARK B)
    (CHARACTER 8)
    (GENERIC CAPTAIN-G)
    (FLAGS PERSONBIT CONTBIT OPENBIT NDESCBIT TRANSBIT ;SEARCHBIT SEENBIT)
    (ACTION ARK-CAPTAIN-F)>

<ROUTINE ARK-CAPTAIN-F ()
    <COND (<VERB? EXAMINE>
           <TELL "He is the captain. You assume he owns the ship, but his unwillingness to leave the bath
tells you he has little authority. He sits in the bath, looking pleased with himself about something.">
           <COND (<EQUAL? <GETP ,MEAT-DISH ,P?OWNER> ,ARK-CAPTAIN>
                  <TELL " He is holding a dish of meat which doesn't look appetizing.">)>
           <CRLF>)
          (<AND <VERB? ASK-ABOUT ASK-FOR>
                <IOBJ? MEAT-DISH>>
           <TELL
"\"Oh ... I don't really want it. I'm supposed to have it but I'm really not hungry.
Here, you can have it.\" He puts it on the floor. \"The meat is made from the flesh
of a vegan snow lizard,\" he whispers, \"just in case it interests you!\"" CR>
           <PUTP ,MEAT-DISH ,P?OWNER ,PLAYER>
           <PUTP ,MEAT-DISH ,P?SDESC "dish of vegan snow lizard meat">
           <MOVE ,MEAT-DISH ,ARK>)
          (<VERB? OPEN CLOSE>
           <TELL "You can't do that to a captain!" CR>)
          (<PERSON-F ,ARK-CAPTAIN>
           <RTRUE>)>>





;"*************************
  **** Morpher Captain ****
  *************************
"

<OBJECT MORPHER-CAPTAIN
    (LOC BATHROOM-SHIP)
    (DESC "morpher captain")
    (CHARACTER 6)
    (LDESC "The morpher captain is on the floor, stunned.")
    (TEXT "The morpher captain is on the floor, stunned.")
    (SYNONYM CAPTAIN CHIEF MAN PERSON ALIEN MORPHER)
    (ADJECTIVE MORPHER MORFER MORPH)
    (GENERIC CAPTAIN-G)
    (FLAGS NDESCBIT PERSONBIT TRANSBIT ;SEARCHBIT)
    (ACTION MORPHER-CAPTAIN-F)>

<ROUTINE MORPHER-CAPTAIN-F ()
    <COND (<PERSON-F ,MORPHER-CAPTAIN>
           <RTRUE>)>>

<OBJECT AUTO-SIGN
    (LOC MORPHER-CAPTAIN)
    (DESC "automatic autograph pen")
    ;(LDESC "There is an automatic autograph pen here.")
    (SYNONYM PEN AUTOGRAPH SIGNER SIGN SIGNATURE)
    (ADJECTIVE AUTO AUTOMATIC AUTOGRAPH AUTO-SIGN)
    (GENERIC PEN-G)
    (FLAGS TAKEBIT VOWELBIT)
	;(ACTION AUTO-SIGN-F)>

;<ROUTINE AUTO-SIGN-F ()
	<COND (<AND <VERB? USE PUT WRITE>
                <IOBJ? REGISTER>>
           <PERFORM ,V?WRITE ,AUTO-SIGN ,REGISTER>)
          (<AND <IOBJ? AUTO-SIGN>
                <VERB? WRITE-WHAT WRITE-IN-WHAT>>
           <TELL "The pen only signs an automatic name." CR>)>>

<GLOBAL CAPTAIN-OHERE:OBJECT <>>
<GLOBAL CAPTAIN-NOTHERE <>>

<GLOBAL CAPTAIN-WAIT:NUMBER 0>

<GLOBAL CAP-ROOM
    <PLTABLE GALLEY
             PRES-BRIDGE
             DORM
             BATHROOM-SHIP
             JUNCTION>>

;<GLOBAL HIDEY T>
<GLOBAL TWO-TURNS 0>

<ROUTINE I-MORPHER-CAPTAIN ("AUX" OBJ (HIDE <NOT <FSET? ,MORPHER-CAPTAIN ,BADRADIOBIT>>))
    ;"HIDE for memory:
        - If BADRADIOBIT is set on the captain, he must move.
        - Therefore, if it is NOT set, then he may stay where he is."
    <FCLEAR ,MORPHER-CAPTAIN ,BADRADIOBIT>
    <SETG TWO-TURNS <+ ,TWO-TURNS 1>>
    <COND (<AND <OR <AND <FSET? ,MORPHER-CAPTAIN ,SECRETBIT>
                         <NOT <IN? ,MORPHER-CAPTAIN ,HERE>>>
                    <NOT .HIDE>>
                ;<EQUAL? <MOD ,TWO-TURNS 2> 0>
                <NOT <FSET? ,MORPHER-CAPTAIN ,MUNGBIT>>>
           <HIDE-CAP .HIDE>)
          (<AND <IN? ,MORPHER-CAPTAIN ,HERE>
                <FSET? ,MORPHER-CAPTAIN ,SECRETBIT>
                <NOT <FSET? ,MORPHER-CAPTAIN ,MUNGBIT>>>
           <SETG CAPTAIN-OHERE <LOC ,MORPHER-CAPTAIN>>
           <SETG CAPTAIN-NOTHERE <>>
           <COND (.HIDE 
                  <SETG CAPTAIN-WAIT <+ ,CAPTAIN-WAIT 1>>
                  <COND (<AND <EQUAL? ,CAPTAIN-WAIT 4>
                              <SET OBJ <FIND-FLAG-HERE ,CAPTAINBIT>>
                              <IN? ,PLAYER <LOC ,MORPHER-CAPTAIN>>>
                         <TELL CR "Suddenly, ">
                         <THE-J .OBJ T>
                         <TELL 
" changes shape and size until it takes the shape of the morpher captain that you saw earlier,
who is brandishing a large weapon. Everything happens so quickly that you don't have time to react. ">
                         <JIGS-UP ,CAPTAIN-DEATH>)>)>)>>

<ROUTINE HIDE-CAP (HIDE ;"Can he stay hidden in the same place?" "AUX" NAMES PLACE)
    <SETG CAPTAIN-OHERE <LOC ,MORPHER-CAPTAIN>>
    <SETG CAPTAIN-NOTHERE T>
    <COND (<NOT <FSET? ,MORPHER-CAPTAIN ,MUNGBIT>>
           <FSET ,MORPHER-CAPTAIN ,SECRETBIT>)>

    <REPEAT ()
        <MOVE ,MORPHER-CAPTAIN <PICK-ONE ,CAP-ROOM>>
        <COND (<EQUAL? <LOC ,MORPHER-CAPTAIN> ,CAPTAIN-OHERE> ;"If captain is in the same place..."
               <COND (.HIDE ;"If BADRADIOBIT isn't set, then he may stay, just have to remove the NOTHERE."
                      <SETG CAPTAIN-NOTHERE <>>)
                     (ELSE  ;"Otherwise, the captain has recently fled your room, and so must change room."
                      <AGAIN>)>)>
        <RETURN>>

    <COND (<AND <FSET? ,MORPHER-CAPTAIN ,SECRETBIT>>
           <COND (<AND <EQUAL? ,HERE ,GALLEY>
                       <IN? ,MORPHER-CAPTAIN ,HERE>>
                  <COND (,CAPTAIN-NOTHERE
                         <COND (<EQUAL? <GETP ,SPOON ,P?SDESC> "spoon">
                                <SET NAMES "fork">)
                               (ELSE
                                <SET NAMES "spoon">)>
                         <PUTP ,SPOON ,P?SDESC .NAMES>)>
                  <FCLEAR ,SPOON ,INVISIBLE>)
                 (ELSE
                  <FSET ,SPOON ,INVISIBLE>)>
           <COND (<AND <EQUAL? ,HERE ,DORM>
                       <IN? ,MORPHER-CAPTAIN ,HERE>>
                  <FCLEAR ,PILLOW ,INVISIBLE>)
                 (ELSE
                  <FSET ,PILLOW ,INVISIBLE>)>
           <COND (<AND <EQUAL? ,HERE ,BATHROOM-SHIP>
                       <IN? ,MORPHER-CAPTAIN ,HERE>>
                  <FCLEAR ,STICKER ,INVISIBLE>)
                 (ELSE
                  <FSET ,STICKER ,INVISIBLE>)>
           <COND (<AND <EQUAL? ,HERE ,JUNCTION>
                       <IN? ,MORPHER-CAPTAIN ,HERE>>
                  ;<FCLEAR ,CAP-CHAIR ,SECRETBIT>
                  <FCLEAR ,CAP-CHAIR ,INVISIBLE>)
                 (ELSE
                  ;<FSET ,CAP-CHAIR ,SECRETBIT>
                  <FSET ,CAP-CHAIR ,INVISIBLE>)>
           <COND (<AND <EQUAL? ,HERE ,PRES-BRIDGE>
                       <IN? ,MORPHER-CAPTAIN ,HERE>>
                  <FCLEAR ,GREEN-BUTTON ,INVISIBLE>
                  <COND (<AND <NOT <FSET? ,ORANGE-BUTTON ,SEENBIT>>
                              <FSET? ,PRES-BRIDGE ,SEENBIT>>
                         <FCLEAR ,ORANGE-BUTTON ,INVISIBLE>
                         <FSET ,FLAP ,OPENBIT>)>)
                 (ELSE
                  <FSET ,GREEN-BUTTON ,INVISIBLE>)>
           ;<COND (<NOT .HIDE> ;"If the captain must flee, he is not in your room so he is not waiting to escape."
                  <SETG CAPTAIN-WAIT 0>)
                 (ELSE        ;"Otherwise, he is waiting, so he is getting bored."
                  <SETG CAPTAIN-WAIT <+ ,CAPTAIN-WAIT 1>>)>)
          (ELSE
           <FSET <FIND-FLAG-HERE ,CAPTAINBIT> ,INVISIBLE>
           <SETG CAPTAIN-WAIT 0>)>>





;"*******************
  **** Policeman ****
  *******************
"

<OBJECT POLICEMAN
    (LOC LOCAL-GLOBALS)
    (DESC "security agent")
    (LDESC "A galactic security agent stands here, swiping through lists of top-secret agency stuff on his phone.")
    (TEXT "A galactic security agent stands here, swiping through lists of top-secret agency stuff on his phone.")
    (SYNONYM AGENT POLICEMAN SPY COP MAN PERSON)
    (ADJECTIVE GALACTIC SECURITY POLICE)
    (GENERIC POLICE-G)
    (FLAGS PERSONBIT CONTBIT OPENBIT ;NDESCBIT TRANSBIT)
    (ACTION POLICEMAN-F)>

<ROUTINE POLICEMAN-F ()
    <COND (<VERB? KILL ATTACK>
           <TELL "While that might be the better way to get out of this situation, let's not go that way, please." CR>)
          (<AND <VERB? TELL HELLO>
                <DOBJ? POLICEMAN>>
           <COND (<NOT <FSET? ,POLICEMAN ,BADRADIOBIT>>
                  <TELL
"\"Hello.\" The " D ,POLICEMAN " is stern and not happy-looking. \"We
have been told by " D ,ZAPHOD " Beeblebrox that you are paying for his
meal.\" So that's why " D ,ZAPHOD " pointed at you!|He continues. \"I
just want you to sign your name here, on this phone. That all, then we
can continue the enjoyment.\" He holds the screen out to you." CR>
                  <THIS-IS-IT ,CELL-PHONE>
                  <SETG AWAITING-REPLY 15>
                  <QUEUE I-REPLY 2>
                  ;<FCLEAR ,CELL-PHONE ,SECRETBIT>
                  <FSET ,POLICEMAN ,BADRADIOBIT>
                  <RTRUE>)
                 (ELSE
                  <TELL "The " D ,POLICEMAN " grunts. \"You're going to have to sign it, ya know.\"" CR>
                  <THIS-IS-IT ,CELL-PHONE>
                  <SETG AWAITING-REPLY 15>
                  <QUEUE I-REPLY 2>
                  <RTRUE>)>)
          (<PERSON-F ,POLICEMAN>
           <RTRUE>)>>

<OBJECT CELL-PHONE
    (LOC POLICEMAN)
    (DESC "touchscreen")
    (LDESC "A normal phone, not too unordinary or high-tech (except touchscreen and stuff), is in the security agent's hands.")
    (SYNONYM PHONE TELEPHONE SMARTPHON FORM SCREEN SMARTSCRE)
    (ADJECTIVE CELL TOUCHSCRE COOL HI-TECH HIGH-TECH HIGH TECH NORMAL SMART)
    (GENERIC PHONE-G)
    (FLAGS ;SECRETBIT READBIT)
    (ACTION CELL-PHONE-F)>

<ROUTINE CELL-PHONE-F ()
    <COND (<VERB? TAKE>
           <TELL
"\"Heya! That phone has top-secret stuff!\" says the agent,
swerving the phone away from you and making you stumble." CR>)
          (<VERB? EXAMINE READ>
           <TELL
"A normal phone, not too unordinary or high-tech (except touchscreen and stuff),
is in the security agent's hands. You're meant to write a name on it." CR>)>>





;"***************
  **** Clyde ****
  ***************
"

;<NEW-ADD-WORD CLYDE ADJ>
;<NEW-ADD-WORD CLYDE NOUN>
;<NEW-ADD-WORD CLYDE\'S NOUN>

<OBJECT CLYDE
    (LOC DRESSING-ROOM-REU)
    (SDESC "service robot")
    (LDESC "A service robot, is lying around, acting very relaxed.")
    (TEXT "A service robot, is lying around, acting very relaxed.")
    (SYNONYM ROBOT CLYDE BOT ROBOT\'S CLYDE\'S BOT\'S)
    (ADJECTIVE SERVICE ;XZZZP)
    (FLAGS PERSONBIT CONTBIT TRANSBIT)
    (ACTION CLYDE-F)>

<ROUTINE CLYDE-F ()
    <COND (<AND <OR <AND <VERB? TELL HELLO>
                         <DOBJ? CLYDE>>
                    <AND <VERB? ASK-ABOUT>
                         <IOBJ? CLYDE>
                         <DOBJ? CLYDE>>>
                <NOT <FSET? ,CLYDE ,NARTICLEBIT>>>
           <TELL
"\"Hi! I'm Clyde. Please get out if you aren't
supposed to be in here, which is unlikely; but
that's my job, so I have to say it. Anyway...
What are you doing? Is it interesting?\"" CR>
           <SETG AWAITING-REPLY 16>
           <QUEUE I-REPLY 2>
           <PUTP ,CLYDE ,P?SDESC "Clyde">
           <PUTP ,CLYDE ,P?LDESC "Clyde, the service robot, is lying around, acting very relaxed.">
           <PUTP ,CLYDE ,P?TEXT
"Clyde, the service robot, is lying around, acting very relaxed. On the back of his head is a strange panel.">
           <FSET ,CLYDE ,NARTICLEBIT>
           ;<REPLACE-NOUN? ,CLYDE ,W?XZZZP ,W?CLYDE>
           ;<REPLACE-ADJ?  ,CLYDE ,W?XZZZP ,W?CLYDE>
           ;<REPLACE-NOUN? ,CLYDE ,W?XZZZQ ,W?CLYDE\'S>
           <TELL CR "As Clyde chats to you, you notice a panel on the back of his head." CR>
           <MOVE ,CLYDE-PANEL ,CLYDE>
           <RTRUE>)
          (<AND <VERB? ASK-ABOUT>
                <DOBJ? CLYDE>>
           <COND (<IOBJ? SAFE>
                  <COND (<NOT <FSET? ,SAFE ,SADRADIOBIT>>
                         <TELL "\"I'm meant to keep it safe. Haha! Keep the safe safe!\"" CR>
                         <FSET ,SAFE ,SADRADIOBIT>)
                        (ELSE
                         <TELL
"\"Ah, ya got me. There are keys inside - they're Hotblack Desiato's keys for his
ship. Max Quordlepleen was tasked with keeping them safe. Ha ha ha!!\" he chuckles." CR>)>)
                 (<IOBJ? CLYDE-PANEL>
                  <TELL "\"That's for overriding any agressive or biased feautures I may have,\" he beams." CR>)
                 (<PERSON-F ,CLYDE>
                  <RTRUE>)>)
          (<AND <ORDERING?>
                <EQUAL? ,WINNER ,CLYDE>>
           <COND (<FSET? ,CLYDE ,BADRADIOBIT>
                  <TELL "\"Yes sir, I will do anything for you.\" ">
                  <COND (<AND <VERB? OPEN UNLOCK>
                              <DOBJ? SAFE>
                              <FSET? ,SAFE ,LOCKED>>
                         <TELL " He secretly uses a combination on the lock that releases a ">
                         <ITALICIZE "PING">
                         <TELL " sound when finished. He steps away and grins." CR>
                         <FCLEAR ,SAFE ,LOCKED>
                         <INCREMENT-SCORE 25>
                         <RTRUE>)
                        (ELSE
                         <TELL "He doesn't " <PICK-ONE <PLTABLE "seem to" "necessarily" "actually">> " do it though." CR>)>
                  <RTRUE>)
                 (ELSE
                  <TELL
"\"Even if you were allowed into the room, I'm not supposed to accept orders from strangers.\"" CR>)>)
          (<PERSON-F ,CLYDE>
           <RTRUE>)>>

<OBJECT CLYDE-PANEL
    (LOC LOCAL-GLOBALS)
    (OWNER CLYDE)
    (DESC "override access panel")
    (SYNONYM HEAD PANEL)
    (ADJECTIVE SERVICE ROBOT\'S ACCESS CLYDE\'S)
    (FLAGS ;INVISIBLE TAKEBIT)
    (ACTION CLYDE-PANEL-F)>

<ROUTINE CLYDE-PANEL-F ()
    <COND (<AND <VERB? TAKE REMOVE>
                ,PRSI>
           <COND (<FSET? ,CLYDE ,BADRADIOBIT>
                  <HACK-HACK "The panel has already been removed. Doing that">)
                 (ELSE
                  <COND (<IOBJ? UNBOTTLER>
                         <TELL
"As quickly and painlessly (as if!) as you can, you use the " D ,UNBOTTLER
" to remove the panel. As soon as it falls off, the microchip board inside
the " D ,CLYDE-PANEL " falls out and bounces delicately along the floor." CR>
                         <QUEUE I-MICROCHIP 3>
                         <MOVE ,MICROCHIP ,HERE>
                         <MOVE ,CLYDE-PANEL ,HERE>
                         <FSET ,CLYDE ,BADRADIOBIT>)
                        (ELSE
                         <TELL ,TOO-STUCK>
                         <PERFORM ,V?EXAMINE ,CLYDE-PANEL>)>)>)
          (<AND <VERB? TAKE REMOVE>
                <DOBJ? CLYDE-PANEL>
                <IN? ,CLYDE-PANEL ,CLYDE>>
           <TELL "You can't just take it like that! " ,TOO-STUCK>
           <PERFORM ,V?EXAMINE ,CLYDE-PANEL>)
          (<VERB? EXAMINE>
           <COND (<IN? ,CLYDE-PANEL ,CLYDE>
                  <TELL 
              "To be honest, the " D ,CLYDE-PANEL " brings back memories.
It reminds you mildly of pubs and difficulties that occurred in said pubs
between sitting down and leaving the pub. You're not sure why, or if the
difficulties were even of any importance to you - you just remember that
there was a difficult situation amongst you, your friends and the bartender,
and that the fate of having another beer hung in the balance." CR>
                  <RTRUE>)
                 (ELSE
                  <RFALSE>)>)>>

<OBJECT MICROCHIP
    (LOC LOCAL-GLOBALS)
    (DESC "microchip board")
    (SYNONYM BOARD MICROCHIP CHIP)
    (ADJECTIVE MICRO MICROCHIP DELICATE FRAGILE)
    (FLAGS TRYTAKEBIT TAKEBIT)
    (ACTION MICROCHIP-F)>

<ROUTINE MICROCHIP-F ()
    <COND (<VERB? TAKE>
           <DEQUEUE I-MICROCHIP>
           <I-MICROCHIP T>)
          (<VERB? EXAMINE>
           <TELL "Well, it looks very delicate." CR>)>>

<ROUTINE I-MICROCHIP ("OPT" TAKE?)
    <MOVE ,MICROCHIP ,LOCAL-GLOBALS>
    <COND (.TAKE?
           <TELL "Unfortunately, as you begin to pick the " D ,MICROCHIP " up, Clyd">)
          (ELSE
           <COND (<IN? ,PLAYER ,DRESSING-ROOM-REU>
                  <TELL CR "\"OOPS!\" yells Clyde as h">)
                 (ELSE
                  <RTRUE>)>)>
    <TELL
"e trips over his own leg and sits directly on the microchip, smashing it to
hundreds of pieces.|Quickly thinking, Clyde dashes all the pieces under the
safe. He explains that if a mess was found, he would get in trouble for it." CR>>






"************************************"
"**** ALL OF THE PEOPLE ROUTINES ****"
"************************************"

<ROUTINE ASKING-ABOUT? (WHO "AUX" DR)
	<COND (<VERB? ASK-ABOUT ;CONFRONT SHOW>
	       <COND (<EQUAL? .WHO ,PRSO>
		      <RETURN ,PRSI>)>)
	      ;(<VERB? FIND ;WHAT>
	       <COND (<EQUAL? .WHO ,WINNER>
		      <RETURN ,PRSO>)>)
	      (T <RFALSE>)>>

<ROUTINE TELL-DUNNO (PER OBJ)
 <COND ;(<FSET? .OBJ ,PERSONBIT>
	<TELL "\"I don't indulge much in idle gossip, you know.\"" CR>)
       (T
	<TELL "\"You know as much as I do.\"" CR>)>>


<CONSTANT CHARACTER-TABLE
	<TABLE (LENGTH PURE) 
        PLAYER MARVIN FORD
		ZAPHOD TRILLIAN
		HEAD-COOK MORPHER-CAPTAIN
		FIRST-CLASS-IDIOT ARK-CAPTAIN
        SLARTY ;CH-DIRK>>

<CONSTANT FOLLOW-LOC	 <TABLE 0 0 0 0 0 0 0 0 0 0 0>>

<CONSTANT TOUCHED-LDESCS <TABLE 0 0 0 0 0 0 0 0 0 0 0>>


<ROUTINE DESCRIBE-PERSON (PER "AUX" (STR <>))
	<SET STR <GETP .PER ,P?LDESC>>
	<COND (<AND .STR ;<NOT <==? .STR 6 ;"walking along">>>
	       <PUT ,TOUCHED-LDESCS <GETP .PER ,P?CHARACTER> .STR>
	       <RFALSE>)>
	<THE-J .PER T T> <TELL " is ">
	<COND (<AND <SET STR <GETPT .PER ,P?WEST>>
		    <SET STR <GET .STR ,NEXITSTR>>>
	       <TELL .STR>)
	      (T
	       <TELL "looking bored">)>
	<TELL ".">
	<COND (<==? .STR 6 ;"walking along"> <PRINTC 32>)
	      (T <CRLF>)>
	<RTRUE>>

<CONSTANT LDESC-STRINGS
<PLTABLE "dancing"
		"sipping sherry"
	;3	"watching you" ;"talking quietly"
		"looking at you with suspicion"
		0 ;"gazing out the window"
	;6	"walking along"
		"sobbing quietly"
		"poised to attack"
	;9	"waiting patiently"
		"eating with relish"
		"preparing dinner"
	;12	"listening to you"
		"lounging and chatting"
		"asleep"
	;15	0 ;"reading a note"
		"listening"
		"preparing to leave"
	;18	"deep in thought"
		"out cold"
		"ignoring you"
	;21	"searching"
		"playing the piano"
		"following you"
	;24	"brushing her hair"
		"looking sleepy">>

;<ROUTINE TELL-ABOUT-OBJECT (PER OBJ GL "AUX" C)
	<COND (<T? <GET .GL ,PLAYER-C>>
	       <SET C <GETP .PER ,P?CHARACTER>>
	       <COND (<ZERO? <GET .GL .C>>
		      <PUT .GL .C T>
		      <RETURN <GOOD-SHOW .PER .OBJ>>)
		     (T <TELL"\"I know that you found a " D .OBJ ".\"" CR>)>)>>

;<ROUTINE JUST-A-PERSON ()
	<COND (<ORDERING?>
		   <PERSON-F ,WINNER>)
		  (<FSET? ,PRSO ,PERSONBIT>
		   <PERSON-F ,PRSO>)
		  (ELSE
		   <PERSON-F ,PRSI>)>>

<ROUTINE PERSON-F (PER ;ARG "AUX" OBJ X (L <LOC .PER>) (C <GETP .PER ,P?CHARACTER>) N)
 <COND (<AND <OR <ALL-OVER-VERB?> <EVERYWHERE-VERB?>>
             <NOT <IN? .PER ,HERE>>>
        <TELL ,NOPE "see ">
        <COND (<AND <FSET? .PER ,SEENBIT>
                    ;<NOT <IN? .PER ,HERE>>>
               <THE-J .PER T><TELL " here." CR>)
              (ELSE
               <TELL "any "><D-J .PER><TELL " here." CR>)>)
       (<VERB? ALARM SHAKE>
	    <COND (<==? ,PRSO .PER>
	           <COND (<UNSNOOZE .PER T>
	    	          ;<TELL He .PER " gasps to see you so close!" CR>
	    		      <TELL He .PER " shakes you off." CR>
	    	          <RTRUE>)
	    	         (T
	    	          <TELL He+verb .PER "is" " still ">
	    	          <COND (<SET X <GETP .PER ,P?LDESC>>
	    		             <TELL <GET ,LDESC-STRINGS .X>>)
	    		            (<SET X <GETPT .PER ,P?WEST>>
	    		             <TELL <GET .X ,NEXITSTR>>)>
	    	          <TELL ,PAUSES>)>)>)
       (<VERB? GIVE>
	    <COND (<AND <EQUAL? ,PRSI .PER> <HELD? ,PRSO>>
	           <COND (<NOT <GRAB-ATTENTION .PER>><RFATAL>)>
	           <RFALSE>)>)
       (<VERB? LAMP-OFF>
		<WONT-HELP>
        <RTRUE>)
       (<VERB? MUNG SEARCH SEARCH-FOR>
	    <COND (<AND <==? .PER ,PRSO>
	    	        <FSET? .PER ,PERSONBIT>
	    	        <NOT <FSET? .PER ,MUNGBIT>>>
	           ;<PUTP .PER ,P?LINE <+ 1 <GETP .PER ,P?LINE>>>
	           ;<COND (<NOT <EQUAL? <GETP .PER ,P?LDESC>
	    			   4 ;"looking at you with suspicion">>
	    	          <PUTP .PER ,P?LDESC 20 ;"ignoring you">)>
	           <TELL
He .PER " pushes you away and mutters, \"I don't think that's
called for.\"" CR>
	           <RTRUE>)
              (<AND <==? .PER ,PRSO>
	    	        <FSET? .PER ,PERSONBIT>>
               <NOTHING-SPECIAL>)>)
       (<VERB? SHOW>
	    <COND (<==? .PER ,PRSO>
	           <COND (<AND ;<NOT <EQUAL? ,PRSI ,PASSAGE>>
	    		   <NOT <GRAB-ATTENTION .PER>>>
	    	      <RFATAL>)
	    	     (T
	    	      <PERFORM ,V?TELL-ABOUT ,PRSO ,PRSI>
	    	      <RTRUE>)>)>)
       (<VERB? SMILE>
	    <COND (<==? .PER ,PRSO>
	           <COND (<NOT <GRAB-ATTENTION .PER>>
	    	      <RFATAL>)
	    	     (T
	    	      <TELL He+verb ,PRSO "smile" " back at you." CR>
	    	      <RTRUE>)>)>)
       (<VERB? TELL-ABOUT>
	    <COND (<==? .PER ,PRSO>
	           <TELL "\"I don't understand! What are you referring to?\"" CR>
               <RTRUE>)>)
       ;(<VERB? THROW-AT>
	    <COND (<AND <==? .PER ,PRSI>
	    	    <FSET? .PER ,PERSONBIT>
	    	    <NOT <FSET? .PER ,MUNGBIT>>>
	           <MOVE ,PRSO ,PRSI>
	           <TELL He .PER " catches "> <THE-J ,PRSO T> <TELL " with" his .PER !\ >
	           <COND ;(<EQUAL? .PER ,DEB ,DOCTOR> <TELL "lef">)
	    	     (T <TELL "righ">)>
	           <TELL "t hand." CR>
	           <RTRUE>)>)
        (<AND <==? .PER ,PRSI>
              <VERB? THROW-AT>>
         <TELL "That wouldn't be nice." CR>)
       ;(<SET OBJ <ASKING-ABOUT? .PER>>
	    <COND (<NOT <GRAB-ATTENTION .PER>>
	           <RFATAL>)
	          ;(<SET X <COMMON-ASK-ABOUT .PER .OBJ>>
	           <COND (<==? .X ,M-FATAL> <RFALSE>) (T <RTRUE>)>)
	          (T <DONT-KNOW .PER .OBJ>)>)
        (<AND <VERB? ASK-ABOUT>
              <EQUAL? ,PRSO .PER>
              <COMMON-ASK-ABOUT .PER ,PRSI>>
         <RTRUE>)
		(<AND <ORDERING?>
              <EQUAL? ,WINNER .PER>>
         <COND (<OR <VERB? WHAT WHAT-ABOUT TALK-ABOUT>
                    <AND <VERB? TELL>
                         <DOBJ? PLAYER>>>
                <PERFORM ,V?ASK-ABOUT .PER ,PRSO>
                <RTRUE>)
               (<AND <VERB? GIVE THROW-AT>
                     <EQUAL? ,PRSI ,PLAYER>>
                <RESET-WINNER>
                <PERFORM ,V?ASK-FOR .PER ,PRSO>
                <RTRUE>)
               (ELSE
                <TELL He+verb .PER "ignore" " you." CR>)>)
        (ELSE
         <COND (<COMMON-OTHER .PER> <RTRUE>)
               (T <RFALSE>)>)>>

"People Functions"

<ROUTINE CARRY-CHECK (PER)
 <COND (<FIRST? .PER>
	;<TELL He+verb .PER "is" " holding:" CR>
	;<PRINT-CONT .PER>
	<OPEN-ANYTHING .PER <>>
	;<TELL ,PAUSES>)>>

<ROUTINE TRANSIT-TEST (PER)
	<COND (<OR <VERB? DISEMBARK LEAVE TAKE-TO THROUGH WALK WALK-TO>
		   ;<AND <VERB? FOLLOW>
			<EQUAL? ,PRSO ,PLAYER>>>
	       T ;<WILLING? .PER>)>>

<ROUTINE COM-CHECK (PER "AUX" N)
 	 ;<SET N <GETP .PER ,P?LINE>>
	 <COND (<VERB? $CALL>	;"e.g. TAMARA, LOVE ME"
		;<DONT-UNDERSTAND>
		<RETURN ,M-OTHER>)
	       (<TRANSIT-TEST .PER>
		<RFATAL>)
	       (<VERB? ALARM HELLO SORRY>
		<COND (<OR <DOBJ? ROOMS> <==? ,PRSO .PER>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,PRSA .PER>
		       <RTRUE>)
		      (T <RFALSE>)>)
	       (<L? 0 .N>
		<TELL "\"I'm too ">
		<COND (<1? .N> <TELL "peeved">) (T <TELL "angry">)>
		<TELL " with you now.\"" CR>
		<RTRUE>)
	       (<VERB? NO THANK YES>
		<RFATAL>		;"let thru to next handler")
	       (<VERB? FOLLOW WALK-TO>
		<COND (<AND <VERB? WALK-TO>
			    <DOBJ? SLEEP-GLOBAL ;BED>>
		       <RFATAL>)
		      (T
		       <TELL
"\"I will go where I please, thank you very much.\"" CR>
		       <RTRUE>)>)
	       (<VERB? INVENTORY>
		<COND (<NOT <CARRY-CHECK .PER>>
		       <TELL He+verb .PER "is" "n't holding anything." CR>)>
		<RTRUE>)
	       (<VERB? LISTEN>
		<COND (<OR <EQUAL? ,PRSO ,PLAYER>
			   <NOT <IN? ,PRSO ,GLOBAL-OBJECTS>>>
		       <TELL "\"I'm trying to!\"" CR>
		       <RTRUE>)
		      (T <RFALSE>)>)
	       (<VERB? RUB>
		<FACE-RED>
		<RTRUE>)>
	 <COND ;(<AND <VERB? DANCE> <EQUAL? ,PRSO ,PLAYER>>
		<SETG WINNER ,PLAYER>
		<PERFORM ,PRSA .PER>
		<RTRUE>)
	       (<OR ;<VERB? DANCE>
		    <AND <VERB? WALK>
			 <DOBJ? P?OUT>>>
		<RFATAL> ;"let thru to next handler")
	       (<VERB? KISS>
		<UNSNOOZE .PER>
		<TELL
"\"I really don't think this is the proper time or place.\"" CR>)
	       ;(<VERB? WALK-TO>
		<COND (<DOBJ? HERE GLOBAL-HERE>
		       <TELL "\"I am here!\"" CR>)>)
	       (<VERB? TAKE ;"GET SEND SEND-TO BRING">
		<COND (<IN? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?GIVE ,PRSO .PER>
		       <RTRUE>)>)
	       (<VERB? EXAMINE LOOK-INSIDE READ>
		<COND (<IN? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SHOW .PER ,PRSO>
		       <RTRUE>)>)
	       (<AND <VERB? GIVE THROW-AT> <FSET? ,PRSI ,PERSONBIT>>
		<SETG WINNER ,PRSI>
		<PERFORM ,V?ASK-FOR .PER ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SGIVE> <FSET? ,PRSO ,PERSONBIT>>
		<SETG WINNER ,PRSO>
		<PERFORM ,V?ASK-FOR .PER ,PRSI>
		<RTRUE>)
	       (<VERB? HELP>
		<COND (<EQUAL? ,PRSO <> ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK .PER>
		       <RTRUE>)
		      (T <RFALSE>)>)
	       (<VERB? FIND SHOW SSHOW>
		<COND (<VERB? SHOW>
		       <SETG PRSA ,V?SSHOW>
		       <SET N ,PRSI>
		       <SETG PRSI ,PRSO>
		       <SETG PRSO .N>)>
		<COND (<IN? ,PRSO ,ROOMS>	;"SHOW ME MY ROOM"
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?WALK-TO ,PRSO>
		       <RTRUE>)
		      (<IN? ,PRSO .PER>
		       <COND (<==? <ITAKE <>> T>
			      <TELL
He .PER " fumbles in" his .PER " pocket and produces" him ,PRSO ,PAUSES>)>
		       <RTRUE>)
		      (<VERB? FIND>
		       ;<SETG WINNER ,PLAYER>
		       ;<PERFORM ,PRSA ,PRSO>
		       <RFALSE>)>)
	       (<VERB? TELL>
		<COND (<EQUAL? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK .PER>
		       <RTRUE>)>)
	       (<VERB? TELL-ABOUT>
		<COND (<EQUAL? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK-ABOUT .PER ,PRSI>
		       ;<SETG WINNER .PER>
		       <RTRUE>)>)
	       (<VERB? STOP WAIT-FOR>
		<COND (<EQUAL? ,PRSO ,HERE ,GLOBAL-HERE ,PLAYER ,ROOMS>
		       <COND (<==? .PER ,FOLLOWER>
			      <SETG FOLLOWER 0>
			      <TELL "\"As you wish.\"" CR>)
			     (T
			      <SETG WINNER ,PLAYER>
			      <PERFORM ,V?$CALL .PER>
			      <RTRUE>)>)>)
	       (<VERB? ;WHAT TALK-ABOUT>
		<SETG WINNER ,PLAYER>
	        <PERFORM ,V?ASK-ABOUT .PER ,PRSO>
		<RTRUE>)>>

<ROUTINE COMMON-ASK-ABOUT (PER OBJ)
	<COND ;(<EQUAL? .OBJ .PER>
		   <TELL "\"I have no secrets. Anyone can see what I am.\"" CR>)
		  (<EQUAL? .OBJ ,PLAYER>
           <COND (<EQUAL? .PER ,POLICEMAN>
                  <TELL "\"That's exactly what I want to find out from you!\"" CR>)
                 (<EQUAL? .PER ,BOUNCER>
                  <TELL
"The bouncer explains to you exactly who would care about that kind
of thing, and he would like to tell you that it does not include him." CR>)
                 (<EQUAL? .PER ,CLYDE>
                  <TELL
"\"Well, I dunno,\" he says. \"Apparently you're some morpher person, but
you don't look like any morpher to me. Oh, wait, that's the point...\"" CR>)
		         (ELSE
                  <TELL "\"You're Arthur Dent, the next-to-last Earthling.\"" CR>)>
           <RTRUE>)
		  (<FSET? .OBJ ,PERSONBIT>
		   <RFALSE>)
		  (<EQUAL? .OBJ ,OBJECT-OF-GAME>
		   <COND (<EQUAL? .PER ,BENJY ,PERCY>
		  		  <TELL ,YOUR-BRAIN
" It's a very interesting subject to work on, and it's what we set out to find.
But be careful with that head - our life's work is right there in your brain.\"" CR>)
				 (ELSE
				  <TELL ,ASK-ABOUT-OBJECT CR>)>
           <RTRUE>)
		  ;(<IN? .OBJ .PER>
		   <TELL "\"I have it right here.\"" CR>)
          (ELSE
           <TELL He .PER " shrugs." CR>
           <RTRUE>)>>

<ROUTINE COMMON-OTHER (PER "AUX" (X <>) Y N VAL)
 <COND (<VERB? ASK> <RFALSE>)
       (<VERB? EXAMINE>
        <COND (<SET Y <GETP .PER ,P?DESCFCN>>
	    	   <SET VAL <APPLY .Y ,M-OBJDESC>>)
              (ELSE
               <TELL <GETP .PER ,P?TEXT> CR>)>
	    <COND (<AND <IN? .PER ,HERE>
	    	        <SET N <FIRST? .PER>>
	    	        <NOT <FSET? .N ,NDESCBIT>>>
	           <COND (<CARRY-CHECK .PER>
	    	          <SET X T>)>)>
	    ;<COND (<FSET? .PER ,MUNGBIT>
	           <COND (<NOT <ZERO? .X>> <TELL "And">)>
	           <HE-SHE-IT .PER <NOT .X> "is">
	           <TELL !\  <GET ,LDESC-STRINGS <GETP .PER ,P?LDESC>> ,PAUSES>)>
	    <RTRUE>)
       (<AND <EQUAL? ,PRSO .PER> 
             <VERB? SHOW>>
	    <PERFORM ,V?ASK-ABOUT ,PRSO ,PRSI>
	    <RTRUE>)>>