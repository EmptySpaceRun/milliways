"MAGRATHEA for
        the Restaurant at the End of the Universe"

<OBJECT MAGRATHEA
	(LOC LOCAL-GLOBALS)
	(DESC "Magrathea")
	(SYNONYM MAGRATHEA LOST LEGENDARY CORPS)
	(ADJECTIVE LOST LEGENDARY PLANET NAMED CALLED)
	(FLAGS NARTICLEBIT)
	(ACTION MAGRATHEA-F)>

<ROUTINE MAGRATHEA-F ()
	 <COND (<VERB? LEAVE DISEMBARK>
		    <V-WALK-AROUND>)
	       (<AND <VERB? THROUGH WALK-TO BOARD>
                 <ON-MAG? ,PLAYER>>
		    <TELL "You're in it!" CR>)
           (<VERB? FIND WALK-TO>
            <COND (<ON-MAG? ,PLAYER>
                   <ALREADY ,WINNER "in it">)
                  (ELSE
                   <TELL ,DO-YOURSELF CR>)>)>>

<ROUTINE ON-MAG? (OBJ)
   <COND (<OR 
           <EQUAL? <META-LOC .OBJ> ,HATCHWAY ,RAMP ,BLIGHTED-GROUND ,LIP1 ,LIP2 ,LIP3 ,LIP4 ,WHALE-CRATER>
	       <EQUAL? <LOC .OBJ> ,HATCHWAY ,RAMP ,BLIGHTED-GROUND ,LIP1 ,LIP2 ,LIP3 ,LIP4 ,WHALE-CRATER>>
	  <RTRUE>)
	 (T
	  <RFALSE>)>>


"PART 1 - ON MAGRATHEA'S SURFACE"

<GLOBAL LOOK-COUNTER-A 0>
<GLOBAL TAKE-COUNTER-A 0>
;<GLOBAL RADIO-MILLIWAYS <>>
<GLOBAL MAD-RADIO-COUNTER 0>
;<GLOBAL PLANT-TO-RADIO <>>
<GLOBAL PLUG-POINT <>>
<GLOBAL MARVIN-TIMES-FOLLOW 0>
<GLOBAL WITHOUT-A-WORD <>>
<GLOBAL GONE-DOWN <>>

"Scene 1 - The Ship"

<ROOM HATCHWAY
    (IN ROOMS)
    (DESC "Hatchway")
    (LDESC 0)
    (DOWN TO RAMP IF HATCH IS OPEN)
    (SOUTH TO RAMP IF HATCH IS OPEN)
	(EAST SORRY "No need. You've accomplished eveything you need to there.")
    (UP PER BANG-HEAD)
    (OUT TO RAMP IF HATCH IS OPEN)
    (GLOBAL HATCH HEART-OF-GOLD MAGRATHEA)
    (FLAGS ONBIT LIGHTBIT ;GUIDEBIT)
	(THINGS BOTTOM (BOTTOM HATCHWAY GANGWAY) GLOBAL-ROOM-F
            (OTHER ANOTHER JAMMED CLOSED SHUT) (DOOR PANEL) OTHER-DOOR-F
            <> (LADDER STAIRCASE) LADDER-F)
	(ACTION HATCHWAY-F)>

<ROUTINE OTHER-DOOR-F ()
    <COND (<VERB? OPEN>
           <TELL "It's been jammed." CR>)
          (<VERB? BOARD THROUGH CLIMB-UP>
           <DO-WALK ,P?UP>
           <RTRUE>)
          (<VERB? CLOSE>
           <TELL ,ALREADY-IS CR>)
          (ELSE
           <USELESS>)>>

<ROUTINE LADDER-F ()
    <COND (<VERB? CLIMB-UP BOARD>
           <DO-WALK ,P?UP>
           <RTRUE>)
          (ELSE
           <USELESS "ladder" T>)>>

<ROUTINE HATCHWAY-F (RARG)
	<COND (<EQUAL? .RARG ,M-ENTER>
           <REPLACE-NOUN? ,HATCH ,W?DOOR ,W?XZZZP>)
          (<EQUAL? .RARG ,M-LOOK>
		   <TELL
"You are at the bottom of a gangway. A hatch below you,
which leads out to " ,LOST-PLANET ", is open. Another
door leads up, but Eddie closed it when you left." CR>)>>

<OBJECT HATCH
	(LOC LOCAL-GLOBALS)
	(DESC "hatch")
	(SYNONYM HATCH ;HATCHWAY DOOR)
    (ADJECTIVE OPEN WIDE)
	(FLAGS DOORBIT OPENBIT DOORBIT)
    (GENERIC DOOR-G)
	(ACTION HATCH-F)>

<ROUTINE HATCH-F ()
  <COND (<VERB? EXAMINE>
            <TELL "The hatch leading down onto the ramp and up to the hatchway." CR>)
		(<VERB? CLIMB-DOWN CLIMB-UP>
            <PERFORM ,V?THROUGH ,HATCH>)
        (<VERB? OPEN>
			<TELL "It's already open." CR>)
		(<VERB? CLOSE>
			<TELL
"Imagine moving a 200-KG, electronic door that doesn't
want to close. That is exactly what you're up against." CR>)>>

<ROOM RAMP
    (IN ROOMS)
    (DESC "Ramp")
	(SYNONYM BEAM BEAMS)
    (ADJECTIVE MATTER TRANSFERE)
    (NORTH TO HATCHWAY IF HATCH IS OPEN)
    (UP TO HATCHWAY IF HATCH IS OPEN)
    (IN TO HATCHWAY IF HATCH IS OPEN)
    (DOWN TO BLIGHTED-GROUND)
    (SOUTH TO BLIGHTED-GROUND)
    (OUT TO BLIGHTED-GROUND)
    (WEST PER BANG-HEAD)
	(EAST PER BANG-HEAD)
	(NE PER BANG-HEAD)
	(NW PER BANG-HEAD)
	(SE PER FALL-OFF-RAMP)
	(SW PER FALL-OFF-RAMP)
    (GLOBAL HATCH HEART-OF-GOLD MAGRATHEA)
	(ACTION RAMP-F)
    (FLAGS ONBIT LIGHTBIT OUTSIDEBIT ;ONTOPBIT ;GUIDEBIT)
    (GENERIC BEAM-G)
    (THINGS (FAMILIAR FRIENDLY RECOGNISABLE STRANGE)
                (SHAPE OUTLINE SILHOUETT GLINT TWINKLING
                    TWINKLE LIGHT SPARKLE SPARKLING) FAMILIAR-SHAPE-F)>

<ROUTINE FAMILIAR-SHAPE-F ()
    <COND (<OR <AND <NOT <IN? ,GOWN ,HATCHWAY>>
                    <OR <NOUN-USED? ,PRSO ,W?SHAPE ,W?OUTLINE ,W?SILHOUETT>
                        <NOUN-USED? ,PRSI ,W?SHAPE ,W?OUTLINE ,W?SILHOUETT>>>
               <AND <NOT <IN? ,RADIO ,BLIGHTED-GROUND>>
                    <OR <NOUN-USED? ,PRSO ,W?LIGHT ,W?SPARKLE ,W?SPARKLING>
                        <NOUN-USED? ,PRSI ,W?LIGHT ,W?SPARKLE ,W?SPARKLING>
                        <NOUN-USED? ,PRSO ,W?GLINT ,W?TWINKLING ,W?TWINKLE>
                        <NOUN-USED? ,PRSI ,W?GLINT ,W?TWINKLING ,W?TWINKLE>>>
               <AND <NOT <IN? ,RADIO ,BLIGHTED-GROUND>>
                    <NOT <IN? ,GOWN ,HATCHWAY>>>>
           <CANT-SEE ,PSEUDO-OBJECT>
           <FUCKING-CLEAR>
           <RTRUE>)>
    <COND (<VERB? EXAMINE WHAT FIND>
           <TELL "You'll have to go to it." CR>)
          (<VERB? FOLLOW WALK-TO>
           <COND (<OR <NOUN-USED? ,PRSO ,W?SHAPE ,W?OUTLINE ,W?SILHOUETT>
                      <NOUN-USED? ,PRSI ,W?SHAPE ,W?OUTLINE ,W?SILHOUETT>>
                  <DO-WALK ,P?UP>)
                 (<OR <NOUN-USED? ,PRSO ,W?LIGHT ,W?SPARKLE ,W?SPARKLING>
                      <NOUN-USED? ,PRSI ,W?LIGHT ,W?SPARKLE ,W?SPARKLING>
                      <NOUN-USED? ,PRSO ,W?GLINT ,W?TWINKLING ,W?TWINKLE>
                      <NOUN-USED? ,PRSI ,W?GLINT ,W?TWINKLING ,W?TWINKLE>>
                  <DO-WALK ,P?DOWN>)
                 (ELSE
                  ;%<DEBUG-CODE 
                      <COND (<T? ,P-DBUG>
                             <V-FOO>
                             <RTRUE>)>>
                  <TELL "Just type whether you want to go UP or DOWN." CR>)>)
          (<AND <NOT <VERB? ASK-ABOUT>>>
           <NOT-HERE ,PSEUDO-OBJECT>)>>

<ROUTINE RAMP-F (RARG)
    <COND (<EQUAL? .RARG ,M-ENTER>
           <REPLACE-NOUN? ,HATCH ,W?XZZZP ,W?DOOR>)
          (<EQUAL? .RARG ,M-LOOK>
		   <COND (<EQUAL? ,VERBOSITY 2>
		          <TELL
"You are on the ramp leading from the starship Heart of Gold down to
the surface of " ,LOST-PLANET ", which isn't. Lost, that is. It isn't
lost because if it were, you wouldn't be here, but you are, so it isn't.
If the logic of all that is too much for you, just go down to the
surface or up to the hatchway. Go anywhere else and you'll just get
into awful difficulties. Not that you'll take any notice, of course;
just don't say you weren't warned." CR>)
                 (ELSE
                  <TELL
"You are on the ramp leading down from the starship Heart
of Gold to the surface of " ,LOST-PLANET ". To the north
is the hatchway, and down leads to the Blighted Ground." CR>)>)>
	<COND (<NOT ,WITHOUT-A-WORD>
		   <TELL
"Without a word, your friends return to the ship, leaving you (once again)
to scout the area without having to do it themselves; and leaving you alone
with Marvin - which is as close to no companion as you can get." CR CR "You
notice a strange twinkling down to the south, whereas you can see a familiar
shape up the ramp - to the north. You can go to either of these; they don't
lead anywhere helpful." CR>
		   <SETG WITHOUT-A-WORD T>)>>

<ROUTINE FALL-OFF-RAMP ()
	<TELL
"You fall off the edge of the ramp onto the surface
of Magrathea. It's not a long way down and the ground
breaks your fall, but nevertheless you die. ">
	 <COND (<L? ,MOVES 10>
        <JIGS-UP
"This is something which is going to happen to you
quite a lot, so you might as well get used to it.">)
        (ELSE
			<JIGS-UP
"You might not think it's very fair, but nobody
said the Galaxy was a very fair place anyway.">)>
	 <RFALSE>>

<OBJECT ONRAMP
	(LOC RAMP)
	(DESC "ramp")
	(SYNONYM RAMP STAIR STAIRCASE)
	(FLAGS SURFACEBIT TRANSBIT NDESCBIT)
	(ACTION FLOOR-F)>


<ROOM BLIGHTED-GROUND
    (IN ROOMS)
	(DESC "Blighted Ground")
	(SYNONYM ROBOT ROBOTS INTELLIGENCE REPORTS REPORT)
	(ADJECTIVE ROBOT)
	(FDESC
"The surface of Magrathea is barren and inhospitable:
a cold, constant wind, a sifting of dust, no sign of
life or movement. Except for a strong fishy odour.|
|The ramp lies upwards to the north; to the south-east,
there's an unhealthy-looking crater.")
	(LDESC
"The land is barren and cold - to the north is the ramp
back to the Heart of Gold; to the south-east, there's an
unhealthy-looking crater.")
    ;(ACTION BLIGHTED-GROUND-F)
    (NORTH TO RAMP)
    (UP TO RAMP)
	;(DOWN PER CANNOT-GO)
    (SOUTH PER WANDER-AROUND)
	(WEST PER WANDER-AROUND)
	(EAST PER WANDER-AROUND)
	(NE PER WANDER-AROUND)
	(SE TO LIP1)
	(NW PER WANDER-AROUND)
	(SW PER WANDER-AROUND)
	(GLOBAL HEART-OF-GOLD MAGRATHEA)
    (THINGS (BLIGHTED COLD BARREN MISERABLE) (GROUND LAND) GLOBAL-ROOM-F
            (FISHY OILY OIL) (SMELL ODOR ODOUR WHIFF) UNAPPETIZING-F)
	(FLAGS ONLANDBIT ONBIT LIGHTBIT OUTSIDEBIT ;GUIDEBIT)>

<OBJECT BLUE-FROB
    (LOC BLIGHTED-GROUND)
    (SDESC "blue frob")
    (SYNONYM FROB RIDGE KNIFE PENKNIFE POWER)
    (ADJECTIVE BLUE SMALL FLIMSY WEAK)
    (DESCFCN BLUE-FROB-D)
    ;(FDESC "On the ground is a blue frob.")
    ;(LDESC "There is a blue frob here.")
    (ACTION BLUE-FROB-F)
    (GENERIC FROB-G)
    (FLAGS ;TOUCHBIT TAKEBIT TRYTAKEBIT)
    (SIZE 2)>

<ROUTINE BLUE-FROB-D ()
    <COND (<NOT <FSET? ,BLUE-FROB ,SEENBIT>>
           <TELL "On the ground">)
          (ELSE
           <TELL "There">)>
    <TELL " is ">
    <THE-J ,BLUE-FROB <>>
    <COND (<NOT <FSET? ,BLUE-FROB ,SEENBIT>>
           <FSET ,BLUE-FROB ,SEENBIT>)
          (ELSE
           <TELL " here">)>
    <TELL ,PAUSES>>

<ROUTINE BLUE-FROB-F ()
    <COND (<AND <NOUN-USED? ,BLUE-FROB ,W?KNIFE ,W?PENKNIFE>
                <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">>
           <CANT-SEE <> "small penknife">
           <FUCKING-CLEAR>
           ;<V-FOO>
           <RTRUE>)
          (<AND <NOUN-USED? ,BLUE-FROB ,W?RIDGE>
                <NOT <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">>>
           <CANT-SEE <> "ridge">
           <FUCKING-CLEAR>
           ;<V-FOO>
           <RTRUE>)
          (<AND <NOUN-USED? ,BLUE-FROB ,W?FROB ,W?FROBS>
                <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "small penknife">>
           <CANT-SEE <> "frob">
           <FUCKING-CLEAR>
           ;<V-FOO>
           <RTRUE>)
          (<AND <NOUN-USED? ,BLUE-FROB ,W?POWER>
                <NOT <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob of power">>>
           <CANT-SEE <> "anything that powerful">
           <FUCKING-CLEAR>
           ;<V-FOO>
           <RTRUE>)>
    <COND (<VERB? EXAMINE>
        <COND (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">
            <TELL "A small blue frob. There appears to be a ridge halfway along it." CR>
            <FSET ,BLUE-FROB ,TOUCHBIT>)
        (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "small penknife">
            <TELL "It's a flimsy penknife. Who knows what its point in life is?" CR>)
        (ELSE
            <TELL
"Apparently, it's a blue Frob of Power, but it looks more like a small penknife to you." CR>)>)
    (<AND <VERB? PULL-APART MOVE OPEN>
          <DOBJ? BLUE-FROB>>
        <COND (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">
            <TELL "You pull the thing in two along the ridge. Surprisingly it turns
into a flimsy penknife with a blue handle. The frob will never be the same again." CR>
            ;<REMOVE ,BLUE-FROB>
            <PUTP ,BLUE-FROB ,P?SDESC "small penknife">
			<THIS-IS-IT ,BLUE-FROB>
            ;<INCREMENT-SCORE 10> ;"Moved to leaving Dark"
            <RTRUE>)
        (T
            <TELL "Doesn't seem like you can do that now." CR>
            <RTRUE>)>)
    (<AND <VERB? RUB>
          <NOT ,PRSI>>
        <COND (<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">
            <TELL
"There's something odd about the ridge halfway along it, as if it could pull apart." CR>)
        (ELSE
            <TELL "The edge looks sharp, but it isn't." CR>)>)>>


; "DO NOT TOUCH THE RADIO SYNONYMS unless you weant to never get this code compiled EVER AGAIN - :)"

<OBJECT RADIO
    (LOC BLIGHTED-GROUND)
    (SDESC "black metallic box")
    (SYNONYM TECHNOLOGY RADIO MUSIC TECH TUNE HUNK METAL BOX)
    (ADJECTIVE PIECE SAD OLD HAPPY BLACK METAL HUNK METALLIC)
    ;(FDESC "There is a miserable-looking piece of technology here.")
    ;(LDESC "There is a radio here.")
	(DESCFCN RADIO-D)
    (ACTION RADIO-F)
    (FLAGS ;TOUCHBIT TAKEBIT TRYTAKEBIT CONTBIT OPENBIT)
    (SIZE 11)>

<GLOBAL RAD-EXAMINE 0>

<ROUTINE RADIO-F ()
	<COND (<VERB? EXAMINE>
		   <COND (<NOT <FSET? ,RADIO ,TOUCHBIT>>
                  <COND (<=? ,RAD-EXAMINE 3 5 8 12 17 23>
                         <TELL "Look, it's just... You need to pick it up. That's it." CR>)
                        (ELSE
                         <TELL
,NOPE "tell what it is by looking at it while it's on the ground." CR>)>
			      <SETG RAD-EXAMINE <+ ,RAD-EXAMINE 1>>
                  <FSET ,RADIO ,RADPLUGBIT>
                  <RTRUE>)>
		   <TELL "It's an old radio, which">
		   <FINE-PRODUCT>
		   <COND (<NOT <EQUAL? <GETP ,RADIO ,P?SDESC> "radio">>
                  <PUTP ,RADIO ,P?SDESC "radio">
                  <QUEUE I-RADIO-MILLIWAYS 3>)>)>
    <COND (<AND <VERB? WALK-TO>
                <FSET? ,RADIO ,RADPLUGBIT>
                <NOT <FSET? ,RADIO ,TOUCHBIT>>>
           <TELL
"Alright, it's not that you're far away from it. You just
can't see it well. Maybe you could try picking it up first?" CR>
           <RTRUE>)
          (<AND <VERB? EXAMINE LISTEN>>
		   <COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                  <TELL "It is plugged into the loudspeaker." CR>
                  <RTRUE>)>
           <TELL "It plays a">
           <COND (<FSET? ,RADIO ,BADRADIOBIT>
                  <TELL " soft static that grinds at your ears. Well, at least it isn't the music.">)
                 (<FSET? ,PLANT ,RADPLUGBIT>
		          <TELL "n old, melancholy tune.">)
		         (ELSE
		          <TELL
" cheerful, jolly tune, which is not perfect for the mood you are in.
It looks like something is missing - you just can't tell what.">)>
           <FSET ,RADIO ,TOUCHBIT>
		   <CRLF>)
	      (<VERB? PLUG PUT-IN>
		   <COND (<IOBJ? PLANT>
		          <PERFORM ,V?PLUG ,PLANT ,RADIO>
                  <RTRUE>)
                 (<IOBJ? LOUDSPEAKER>
		          <RFALSE>
                  ;<PERFORM ,V?PLUG ,LOUDSPEAKER ,RADIO>
                  ;<RTRUE>)
		         (ELSE
		          <RFALSE>)>)
	      (<VERB? LAMP-OFF LAMP-ON>
		   <TELL "You fiddle around for a few seconds with "><THE-J ,RADIO T><TELL " but find no switch." CR>)>>

<ROUTINE RADIO-D ()
	<COND (<AND <NOT <EQUAL? <GETP ,RADIO ,P?SDESC> "radio">>
                <IN? ,RADIO ,BLIGHTED-GROUND>>
		   <TELL "Lying face-down in the dust">
		   <COND (<OR <EQUAL? <LOC ,BLUE-FROB> <LOC ,RADIO>>
		   			  <IN? ,BLUE-FROB ,PSEUDO-OBJECT>>
		   		  <TELL " next to the blue frob">)>
		   <TELL " is "><THE-J ,RADIO <>><TELL ", which has strange things protruding from it." CR>)
		  (ELSE
		   <TELL "There is "><THE-J ,RADIO <>><TELL " here." CR>)>>

<ROUTINE I-RADIO ()
	<COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
           <RTRUE>)
          (<AND <NOT <FSET? ,RADIO ,BADRADIOBIT>>
				<ACCESSIBLE? ,RADIO>
				<EQUAL? <GETP ,RADIO ,P?SDESC> "radio">>
		   <SETG MAD-RADIO-COUNTER <+ ,MAD-RADIO-COUNTER 1>>
		   <COND (<EQUAL? ,MAD-RADIO-COUNTER 15>
		    	  <TELL CR "The music from the radio is starting to make you feel tired." CR>)
		         (<EQUAL? ,MAD-RADIO-COUNTER 23>
		          <TELL CR "You can really feel the effect of the music on the radio." CR>)
		         (<EQUAL? ,MAD-RADIO-COUNTER 28>
		          <TELL CR
"The awful music from the radio is starting to have the same effect
on you as, say, a good solid kick in the head. You recoil from the
shock of realising that the radio's music could be harmful to you." CR>)
		         (<EQUAL? ,MAD-RADIO-COUNTER 30>
		          <TELL CR "The ground around you dips and sways, tripping over itself." CR>)
		         (<EQUAL? ,MAD-RADIO-COUNTER 32>
		          <TELL CR "You begin to lose consciousness" ,ELLIPSIS CR>)
		         (<EQUAL? ,MAD-RADIO-COUNTER 33>
		          <TELL CR
"You collapse on the floor, and the tunes act as anaesthetic to everything but your
head. This could mean more to you, but you aren't really thinking about that - much
less anything, to be honest. This is because" ,ELLIPSIS>
			      <JIGS-UP "">)>)
	      (ELSE
		   <COND (<AND <G? ,MAD-RADIO-COUNTER 0>
                       <EQUAL? <MOD ,MAD-RADIO-COUNTER 2> 0>
				       <FSET? ,RADIO ,BADRADIOBIT>>
			      <SETG MAD-RADIO-COUNTER <- ,MAD-RADIO-COUNTER 1>>)>)>>

<ROUTINE I-RADIO-MILLIWAYS ()
    <COND (<VISIBLE? ,RADIO>
           <CRLF>
           <THE-J ,RADIO T T><TELL " stops playing ">
           <COND (<FSET? ,RADIO ,BADRADIOBIT>
                  <TELL "static">)
                 (<FSET? ,PLANT ,RADPLUGBIT>
                  <TELL "the sad tune">)
                 (ELSE
                  <TELL "its happy song">)>
           <TELL " to broadcast an announcement:" CR CR>
           <HLIGHT ,H-ITALIC>
           <TELL
"\"Welcome, everybody, to Milliways, " !\t ,RATEOTU "!
Everybody who is anybody at any point in time and/or
space will know about this place. Welcome, all sorts
of living things, to your favourite place in all the
Universe! Join us at the most spectaular attraction
in the whole Universe! And DON'T PANIC!\"" CR CR>
           <HLIGHT ,H-NORMAL>
           <TELL
"After that, it lapses back into what it was playing beforehand." CR>)>>

<OBJECT CHANNEL
	(LOC GLOBAL-OBJECTS)
	(DESC "radio channel")
	(SYNONYM CHANNEL TUNE FREQUENCY STATION CHANNELS)
	(ADJECTIVE DIFFERENT TO RADIO)
	(FLAGS NDESCBIT INTEGRALBIT)
	(ACTION CHANNEL-F)>

<ROUTINE CHANNEL-F ()
	<COND (<NOT <VISIBLE? ,RADIO>>
		   <CANT-SEE ,CHANNEL>)
	      (ELSE
		   <COND (<VERB? CHANGE>
		   	      <COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                         <TELL "Changing the channel does nothing now." CR>)
                        (<FSET? ,RADIO ,BADRADIOBIT>
		   	   	         <TELL "It returns to the ">
		   	   	         <COND (<FSET? ,PLANT ,RADPLUGBIT>
		   	   	         	    <TELL "mesmerisingly sad tune">)
		   	   	               (ELSE 
		   	   	         	    <TELL "happy tune">)>
		   	   	         <TELL " that it was before." CR>
		   	   	         <FCLEAR ,RADIO ,BADRADIOBIT>)
		   	            (ELSE 
		   	   	         <TELL "Your ears are relieved of the horrible stuff you had to endure before,
which is replaced with static." CR>
				         <FSET ,RADIO ,BADRADIOBIT>)>)
			     (<VERB? LISTEN>
				  <PERFORM ,V?LISTEN ,RADIO>
				  <RTRUE>)>)>>

<GLOBAL WANDERING 0>

<ROUTINE WANDER-AROUND ()
	<COND (<0? ,WANDERING>
		   <TELL 
"You wander gloomily around for a while, dirtying your feet,
becoming thoroughly depressed and ending up where you started.">)
		  (<1? ,WANDERING>
		   <TELL
"You stumble around, trying to find somewhere interesting, and decide
that the Blighted Ground could possibly be the most exciting place yet.">)
		  (<EQUAL? ,WANDERING 2>
		   <TELL
"There appears to be nothing in any direction, unless you want
to go north to the Heart of Gold or south-east to the crater.">)
		  (ELSE
		   <TELL "You have walked around in circles. Try something else.">)>
	<CRLF>
	<SETG WANDERING <+ ,WANDERING 1>>
	<RFALSE>>

"Scene 2 - The Crater"

<ROOM LIP1
	(IN ROOMS)
	(SYNONYM AGENCY POLICE COPS POLICEMEN)
	(ADJECTIVE GALACTIC SECURITY)
	(DESC "Crater Lip")
	(WEST PER SLOPE-SCRAMBLE)
	(EAST PER SLOPE-SCRAMBLE)
	(NORTH PER SLOPE-SCRAMBLE)
	(SOUTH PER DEATH-BY-BLUBBER)
	(NW PER FEEL-DRAWN ;"TO BLIGHTED-GROUND")
	(NE PER SLOPE-SCRAMBLE)
	(SW TO LIP4)
	(SE TO LIP2)
	(DOWN PER HAR-HAR)
	;(UP PER CANNOT-GO)
	(FLAGS RLANDBIT ONBIT LIGHTBIT OUTSIDEBIT ;GUIDEBIT)
	(GLOBAL WHALE-CRATER-BOX MAGRATHEA)
    (GENERIC POLICE-G)
	(THINGS (GROSS DISGUSTIN MESSY WHALE FISHY) (BLUBBER MEAT SHARDS SHARD SCENE WHALE BONE WHALEBONE BONES) GROSS-F)
	(ACTION LIP1-F)>

<ROUTINE LIP1-F (RARG)
    <COND (<EQUAL? .RARG ,M-BEG>
           <COND (<VERB? LEAP>
                  <SILLY-MBEG-FOR-LEDGE-F ,M-BEG>)>)
          (<EQUAL? .RARG ,M-LOOK>
		   <COND (<EQUAL? ,LOOK-COUNTER-A 0>
		          <TELL
"The dusty ground rises here before falling away into a crater. The crater
seems rather new, as if it had been created by the impact of something huge
and confused travelling downwards at high velocity. It is as if a sperm whale
had inexplicably materialized several miles above the surface of Magrathea
and plunged downwards, reaching terminal velocity almost immediately, terminal
incomprehension soon afterwards, and, finally, terminal impact just as it was
wondering whether it was going to have a nice day. This impression is heightened
by the shards of whalebone and meat you can see glistening here and there
around the crater.|
|The crater lip continues south-west and south-east, and the blighted ground
lies to the north-west." CR>
                  <SETG LOOK-COUNTER-A <+ ,LOOK-COUNTER-A 1>>)
                 (ELSE
                  <TELL
"You are on the rim of a great crater which leads to the south-west
and south-east, while the blighted ground lies north-west." CR>)>)>>

<ROUTINE DEATH-BY-BLUBBER ()
	<JIGS-UP
"You fall into the new-ish, nasty-ish crater, where the blubber and blood
liberally spattered around break your fall. Unfortunately, however, on
becoming aware of your surroundings, you die of disgust.">
	<RFALSE>>

<ROUTINE SLOPE-SCRAMBLE ()
	<TELL "You slide over the edge of the " D ,HERE ". Fortunately for
you, you regain your footing and scramble back to level ground again." CR>
	<RFALSE>>

<ROUTINE FEEL-DRAWN ()
    <COND (<NOT <FSET? ,LIP1 ,BADRADIOBIT>>
           <FSET ,LIP1 ,BADRADIOBIT>
           <TELL "Even though you willingly walk away from the
death scene, you can't help but feel drawn towards the crater..." CR>)>
    ,BLIGHTED-GROUND>

<ROOM LIP2
	(IN ROOMS)
	(LDESC
"The rim of the whale crater leads northwest and southwest.
The scene of the whale's final disillusionment lies below
you, but there's no way down.")
    (SYNONYM GUIDANCE)
	(DESC "Crater Lip")
	(WEST PER DEATH-BY-BLUBBER)
	(EAST PER SLOPE-SCRAMBLE)
	(NORTH PER SLOPE-SCRAMBLE)
	(SOUTH PER SLOPE-SCRAMBLE)
	(NW TO LIP1)
	(NE PER WANDER-AROUND)
	(SW TO LIP3)
	(SE PER SLOPE-SCRAMBLE)
	(DOWN PER HAR-HAR)
	;(UP PER CANNOT-GO)
	(FLAGS RLANDBIT ONBIT LIGHTBIT OUTSIDEBIT ;GUIDEBIT)
	(THINGS (GROSS DISGUSTIN MESSY WHALE FISHY) (BLUBBER MEAT SCENE WHALE BONE WHALEBONE BONES SHARDS SHARD) GROSS-F)
	(GLOBAL WHALE-CRATER-BOX MAGRATHEA)
    (ACTION SILLY-MBEG-FOR-LEDGE-F)>

<ROOM LIP3
	(IN ROOMS)
	(DESC "Crater Lip")
	(LDESC
"The crater lip leads north-east and north-west. Below you
is a build-your-own-dead-whale kit (glue not included).
There's no way down.")
    (SYNONYM ADVICE)
	(NORTH PER DEATH-BY-BLUBBER)
	(NE TO LIP2)
	(EAST PER SLOPE-SCRAMBLE)
	(SE PER SLOPE-SCRAMBLE)
	(SOUTH PER SLOPE-SCRAMBLE)
	(SW PER SLOPE-SCRAMBLE)
	(WEST PER SLOPE-SCRAMBLE)
	(NW TO LIP4)
	(DOWN PER HAR-HAR)
	;(UP PER CANNOT-GO)
	(FLAGS RLANDBIT ONBIT LIGHTBIT OUTSIDEBIT)
	(THINGS (GROSS DISGUSTIN MESSY WHALE FISHY MAKE MY OWN) (BLUBBER MEAT KIT WHALE BONE WHALEBONE BONES) GROSS-F)
	(GLOBAL WHALE-CRATER-BOX MAGRATHEA)
    (ACTION SILLY-MBEG-FOR-LEDGE-F)>


<ROOM LIP4
	(IN ROOMS)
	(DESC "Crater Lip")
	(SYNONYM LEGEND WIKKIT KEY KRIKKIT CRICKET)
	(ADJECTIVE LEGEND WIKKIT)
	(FDESC
"The crater lip continues northeast and southeast here,
and below you is a ledge. If you fell from here to the
ledge you would probably break an ankle and nobody would
hear you screaming and you would die from pain and exposure.
On the other hand, if you climbed down carefully, you'd
have no trouble. So what are you making all the fuss about?")
	(LDESC
"The crater lip continues northeast and southeast here,
and below you is a ledge.")
	(NORTH PER SLOPE-SCRAMBLE)
	(NE TO LIP1)
	(EAST PER CLIMB-LEDGE ;TO ;LEDGE)
	(DOWN PER CLIMB-LEDGE ;TO ;LEDGE)
	(SE TO LIP3)
	(SOUTH PER SLOPE-SCRAMBLE)
	(SW PER SLOPE-SCRAMBLE)
	(WEST PER SLOPE-SCRAMBLE)
	(NW PER SLOPE-SCRAMBLE)
	;(UP PER CANNOT-GO)
	(FLAGS RLANDBIT ONBIT LIGHTBIT OUTSIDEBIT)
	(GLOBAL WHALE-CRATER-BOX MAGRATHEA)
    (GENERIC KEY-G)
	(THINGS (GROSS DISGUSTIN MESSY WHALE FISHY) (BLUBBER MEAT TEETH WHALE BONE WHALEBONE BONES) GROSS-F
            LOWER (LEDGE EDGE) DOWN-TO-LEDGE-F)
	(ACTION SILLY-MBEG-FOR-LEDGE-F)>

<ROUTINE CLIMB-LEDGE ()
	<TELL "You scra">
	<COND (<IN? ,PLAYER ,LIP4>
		   <TELL "mble down to the ledge." CR ;CR>
		   ,LEDGE)
	      (ELSE
		   <TELL
"bble for footholds as you climb the slippery
ledge, and, surprisingly, you make it up." CR ;CR>
		   ,LIP4)>>

<ROUTINE DOWN-TO-LEDGE-F ()
    <COND (<VERB? CLIMB-DOWN LEAP WALK-TO>
           <DO-WALK ,P?DOWN>
           <RTRUE>)
          (ELSE
           <TELL "Why don't you go down to the ledge first?" CR>)>>

<ROOM LEDGE
	(IN ROOMS)
	(DESC "Ledge")
	(FDESC "The ledge lies halfway between the crater lip and the
floor of the whale crater itself. It doesn't seem quite like any
ledge you've encountered before, perhaps because of the pillars on
either side of you and the rather nice wall - marble, perhaps, or
ivory? - hidden from sight behind you and the steep but survivable
slope down to the crater floor.")
	(LDESC
"This ledge lies halfway between the crater lip and the floor of
the whale crater itself.")
    (SYNONYM QUESTION QUESTIONS ANSWER FORTY-TWO)
    (ADJECTIVE GREAT COOL UNANSWERE)
	(NORTH PER DEATH-BY-BLUBBER)
	(NE PER DEATH-BY-BLUBBER)
	(EAST PER DOWN-TO-CRATER)
	(SE PER DEATH-BY-BLUBBER)
	(SOUTH PER DEATH-BY-BLUBBER)
	(SW PER BANG-HEAD)
	(WEST PER CLIMB-LEDGE ;TO ;LIP4)
    (UP PER CLIMB-LEDGE ;TO ;LIP4)
	(NW PER BANG-HEAD)
	(DOWN PER DOWN-TO-CRATER)
	(FLAGS ONLANDBIT ONBIT LIGHTBIT ;ONTOPBIT OUTSIDEBIT)
	(GLOBAL WHALE-CRATER-BOX MAGRATHEA)
	(THINGS (IVORY MARBLE BIG) (PILLAR PILLARS COLUMN) USELESS
			(STEEP BUT SURVIVABLE) (SLOPE SLIDE) STAIRS-F
			(GROSS DISGUSTIN MESSY WHALE FISHY) (BLUBBER MEAT TEETH WHALE BONE WHALEBONE BONES) GROSS-F
			(IVORY MARBLE RATHER NICE) (WALLS WALL) WALLS-F
			(DISLODGED MOVED) (SOIL RUBBLE) FLOOR-F
            (HIDDEN THIN HALFWAY) (LEDGE EDGE LIP) LEDGE-ROOM-F)
    (ACTION SILLY-MBEG-FOR-LEDGE-F)>

<ROUTINE LEDGE-ROOM-F ()
    <COND (<VERB? CLIMB-UP>
           <DO-WALK ,P?UP>)
          (<VERB? CLIMB-DOWN>
           <DO-WALK ,P?DOWN>)>>

<ROUTINE SILLY-MBEG-FOR-LEDGE-F (RARG)
    <COND (<EQUAL? .RARG ,M-BEG>
           <COND (<VERB? LEAP>
                  <TELL "Oh no! You lost your footing and ">
                  <JIGS-UP <PICK-ONE
                            <LTABLE
                             "fell onto a long shard of whalebone!"
                             "landed face-first in a mound of sticky lard, where you suffocated."
                             "tumbled into the crater where a lurking grue found you - and is now feeling very full...">>>)>)>>

<OBJECT PLANT
	(LOC LEDGE)
	(SDESC "small plant")
	(FDESC "A small plant is poking out of the ground, through the dislodged soil.")
	;(LDESC "There is a small plant here.")
	(SYNONYM PLANT CLOVER STEM XZZZQ XZZZR XZZZS LEAF)
	(ADJECTIVE FOUR-LEAF SMALL GREEN)
	(ACTION PLANT-F)
	(FLAGS TAKEBIT TRYTAKEBIT ;CANPLUGBIT)
	(SIZE 1)>

<ADD-WORD ROOT NOUN>
<ADD-WORD ROOTS NOUN>

<ROUTINE PLANT-F ()
	<COND (<AND <IN? ,PLANT ,HERE>
			    <NOT <FSET? ,PLANT ,TOUCHBIT>>>
		   <THIS-IS-IT ,PLANT>)>
	<COND (<AND <VERB? TAKE>
                <DOBJ? PLANT>
                <ITAKE>>
		   <COND (<EQUAL? ,TAKE-COUNTER-A 0>
		          <TELL "What a selfish person you are. Taken anyway." CR><NOTES 1 T>
		          <SETG TAKE-COUNTER-A <+ ,TAKE-COUNTER-A 1>>
		          <INCREMENT-SCORE 5>
		          <FSET ,PLANT ,TOUCHBIT>
                  <REPLACE-NOUN? ,PLANT ,W?XZZZQ ,W?ROOT>
                  <REPLACE-NOUN? ,PLANT ,W?XZZZR ,W?ROOTS>)
		         (ELSE 
		          <TELL "Taken." CR>)>)
	      (<VERB? EAT>
	       <COND (<AND <FSET? ,PLANT ,RADPLUGBIT>>
                  <UNPLUG-HELD-STUFF ,PLANT>)>
	       <TELL "You eat it. It doesn't satisfy your hunger." CR>
	       <REMOVE ,PLANT>)
	      (<VERB? EXAMINE>
           <TELL "A small, four-leafed ">
           <COND (<EQUAL? <GETP ,PLANT ,P?SDESC> "small plant">
                  <TELL "- what do you call it - ">
                  <PUTP ,PLANT ,P?SDESC "clover">
                  ;<REPLACE-NOUN? ,PLANT ,W?XZZZP ,W?CLOVER>)>
           <TELL "clover. ">
           <COND (<FSET? ,PLANT ,RADPLUGBIT>
                  <TELL "It is plugged into the radio.">)
                 (<NOT ,TAKE-COUNTER-A>)
                 (<FSET? ,PLANT ,TOUCHBIT>
                  <TELL
"The roots seem to form a plug - quite like one of the ones
that you sold when you were still working at the little radio
station at the end of your lane, back when Earth was around.">
                  <REPLACE-NOUN? ,PLANT ,W?XZZZS ,W?PLUG>)>
           <CRLF>
           <RTRUE>)
	      (<VERB? PLUG PUT-IN>
           <COND (<IOBJ? RADIO>
                  <COND (<AND <HELD? ,RADIO>
                              <HELD? ,PLANT>>
                         <COND (<EQUAL? <GETP ,RADIO ,P?SDESC> "black metallic box">
                                <TELL "Perhaps you should look at "><THE-J ,RADIO T><TELL " first." CR>
                                <FUCKING-CLEAR>
                                <RTRUE>)>
                         <COND (<AND <NOT <FSET? ,PLANT ,RADPLUGBIT>>>
                                <FSET ,PLANT ,RADPLUGBIT>
                                <TELL "You plug it in. The music changes its mood, becoming sadder and more meaningful." CR>
                                <COND (<NOT ,PLUG-POINT>
                                       <INCREMENT-SCORE 15>
                                       <SETG PLUG-POINT T>
                                       <TELL CR
"Marvin trudges over to you. \"Oh well,\" he drones, \"I might as well join
you. Don't ask. It's just that I am interested - it is not that like it, I
am merely interested - in that music on your radio.\" Marvin remains motionless." CR>
                                       <MOVE ,MARVIN ,HERE>
                                       <RTRUE>)>)
	      			           (ELSE
	      				        <TELL "But it's aready plugged in!" CR>)>)>)
	      	   (ELSE
                <COND (<VERB? PUT-IN>
                       <RFALSE>)
                      (ELSE
                       <TELL ,NOPE "seem to plug it into "><THE-J ,PRSI T><TELL ,PAUSES>)>)>)>>


<ROUTINE DOWN-TO-CRATER ()
	<TELL "You hop over the teeth and scramble down to the crater floor. ">
	<COND (,PLUG-POINT
		<MOVE ,MARVIN ,WHALE-CRATER>
		<FSET ,MARVIN ,ONBIT>
		<TELL "Marvin climbs down slowly, after you." CR ;CR>
		<SETG GONE-DOWN T>
		,WHALE-CRATER)
	(ELSE
		<JIGS-UP "Unfortunately, you don't get to do much after that, because you trip
up in the dark trying to stand, and impale yourself (in a very un-family-friendly way)
on a shard of bone. This means...">)>>


<OBJECT	WHALE-CRATER-BOX
	(LOC LOCAL-GLOBALS)
	(DESC "the whale crater")
	(SYNONYM CRATER EDGE LIP)
	(ADJECTIVE WHALE CRATER UNHEALTHY)
	(FLAGS NARTICLEBIT TRANSBIT NDESCBIT OPENBIT CONTBIT)
	(ACTION WHALE-CRATER-BOX-F)>

<ROUTINE WHALE-CRATER-BOX-F ()
	<COND (<AND <VERB? ;THROW-IN-TOWEL THROW-AT THROW-THROUGH PUT-IN>
				<IOBJ? WHALE-CRATER-BOX>
				<NOT <DOBJ? WHALE-CRATER-BOX>>
				<IDROP>>
		   <TELL "You chuck "><THE-J ,PRSO T>
		   <TELL
" down into the crater, and " HE+VERB ,PRSO "tumble"
" down to the bottom, out of sight. Oh, well." CR>
		   <MOVE ,PRSO ,WHALE-CRATER>)
		  (<VERB? SEARCH LOOK-INSIDE EXAMINE>
		   <TELL "It's too dark down there." CR>)
		  (<VERB? LEAP BOARD DISEMBARK THROUGH>
		   <COND (<OR <IN? ,PLAYER ,LEDGE>
                      <=? ,P-PRSA-WORD ,W?CLIMB ,W?SCALE ,W?SCRAMBLE>>
                  <DO-WALK ,P?DOWN>
                  <RTRUE>)
                 (ELSE
                  <JIGS-UP "You leap messily to your death. It's quick, painless and fishy.">)>)
		  (<AND <VERB? WALK-TO>
		  		<IN? ,PLAYER ,BLIGHTED-GROUND>>
		   <DO-WALK ,P?SE>)>>

<ROUTINE GROSS-F ()
	<COND (<SEE-VERB?>
		   <TELL "Ugh! Gross." CR>)
		  (<VERB? SMELL EAT LICK>
           <UNAPPETIZING-F>)
          (ELSE
		   <JUNK-F>)>>

<ROUTINE UNAPPETIZING-F ()
    <COND (<VERB? SMELL>
           <TELL "It has a very, very fishy smell." CR>)
          (<VERB? EAT LICK>
           <TELL "No way, not even if we play truth or dare." CR>)
          (<SEE-VERB?>
           <TELL "You can't see an odour!" CR>)
          (ELSE
           <TELL "Ew." CR>)>>

<ROOM WHALE-CRATER
	(IN ROOMS)
	(DESC "Crater Floor")
	(UP PER THATS-IT)
	(SOUTH PER RUN-END-1)
	(DOWN PER RUN-END-1)
	(FLAGS ;LIGHTBIT ONLANDBIT ;ONBIT ;OUTSIDEBIT)
	(ACTION WHALE-CRATER-F)
	(THINGS (DEEPLY CRUFTY MESSY GROSS DISGUSTIN) CRATER GLOBAL-ROOM-F)
    (GLOBAL MAGRATHEA)>

<ROUTINE WHALE-CRATER-F (RARG)
	<FSET ,CEILING ,INVISIBLE>
	<FCLEAR ,SKY ,INVISIBLE>
    <COND
        (<EQUAL? .RARG ,M-BEG>
            <COND 
                (<IN? ,MARVIN ,WHALE-CRATER>
                    <FSET ,WHALE-CRATER ,LIGHTBIT>)
                (ELSE
                    <FCLEAR ,WHALE-CRATER ,LIGHTBIT>)>)>
    <COND 
        (<AND <EQUAL? .RARG ,M-BEG>
              <NOT <FSET? ,WHALE-CRATER ,LIGHTBIT>>>
            <FCLEAR ,GRUES ,INVISIBLE>
		    <COND 
                (<VERB? LOOK>
                    <BOLDEN "|Somewhere in the Whale Crater">
                    <TELL CR "It is pitch dark. Any grues down here were killed by the whale." CR>)
                (ELSE
                    <COND 
                        (<EQUAL? ,GRUES ,PRSI ,PRSO>
                            <RFALSE>)
                        (<SEE-VERB?>
                            <TOO-DARK>)
                        (<VERB? WAIT-FOR WAIT-UNTIL>
                            <RFALSE>)
                        (<VERB? WALK>
                            <BANG-HEAD>)
                        (ELSE
                            <TELL "All I would be thinking about right now is how dark it is." CR>)>)>
		    <FUCKING-CLEAR>
            <RTRUE>)
        (<IN? ,PLAYER ,EXIT-TO-2>
	    	<GOTO ,WHALE-CRATER>)
	    (<AND <EQUAL? .RARG ,M-LOOK>
	    	  <IN? ,MARVIN ,HERE>>
	    	<COND
                (<EQUAL? ,VERBOSITY 2>
	    	        <TELL
"Marvin lights up the floor and walls with his eyes. Using him as a
light source, you look around. The floor of this deeply crufty crater
is splattered with all kinds of disgusting stuff. To the south, you
are able to see a small passageway which leads to a dark place." CR>)
                (ELSE
                    <TELL
"Using Marvin as a light source, you can see the bottom of the whale crater,
which is liberally supplied with whale. To the south is a dark passageway." CR>)>)>>

<ROUTINE THATS-IT ()
	<TELL "Unfotunately, you cannot climb back up." CR>
	<RFALSE>>

<OBJECT EXIT-TO-2
	(LOC WHALE-CRATER)
	(DESC "dark passageway")
	(SYNONYM PASSAGE)
	(ADJECTIVE DARK SMALL ;PASSAGE)
	(FLAGS NDESCBIT)
	(ACTION EXIT-TO-2-F)>

<ROUTINE EXIT-TO-2-F ()
	;<COND (<NOT <EQUAL? ,HERE ,WHALE-CRATER>>
		   <TELL ,NOPE "see that here!" CR>
		   <FUCKING-CLEAR>)>
	<COND (<IN? ,PLAYER ,EXIT-TO-2>
		   <GOTO ,WHALE-CRATER>)
		  (<VERB? EXAMINE>
		   <TELL "You have no idea where it will lead." CR>)
		  (<VERB? BOARD CLIMB-DOWN THROUGH WALK-TO>
		   <END-OF-PART-1>)>>

<ROUTINE RUN-END-1 ()
    <INCREMENT-SCORE 10 T>
	<TELL
"You crawl through the exit and shuffle along. Slowly, it gets harder and harder
to see. At one point, you start to think it will lead nowhere. Then it falls silent.">
	<GO-TO-DARK>>

<ROUTINE END-OF-PART-1 ("OPT" SKIP)
	<COND (<NOT <IN? ,MARVIN ,HERE>>
		   <CANNOT-GO>
		   <FUCKING-CLEAR>)>
	<DO-WALK ,P?SOUTH>>





"PART 2 - MOUSE LAB (BELOW MAGRATHEA)

Scene 1 - The 'Interview'

"; "GLOBAL VARIABLES"
;<GLOBAL WARNING <>>
<GLOBAL NEAR-EXIT <>>
<GLOBAL KILL-NOW? <>>
<GLOBAL DUST-OFF <>>

; "INTERRUPT ROUTINES"
<ROUTINE I-ASK-DEATH ("OPT" (PER <>))
    <FSET ,INTERVIEW-ROOM ,RADPLUGBIT>
	<SETG KILL-NOW? <>>
    <COND (<NOT .PER>
           <TELL CR !\" !\W>)>
    <TELL "elcome to the Testing Lab of Magrathea!">
    <COND (<NOT .PER>
           <TELL "\" Percy says">
           <COND (,DUST-OFF
                  <TELL ", straightening his posture (since he seemed more than a bit shocked after your insult)">)>
           <TELL ". \"">)
          (ELSE
           <TELL !\ >)>
    <TELL
"Please, have something to eat.\" He gestures vaguely towards
the fruit bowl on the table, but doesn't look at it at all." CR>
	<THIS-IS-IT ,BOWL>
    <SETG AWAITING-REPLY 7>
	<DEQUEUE I-REPLY>
	<QUEUE I-REPLY 4>
	<QUEUE I-ASKED-NICELY 4>
	<QUEUE I-ASK-AGAIN 9>>

<ROUTINE I-ASK-AGAIN ()
	<TELL CR
"The mice turn to stare at you. \"Ahem... As I was saying, you are welcome
to have something to eat.\" He glances towards the fruit bowl on the table,
but does nothing else." CR>
	<SETG AWAITING-REPLY 7>
	<DEQUEUE I-REPLY>
	<QUEUE I-REPLY 4>
	<DEQUEUE I-ASKED-NICELY>
	<QUEUE I-ASKED-NICELY 4>
	<SETG KILL-NOW? <>>>

<ROUTINE I-ASKED-NICELY ()
	<QUEUE I-ASKED-NICELY 2>
	<TELL CR "The mice look uncomfortably at each other." CR>
	<SETG KILL-NOW? T>
	;<DEQUEUE I-ASKED-NICELY>>

<GLOBAL MOUS1 <>>
<GLOBAL MOUS2 <>>
<GLOBAL MOUS3 <>>

<ROUTINE I-TENSE-SCENE ("AUX" RND)
	<DEQUEUE I-ASKED-NICELY>
	<DEQUEUE I-ASK-AGAIN>
	<DEQUEUE I-ASK-DEATH>
	<DEQUEUE I-REPLY>
	<COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		   <I-REPLY>
		   <DEQUEUE I-ASK-DEATH>
		   <DEQUEUE I-ASKED-NICELY>
		   <DEQUEUE I-ASK-AGAIN>
		   <DEQUEUE MOUSE-BANG>
		   <DEQUEUE I-TENSE-SCENE>
           <DEQUEUE I-WHATEVER-DEAD>
		   <RFALSE>)>
	<SETG KILL-NOW? <>>
	<COND (<AND ,MOUS1 ,MOUS2 ,MOUS3>
		   <TELL CR
"The mice have a small conversation with themselves, and then bring out the big guns
- literally. \"You better run!\" they shout, as they begin to chase after you." CR>
		   <DEQUEUE MOUSE-BANG>
		   <QUEUE MOUSE-BANG 3>
		   <DEQUEUE I-TENSE-SCENE>
		   <RFALSE>)>
	;"CHECKING IF A NUMBER IS USED"
	<SET RND <RANDOM 3>>
	<COND (<AND <EQUAL? .RND 1>
				<NOT ,MOUS1>>
		   <SETG MOUS1 T>
		   <SETG AWAITING-REPLY 8>
           <QUEUE I-REPLY 3>
		   <TELL CR "\"I'm confused. Are you refusing good offers?">
		   ;<DEQUEUE MOUSE-BANG>
		   <QUEUE MOUSE-BANG 4>)
		  (<AND <EQUAL? .RND 2>
				<NOT ,MOUS2>>
		   <SETG MOUS2 T>
		   <SETG AWAITING-REPLY 9>
           <QUEUE I-REPLY 3>
		   <TELL CR
"Percy stares deeply into your eyes, making you feel uncomfortable. \"You were joking, right?">
		   <DEQUEUE MOUSE-BANG>
		   <QUEUE MOUSE-BANG 4>)
		  (<AND <EQUAL? .RND 3>
				<NOT ,MOUS3>>
		   <SETG MOUS3 T>
		   <SETG AWAITING-REPLY 10>
           <QUEUE I-REPLY 3>
		   <TELL CR
"\"Are you absolutely sure you don't want us to use your brain
to find " ,QUESTION-ANSWER "? It would be for the greater good.">
		   <DEQUEUE MOUSE-BANG>
		   <QUEUE MOUSE-BANG 4>)
		  (ELSE
		   <DEQUEUE I-TENSE-SCENE>
		   <I-TENSE-SCENE>
           <RTRUE>)>
    <TELL !\" CR>>

<ROUTINE MOUSE-BANG ()
	<COND (<IN? ,PLAYER ,INTERVIEW-ROOM>
		   <JIGS-UP
"|The mice, who have spent the last few minutes loading their guns while you were doing
whatever you had been doing, now send you to the darkness. Wait, no, that's just you.">)>>

<GLOBAL MOUSE-BLAB 0>

<ROUTINE I-MOUSE-BLAB ("OPT" (UM <>))
    <COND (<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
           <DEQUEUE I-MOUSE-BLAB>
           <RTRUE>)>
    <COND (<RUNNING? I-ASK-DEATH>
           <DEQUEUE I-ASK-DEATH>
           <QUEUE I-ASK-DEATH 2>)>
    <COND (<RUNNING? I-ASK-AGAIN>
           <DEQUEUE I-ASK-AGAIN>
           <QUEUE I-ASK-AGAIN 5>)>
    <DEQUEUE I-ASKED-NICELY>
    <QUEUE I-ASKED-NICELY 4>
    <COND (<RUNNING? I-WHATEVER-DEAD>
           <DEQUEUE I-WHATEVER-DEAD>
           <QUEUE I-WHATEVER-DEAD 10>)>
    <COND (<1? ,MOUSE-BLAB>
           <COND (<NOT .UM>
                  <TELL CR "\"And ">)>
           <TELL
"the painter had another famous painting, ...\"
The talking goes on and on, and I don't think that they
even remember you're still here." CR>)
          (<EQUAL? ,MOUSE-BLAB 2>
           <COND (<NOT .UM>
                  <TELL CR "\"Do you know, ">)>
           <TELL
"it's quite funny because ...\" You can't even focus on what they're saying." CR>)
          (<EQUAL? ,MOUSE-BLAB 3>
           <COND (<NOT .UM>
                  <TELL CR "\"... And">)>
           <TELL
" that's all that we know about the painting. Well, I hope you
like it" ,PIC "The mice go back to staring schemingly at you." CR>
           <SETG KILL-NOW? T>
           <FSET ,MOUSE-PAINTING ,BADRADIOBIT>
           <DEQUEUE I-MOUSE-BLAB>
           <RTRUE>)>
    <SETG MOUSE-BLAB <+ ,MOUSE-BLAB 1>>
    <QUEUE I-MOUSE-BLAB 1>
    <RTRUE>>

<ROUTINE I-KILL-NOW ()
    <SETG KILL-NOW? T>>

<ROUTINE I-WHATEVER-DEAD ()
    <TELL CR "The mice stop moving. Suddenly. ">
    <ITALICIZE "Very weird, ">
    <TELL
"you think. And then you think about taking this as a
chance to leave, which seems like a good idea to you.
But before you can act on it, the mice fluidly extend
two long, dangerous-looking Kill-O-Zap guns with spikes
on the end (unlike any Kill-O-Zap gun you've seen) and
shoot straight at your head, all while saying \"I give
up. You're at a fail state now!\"" CR CR "Obviously shooting
at the head loses the point of needing an intact brain
to learn " ,QUESTION-ANSWER>
    <JIGS-UP ", but oh well. Your friends will never
suspect. Your family can't know, because whatever is left
of their bodies remain in orbit around the dust cloud once
called Earth. Oh, and you don't either, due to obvious
reasons.">>

<ROUTINE I-CLEAR-DUST-OFF ()
    <SETG DUST-OFF <>>>


; "ROOMS & OBJECTS"
<ROOM INTERVIEW-ROOM
	(IN ROOMS)
	(DESC "Interview Room")
    (SYNONYM THEORY THEORIES)
	(SOUTH PER LEAVE-INTERVIEW)
	(OUT PER LEAVE-INTERVIEW)
	;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
	(FLAGS ONBIT LIGHTBIT ;RADPLUGBIT ;"I-ASK-DEATH called")
    (THINGS (INTERVIEW WHITE BRIGHT MOUSE) (ROOM CHAMBER) GLOBAL-ROOM-F)
	(ACTION INTERVIEW-ROOM-F)>

<ROUTINE INTERVIEW-ROOM-F (RARG)
	<COND (<AND <EQUAL? .RARG ,M-BEG>
                <=? ,AWAITING-REPLY 8 9 10 14>
                <AND ;<NOT <QUEUED? I-MOUSE-BLAB>>
                     <NOT <RUNNING? I-MOUSE-BLAB>>>
                <OR <AND <VERB? WALK PUSH ATTACK MOVE WALK-TO TAKE
                           READ PUT MUNG ASK-ABOUT TELL-ABOUT
                           ASK-FOR ASK-CONTEXT-ABOUT CLIMB-ON
                           ;TELL BOARD THROUGH LEAVE CLIMB-UP
                           CLIMB-DOWN DISEMBARK SLAP LIE SIT
                           SORRY ;HELLO TALK-ABOUT SORRY YELL
                           ;ASK ASK-CONTEXT-FOR>
                         <IF-P-DEBUGGING-PARSER <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: Verbs, etc]|">)>>>
                    <AND <ORDERING?>
                         <NOT <VERB? YES NO>>
                         <IF-P-DEBUGGING-PARSER <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: Order-yes, etc]|">)>>>
                    <AND <VERB? SAY ANSWER REPLY TELL ASK>
                         <NOT <DOBJ? YES-OBJECT NO-OBJECT ;HELLO-OBJECT INTQUOTE>>
                         <IF-P-DEBUGGING-PARSER <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: Say, etc]|">)>>>>>
           <SETG CLOCK-WAIT T>
           <TELL "\"Wait a mo'. I asked you a question" ,PIC>
           <SETG P-CONT <>>
           <RFATAL>)
          (<EQUAL? .RARG ,M-LOOK>
           ;<FSET ,INTERVIEW-ROOM ,SEENBIT>
		   <TELL
"A table stands directly in the middle of the room,
bright white against the also bright white walls.">
           <COND (<NOT ,NEAR-EXIT>
                  <TELL " You are standing next to it.">)>
           <TELL " The south wall (">
           <COND (<NOT ,NEAR-EXIT>
                  <TELL "on the opposite wall, the southern side of the room">)
                 (ELSE
                  <TELL "which is next to you">)>
           <TELL ") ">
           <DESC-SOUTH-WALL>
           <TELL " All of the other walls are plain. ">
		   <PERFORM ,V?LOOK-ON ,TABLE>
		   <CRLF>)
	      (<AND <EQUAL? .RARG ,M-END ,M-BEG>
				<FSET? ,INTERVIEW-ROOM ,SADRADIOBIT>> ;"SADRADIOBIT means that you've visited the room - for Dark..."
		   <TELL CR
"Suddenly, you notice the mice (in robotic bodies) are now standing
over you, holding tools. You soon realise you can't move either!|
|And only then do you notice the needle in the hand of the suit,
and you close your eyes again, for you know you may just die.">
		   <GO-TO-DARK>
		   <RTRUE>)>>

<ROUTINE LEAVE-INTERVIEW ()
	<COND (<AND <FSET? ,EMERGENCY-EXIT ,OPENBIT>
                <OR <NOT ,KILL-NOW?>
                    <RUNNING? I-MOUSE-BLAB>>
                ,NEAR-EXIT>
		   <TELL
"You dash out of the room, through the Emergency Exit,
and into another passage. An alarm starts blaring." CR ;CR>
           <CHOOSE-PASSAGES>
           <DEQUEUE I-WHATEVER-DEAD>
           <QUEUE I-MICE-CHASE -1>
		   <RETURN ,HALLWAY1>)
	      (ELSE
           <COND (<NOT ,NEAR-EXIT>
                  <COND (<AND ,KILL-NOW?
                              <NOT <RUNNING? I-MOUSE-BLAB>>>
                         <TELL
"You hesitate, because right now the mice look like they're plotting to murder you." CR>
                         <RFALSE>)
                        (ELSE
                         <THIS-IS-IT ,EMERGENCY-EXIT>
				         <TELL "You walk up to the door, ">
                         <COND (<AND <FSET? ,EMERGENCY-EXIT ,OPENBIT>
                                     <OR <NOT ,KILL-NOW?>
                                         <RUNNING? I-MOUSE-BLAB>>>
                                <TELL
"and dash straight out of the room, through the Emergency
Exit into another passage. An alarm starts blaring." CR ;CR>
                                <CHOOSE-PASSAGES>
                                <DEQUEUE I-WHATEVER-DEAD>
                                <QUEUE I-MICE-CHASE -1>
		                        <RETURN ,HALLWAY1>)
                               (<AND ,KILL-NOW?
                                     <NOT <RUNNING? I-MOUSE-BLAB>>
                                     <FSET? ,EMERGENCY-EXIT ,OPENBIT>>
                                <JIGS-UP "but are shot in the back very quickly.">
                                <RFALSE>)
                               (ELSE
                                <TELL "but since the door's closed, you move no further." CR>
                                <SETG NEAR-EXIT T>
                                <RFALSE>)>)>)
                 (ELSE
                  <COND (<AND ,KILL-NOW?
                              <NOT <RUNNING? I-MOUSE-BLAB>>>
                         <TELL
"You hesitate, because right now the mice look like they're plotting to murder you." CR>
                         <RFALSE>)
                        (ELSE
                         <TELL "The door isn't open." CR>
                         <RFALSE>)>)>)>>


<OBJECT TABLE
	(LOC INTERVIEW-ROOM)
	(DESC "table")
	(SYNONYM TABLE)
	(ADJECTIVE BRIGHT WHITE)
	(FLAGS SURFACEBIT NDESCBIT OPENBIT TRANSBIT ;SEARCHBIT)
	(CAPACITY 50)
	(ACTION TABLE-F)>

<ROUTINE TABLE-F ()
	<COND (<VERB? BOARD CLIMB-ON>
		   <TELL "\"Don't you dare,\" threaten the mice." CR>
		   <RETURN <FUCKING-CLEAR>>)
		  (<VERB? WALK-TO>
		   <COND (,NEAR-EXIT
		   		  <TELL "OK." CR>
				  <SETG NEAR-EXIT <>>)
				 (ELSE
				  <TELL "But you're already next to it!" CR>
				  <FUCKING-CLEAR>)>)
		  (<VERB? EXAMINE>
		   <TELL "A bright white table, hardly noticeable against the walls. ">)>
	<COND (<VERB? EXAMINE LOOK-ON>
		   <TELL "On the table is a bowl full of fruit">
		   <COND (<IN? ,SPORFE ,TABLE>
		   		  <TELL
", and beside the bowl a sporfe (intended to be used for consumption
- not to commit suicide with, which is its general purpose)">)>
		   <TELL ", and the two mice: Benjy and Percy." CR>)>>

<OBJECT SPORFE
	(LOC TABLE)
	(DESC "sporfe")
	(SYNONYM SPORFE SPORK ;SPOON)
	(FLAGS TAKEBIT)
	(ACTION SPORFE-F)>

<ROUTINE SPORFE-F ()
	<COND (<VERB? EXAMINE>
		   <TELL "It looks like a sporfe. What else is there to say?" CR>)
		  (<AND <VERB? ATTACK KILL EAT>
		    	<EQUAL? ,PRSI ,SPORFE>
		   		<NOT <EQUAL? ,PRSO ,SPORFE>>>
		   <COND (<EQUAL? ,PRSO ,PLAYER>
		   		  <TELL "No, don't do that. Then it wouldn't be a fun game." CR>)
				 (ELSE
				  <COND (<FSET? ,PRSO ,PERSONBIT>
				  		 <TELL "You're not going to do that." CR>)
						(ELSE
						 <HAR-HAR>)>
				  <FUCKING-CLEAR>)>)>>

<OBJECT MICE
	(LOC TABLE)
	(LDESC 0)
	(SYNONYM MICE)
	(ADJECTIVE WHITE SMALL)
	(DESC "white mice")
	(FLAGS PLURALBIT NDESCBIT PERSONBIT)
	(ACTION MICE-F)>

<ROUTINE MICE-F ()
 <COND
    (<VERB? EXAMINE>
		<TELL
"Two white mice in what appear to be electronic wine bottles.
The first one is called Benjy. The other is called Percy." CR>)
	(<OR <AND <VERB? ASK-ABOUT TELL HELLO>
              <DOBJ? MICE>>
		 <ORDERING?>>
		<TELL "Be specific: Benjy or Percy?" CR>
		<FUCKING-CLEAR>)
	(<VERB? WALK-TO>
		<PERFORM ,V?WALK-TO ,TABLE>)
    (<VERB? LISTEN>
        <COND
            (<RUNNING? I-MOUSE-BLAB>
                <TELL "They're talking about some boring painting." CR>
                <THIS-IS-IT ,MOUSE-PAINTING>)
            (<AND <OR <QUEUED? I-TENSE-SCENE>
                      <RUNNING? I-TENSE-SCENE>>
                  <NOT ,KILL-NOW?>>
                <TELL "They're whispering to each other." CR>)>)>>

<OBJECT MICE-GUN
	(LOC INTERVIEW-ROOM)
	(DESC "Kill-O-Zap gun")
	(SYNONYM GUN KILL-O-ZAP ZAP)
	(ADJECTIVE KILL O ZAP MICE MOUSE\'S BENJY\'S PERCY\'S)
	(OWNER MICE)
    (FLAGS NDESCBIT)
	(ACTION MICE-GUN-F)>

<ROUTINE MICE-GUN-F ()
	<COND (ELSE ;<IN? ,PLAYER ,INTERVIEW-ROOM>
		   <COND (<VERB? EXAMINE>
		   		  <TELL "It belongs to the mice." CR>)
				 (ELSE
				  <TELL "That belongs to the mice." CR>
				  <FUCKING-CLEAR>)>)
		  ;(ELSE
		   <>)>>

<OBJECT BOTTLE-MOUSE
	(LOC TABLE)
	(SYNONYM WINE BOTTLE WINE-BOTTLE DEVICE CONTRAPTION BOTTLES)
	(ADJECTIVE WINE BOTTLE WINE-BOTTLE LOOKING ELECTRONI)
	(FLAGS CONTBIT TRANSBIT NDESCBIT)
	(DESC "wine-bottle looking contraption")
	(ACTION BOTTLE-MOUSE-F)>

<ROUTINE BOTTLE-MOUSE-F ()
	<COND ;(<NOT <IN? ,PLAYER ,INTERVIEW-ROOM>>
		<TELL ,NOPE "see that here!" CR>
		<FUCKING-CLEAR>)
	(<VERB? OPEN RUB ATTACK PULL-APART TAKE>
		<TELL <PICK-ONE <LTABLE "Percy" "Benjy">> " gives you a threating
look accompanied by a Kill-O-Zap gun giving you the same intimidating stare.
After you back down, he puts the gun away." CR>)
	(<VERB? SEARCH EXAMINE>
		<TELL "Inside is " <PICK-ONE <LTABLE "Percy" "Benjy">> ,PAUSES>)>>

<OBJECT BOWL
	(LOC TABLE)
	(DESC "bowl")
	(SYNONYM FRUIT BOWL APPLE ORANGE PEAR GRAPEFRUI)
	(ADJECTIVE FRUIT)
	(LDESC "On the table is a bowl of fruit.")
	(FLAGS ;EATBIT ;NARTICLEBIT TAKEBIT ;TRYTAKEBIT CONTBIT OPENBIT TRANSBIT)
    (GENERIC FRUIT-G)
	(ACTION BOWL-F)>

<ROUTINE BOWL-F ()
    <COND (<AND <VISIBLE? ,FRUIT>
                <OR <NOUN-USED? ,BOWL ,W?FRUIT>
                    <ADJ-USED? ,BOWL ,W?FRUIT>>
                <NOT <NOUN-USED? ,BOWL ,W?BOWL>>>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: running from BOWL to FRUIT...]|">)>>
           <COND (<DOBJ? BOWL>
                  <PERFORM ,PRSA ,FRUIT ,PRSI>)
                 (<IOBJ? BOWL>
                  <PERFORM ,PRSA ,PRSO ,FRUIT>)>
           <RTRUE>)
          (<OR <AND <VERB? EXAMINE SEARCH LOOK-INSIDE>
                    <NOT <FIRST? ,BOWL>>>
               <VERB? POUR>>
           <TELL "No nice-looking fruit is left." CR>)
          (<AND <VERB? PUT-IN PUT>
                <IOBJ? BOWL>>
           <TELL "That'd be impolite." CR>)
          (<VERB? TAKE>
		   <TELL "Benjy says, \"Only take the fruit, not the BOWL. Duh" ,PIC>
           <RTRUE>)>>

<OBJECT FRUIT
    (LOC BOWL)
    (DESC "piece of fruit")
    (SYNONYM FRUIT VEG VEGETABLE FROOT APPLE ORANGE PEAR LEMON BANANA PIECE)
    (ADJECTIVE PIECE FRUIT)
    (FLAGS TAKEBIT TRYTAKEBIT)
    (GENERIC FRUIT-G)
    (ACTION FRUIT-F)>

<ROUTINE FRUIT-F ()
    <COND (<VERB? EAT>
           <COND (,KILL-NOW?
                  <JIGS-UP
"You begin to feel a little sick...|
|\"The stuff in that fruit worked quickly, didn't it?\" says one disembodied voice.
|\"Of course,\" says another. \"You know where I buy everything from.\"
|\"Yeah, yeah. Anyway, let's begin.\"|
|On, the upside, you felt no pain.">)
                 (ELSE
                  <JIGS-UP
"You begin to feel a little sick. From that point, it escalates
quickly until it reaches the point where you realise the fruit
was obviously poisoned, and...|
|Well. I don't want to be the one who has to tell you, do I?">)>)
          (<AND <VERB? REFUSE>
                <=? ,AWAITING-REPLY 7>>
           <PERFORM ,V?NO>
           <RTRUE>)
          (<AND <VERB? THROW>
                <IOBJ? MICE BENJY PERCY>>
           <TELL "You hurl a" <PICK-ONE <PLTABLE
"n apple" "n orange" " pear" " grapefruit">> " at the mice. \"Hey!\" they
shout. \"What was that for?\" and look over at the fruit you just threw." CR>
           <SETG KILL-NOW? <>>
           <DEQUEUE I-MOUSE-BLAB>
           <QUEUE I-KILL-NOW 2>
           <QUEUE MOUSE-BANG 4>)>>

<OBJECT EMERGENCY-EXIT
	(LOC INTERVIEW-ROOM)
	(SYNONYM EXIT DOOR)
	(ADJECTIVE BIG EMERGENCY EXIT)
	(DESC "emergency exit")
	(FLAGS DOORBIT NDESCBIT VOWELBIT)
	(ACTION EMERGENCY-EXIT-F)>

<ROUTINE EMERGENCY-EXIT-F ()
	<COND (<VERB? EXAMINE>
		   <TELL
"A grand emergency exit along the south wall, which doesn't make much sense because emergency
exits generally aren't grand. Also, with mice as small as these, why would they need it that
big?|Next to the exit is an emergency button." CR>
		   <THIS-IS-IT ,EMERGENCY-BUTTON>)
		  (<VERB? OPEN>
		   <COND (<FSET? ,EMERGENCY-EXIT ,OPENBIT>
		   		  <TELL ,ALREADY-IS CR>
				  <FUCKING-CLEAR>)
				 (ELSE
				  <TELL "There's no door handle! Although, next to it is an emergency button." CR>
				  <THIS-IS-IT ,EMERGENCY-BUTTON>)>)
          (<VERB? ;WALK-TO BOARD THROUGH LEAP>
           <DO-WALK ,P?SOUTH>)>>

<OBJECT MOUSE-PAINTING
	(LOC INTERVIEW-ROOM)
	(SYNONYM MOUSE PAINTING MONOCLE PLAQUE REGINALD MARKENPLA REG BAD)
	(ADJECTIVE BAD UGLY STRANGE OLD MOUSE REGINALD)
	(DESC "painting of a mouse")
	(FLAGS TAKEBIT READBIT NDESCBIT)
    (SIZE 20)
    (GENERIC PAINTING-G)
	(ACTION MOUSE-PAINTING-F)>

<ROUTINE MOUSE-PAINTING-F ()
    <COND (<AND <VERB? SHOW>
                <DOBJ? CAT-PAINTING>
                <IOBJ? MOUSE-PAINTING>>
           <TELL
"The mouse squeaks unflatteringly (considering its apparent status in
interstellar mice communities) and scrambles out of the image, leaving
only a painting of a monocle. Now that the mouse is not blocking the
background of this painting, you that the background is of a large wheat
field with a bright sun in the background! The sun's rays blind you momentarily,
and when the bright light disappears, you are no longer holding any such
painting of a mouse; nor do you have any such painting of a mutant cat." CR>
           <REMOVE ,CAT-PAINTING>
           <REMOVE ,MOUSE-PAINTING>
           <NOTES 16 T>)
          (<AND <TOUCHING?>
                <FSET? ,MOUSE-PAINTING ,NDESCBIT>
                <NOT ,NEAR-EXIT>>
           <TELL "Preferably, you should be ">
           <ITALICIZE "near">
           <TELL " the painting before you can do that." CR>
           <RTRUE>)
          (<VERB? EXAMINE READ>
           <COND (<VERB? EXAMINE>
                  <TELL
"You look at the painting, which could have been done by yours truly
(and I'm not even AI yet). It is of an old mouse wearing a monocle. ">)>
           <TELL "At the bottom of the painting is a plaque, which reads:" CR>
           <ITALICIZE
"    Reginald Markenplatt|
    Founder of Magrathea Corps.|
    86 standard yrs.">
           <COND (<AND <NOT <FSET? ,MOUSE-PAINTING ,SADRADIOBIT>>
                       <IN? ,PLAYER ,INTERVIEW-ROOM>
                       <NOT <=? ,AWAITING-REPLY 8 9 10>>>
                  <TELL CR CR "\"Oh, you like it?\" says Percy.">
                  <SETG AWAITING-REPLY 14>
                  <QUEUE I-REPLY 3>
                  <FSET ,MOUSE-PAINTING ,SADRADIOBIT>)>
           <CRLF>
           <RTRUE>)
          (<AND <VERB? TAKE>
                <ITAKE>>
           <TELL "As you grab it, the mice ask, \"Just what do you think you're doing?\"" CR>
           <FCLEAR ,MOUSE-PAINTING ,NDESCBIT>
           <DEQUEUE I-MOUSE-BLAB>
           <SETG KILL-NOW? T>)
          (<AND <VERB? PUT>
                <IOBJ? WALLS>>
           <COND (<IN? ,PLAYER ,INTERVIEW-ROOM>
                  <COND (,NEAR-EXIT
                         <TELL "You place the painting back up. \"Now what was that about?\" asks Percy." CR>
                         <DEQUEUE I-MOUSE-BLAB>
                         <SETG KILL-NOW? <>>
                         <FSET ,MOUSE-PAINTING ,NDESCBIT>)
                        (ELSE
                         <FIRST-YOU "walking over to the south wall">
                         <COND (,KILL-NOW?
                                <JIGS-UP
"The mice take you walking over as an opportunity to shoot you, which they do.">)
                               (ELSE
                                <SETG NEAR-EXIT T>
                                <PERFORM ,V?PUT ,MOUSE-PAINTING ,WALLS>
                                <RTRUE>)>)>)
                 (ELSE
                  <TELL "There's nowhere to put it." CR>)>)
          (<VERB? MUNG ATTACK>
           <TELL
"\"What!\" shout the mice in unison. \"That was extremely expensive!\" Benjy
growls. \"Prepare to give us your brain in the name of science and revenge" ,PIC>
           <SETG KILL-NOW? T>
           <DEQUEUE I-MOUSE-BLAB>
           <QUEUE MOUSE-BANG 3>)
          (<AND <VERB? ASK-ABOUT>
                <DOBJ? MICE BENJY PERCY>
                <IOBJ? MOUSE-PAINTING>>
           <COND (<RUNNING? I-MOUSE-BLAB>
                  <TELL "The mice are literally right now talking about it." CR>)
                 (<FSET? ,MOUSE-PAINTING ,BADRADIOBIT>
                  <TELL "\"We just taked about that" ,PIC>)
                 (<NOT <RUNNING? I-MOUSE-BLAB>>
                  <TELL
"\"Well, it's a very old painting, and it's of our owner,
....\" And they just keep talking. Blah blah blah." CR>
                  <QUEUE I-MOUSE-BLAB 1>)>)>>

<OBJECT EMERGENCY-BUTTON
	(LOC INTERVIEW-ROOM)
	(SYNONYM BUTTON)
	(ADJECTIVE EMERGENCY EXIT)
	(DESC "emergency exit button")
	(FLAGS DOORBIT NDESCBIT VOWELBIT)
	(ACTION EMERGENCY-BUTTON-F)>

<ROUTINE EMERGENCY-BUTTON-F ()
	<COND (<VERB? EXAMINE>
		   <TELL
"Next to the exit is an emergency button. It is bright red and has the words
\"EMERGENCY\" plastered over it." CR>)
		  (<OR <VERB? SLAP PUSH>
               <AND <VERB? ATTACK>
                    <VERB-WORD? ,W?HIT>>>
		   <COND (<AND ,KILL-NOW?
                       <NOT <RUNNING? I-MOUSE-BLAB>>
		   			   <NOT ,NEAR-EXIT>>
                  <FIRST-YOU "walking over to" ,EMERGENCY-EXIT>
		   		  <TELL ,SUDDEN "attempt to leave and push the emergency exit button">
		   		  <TELL ", Perc" ,HEADSHOT>
				  <JIGS-UP
" Of course, you had to walk over to the door, and then push the button, all in one. So you had no chance.">)
				 (ELSE
				  <COND (<FSET? ,EMERGENCY-EXIT ,OPENBIT>
				  		 <TELL "Nothing happens." CR>)
						(ELSE
						 <TELL "The emergency door slides open, ">
                         <COND (<RUNNING? I-MOUSE-BLAB>
                                <TELL "but the mice don't notice yet as they are talking about the painting">)
                               (ELSE
                                <TELL "and the mice begin to become extremely suspicious of your behaviour">)>
						 <TELL ,PAUSES>
                         <FSET ,EMERGENCY-EXIT ,OPENBIT>)>
                  <RTRUE>)>)
		  ;(<VERB? WALK-TO>
		   <PERFORM ,V?WALK-TO ,EMERGENCY-EXIT>)>>

"Scene 2 - The Hallway"
<GLOBAL O-2 <>>
<GLOBAL O-3 <>>
<GLOBAL D3 <>>
<GLOBAL D-O/E <>>
<GLOBAL O/E <>>
<GLOBAL TCOMP <>>

<ROUTINE CHOOSE-PASSAGES ()
	<SETG O-2 <PICK-ONE <LTABLE ;0 "south" "west">>>
	<SETG O-3 <PICK-ONE <LTABLE ;0 "northeast" "east" "southwest">>>
	<SETG D3 <PICK-ONE <LTABLE ;0 "east" "west">>>
	<SETG D-O/E <PICK-ONE <LTABLE ;0 "north" "southeast" "southwest">>>
	<SETG O/E <PICK-ONE <LTABLE ;0 "hall" "end">>>
	<SETG TCOMP <PICK-ONE <LTABLE ;0 "southeast" "down">>>>

<ROUTINE IN-A-HALLWAY ("AUX" (SCORE? <>))
    <COND (<NOT <FSET? ,HALLWAY1 ,RADPLUGBIT>>
           <TELL "This is">
           <FSET ,HALLWAY1 ,RADPLUGBIT>
           <SET SCORE? T>)
          (ELSE
           <TELL "You are still in">)>
    <TELL " a winding hallway, ">
    <RETURN .SCORE?>>

<ROUTINE PASSAGES-LEAD ("OPT" (DES T))
    <COND (.DES
           <TELL !\P>)
          (ELSE
           <TELL !\p>)>
    <TELL "assages lead">
    <COND (<NOT .DES>
           <TELL "ing">)>
    <TELL !\ >
    <COND (<IN? ,PLAYER ,HALLWAY1>
           <TELL "off to the " ,O-2 !\, !\  ,O-3 ",
and back into the \"Interview\" room to the north">)
          (<IN? ,PLAYER ,HALLWAY2>
           <TELL "up a set of stairs, " ,D-O/E ", and " ,D3>)
          (<IN? ,PLAYER ,HALLWAY3>
           <TELL "east, north and " ,TCOMP>)>
    <TELL ,PAUSES>
    <COND (.DES
           <RFALSE>)
          (ELSE
           <RTRUE>)>>

<GLOBAL MICE-CHASE 0>

<ROUTINE I-MICE-CHASE ()
    <DEQUEUE I-TENSE-SCENE>
    <DEQUEUE I-ASK-DEATH>
    <DEQUEUE I-ASK-AGAIN>
    <DEQUEUE I-ASKED-NICELY>
    <DEQUEUE I-TENSE-SCENE>
    <DEQUEUE I-MOUSE-BLAB>
    <DEQUEUE MOUSE-BANG>
    <SETG KILL-NOW? <>>
    <COND (<AND <G? ,MICE-CHASE <+ <RANDOM 5> 10>>
                <NOT <IN? ,PLAYER ,BEHIND-DEVICE>>>
           <TELL CR
"With a jolt of fear that freezes you to the spot, the two mice burst into the room you ">
           <COND (<VERB? WALK>
                  <TELL "have just entered">)
                 (ELSE
                  <TELL "are in">)>
           <TELL ", backed up by a bunch of " ,AGENCY>
           <JIGS-UP " people, and they shoot you down
with a stun gun. Oh, well. The mice have got their way.">)
          (ELSE
           <TELL CR
"Behind you, the sound of footsteps and people shouting echoes around the corridor." CR>
           <SETG MICE-CHASE <+ ,MICE-CHASE 1>>)>>

<ROOM HALLWAY1
	(IN ROOMS)
	(DESC "Hallway")
	(LDESC 0)
	(SOUTH PER ONE-TWO-S)
	(WEST PER ONE-TWO-W)
	(NE PER ONE-THREE-NE)
	(EAST PER ONE-THREE-E)
	(SW PER ONE-THREE-SW)
	(DOWN PER PASSAGES-LEAD)
	(UP PER PASSAGES-LEAD)
    (SE PER PASSAGES-LEAD)
    (NW PER PASSAGES-LEAD)
	(NORTH SORRY "You can't go back in there! That's extremely dangerous!")
	(ACTION HALLWAY1-F)
    (THINGS (WINDY COMPLICAT) (PASSAGE HALLWAY) GLOBAL-ROOM-F)
	(FLAGS LIGHTBIT ONBIT)>

<ROUTINE HALLWAY1-F (RARG "AUX" SCORE?)
	<COND ;(<AND <EQUAL? .RARG ,M-ENTER>
                <NOT <FSET? ,HALLWAY1 ,RADPLUGBIT>>>
           <INCREMENT-SCORE 20>
           <CRLF>
           <FSET ,HALLWAY1 ,RADPLUGBIT>)
          (<EQUAL? .RARG ,M-LOOK>
		   <SET SCORE? <IN-A-HALLWAY>>
           <PASSAGES-LEAD <>>
           <COND (.SCORE?
                  ;<CRLF>
                  <INCREMENT-SCORE 20>)>)>>

;"Buncha movement routines"
<ROUTINE ONE-TWO-S ()
	<COND (<EQUAL? ,O-2 "south"> ,HALLWAY2) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE ONE-TWO-W ()
	<COND (<EQUAL? ,O-2 "west"> ,HALLWAY2) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE ONE-THREE-NE ()
	<COND (<EQUAL? ,O-3 "northeast"> ,HALLWAY3) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE ONE-THREE-E ()
	<COND (<EQUAL? ,O-3 "east"> ,HALLWAY3) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE ONE-THREE-SW ()
	<COND (<EQUAL? ,O-3 "southwest"> ,HALLWAY3) (ELSE <PASSAGES-LEAD> <RFALSE>)>>

<ROOM HALLWAY2
	(IN ROOMS)
	(DESC "Hallway")
    (SYNONYM HOME HOUSE)
	(LDESC 0)
	(UP TO HALLWAY1)
	(EAST PER TWO-THREE-E)
	(WEST PER TWO-THREE-W)
	(NORTH PER O-E-N)
    (SOUTH PER PASSAGES-LEAD)
	(SW PER O-E-SW)
	(SE PER O-E-SE)
    (NW PER PASSAGES-LEAD)
    (NE PER PASSAGES-LEAD)
	(DOWN PER PASSAGES-LEAD)
	(ACTION HALLWAY2-F)
    (THINGS (WINDY COMPLICAT) (PASSAGE HALLWAY) GLOBAL-ROOM-F)
	(FLAGS LIGHTBIT ONBIT)>

<ROUTINE HALLWAY2-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		   <IN-A-HALLWAY>
           <PASSAGES-LEAD <>>)>>

;"Buncha movement routines"
<ROUTINE TWO-THREE-E ()
	<COND (<EQUAL? ,D3 "east"> ,HALLWAY3) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE TWO-THREE-W ()
	<COND (<EQUAL? ,D3 "west"> ,HALLWAY3) (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE O-E-N ()
	<COND (<EQUAL? ,D-O/E "north">
		   <COND (<EQUAL? ,O/E "hall"> ,HALLWAY1) (ELSE ,END)>)
		  (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE O-E-SW ()
	<COND (<EQUAL? ,D-O/E "southwest">
		   <COND (<EQUAL? ,O/E "hall"> ,HALLWAY1) (ELSE ,END)>)
		  (ELSE <PASSAGES-LEAD> <RFALSE>)>>
<ROUTINE O-E-SE ()
	<COND (<EQUAL? ,D-O/E "southeast">
		   <COND (<EQUAL? ,O/E "hall"> ,HALLWAY1) (ELSE ,END)>)
		  (ELSE <PASSAGES-LEAD> <RFALSE>)>>

<ROOM HALLWAY3
	(IN ROOMS)
	(DESC "Hallway")
    (SYNONYM HELP HINT HINTS MAX FOG FOUQUET OGARRA O\'GARRA INFOCOM)
    (ADJECTIVE MAX FOUQUET)
	(LDESC 0)
	(EAST TO END)
	(SE PER THREE-COMP-SE)
	(DOWN PER THREE-COMP-D)
	(NORTH TO HALLWAY1)
	(UP PER PASSAGES-LEAD)
    (SOUTH PER PASSAGES-LEAD)
    (WEST PER PASSAGES-LEAD)
    (NE PER PASSAGES-LEAD)
    (NW PER PASSAGES-LEAD)
    (SW PER PASSAGES-LEAD)
	(ACTION HALLWAY3-F)
    (GENERIC MAX-G)
    (THINGS (WINDY COMPLICAT) (PASSAGE HALLWAY) GLOBAL-ROOM-F)
	(FLAGS LIGHTBIT ONBIT)>

<ROUTINE HALLWAY3-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		   <IN-A-HALLWAY>
           <PASSAGES-LEAD <>>)>>

;"Buncha movement routines"
<ROUTINE THREE-COMP-SE ()
	<COND (<EQUAL? ,TCOMP "southeast">
           <FCLEAR ,HALLWAY1 ,RADPLUGBIT>
           ,COMP-ROOM)
          (ELSE
           <PASSAGES-LEAD>
           <RFALSE>)>>
<ROUTINE THREE-COMP-D ()
	<COND (<EQUAL? ,TCOMP "down">
           <FCLEAR ,HALLWAY1 ,RADPLUGBIT>
           ,COMP-ROOM)
          (ELSE
           <PASSAGES-LEAD>
           <RFALSE>)>>

<ROOM END
	(IN ROOMS)
	(DESC "Dead End")
	(LDESC "This is a dead end. The only way out is down a set of stairs.")
    (SYNONYM CORPORATI CYBERNETI SIRIUS)
    (ADJECTIVE SIRIUS CYBERNETI)
	(DOWN TO HALLWAY1)
    (UP SORRY "You're at the top of the steps.")
    (NORTH SORRY "Only down.")
    (SOUTH SORRY "You can only go down.")
    (EAST SORRY "East goes nowhere. Down only.")
    (WEST SORRY "You can't go that way. You can go down.")
    (SE SORRY "There is a set of steps going downwards. Nothing else.")
    (SW SORRY "Down, please.")
    (NE SORRY "I tell you, only downwards.")
    (NW SORRY "I can see a staircase going down. You can as well.")
    (THINGS DEAD END GLOBAL-ROOM-F)
	(FLAGS LIGHTBIT ONBIT)
    (GLOBAL STAIRS)>

<ROOM COMP-ROOM
	(IN ROOMS)
	(DESC "The Great Device")
	(LDESC
"This is the chamber of a great device named (appropriately) The Great Device. It looks like it should
calculate something important, you just can't tell what. The only path leads east, back into the maze
of hallways. However, it looks like you may be able to squeeze around the computer, to the northwest
and southwest.")
	(EAST TO HALLWAY2)
	(NW TO BEHIND-DEVICE)
	(SW TO BEHIND-DEVICE)
	;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
	(THINGS (BIG GREAT IMPORTANT HOT HYPERSPAT FIELD) (DEVICE COMPUTER CALCULATO GENERATOR) BIG-DEVICE-F)
	(FLAGS LIGHTBIT ONBIT)>

<ROUTINE BIG-DEVICE-F ()
    <COND (<VERB? WALK-AROUND HIDE THROUGH>
           <COND (<IN? ,PLAYER ,COMP-ROOM>
                  <DO-WALK ,P?NW>)
                 (ELSE
                  <DO-WALK ,P?SE>)>
           <RTRUE>)
          (<VERB? LISTEN>
           <COND (<IN? ,PLAYER ,COMP-ROOM>
                  <TELL "A lot more whirring seems to be coming from the other side of it." CR>)
                 (T
                  <TELL
"A lot of whirring is coming from this magnificently large but apparently
useless computer, but above the loud footsteps and other noise it is still
barely audible. It reminds you of the time when your friend (who was in a
rock band) played some songs that, he said, wouldn't come out until 2004.
You suppose, thinking back on it, that he meant in a timeline in which the
Vogons didn't destroy the Earth. But although you liked it, you couldn't
get out of your mind how nice a person he was - even with all this heavy
music he listened to. Considering how smart and aware of what you now realise
to be the whole of the Galaxy, you wouldn't be surprised if he also made
it out and is now living in incognito mode." CR CR
"Oh right, the computer. Yes, very loud." CR>)>)
          (<VERB? RUB>
           <TELL "OUCH! It's burning SO HOT that it may well be a nuclear blast zone." CR>)
          (<VERB? EXAMINE>
           <TELL
"The heat radiating off the Great Device is burning your skin and
making you feel lightheaded at such a close proximity. As you scan
the servers and wires it hosts, you realise that it's so complex
and supermassive that no single part of it can be important on its
own. Therefore the machine is not important." CR>)
          (ELSE
           <UNIMPORTANT-THING-F>)>>

<ROOM BEHIND-DEVICE
	(IN ROOMS)
	(DESC "Behind The Great Device")
	(FDESC
"Alarms, signals, sirens, shouting, banging, flashing lights, whirring computers,
pounding feet, all around. You can hear someone saying something, presumably to
you, but like any song where you can't tell if it is being sung in English or a
foreign language (which shouldn't mean much now; you have a babel fish), you can't
tell what is being said.||The computer is hot against your back, and the bullets
ricochet off the walls, barely missing you. Can you escape?")
	(LDESC
"There are a lot of loud noises all around you, coming from bullets, alarms,
and the big hot computer separating you from the mice and whosever army they
have hired. Not your idea of a perfect holiday, then again, who said this was
a holiday?")
	(NE SORRY "You can't go back! You'd die!")
	(SE SORRY "You can't go back! You'd die!")
	(EAST SORRY "You can't since the big computer is in the way.")
	;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
	(THINGS (BIG GREAT IMPORTANT HOT HYPERSPAT FIELD) (DEVICE COMPUTER CALCULATO GENERATOR) BIG-DEVICE-F
			(FOREIGN UNINTELLIGIBLE ENGLISH) (SONG GIBBERISH SIREN ALARM SIGNAL BULLETS) USELESS)
	(FLAGS LIGHTBIT ONBIT)
    (ACTION EXPLODE-DEVICE)>

<GLOBAL DEVICE-EXPLODES 0>

<ROUTINE EXPLODE-DEVICE ("OPT" (RARG <>))
	<COND (<EQUAL? .RARG ,M-END>
           <COND (<L? ,DEVICE-EXPLODES 3>
                  <SETG DEVICE-EXPLODES <+ ,DEVICE-EXPLODES 1>>)
                 (ELSE
                  <TELL CR
"Suddenly, the computer you are hiding behind (which is called a
hyperspatial field generator - in case you were wondering)
explodes after having overheated during the past few turns.
No-one knows exactly why it exploded, but they think it got
scared of all the loud noises around it "><NOTES 2><TELL ". Anyway,
that's not the point. The point is that you have just exploded.">
	              <INCREMENT-SCORE 15 T>
	              <GO-TO-DARK>)>)>>