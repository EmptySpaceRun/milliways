"MILLIWAYS for
        the Restaurant at the End of the Universe"

"PART 3 - MILLIWAYS"

<OBJECT RESTAURANT
	(LOC LOCAL-GLOBALS)
	(DESC "Milliways")
	(SYNONYM RESTAURANT END UNIVERSE MILLIWAYS)
	(ADJECTIVE END AT)
	(FLAGS NARTICLEBIT)
	(ACTION RESTAURANT-F)>

<ROUTINE RESTAURANT-F ()
	 <COND (<VERB? LEAVE DISEMBARK>
		    <V-WALK-AROUND>)
	       (<VERB? THROUGH WALK-TO BOARD>
		    <TELL "You're in it!" CR>)
           (<VERB? FIND>
            <COND (<IN-REST? ,PLAYER>
                   <ALREADY ,WINNER "in it">)
                  (ELSE
                   <TELL ,DO-YOURSELF CR>)>)>>

<ROUTINE IN-REST? (OBJ)
   <COND (<OR <EQUAL? <META-LOC .OBJ> ,RECEPTION ,CAR-PARK ,THIRD-C ,DINING-HALL ,KITCHEN ,DRESSING-ROOM-REU>
	          <EQUAL? <LOC .OBJ>      ,RECEPTION ,CAR-PARK ,THIRD-C ,DINING-HALL ,KITCHEN ,DRESSING-ROOM-REU>>
	      <RTRUE>)
	     (T
	      <RFALSE>)>>

<ROOM RECEPTION
    (LOC ROOMS)
    (DESC "Reception")
    (EAST PER RECEPTION-TO-CAR-PARK)
    (UP ;PER ;TO-THIRD-C TO THIRD-C)
    ;(DOWN PER CANNOT-GO)
    (FLAGS LIGHTBIT ONBIT)
    (GLOBAL TABLE-RANDOM CAR-PARK-ACCESS-DOOR CAR-PARK-PANEL RESTAURANT)
    (ACTION RECEPTION-F)
    (THINGS <> RECEPTION GLOBAL-ROOM-F
            <> (SET STAIRS STEPS) STAIRS-F)>

<ROUTINE RECEPTION-F (RARG)
     ;<MOVE ,HOTBLACK-CAR ,GLOBAL-OBJECTS>
     <PUTP ,CAR-PARK-ACCESS-DOOR ,P?SDESC "car park access door">
     <PUTP ,CAR-PARK-PANEL ,P?SDESC "car park access panel">
     <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?RECEPTION ,W?CAR>
     <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?XZZZP ,W?PARK>
     <COND (<EQUAL? .RARG ,M-LOOK>
            <TELL "This is the reception">
            <COND (<FSET? ,RECEPTION ,SEENBIT>
                   <TELL " of Milliways">)>
            <TELL ", which has recently been polished clean. Here is a desk, and to the east is the car park.
You can walk up a set of stairs to the Third Class." CR>
            <FSET ,RECEPTION ,SEENBIT>)>>

<GLOBAL BEEN-ALREADY-CAR 0>
<GLOBAL BEEN-ALREADY-HALL 0>

<ROUTINE RECEPTION-TO-CAR-PARK ()
     <COND (<FSET? ,CAR-PARK-ACCESS-DOOR ,OPENBIT>
            <PUTP ,CAR-PARK-ACCESS-DOOR ,P?SDESC "reception access door">
            <PUTP ,CAR-PARK-PANEL ,P?SDESC "reception access panel">
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?CAR ,W?RECEPTION>
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?PARK ,W?XZZZP>
            <SETG BEEN-ALREADY-CAR <+ ,BEEN-ALREADY-CAR 1>>
            ,CAR-PARK)
           (<IN? ,FIRST-CLASS-CARD ,PLAYER>
            <TELL "You flash your access card against the panel and stroll through." CR CR>
            <PUTP ,CAR-PARK-ACCESS-DOOR ,P?SDESC "reception access door">
            <PUTP ,CAR-PARK-PANEL ,P?SDESC "reception access panel">
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?CAR ,W?RECEPTION>
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?PARK ,W?XZZZP>
            <SETG BEEN-ALREADY-CAR <+ ,BEEN-ALREADY-CAR 1>>
            ,CAR-PARK)
           (<G? ,BEEN-ALREADY-CAR 1>
            <TELL "\"Oh, it's you,\" says the computer, opening the door automatically and closing it behind you." CR CR>
            <PUTP ,CAR-PARK-ACCESS-DOOR ,P?SDESC "reception access door">
            <PUTP ,CAR-PARK-PANEL ,P?SDESC "reception access panel">
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?CAR ,W?RECEPTION>
            <REPLACE-ADJ? ,CAR-PARK-ACCESS-DOOR ,W?PARK ,W?XZZZP>
            <SETG BEEN-ALREADY-CAR <+ ,BEEN-ALREADY-CAR 1>>
            ,CAR-PARK)
           (ELSE
            <TELL "The car park management computer denies access. \"You don't have an access card.\"" CR>
            <RFALSE>)>>

<ROOM CAR-PARK
    (LOC ROOMS)
    (DESC "Car Park")
    (FDESC "This is the car park. All is silent, other than an old, buzzing light on the ceiling
which probably needs replacing and the odd sound of a maintenance robot scrubbing the toilet.
There is nothing of great importance here that you would need right away, though the toilet
is to the south, and the time-teleport cubicle is to the north.||To the west, you can go back
to the Reception, or to the east where ther is a large ship (apparently Hotblack Desiato's ship),
which is the only one that stands out from the other ships.")
    (LDESC
"To the south is the toilet, to the west is the Reception,
east leads to a hundred strange-looking ships (including
Hotblack Desiato's cruiser, which is all that you can look
at), and north to the time-teleport cubicles.")
    (WEST TO RECEPTION)
    (EAST PER ENTER-HOTBLACK)
    (IN SORRY
"Choice: you can go inwards to the north (where there is a time-teleport
cubicle) or to the east (to Hotblack Desiato's ship, among others).")
    (NORTH PER GO-TO-DARK)
    (SOUTH PER CANT-ENTER-OBJECT)
    ;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
    (THINGS CAR PARK GLOBAL-ROOM-F
            (RED BLUE FISHY ;HUNDRED OTHER DULL OTHER UNIMPORTA SIMILAR)
                 (SHIP SHIPS LOADS TONS HUNDREDS SPACESHIP STARSHIP CAR CARS) CANT-ENTER-OBJECT
            <> (BATHROOM TOILET) CANT-ENTER-OBJECT
            ;[(HOTBLACK DESIATO\'S DESIATO STUNT PERSONAL HIS) (SHIP SPACESHIP STARSHIP) CANT-ENTER-OBJECT]
            (BUZZING FLICKERING BUZZY FLICKERY) (LIGHT BUZZ) UNIMPORTANT-THING-F
            (MAINTENANCE SERVICE CLEANING TOILET) (ROBOT WORKER CLEANER) WORKER-ROBOT-F
            (DARK TIME TELEPORT TELEPORTA PERSONAL) (CUBICLE CUBICLES PORTAL BEAM) N-PORTAL-F)
    (GLOBAL CAR-PARK-ACCESS-DOOR CAR-PARK-PANEL RESTAURANT)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE ENTER-HOTBLACK ("OPT" (UNMOV <>))
    <COND (<NOT .UNMOV><TELL "(assuming you mean entering "><THE-J ,HOTBLACK-CAR T><TELL !\) CR>)>
    <THIS-IS-IT ,HOTBLACK-CAR>
    <COND (<FSET? ,HOTBLACK-CAR ,OPENBIT>
           <TELL
"You step inside the ship... and the hatch slides shut behind you,
leaving you in a dark nearly as terrifying as all the others before
it, although there is no shock so you feel the fear even greater than
previous times...">
           <CHANGE-PART 2>
           <QUEUE I-STUNT-SHIP -1>
           <COND (<NOT <IN? ,PEANUT-PACKET ,PLATE>>
                  <QUEUE I-GROGGY 2>)>
           ,STUNT-SHIP)
          (ELSE
           <TELL "You need not move anywhere, as the door's closed." CR>
           <RFALSE>)>>

<ROUTINE WORKER-ROBOT-F ()
    <COND (<VERB? FIND EXAMINE LISTEN>
           <TELL "It's somewhere in the toilet." CR>)
          (ELSE
           <UNIMPORTANT-THING-F>)>>

<ROUTINE N-PORTAL-F ()
    <COND (<VERB? WALK-TO BOARD THROUGH LEAP>
           <DO-WALK ,P?NORTH>
           <RTRUE>)
          (<VERB? EXAMINE>
           <TELL
"A dark portal - the time-teleport cubicles. It
uses a more sophisticated" ,BEAM ", so that all
guests feel welcome and less affected by the shock. ">
           <NOTES 7 T>)>>

<OBJECT CAR-PARK-ACCESS-DOOR
    (LOC LOCAL-GLOBALS)
    (SDESC "car park access door")
    (SYNONYM ACCESS DOOR COMPUTER)
    (ADJECTIVE CAR PARK ACCESS)
    (ACTION CAR-PARK-ACCESS-DOOR-F)
    (GENERIC DOOR-G)
    (FLAGS DOORBIT ;SADRADIOBIT)>

<ROUTINE CAR-PARK-ACCESS-DOOR-F ()
    <COND (<VERB? THROUGH>
           <COND (<IN? ,PLAYER ,CAR-PARK>
                  <DO-WALK ,P?WEST>)
                 (<IN? ,PLAYER ,RECEPTION>
                  <DO-WALK ,P?EAST>)>)
          (<AND <VERB? OPEN>
                <IOBJ? FIRST-CLASS-CARD>>
           <PERFORM ,V?PUT ,FIRST-CLASS-CARD ,CAR-PARK-PANEL>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL "There's no door handle." CR>)
          (<VERB? EXAMINE>
           <DESCRIBE-DOORS ,CAR-PARK-ACCESS-DOOR "It looks like it could squish you in half as you walk through it">)>>

<ROUTINE CLOSE-CAR-DOOR ()
    <FCLEAR ,CAR-PARK-ACCESS-DOOR ,OPENBIT>
    <COND (<GLOBAL-IN? ,CAR-PARK-ACCESS-DOOR ,HERE>
           <CRLF>
           <THE-J ,CAR-PARK-ACCESS-DOOR T T><TELL " slides shut." CR>)>>

<OBJECT CAR-PARK-PANEL
    (LOC LOCAL-GLOBALS)
    (SDESC "car park access panel")
    (SYNONYM PANEL)
    (ADJECTIVE CAR PARK ACCESS DOOR RECEPTION)
    (FLAGS SURFACEBIT ;SADRADIOBIT)
    (ACTION MANAGEMENT-PANEL-F)>

<OBJECT HOTBLACK-CAR
    (LOC CAR-PARK)
    (OWNER HOTBLACK)
    (DESC "personal ship")
    (ADJECTIVE HOTBLACK DESIATO\'S DESIATO STUNT PERSONAL HIS SHIP
               SPACESHIP STARSHIP BLACK JET EBONY VANTABLACK VOID COOL)
    (SYNONYM SHIP SPACESHIP STARSHIP DOOR HATCH HATCHWAY)
    (FLAGS NARTICLEBIT NDESCBIT)
    (GENERIC DOOR-G)
    (ACTION HOTBLACK-CAR-F)>

<ROUTINE HOTBLACK-CAR-F ("AUX" X)
    <COND (<AND <ADJ-USED? ,HOTBLACK-CAR ,W?STUNT>
                <NOT <FSET? ,HOTBLACK-CAR ,SADRADIOBIT>>>
           <FSET ,HOTBLACK-CAR ,SADRADIOBIT>
           <TELL "[Shh! You're not supposed to know that it's a stunt ship. Stop cheating!]" CR CR>)>
    <COND (<VERB? OPEN UNLOCK>
           <COND (<FSET? ,HOTBLACK-CAR ,OPENBIT>
                  <TELL "It already is!" CR>)
                 (<FSET? ,MARVIN ,RADPLUGBIT>
                  <TELL "Marvin's literally helping you. Please, spare me the pain of your uselessness and ragequit now." CR>)
                 (ELSE
                  <TELL "You'll need someone like Marvin to do that." CR>)>
           <RTRUE>)
          (<VERB? EXAMINE>
           <TELL "It's "><THE-J ,HOTBLACK-CAR T>
           <TELL
". It's totally black - like, fully black! Your eyes just
slideright off it. It looks like a good way to leave "
D ,RESTAURANT ", and then you can also exit in style!" CR>)
          (<OR ;<AND <VERB? THROUGH>
                    <NOUN-USED? ,HOTBLACK-CAR ,W?DOOR>>
               <VERB? BOARD CLIMB-ON CLIMB-UP WALK-AROUND THROUGH>>
           <COND (<SET X <ENTER-HOTBLACK T>>
                  <GOTO .X>)
                 ;(ELSE
                  <RTRUE>)>
           <RTRUE>)>>




<ROOM THIRD-C
    (LOC ROOMS)
    (DESC "Third Class")
    (DOWN TO RECEPTION)
    (NE PER THIRD-C-TO-DINING-HALL)
	;(UP PER CANNOT-GO)
    (GLOBAL SECOND-CLASS-ACCESS-DOOR SECOND-CLASS-PANEL RESTAURANT)
    (ACTION THIRD-C-F)
    (FLAGS LIGHTBIT ONBIT)
    (THINGS (THIRD CLASS) (THIRD-CLASS CLASS AREA) GLOBAL-ROOM-F
            SET (SET STAIRS STEPS) STAIRS-F)>

<ROUTINE THIRD-C-F (RARG)
    <PUTP ,SECOND-CLASS-ACCESS-DOOR ,P?SDESC "second class access door">
    <PUTP ,SECOND-CLASS-PANEL ,P?SDESC "second class access panel">
    <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?THIRD-CLASS ,W?SECOND-CLASS>
    <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?THIRD ,W?SECOND>
    <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?SOUTHWEST ,W?NORTHEAST>
    <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?THIRD-CLASS ,W?SECOND-CLASS>
    <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?THIRD ,W?SECOND>
    <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?SOUTHWEST ,W?NORTHEAST>
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<NOT <FSET? ,FORD ,SEENBIT>>
                  <TELL
"This is the third class. ">)>
           <TELL "To the northeast is the second class area, and you can also go down a set of steps. ">
           <COND (<NOT <FSET? ,FORD ,SEENBIT>>
                  <TELL
"Right here, it is very dull, silent, and you can't see the
explosion that is happening outside. You need to get through!">)>
           <CRLF>)>>

<ROUTINE THIRD-C-TO-DINING-HALL ()
     <COND (,MAX-ALLOWED
            <ITALICIZE "Accepted.">
            <TELL CR CR "The door slides open in silence." CR CR>
            <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <QUEUE CLOSE-SECOND-DOOR 2>
            ,DINING-HALL)
           (<FSET? ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <TELL "You sneak through into the second class area." CR CR>
            <FSET ,FORD ,SEENBIT>
            ,DINING-HALL)
           (<G? ,BEEN-ALREADY-HALL 1>
            <TELL "\"Oh, it's you,\" says the computer, opening the door automatically and closing it behind you." CR>
            ,DINING-HALL)
           (<IN? ,FIRST-CLASS-CARD ,PLAYER>
            <FIRST-YOU "swiping" ,FIRST-CLASS-CARD ,SECOND-CLASS-PANEL>
            <CRLF>
            <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <SETG BEEN-ALREADY-HALL <+ ,BEEN-ALREADY-HALL 1>>
            <QUEUE CLOSE-SECOND-DOOR 2>
            ,DINING-HALL)
           (ELSE
            <TELL ,NOPE "- the door's closed." CR>
            <RFALSE>)>>

<OBJECT SECOND-CLASS-ACCESS-DOOR
    (LOC LOCAL-GLOBALS)
    (SDESC "second class access door")
    (SYNONYM ACCESS DOOR)
    (ADJECTIVE SECOND CLASS SECOND-CLASS ACCESS NORTHEAST)
    (ACTION SECOND-CLASS-ACCESS-DOOR-F)
    (GENERIC DOOR-G)
    (FLAGS DOORBIT ;BADRADIOBIT)>

<ROUTINE SECOND-CLASS-ACCESS-DOOR-F ()
    <COND (<VERB? THROUGH>
           <COND (<IN? ,PLAYER ,THIRD-C>
                  <DO-WALK ,P?NE>)
                 (<IN? ,PLAYER ,DINING-HALL>
                  <DO-WALK ,P?SW>)>)
          (<AND <VERB? OPEN>
                <IOBJ? FIRST-CLASS-CARD>>
           <PERFORM ,V?PUT ,FIRST-CLASS-CARD ,SECOND-CLASS-PANEL>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL "There's no door handle." CR>)
          (<VERB? EXAMINE>
           <DESCRIBE-DOORS ,SECOND-CLASS-ACCESS-DOOR "It leads to and from the Dining Hall to the Third Class">)>>

<ROUTINE CLOSE-SECOND-DOOR ()
    <FCLEAR ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
    <COND (<GLOBAL-IN? ,SECOND-CLASS-ACCESS-DOOR ,HERE>
           <CRLF><THE-J ,SECOND-CLASS-ACCESS-DOOR T T><TELL " slides shut." CR>)>>

<OBJECT SECOND-CLASS-PANEL
    (LOC LOCAL-GLOBALS)
    (SDESC "second class access panel")
    (SYNONYM PANEL)
    (ADJECTIVE SECOND CLASS SECOND-CLASS ACCESS NORTHEAST DOOR)
    (FLAGS SURFACEBIT ;BADRADIOBIT)
    (ACTION MANAGEMENT-PANEL-F)>


<ROOM DINING-HALL
    (LOC ROOMS)
    (DESC "Dining Hall")
    (FDESC
"The area is busy with people, who talk to each other, taking glances at you
occasionally in surprise. Heading north will lead you to the First Class. In
front of the door, however, is a buff bouncer blocking the entrance. To the
east is a door labelled \"NO ENTRY\", and below it in tiny letters: \"under
penalty of death\". West is a room which has tape all around it, presumably
under maintenance. To the southeast is the Kitchen, while southwest is the
Third Class.")
    (LDESC
"You can go southwest (to the Third Class area),
southeast (to the kitchen), east (although there
is a door stating \"NO ENTRY\") and north leads
to the first class.")
    (NORTH PER DINING-HALL-TO-FIRST-CLASS)
    (SW PER DINING-HALL-TO-THIRD-C)
    (SE PER ENTER-KITCHEN?)
    (EAST PER ENTER-DRESSING-ROOM?)
    (WEST SORRY "The area is under maintenance.")
    ;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
    (GLOBAL SECOND-CLASS-ACCESS-DOOR SECOND-CLASS-PANEL RESTAURANT TABLE-RANDOM MAX-DRESS-DOOR)
    (THINGS (TIGHTLY PACKED TIGHT CROWDED BUSY) (PEOPLE ALIENS CROWD MOB) CROWD-F
            (DINING SECOND CLASS) (HALL CLASS SECOND-CLASS AREA) GLOBAL-ROOM-F)
    (ACTION DINING-HALL-F)
    (FLAGS LIGHTBIT ONBIT)>

<OBJECT BOUNCER
    (LOC DINING-HALL)
    (DESC "bouncer")
    (ADJECTIVE SECURITY SAFETY)
    (SYNONYM BOUNCER GUARD MAN)
    (FLAGS PERSONBIT NDESCBIT)
    (ACTION BOUNCER-F)>

<ROUTINE BOUNCER-F ()
    <COND (<PERSON-F ,BOUNCER>
           <RTRUE>)>>

<ROUTINE DINING-HALL-F (RARG)
    <COND (<EQUAL? .RARG ,M-ENTER>
           <DEQUEUE SHUT-CUPBOARD-DOOR>
           <PUTP ,SECOND-CLASS-ACCESS-DOOR ,P?SDESC "third class access door">
           <PUTP ,SECOND-CLASS-PANEL ,P?SDESC "third class access panel">
           <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?SECOND-CLASS ,W?THIRD-CLASS>
           <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?SECOND ,W?THIRD>
           <REPLACE-ADJ? ,SECOND-CLASS-ACCESS-DOOR ,W?NORTHEAST ,W?SOUTHWEST>
           <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?SECOND-CLASS ,W?THIRD-CLASS>
           <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?SECOND ,W?THIRD>
           <REPLACE-ADJ? ,SECOND-CLASS-PANEL ,W?NORTHEAST ,W?SOUTHWEST>
           <COND (<AND <FSET? ,DARK-OBJECT ,SADRADIOBIT>
                       <NOT <FSET? ,DINING-HALL ,BADRADIOBIT>>>
                  <FSET ,DINING-HALL ,RADPLUGBIT>
                  <FSET ,DINING-HALL ,BADRADIOBIT>)>)
           (<EQUAL? .RARG ,M-END>
            <COND (<FSET? ,DINING-HALL ,RADPLUGBIT>
                   <FCLEAR ,DINING-HALL ,RADPLUGBIT>
                   <MOVE ,POLICEMAN ,DINING-HALL>
                   <THIS-IS-IT ,POLICEMAN>
                   <TELL CR
"As you walk in, you notice somebody talking to " D ,ZAPHOD
" Beeblebrox. " D ,ZAPHOD " points at you, and the other person
turns around, and you realise who he is - a galactic security
agent. He takes a step forward, with a stern look on his face,
and beckons to you to go to him, which you do. \"You know this
man?\" he asks you, pointing at " D ,ZAPHOD " Beeblebrox. You
say that you do, explaining that even if you do know him, you
only recently met him. He stops you there with a finger and says
that he needs to talk to you." CR>)>)>>

<ROUTINE DINING-HALL-TO-FIRST-CLASS ()
     <COND (,MAX-ALLOWED
            <TELL "\"Lucky bugger,\" mutters the bouncer as you pass through. \"Got on old Max's register.\"" CR CR>
            ,FIRST-CLASS)
           (<IN? ,TOWEL ,PLAYER>
            <TELL
"The bouncer approves of your towel, mistakenly believing you to be a waiter, and allows you through." CR CR>
            ,FIRST-CLASS)
           (<OR ;<IN? ,MAX-CARD ,PLAYER>
                <IN? ,FIRST-CLASS-CARD ,PLAYER>>
            <TELL
"The bouncer swipes your card for you, impressed you would have such a card, nevertheless letting you in." CR CR>
            ,FIRST-CLASS)
           (ELSE
            <TELL "The bouncer stops you. \"Hold up, buddy!\" he shouts.
\"Where's your card? Or... nope, no towel. Not a waiter. " ,NOPE "go through.\"" CR>
            <RFALSE>)>>

<ROUTINE DINING-HALL-TO-THIRD-C ()
     <COND (,MAX-ALLOWED
            <ITALICIZE "\"Accepted.\"">
            <TELL CR CR "The door slides open in silence." CR CR>
            <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <QUEUE CLOSE-SECOND-DOOR 2>
            ,THIRD-C)
           (<FSET? ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <TELL "You walk back into the Third Class." CR CR>
            ,THIRD-C)
           (<G? ,BEEN-ALREADY-HALL 1>
            <TELL "\"Oh, it's you,\" says the computer, opening the door automatically and closing it behind you." CR>
            ,THIRD-C)
           (<IN? ,FIRST-CLASS-CARD ,PLAYER>
            <FIRST-YOU "swiping" ,FIRST-CLASS-CARD ,SECOND-CLASS-PANEL>
            <CRLF>
            <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
            <SETG BEEN-ALREADY-HALL <+ ,BEEN-ALREADY-HALL 1>>
            <QUEUE CLOSE-SECOND-DOOR 2>
            ,THIRD-C)
           (ELSE
            <TELL ,NOPE "- the door's closed." CR>
            <RFALSE>)>>

<ROUTINE ENTER-KITCHEN? ()
     <COND (<IN? ,TOWEL ,PLAYER>
            <QUEUE SHUT-CUPBOARD-DOOR 1>
            ,KITCHEN)
           (ELSE
            ;<GOTO ,KITCHEN>
            ;<V-LOOK>
            <TELL
"Just as you are about to step inside..." CR CR
"\"Hold on a minute!\" shouts a voice. \"Where's your dishcloth?\"
says the head cook, stepping out from behind an assortment of pots
and pans. \"Go back and get it!\" and promptly throws you out of
the kitchen.">
            <COND (,MAX-ALLOWED
                   <TELL
" You complain that you are on Max Quordlepleen's access register
and therefore should be allowed to enter, but the cook scoffs at
your rich-person behaviour and slams the door.">)>
            <CRLF>
            ;<GOTO ,DINING-HALL>
            <RFALSE>)>>


<OBJECT MAX-DRESS-DOOR
    (LOC LOCAL-GLOBALS)
    (SDESC "no-entry door")
    (ADJECTIVE NO ENTRY TO NO-ENTRY XZZZP XZZZQ XZZZR XZZZS XZZZT)
    (SYNONYM DOOR SIGN EAST)
    (FLAGS DOORBIT)
    (GENERIC DOOR-G)
    (ACTION MAX-DRESS-DOOR-F)>

<ROUTINE MAX-DRESS-DOOR-F ()
    <COND (<VERB? THROUGH>
           <COND (<IN? ,PLAYER ,DINING-HALL>
                  <DO-WALK ,P?EAST>)
                 (<IN? ,PLAYER ,DRESSING-ROOM-REU>
                  <DO-WALK ,P?WEST>)>)
          (<AND <VERB? OPEN>
                <IOBJ? FIRST-CLASS-CARD>>
           <TELL "There's no panel." CR>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL ,NOPE "do that with your hands!" CR>)
          (<VERB? EXAMINE>
           <COND (<FSET? ,DRESSING-ROOM-REU ,RADPLUGBIT>
                  <DESCRIBE-DOORS ,MAX-DRESS-DOOR "It leads to and from the Dining Hall to Max Quordlepleen's dressing room">)
                 (ELSE
                  <DESCRIBE-DOORS ,MAX-DRESS-DOOR "It might lead to the dressing room, but you can't be sure">)>)>>


<ROUTINE ENTER-DRESSING-ROOM? ()
     <COND (,MAX-ALLOWED
            <TELL "\"Looks like you're on the register. Enter.\"" CR CR>
            <COND (<FSET? ,DRESSING-ROOM-REU ,RADPLUGBIT>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?EAST ,W?WEST>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?MAX ,W?DINING>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?QUORDLEPL ,W?HALL>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?DRESSING ,W?SECOND>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?ROOM ,W?CLASS>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZT ,W?SECOND-CLASS>)
                  (ELSE
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?EAST ,W?WEST>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZP ,W?DINING>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZQ ,W?HALL>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZP ,W?SECOND>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZQ ,W?CLASS>
                   <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?XZZZT ,W?SECOND-CLASS>)>
            ,DRESSING-ROOM-REU)
           (ELSE
            <TELL
"The computer denies your access, stating that your name is not on Max
Quordlepleen's special card, and nor is your name on " D ,REGISTER ,PAUSES>
            <RFALSE>)>>



"FORD'S SATCHEL"
<OBJECT SATCHEL
	(LOC DINING-HALL)
	(DESC "satchel")
    ;(LDESC "Ford's satchel is on the floor here.")
	(DESCFCN SATCHEL-D)
	(SYNONYM SATCHEL)
	(ADJECTIVE BATTERED LEATHER BULKY FORD\'S)
	(FLAGS CONTBIT TRYTAKEBIT TAKEBIT ;SEARCHBIT OPENABLEBIT)
	(CAPACITY 30)
	(SIZE 28)
    (OWNER FORD)
	(ACTION SATCHEL-F)>

<ROUTINE SATCHEL-D ()
	<TELL "Ford's satchel is here." CR>
    <COND (<FSET? ,SATCHEL ,OPENBIT>
           <PRINT-CONT ,SATCHEL <> 0 <> T>)>>

<ROUTINE SATCHEL-F ()
	 <COND (<VERB? EXAMINE>
		    <TELL "The satchel, which is ">
		    <COND (<FSET? ,SATCHEL ,OPENBIT>
		           <TELL "open">)
		          (T
		           <TELL "closed">)>
		    <TELL ", is fairly bulky." CR>
            ;"<COND (<FSET? ,SATCHEL ,OPENBIT>"
                   <PRINT-CONT ,SATCHEL <> 0 <> ;T>;")>"
		    ;<ITEM-ON-SATCHEL-DESCRIPTION>)
	       ;(<AND <VERB? OPEN>
                 <NOT <FSET? ,SATCHEL ,OPENBIT>>>
            <COND (<NOT <IN? ,SATCHEL ,PLAYER>>
                   <COND (<IN? <LOC ,SATCHEL> ,PLAYER>
                          <FIRST-YOU "taking" ,SATCHEL <LOC ,SATCHEL>>)
                         (ELSE
                          <FIRST-YOU "taking" ,SATCHEL>)>
                   <PERFORM ,V?TAKE ,SATCHEL>)>
            <FSET ,SATCHEL ,OPENBIT>
            <PRINT-CONT ,SATCHEL <> 0 T>
			<QUEUE I-MINERAL-WATER 2>)
           (<AND <VERB? OPEN>
                 <NOT <FSET? ,SATCHEL ,OPENBIT>>>
            <FSET ,SATCHEL ,OPENBIT>
            <PRINT-CONT ,SATCHEL <> 0 T T>
			<QUEUE I-MINERAL-WATER 2>)
		   (<VERB? CLOSE>
		   	<TELL "Closed." CR>
			<FCLEAR ,SATCHEL ,OPENBIT>
			;<DEQUEUE I-MINERAL-WATER>)
		   ;(<VERB? SEARCH LOOK-INSIDE>
            <COND (<FSET? ,SATCHEL ,OPENBIT>
                   <PRINT-CONT ,SATCHEL>)
                  (ELSE
                   <COND (<IN? ,SATCHEL ,PLAYER>
                          <FIRST-YOU "opening" ,SATCHEL>)
                         (ELSE
                          <COND (<IN? <LOC ,SATCHEL> ,PLAYER>
                                 <FIRST-YOU "taking and opening" ,SATCHEL <LOC ,SATCHEL>>)
                                (ELSE
                                 <FIRST-YOU "taking and opening" ,SATCHEL>)>)>)>)
           (<VERB? SEARCH LOOK-INSIDE>
            <COND (<NOT <FSET? ,SATCHEL ,OPENBIT>>
                   <FIRST-YOU "opening" ,SATCHEL>)
                  (ELSE
                   <PRINT-CONT ,SATCHEL <> 0 <> T>)>)>>

<OBJECT MINERAL-WATER
	(LOC SATCHEL)
	(DESC "Santraginean Mineral Water")
	(LDESC "There is a bottle of mineral water here.")
	(SYNONYM BOTTLE WATER)
	(ADJECTIVE SANTRAGIN MINERAL)
	(FLAGS NARTICLEBIT DRINKBIT TAKEBIT ;GUIDEBIT)
	(GENERIC WATER-G)
	(ACTION MINERAL-WATER-F)
    (SIZE 5)>

<ROUTINE MINERAL-WATER-F ()
	 <COND (<VERB? DRINK>
		<TELL
"Bad idea. Even Santraginus Five seawater is illegal on most planets. (You can
imagine what kind of beach communities they have.)" CR>)
	       (<VERB? SEARCH LOOK-INSIDE>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<VERB? OPEN CLOSE>
		<TELL
"This is one of those clever new always-open always-closed bottles." CR>)>>

<GLOBAL MINERAL-WATER-CAUGHT 0>

<ROUTINE I-MINERAL-WATER ("AUX" (HERE? <>))
	<COND (<AND <VISIBLE? ,MINERAL-WATER>
				<EQUAL? ,HERE ,DINING-HALL ,THIRD-C ,FIRST-CLASS>>
		   <SET HERE? T>)
		  (ELSE
		   <SET HERE? <>>)>
	<COND (<OR <AND <EQUAL? <LOC ,MINERAL-WATER> ,GOWN ,SATCHEL>
		   			<NOT <FSET? <LOC ,MINERAL-WATER> ,OPENBIT>>>
			   <IN? ,MINERAL-WATER ,THING>>
           <COND (<G? ,MINERAL-WATER-CAUGHT 1>
                  <SETG MINERAL-WATER-CAUGHT <- ,MINERAL-WATER-CAUGHT 1>>)>
		   <RTRUE>)>
    <COND (.HERE?
    	   <COND (<EQUAL? ,MINERAL-WATER-CAUGHT 7>
  		 		  <TELL CR "Suddenly, someone realises what the bottle">
  				  <COND (<EQUAL? <LOC ,MINERAL-WATER> ,GOWN ,THING ,SATCHEL>
  					     <TELL " in ">
  					     <THE-J <LOC ,MINERAL-WATER> T>)>
  				  <TELL
" contains, and calls out, \"Oh dear! Guards, guards! That scruffy man over there
is in possession of a bottle of " D ,MINERAL-WATER "! Arrest him!\"||Soon, you are
placed in a non-time prison, where you grow old and end up dying a boring death.||||">
                  <BOLDEN "     ****  You have failed in life  ****">
                  <JIGS-UP "" T>)
	      	     (ELSE
	      	   	  <TELL CR "The people are beginning to become wary of the "  D ,MINERAL-WATER>
	      		  <COND (<OR <EQUAL? <LOC ,MINERAL-WATER> ,GOWN ,THING ,SATCHEL>
                             <EQUAL? <LOC <LOC ,MINERAL-WATER>> ,GOWN ,THING ,SATCHEL>>
	      			     <TELL " in ">
	      			     <THE-J <LOC ,MINERAL-WATER> T>)>
	      		  <TELL ,PAUSES>
	      		  <SETG MINERAL-WATER-CAUGHT <+ .MINERAL-WATER-CAUGHT 1>>
                  <QUEUE I-MINERAL-WATER 2>)>)
	      (ELSE
	       <COND (<EQUAL? ,MINERAL-WATER-CAUGHT 7>
	       		  <COND (<IN-REST? ,PLAYER>
	      			     <TELL CR
,YOU-HEAR "shouting and zipping noises coming from somewhere else in
the restaurant, and the words \"Mineral\", \"Illegal\", and \"Bottle\";
before everything returns to normal." CR>)>
				  <REMOVE ,MINERAL-WATER>)
				 (ELSE
				  <SETG MINERAL-WATER-CAUGHT <+ .MINERAL-WATER-CAUGHT 1>>)>)>>

<OBJECT TOWEL
	(LOC SATCHEL)
    ;(LDESC "There is a towel here.")
	(DESC "towel")
    (SYNONYM TOWEL TOWELS CLOTH DISHCLOTH)
	(FLAGS TAKEBIT TRYTAKEBIT ;GUIDEBIT)
	(SIZE 7)
	(CAPACITY 40)
	(ACTION TOWEL-F)>

<ROUTINE TOWEL-F ()
	 <COND (<AND <VERB? TAKE>
				 <EQUAL? ,PRSO ,TOWEL>
				 <FSET? ,TOWEL ,SURFACEBIT>>
			<FCLEAR ,TOWEL ,TRYTAKEBIT>
			<FCLEAR ,TOWEL ,SURFACEBIT>
			<ROB ,TOWEL ,HERE>
			<FCLEAR ,TOWEL ,CONTBIT>
			<FCLEAR ,TOWEL ,OPENBIT>
			<FCLEAR ,TOWEL ,NDESCBIT>
		    <RFALSE>)
	       (<AND <VERB? PUT>
		     	 <EQUAL? ,PRSI ,HEAD ,EYES>>
		    <TELL
"There's no need for that. It's not like there's a " D ,BEAST " around,
or something." CR>)
           ;(<AND <VERB? PUT>
                 <EQUAL? ,PRSI ,ARMS>>
            <TELL "Done.">)
	       (<VERB? EXAMINE>
            <TELL
"It's covered with little pink and blue flowers." CR>)
           (<AND <VERB? DROP TAKE>
                 ,TOWEL-HOLDING>
            <TELL
"You let go of the towel, and you fall back down. As it flutters to the floor, you grab the towel again." CR>
            <SETG TOWEL-HOLDING <>>)>>


;"*****************************
  ********** KITCHEN **********
  **** Over 700 lines long ****
  **** last time I checked ****
  *****************************
"

<ROOM KITCHEN
    (LOC ROOMS)
    (DESC "Kitchen")
    ;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
    (NW TO DINING-HALL)
    (FLAGS LIGHTBIT ONBIT)
    (GLOBAL RESTAURANT)
    (ACTION KITCHEN-F)
    (THINGS <> KITCHEN GLOBAL-ROOM-F
            (MANY PILING PILED STACKED) (STACKS LOTS TONS HUNDREDS POTS PANS DISHES POT PAN DISH) DISHES-F)>

<ROUTINE KITCHEN-F (RARG "AUX" THINGY)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL
"The kitchen is bustling with pots, pans, dishes, ">
           <COND (<NOT <FSET? ,OVEN ,SECRETBIT>>
                  <TELL "an oven">
                  <COND (<FSET? ,OVEN ,OPENBIT>
                         <TELL " (open)">)>
                  <TELL !\, !\ >)>
           <TELL "a small sink ">
           <COND (<FIRST? ,SINK>
                  <TELL "(inside which is "><PRINT-CONTENTS ,SINK><TELL !\) !\ >)
                 (<FSET? ,SINK ,SADRADIOBIT>
                  <TELL "(underneath which is a jumble of pipes and bolts) ">)>
           <TELL
"and hundreds upon hundreds of cupboards, which line the wall">
           <DO (NUM 1 13 2)
                <COND (<EQUAL? <GET ,CUPBOARD-PUZZLE .NUM> T>
                       <TELL ". One of them is open, ">
                       <COND (<SET THINGY <GET ,CUPBOARD-PUZZLE <+ .NUM 1>>>
                              <TELL "and inside that cupboard is ">
                              <THE-J .THINGY <>>
                              <THIS-IS-IT .THINGY>
                              <FCLEAR .THINGY ,INVISIBLE>)
                             (ELSE
                              <TELL "but it's empty">)>)>
                <RETURN>>
           <TELL ". The only exit is to the northwest." CR>)>>


<ROUTINE DISHES-F ()
    <COND (<OR <VERB? BRUSH>
               <AND <VERB? PUT-IN>
                    <IOBJ? SINK>>>
           <TELL "It's not your job to clean them. Also, you can't be bothered to." CR>
           <RTRUE>)
          (<VERB? SEARCH MOVE>
           <TELL "You spend a bit of time moving the pots and pans about. ">
           <COND (<FSET? ,OVEN ,SECRETBIT>
                  <TELL "You see an oven amidst the pans, and clear a space around it.">
                  <FCLEAR ,OVEN ,SECRETBIT>)
                 (ELSE
                  <TELL "Nothing is found.">)>
           <CRLF>
           <RTRUE>)
          (<VERB? EXAMINE TAKE RUB>
           <TELL
"It's just another thing to clear, or to search and find something
important hidden behind. But not now, it isn't your job." CR>)
          (ELSE
           <TELL "The pots and pans aren't your job to deal with.">)>>

;"Essentially the oven is a CPE (copy-paste-edit) of the sink... not the other way round"

<OBJECT OVEN
    (LOC KITCHEN)
    (DESC "oven")
    (SYNONYM OVEN MICROWAVE HEATER KNOB)
    (ADJECTIVE MICROWAVE HEATING)
    (FLAGS NDESCBIT CONTBIT OPENABLEBIT TRANSBIT SECRETBIT VOWELBIT ;INVISIBLE)
    (CAPACITY 100)
    (ACTION OVEN-F)>

<ROUTINE OVEN-F ()
    <COND (<AND <NOUN-USED? ,OVEN ,W?KNOB>
                <NOT <VERB? LAMP-ON LAMP-OFF TURN>>>
           <ACTUALLY ,OVEN>)>
    <COND (<AND <OR <VERB? LAMP-ON>
                    <AND <NOUN-USED? ,OVEN ,W?KNOB>
                         <VERB? TURN>>>
                ;<FSET? ,OVEN ,OPENBIT>>
           <COND (<NOT <FSET? ,OVEN ,OPENBIT>>
                  <TELL "Nothing happens. It's still open." CR>
                  <RTRUE>)>
           <TELL "You rotate the knob to full power. Inside, you can hear strain on the power.">
           <COND (<AND <HELD? ,GUIDE ,OVEN> ;"Not Thing because Thing protects it."
                       <NOT <HELD? ,GUIDE ,THING>>>
                  <COND (<VISIBLE? ,GUIDE>
                         <TELL !\  ,GUIDE-NAME
" fries and blows its inner circuits, but leaves the inside of the oven clean.">
                         ;<SET X T>)>
                  <FSET ,GUIDE ,BADRADIOBIT>)>
           <COND (<AND <HELD? ,THING ,OVEN>
                       <VISIBLE? ,THING>>
                  <TELL " The Thing looks unharmed.">
                  ;<SET X T>)>
           <COND (<IN? ,PLATE ,OVEN>
                  <TELL
"The meat turns a good shade of brown. I think it's now become an actual Haragia ez Beganoa - an actual meal!" CR>
                  <MOVE ,DINNER ,OVEN>
                  <MOVE ,PLATE ,LOCAL-GLOBALS>
                  <INCREMENT-SCORE 25>)
                 (<IN? ,DINNER ,OVEN>
                  <TELL
"The dinner becomes a pile of ashes. It's extremely painful to watch,
and you can feel your heart breaking into tiny metaphorical pieces." CR>
                  <INCREMENT-SCORE -30 T>)>
           <CRLF><CRLF>
           <TELL "The knob falls back to zero with a "><ITALICIZE "ding"><TELL ,PAUSES>)
          (<VERB? EXAMINE>
           <TELL "An oven. You found it behind all the pots and pans." CR>
           <PRINT-CONT ,OVEN>)>>


<OBJECT SINK
    (LOC KITCHEN)
    (DESC "sink")
    (SYNONYM SINK LAVATORY TAP BASIN WASHBOWL PIPES PIPE BOLT BOLTS SCREW SCREWS)
    (ADJECTIVE WASH DRAINAGE LOOSE)
    (FLAGS NDESCBIT CONTBIT OPENBIT ;SADRADIOBIT ;"Seen pipes" ;BADRADIOBIT ;"Fixed")
    (CAPACITY 100)
    (ACTION SINK-F)>

<ROUTINE SINK-F ("AUX" X)
    <COND (<AND <NOUN-USED? ,SINK ,W?TAP>
                <NOT <VERB? LAMP-ON LAMP-OFF TURN>>>
           <ACTUALLY ,SINK>)>
    <COND (<OR <VERB? LAMP-ON>
               <AND <NOUN-USED? ,SINK ,W?TAP>
                    <VERB? TURN>>>
           <COND (<FSET? ,SINK ,BADRADIOBIT>
                  <TELL "Out of the sink comes a flow of water, which cannot decide on a suitable direction to go in.">
                  <COND (<HELD? ,GUIDE ,SINK>
                         <COND (<VISIBLE? ,GUIDE>
                                <TELL !\  ,GUIDE-NAME " fizzles.">
                                <SET X T>)>
                         <FSET ,GUIDE ,BADRADIOBIT>)>
                  <COND (<AND <HELD? ,THING ,SINK>
                              <VISIBLE? ,THING>>
                         <TELL " The Thing empties much more water than it could have contained.">
                         <SET X T>)>
                  <COND (<AND <HELD? ,PLATE ,SINK>
                              ;<VISIBLE? ,PLATE>>
                         <COND (<VISIBLE? ,PLATE>
                                <TELL !\ >
                                <COND (.X
                                       <TELL "One thing that seems to be able to hold water, however, is the " D ,PLATE>)
                                      (ELSE
                                       <TELL "The " D ,PLATE " is now holding a quantity of water">)>
                                <TELL !\.>)>
                         <MOVE ,WATER-PORTION ,PLATE>)>
                  <CRLF>)
                 (ELSE
                  <TELL <PICK-ONE <PLTABLE "A single drop comes out of the tap"
                                           "Two drops fall out of the tap"
                                           "A steady stream of water comes out
of the tap, but the water is so hot that it eveaporates almost immediately">>
                        ,PAUSES>)>)
          (<VERB? EXAMINE>
           <TELL "A large sink. Underneath it is a bunch of pipes and bolts.">
           <COND (<AND <NOUN-USED? ,SINK ,W?PIPES ,W?PIPE ,W?BOLT>
                       <NOUN-USED? ,SINK ,W?BOLTS ,W?SCREW ,W?SCREWS>>
                  <TELL " One of the bolts is loose.">)>
           <PRINT-CONT ,SINK>
           <FSET ,SINK ,SADRADIOBIT>)
          (<AND <VERB? FIX TURN>
                <DOBJ? SINK>>
           <COND (<AND <NOT <NOUN-USED? ,SINK ,W?PIPES ,W?PIPE ,W?BOLT>>
                       <NOT <NOUN-USED? ,SINK ,W?BOLTS ,W?SCREW ,W?SCREWS>>>
                  <ACTUALLY <> "the loose bolt">)>
           <FSET ,SINK ,SADRADIOBIT>
           <COND (<IOBJ? WRENCH>
                  <COND (<FSET? ,SINK ,BADRADIOBIT>
                         <TELL "You turn the bolt until it is securely fastened." CR>
                         <FSET ,SINK ,BADRADIOBIT>)
                        (ELSE
                         <TELL "It's already been fastened. The water should work properly now." CR>
                         %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "|[DEBUG: It should be fixed!]|">)>>)>)
                 (ELSE
                  <TELL-ME-HOW>)>
           <RTRUE>)>>


<OBJECT WATER-PORTION
	(IN LOCAL-GLOBALS)
	(SYNONYM WATER QUANTITY LIQUID H2O)
	(DESC "quantity of water")
	(FLAGS TRYTAKEBIT TAKEBIT EATBIT ;DRINKBIT)
	(ACTION WATER-PORTION-F)
    (GENERIC WATER-G)
	(SIZE 4)>

<ROUTINE WATER-PORTION-F ()
	 <COND ;(<VERB? SGIVE> <RFALSE>)
	       (<VERB? THROUGH BOARD SWIM>
		    <TELL "Trying to swim in a tiny portion of water is like trying to make Marvin happy." CR>
		    <RTRUE>)
	       (<AND <VERB? FILL>
                 ,PRSI
                 <DOBJ? WATER-PORTION>>
		    <PERFORM ,V?PUT-IN ,PRSO ,PRSI>
            <RTRUE>)
           (<VERB? DRINK EAT>
            <TELL "Just because it comes from a tap in a high-class restaurant doesn't mean you should drink it." CR>
            <RTRUE>)
           (<AND <VERB? PUT-IN PUT> ;<NOT .PI?>>
	    	<COND (<AND ,PRSI 
                        <NOT <IOBJ? PLATE>>>
	    	       <THE-J ,WATER-PORTION T T>
                   <TELL !\ >
                   <COND (<NOT <FSET? ,PRSI ,CONTBIT>>
                          <TELL "slips right off">)
                         (ELSE
                          <TELL "leaks through">)>
                   <TELL " of ">
                   <THE-J ,PRSI T><TELL " and evaporates immediately." CR>
	    	       <REMOVE ,WATER-PORTION>
                   <RTRUE>)
	    	      (<DOBJ? PLATE>
	    	       <COND (<NOT <FIRST? ,PLATE>>
	    		          <MOVE ,WATER-PORTION ,PLAYER>
	    		          <TELL "The " D ,PLATE " is now full of water." CR>
                          <RTRUE>)
	    		         ;(T
	    		          <TELL "The water slips through your fingers, and onto the floor, where it evaporates." CR>
	    		          <REMOVE ,WATER-PORTION>
                          <RTRUE>)>)
		          (T
		           <TELL "The water slips through your fingers, and onto the floor, where it evaporates." CR>
	    	       <REMOVE ,WATER-PORTION>
                   <RTRUE>)>)
	       (<VERB? DROP GIVE>
		    <COND (<AND <VERB? DROP>
		    	        <IN? ,WATER-PORTION ,PLATE>>
		           <TELL "The water slips through your fingers, and onto the floor, where it evaporates." CR>
	        	   <REMOVE ,WATER-PORTION>
                   <RTRUE>)
	              (<VERB? THROW>
		           <TELL "The water splashes on the walls and evaporates immediately." CR>
		           <REMOVE ,WATER-PORTION>
                   <RTRUE>)>)>
     <RFALSE>>



<OBJECT CUPBOARD
    (LOC KITCHEN)
    (DESC "cupboards")
    (SYNONYM CUPBOARD CUPBOARDS CUBPOARD CUBPOARDS DOOR ;"People make this mistake a lot"
             SHELF SHELVES DRAWER DRAWERS WALL LOTS LINE ROW LINES LOT ;(A LOT of cupboards)
             ROWS HUNDREDS LOADS ONE ANOTHER)
    (ADJECTIVE MANY LINED BIG LARGE COMPLICAT COMPLEX UPON)
    (FLAGS CONTBIT OPENBIT NDESCBIT PLURALBIT ;SEARCHBIT TRANSBIT)
    (ACTION CUPBOARD-F)>

<GLOBAL CUPBOARD-PUZZLE
    <LTABLE <> RUM-GLASS
            <> PLATE
            <> BLASTER
            <> RED-DYE
            <> WINE-GLASS
            <> <> ;DUCT-TAPE
            <> <>>>

<GLOBAL CUP-PROB
    <TABLE 60
           60
           60
           60
           60
           60
           100>>

<GLOBAL CUPBOARD-SHUTTING <>>
<GLOBAL CUPBOARD-ENTRANCED <>>
<GLOBAL ENTRANCED <>>

<ROUTINE CUPBOARD-F ("AUX" CUP THINGY) ;"Another complicated one..."
     <COND (<AND <VERB? OPEN>>
            <TELL ,AUTO CR>
            <RTRUE>)
		   (<VERB? CLOSE>
            <TELL ,AUTO CR>
            <RTRUE>)
           (<AND <VERB? PUT PUT-IN GIVE>
                 <IOBJ? CUPBOARD>
                 <NOT <DOBJ? CUPBOARD>>
                 <HELD? ,PRSO>>
            <TELL 
"As you place "><THE-J ,PRSO T><TELL " inside the open cupboard, a voice says \"Ooh! Is that ">
<THE-J ,PRSO <>><TELL "? Thank you...\" And the cupboard swallows the object, briefly distracted
from its opening-and-closing door business as it decides just where to place "><THE-J ,PRSO T>
<TELL ", which disappears behind miles of shelves." CR CR "Behind you, the chef chuckles to himself.
\"You're never getting that back, you know.\"" CR>
            <REMOVE ,PRSO>
            ;<SETG CUPBOARD-SHUTTING T>
            <SETG CUPBOARD-ENTRANCED T>
            <RTRUE>)
           (<VERB? EXAMINE SEARCH LOOK-INSIDE>
            <TELL "Rows of complex cupboards, hundreds lining the wall">
            <DO (NUM 1 18 2)
                 <COND (<EQUAL? <GET ,CUPBOARD-PUZZLE .NUM> T>
                        <TELL ". One of them is open, ">
                        <COND (<SET THINGY <GET ,CUPBOARD-PUZZLE <+ .NUM 1>>>
                               <TELL "and inside that cupboard is ">
                               <THE-J .THINGY <>>
                               <THIS-IS-IT .THINGY>
                               ;<FCLEAR .THINGY ,INVISIBLE>)
                              (ELSE
                               <TELL "but it's empty">)>)>
                 <RETURN>>
            <TELL ,PAUSES>
            <RTRUE>)
           (<VERB? ATTACK>
            <TELL "\"Well that's not very nice!\" A disembodied voice shouts." CR>)>>

<ROUTINE SHUT-CUPBOARD-DOOR ("AUX" FOUND FIN THINGY CUP ;OBJ)
    <COND (,CUPBOARD-ENTRANCED
           <QUEUE SHUT-CUPBOARD-DOOR 2>
           <SETG ENTRANCED T>
           <SETG CUPBOARD-ENTRANCED <>>
           <RTRUE>)>
    <QUEUE SHUT-CUPBOARD-DOOR 1>
    <SETG ENTRANCED <>>
    <CRLF>
    <DO (NUM 1 13 2)
         <COND (<EQUAL? <GET ,CUPBOARD-PUZZLE .NUM> T>
                <TELL "The open cupboard door shuts. " ;CR>
                <PUT ,CUPBOARD-PUZZLE .NUM <>>
                ;<MOVE <GET ,CUPBOARD-PUZZLE <+ .NUM 1>> ,LOCAL-GLOBALS>
                ;<FSET <GET ,CUPBOARD-PUZZLE <+ .NUM 1>> ,INVISIBLE>
                <FSET <GET ,CUPBOARD-PUZZLE <+ .NUM 1>> ,SECRETBIT>
                <FCLEAR <GET ,CUPBOARD-PUZZLE <+ .NUM 1>> ,SEENBIT>
                <FCLEAR <GET ,CUPBOARD-PUZZLE <+ .NUM 1>> ,TOUCHBIT>
                <SET FOUND .NUM>
                <RETURN>)>>
    <SETG CUPBOARD-SHUTTING <>>
    <DO (NUM 1 13 2)
         <COND (<PROB <GET ,CUP-PROB <SET FIN </ <- .NUM 1> 2>>>>
                <COND (<NOT <EQUAL? .FIN 8>>
                       <PUT ,CUP-PROB .FIN 0>)>
                <TELL "A">
                <COND (.FOUND <TELL "nother">)>
                <TELL " cupboard door opens">
                <PUT ,CUPBOARD-PUZZLE .NUM T>
                <COND (<NOT <EQUAL? <SET THINGY <GET ,CUPBOARD-PUZZLE <+ .NUM 1>>> <>>>
                       <TELL ", revealing ">
                       <THE-J .THINGY <>>
                       <FCLEAR .THINGY ,INVISIBLE>
                       <FCLEAR .THINGY ,SECRETBIT>)>
                <TELL !\.>
                <RETURN>)
               (ELSE
                <COND (<0? <GET ,CUP-PROB .FIN>>
                       <PUT ,CUP-PROB .FIN 60>)>)>>
    <CRLF>>

<OBJECT RUM-GLASS
    (LOC CUPBOARD)
    (DESC "rum glass")
    (SYNONYM GLASS)
    (ADJECTIVE RUM)
    (DESCFCN RUM-GLASS-D)
    (FLAGS CONTBIT TAKEBIT TRYTAKEBIT ;INVISIBLE SECRETBIT OPENBIT)
    (ACTION RUM-GLASS-F)
    (SIZE 5)>

<ROUTINE RUM-GLASS-D ()
    <TELL "There is a rum glass here. ">
    <PERFORM ,V?EXAMINE ,RUM-GLASS>>

<ROUTINE RUM-GLASS-F ()
    <COND (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 2 <>>
           <RFALSE>)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)
          (<VERB? EXAMINE SEARCH LOOK-INSIDE>
           <COND (<AND ,WINE-RUM
                       ,BLASTER-RUM>
                  <TELL "It has got a mix of " ,GALACT " and red wine inside it.">)
                 (,BLASTER-RUM
                  <TELL "There's some clear liquid, which you can tell is " ,GALACT " from the smell.">)
                 (,WINE-RUM
                  <TELL "There's some red wine in it.">)
                 (ELSE
                  <TELL "It's empty.">)>
           <CRLF>)>>

<OBJECT WINE-GLASS
    (LOC CUPBOARD)
    (DESC "wine glass")
    (DESCFCN WINE-GLASS-D)
    (SYNONYM GLASS)
    (ADJECTIVE WINE)
    (FLAGS CONTBIT TAKEBIT TRYTAKEBIT ;INVISIBLE SECRETBIT OPENBIT)
    (ACTION WINE-GLASS-F)
    (SIZE 4)>

<ROUTINE WINE-GLASS-D ()
    <TELL "There is a wine glass here. ">
    <PERFORM ,V?EXAMINE ,WINE-GLASS>>

<ROUTINE WINE-GLASS-F ()
    <COND (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 10 <>>
           <RFALSE>)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)
          (<VERB? EXAMINE SEARCH LOOK-INSIDE>
           ;<TELL "The wine glass is quite well designed. ">
           <COND (<AND ,WINE-WINE
                       ,BLASTER-WINE>
                  <TELL "It has got a mix of " ,GALACT " and red wine inside it.">)
                 (,BLASTER-WINE
                  <TELL "There's some clear liquid, which you can tell is " ,GALACT " from the smell.">)
                 (,WINE-WINE
                  <TELL "There's some red wine in it.">)
                 (ELSE
                  <TELL "It's empty.">)>
           <CRLF>)>>

<OBJECT PLATE
    (LOC CUPBOARD)
    (DESC "heatproof tray")
    (DESCFCN PLATE-D)
    (SYNONYM PLATE DISH TRAY)
    (ADJECTIVE COOKING HEATPROOF HEAT-PROO)
    (FLAGS TAKEBIT TRYTAKEBIT SURFACEBIT ;INVISIBLE SECRETBIT CONTBIT OPENBIT)
    (GENERIC DINNER-G)
    (ACTION PLATE-F)
    (CAPACITY 100)
    (SIZE 7)>

<ROUTINE PLATE-D ()
    <TELL "There is a heatproof tray here." CR>
    <COND (<FIRST? ,PLATE>
           <PRINT-CONT ,PRSO <> 0 <> T>)>>

<ROUTINE PLATE-F ("AUX" X)
    <COND (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 4 <>>
           <RFALSE>)
          (<VERB? OPEN CLOSE>
           <HAR-HAR>)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)
          (<VERB? EXAMINE SEARCH LOOK-INSIDE>
           <TELL
"The tray is meant to withstand temperatures up to about 5 hundred thousand
degrees celsius, so it is also used as a quick tray for cooking stuff on.">
           <COND (<NOT <SET X <FIRST? ,PLATE>>>
                  <COND (<VERB? SEARCH LOOK-INSIDE>
                         <TELL " There is nothing on the tray.">)>
                  <CRLF>)
                 (ELSE
                  <CRLF>
                  <PRINT-CONT ,PRSO <> 0 <> T>
                  <COND (<NEXT? .X>
                         <TELL
"It's all been mixed up, so there's not much distinguishing between
everything on the tray - it's just that you know what's on the tray." CR>)>)>
           <RTRUE>)
          (<AND <VERB? PUT PUT-IN>
                <IOBJ? OVEN>>
           <COND (<IN? ,MEAT-DISH ,PLATE>
                  <COND (<IN? ,WATER ,PLATE>
                         <TELL "You place it in the oven, satisfied with the ingredients on it." CR>
                         <MOVE ,MEAT-DISH ,OVEN>)
                        (ELSE
                         <TELL "There isn't any water, so the meat will just get burnt if it is put in the oven." CR>)>)
                 (<IN? ,WATER ,PLATE>
                  <TELL "What! Just water?" CR>)
                 (<IN? ,PEANUT-PACKET ,PLATE>
                  <TELL "That sounds stupid." CR>)
                 (ELSE
                  <TELL "Really? Come on." CR>)>)
          (<AND <VERB? PUT PUT-IN>
                <IOBJ? PLATE>>
           <COND (<DOBJ? MEAT-DISH>
                  <TELL
"You swipe the meat onto the dish, and the old tray disappears with a spectaular swishing sound." CR>
                  <MOVE ,MEAT-DISH ,PLATE>
                  <PUTP ,MEAT-DISH ,P?OWNER <>>
                  <COND (<EQUAL? <GETP ,MEAT-DISH ,P?SDESC> "dish of meat">
                         <PUTP ,MEAT-DISH ,P?SDESC "piece of meat">)
                        (ELSE
                         <PUTP ,MEAT-DISH ,P?SDESC "piece of vegan snow lizard meat">)>
                  <FSET ,MEAT-DISH ,SADRADIOBIT>
                  <REPLACE-NOUN? ,MEAT-DISH ,W?DISH ,W?PIECE>
                  <REPLACE-NOUN? ,MEAT-DISH ,W?PLATE ,W?XZZZQ>
                  ;<REPLACE-ADJ? ,MEAT-DISH ,W?DISH ,W?XZZZP>
                  ;<REPLACE-ADJ? ,MEAT-DISH ,W?PLATE ,W?XZZZQ>
                  <RTRUE>)
                 (<DOBJ? PEANUT-PACKET>
                  <COND (<NOT <FSET? ,PEANUT-PACKET ,OPENBIT>>
                         <TELL "It isn't even open!" CR>)
                        (<FSET? ,PEANUT-PACKET ,SADRADIOBIT>
                         <TELL "It's empty." CR>)
                        (ELSE
                         <TELL "You empty the packet of peanuts onto the tray." CR>
                         <MOVE ,PEANUT-PACKET ,PLATE>
                         <PUTP ,PEANUT-PACKET ,P?SDESC "peanuts">
                         <FCLEAR ,PEANUT-PACKET ,OPENBIT>
                         <FSET ,PEANUT-PACKET ,PLURALBIT>
                         <REPLACE-NOUN? ,PEANUT-PACKET ,W?PACKET ,W?XZZZP>
                         <FSET ,PEANUT-PACKET ,BADRADIOBIT>)>
                  <RTRUE>)
                 (<OR <DOBJ? BLASTER>
                      <AND <DOBJ? RUM-GLASS>
                           ,BLASTER-RUM
                           <NOT ,WINE-RUM>>
                      <AND <DOBJ? WINE-GLASS>
                           ,BLASTER-WINE
                           <NOT ,WINE-WINE>>>
                  <COND (<NOT <FIRST? ,PLATE>>
                         <TELL "Real clever idea. Just pour " ,GALACT " straight onto the tray." CR>)
                        (<AND <SET X <FIRST? ,PLATE>>
                              <NOT <NEXT? .X>>>
                         <COND (<EQUAL? .X ,PEANUT-PACKET ,WATER>
                                <TELL "It doesn't seem like a good idea to pour " ,GALACT " on ">
                                <THE-J .X T>
                                <TELL ,PAUSES>)
                               (ELSE
                                <COND (,USING-SPORFE
                                       <TELL
"Using the sporfe, you measure one spoonful and sprinkle it onto the
tray. You place the bottle down, and it is immediately whisked away." CR>
                                       <INCREMENT-SCORE 15>)
                                      (ELSE
                                       <TELL
"Done, although you spill a little too much " ,GALACT
" on the tray - you and your shaky hands. The bottle, now empty, ">
                                       <COND (<IN-REST? ,PLAYER>
                                              <TELL "is collected by a service cleaning robot">)
                                             (ELSE
                                              <TELL "vanishes without a trace">)>
                                       <TELL ,PAUSES>
                                       <FSET ,DINNER ,RADPLUGBIT>)>
                                <MOVE ,BLASTER ,LOCAL-GLOBALS>)>)>)
                 (ELSE
                  <TELL "I rather wouldn't put that on the tray." CR>)>)>>

<OBJECT RED-DYE
    (LOC CUPBOARD)
    (DESC "pot of burgundy food dye")
    ;(LDESC "There is a pot of red food dye here.")
    (SYNONYM DYE POT)
    (ADJECTIVE RED FOOD LIQUID)
    (FLAGS ;CONTBIT ;OPENABLEBIT TAKEBIT TRYTAKEBIT ;INVISIBLE SECRETBIT OPENBIT)
    (ACTION RED-DYE-F)
    (SIZE 13)>

<ROUTINE RED-DYE-F ()
    <COND (<VERB? EXAMINE>
           <TELL "It is a liquid food dye.">)
          (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 8 <>>
           <RFALSE>)
          (<VERB? DRINK>
           <HAR-HAR>)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL ,WORTHLESS CR>)
          (<AND <VERB? FILL>
                    ,PRSI
                    <DOBJ? RED-DYE>>
		   <PERFORM ,V?PUT-IN ,PRSO ,PRSI>)
          (<AND <VERB? POUR>
                ;<HELD? ,BLASTER>>
           <COND (<AND <HELD? ,RUM-GLASS>
                       <HELD? ,WINE-GLASS>>
                  <TELL "You'll have to be more specific about which glass." CR>)
                 (<HELD? ,WINE-GLASS>
                  <TELL "(into the wine glass)" CR>
                  <COND (,WINE-WINE
                         <TELL "You've already poured some dye in there.">)
                        (ELSE
                         <TELL "You pour some food dye in the glass.">
                         <SETG WINE-WINE T>)>
                  <CRLF>)
                 (<HELD? ,RUM-GLASS>
                  <TELL "(into the rum glass)" CR>
                  <COND (,WINE-RUM
                         <TELL "You've already poured some dye in there.">)
                        (ELSE
                         <TELL "You pour some food dye in the glass.">
                         <SETG WINE-RUM T>)>
                  <CRLF>)
                 (ELSE
                  <RFALSE>)>)
          (<OR <AND <VERB? PUT-IN>
                    <DOBJ? RED-DYE>
                    <NOT <EQUAL? ,PRSI ,BLASTER ,RED-DYE>>>
               <AND <VERB? FILL>
                    <IOBJ? RED-DYE>>
                    <NOT <EQUAL? ,PRSI ,BLASTER ,RED-DYE>>>
           <COND (<EQUAL? ,RUM-GLASS ,PRSO ,PRSI>
                  <COND (,WINE-RUM
                         <TELL "You've already poured some wine in there.">)
                        (ELSE
                         <TELL "You pour some wine in the glass.">
                         <SETG WINE-RUM T>)>
                  <CRLF>)
                 (<EQUAL? ,WINE-GLASS ,PRSO ,PRSI>
                  <COND (,WINE-WINE
                         <TELL "You've already poured some wine in there.">)
                        (ELSE
                         <TELL "You pour some wine in the glass.">
                         <SETG WINE-WINE T>)>
                  <CRLF>)
                 (ELSE
                  <RFALSE>)>)>>

<OBJECT BLASTER
    (LOC CUPBOARD)
    (DESC "bottle of Pan Galactic Gargle Blaster")
    (FDESC "Uh oh! You notice a bottle of Pan Galactic Gargle Blaster here.")
    (LDESC "You can see a bottle with some Pan Galactic Gargle Blaster here.")
    (SYNONYM BOTTLE BLASTER PGGB)
    (ADJECTIVE PAN GALACTIC GARGLE PAN-GALACTIC)
    (FLAGS ;CONTBIT ;OPENABLEBIT TAKEBIT TRYTAKEBIT ;INVISIBLE SECRETBIT OPENBIT)
    (ACTION BLASTER-F)
    (SIZE 10)>

<ROUTINE BLASTER-F ()
    <COND (<VERB? EXAMINE>
           <TELL "It looks like water, but is a much more volatile liquid." CR>)
          (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 6 <>>
           <RFALSE>)
          (<VERB? DRINK>
           <TELL "Are you stupid? What, just drink something like that? No thanks.">)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL ,WORTHLESS CR>)
          (<AND <VERB? FILL>
                    ,PRSI
                    <DOBJ? WATER-PORTION>>
		   <PERFORM ,V?PUT-IN ,PRSO ,PRSI>)
          (<AND <VERB? POUR>
                ;<HELD? ,BLASTER>>
           <COND (<AND <HELD? ,RUM-GLASS>
                       <HELD? ,WINE-GLASS>>
                  <TELL "You'll have to be more specific about which glass." CR>)
                 (<HELD? ,WINE-GLASS>
                  <TELL "(into the wine glass)" CR>
                  <COND (,BLASTER-WINE
                         <TELL "You've already poured some " ,GALACT " in there.">)
                        (ELSE
                         <TELL "You pour some " ,GALACT " in the glass.">
                         <SETG BLASTER-WINE T>)>
                  <CRLF>)
                 (<HELD? ,RUM-GLASS>
                  <TELL "(into the rum glass)" CR>
                  <COND (,BLASTER-RUM
                         <TELL "You've already poured some " ,GALACT " in there.">)
                        (ELSE
                         <TELL "You pour some " ,GALACT " in the glass.">
                         <SETG BLASTER-RUM T>)>
                  <CRLF>)
                 (ELSE
                  <RFALSE>)>)
          (<OR <AND <VERB? PUT-IN>
                    <DOBJ? BLASTER>
                    <NOT <EQUAL? ,PRSI ,BLASTER ,RED-DYE>>>
               <AND <VERB? FILL>
                    <IOBJ? BLASTER>
                    <NOT <EQUAL? ,PRSO ,BLASTER ,RED-DYE>>>>
           <COND (<EQUAL? ,RUM-GLASS ,PRSO ,PRSI>
                  <COND (,BLASTER-RUM
                         <TELL "You've already poured some " ,GALACT " in there.">)
                        (ELSE
                         <TELL "You pour some " ,GALACT " in the glass.">
                         <SETG BLASTER-RUM T>)>
                  <CRLF>)
                 (<EQUAL? ,WINE-GLASS ,PRSO ,PRSI>
                  <COND (,BLASTER-WINE
                         <TELL "You've already poured some " ,GALACT " in there.">)
                        (ELSE
                         <TELL "You pour some " ,GALACT " in the glass.">
                         <SETG BLASTER-WINE T>)>
                  <CRLF>)
                 (ELSE
                  <RFALSE>)>)>>

;<OBJECT DUCT-TAPE
    (LOC CUPBOARD)
    (DESC "roll of duct tape")
    ;(LDESC "You can see a roll of duct tape here.")
    (SYNONYM ROLL TAPE)
    (ADJECTIVE DUCT DUCK)
    (FLAGS ;CONTBIT ;OPENABLEBIT TAKEBIT TRYTAKEBIT ;INVISIBLE SECRETBIT)
    (ACTION DUCT-TAPE-F)
    (SIZE 7)>

;<ROUTINE DUCT-TAPE-F ()
    <COND (<AND <VERB? TAKE>
                ,ENTRANCED>
           <PUT ,CUPBOARD-PUZZLE 12 <>>
           <RFALSE>)
          (<VERB? TAKE>
           <TELL ,REPLACE CR>
           <RTRUE>)>>

<GLOBAL BLASTER-RUM <>>
<GLOBAL WINE-RUM <>> ;"Still called wine because the red dye used to be wine...."
<GLOBAL BLASTER-WINE <>>
<GLOBAL WINE-WINE <>>

;"****************************
  **** End of the Kitchen ****
  ****************************
"





<ROOM DRESSING-ROOM-REU
    (LOC ROOMS)
    (DESC "Max Quordlepleen's Dressing Room")
    (SW PER TO-DINING-HALL)
    (OUT PER TO-DINING-HALL)
    (GLOBAL RESTAURANT MAX-DRESS-DOOR)
    (FLAGS LIGHTBIT ONBIT)
    (THINGS (MAX QUORDLEPL DRESSING) ROOM GLOBAL-ROOM-F)
    (ACTION DRESSING-ROOM-REU-F)>

<ROUTINE DRESSING-ROOM-REU-F (RARG)
    <COND ;(<AND <EQUAL? .RARG ,M-ENTER>
                <NOT <FSET? ,DRESSING-ROOM-REU ,RADPLUGBIT>>>
           <FSET ,DRESSING-ROOM-REU ,RADPLUGBIT>
           <INCREMENT-SCORE 25>
           <RFALSE>)
          (<EQUAL? .RARG ,M-LOOK>
           <TELL 
"You are in " D ,DRESSING-ROOM-REU ". To the
southwest is the " D ,DINING-HALL " area." CR>)>>

<ROUTINE TO-DINING-HALL ()
    <FSET ,DRESSING-ROOM-REU ,RADPLUGBIT>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?WEST ,W?EAST>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?DINING ,W?MAX>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?HALL ,W?QUORDLEPL>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?SECOND ,W?DRESSING>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?CLASS ,W?ROOM>
    <REPLACE-ADJ? ,MAX-DRESS-DOOR ,W?SECOND-CLASS ,W?XZZZT>
    ,DINING-HALL>


<OBJECT SAFE
    (IN DRESSING-ROOM-REU)
    (DESC "safe")
    (DESCFCN SAFE-D)
    (SYNONYM SAFE)
    (ADJECTIVE SECURE)
    (FLAGS CONTBIT LOCKED DOORBIT)
    (ACTION SAFE-F)>

<ROUTINE SAFE-D ()
    <TELL "A safe stands in one corner of the room. ">
    <COND (<FSET? ,SAFE ,OPENBIT>
           <TELL "It is open">
           <COND (<FIRST? ,SAFE>
                  <TELL ", and inside you can see ">
                  <PRINT-CONTENTS ,SAFE>)>
           <TELL !\.>)>
    <CRLF>>

<ROUTINE SAFE-F ()
    <COND (<AND <VERB? OPEN UNLOCK>
                <FSET? ,SAFE ,LOCKED>>
           <TELL "You don't have the combination. So... ">
           <TELL-ME-HOW>)
          (<VERB? THROUGH>
           <TELL "There's nothing on the other side." CR>)>>

<OBJECT KEYSET
    (LOC SAFE)
    (DESC "keyset")
    (SYNONYM KEY KEYS KEYSET SET RING)
    (ADJECTIVE KEY RING)
    (GENERIC KEY-G)
    (FLAGS TAKEBIT)
    (ACTION KEYSET-F)>

<ROUTINE KEYSET-F ()
    <COND (<VERB? EXAMINE>
           <TELL
"A keychain with a bunch of keys on it, for many different purposes.
One is them is allegedly Hotblack Desiato's, but it would take years
to find the right one all by yourself. You count through a few to 
prove that this is, in fact, true: ">
           <PERFORM ,V?COUNT ,KEYSET>
           <RTRUE>)
          (<VERB? SEARCH COUNT LOOK-THROUGH>
           <TELL "One, two, three,">
           <WORD-FROM-NUMBERS <PICK-ONE <PLTABLE 4 14 42 100 222 911 2356 4566 12345 19891 32767>>>
           <TELL " ...  You get the idea." CR>
           <RTRUE>)>>



<ROOM FIRST-CLASS
    (LOC ROOMS)
    (DESC "First Class")
    (LDESC
"The first class is spacious, with a stage at the
northern end (for Max Quordlepleen's performance),
and an exit at the southern end of the room.")
    (SOUTH TO DINING-HALL)
    ;(DOWN PER CANNOT-GO)
	;(UP PER CANNOT-GO)
    (NORTH SORRY "Get on the stage? Sorry, I'm not going to let you do it.")
    (ACTION FIRST-CLASS-F)
    (GLOBAL RESTAURANT)
    (FLAGS LIGHTBIT ONBIT)
    (THINGS (FIRST CLASS) (CLASS FIRST-CLA AREA ROOM) GLOBAL-ROOM-F)>

<ROUTINE FIRST-CLASS-F (RARG)
    <COND (<AND <EQUAL? .RARG ,M-END>
                <NOT <FSET? ,FIRST-CLASS ,RADPLUGBIT>>>
           <INCREMENT-SCORE 15>
           <FSET ,FIRST-CLASS ,RADPLUGBIT>)>
    <MOVE ,FIRST-CLASS-IDIOT ,FIRST-CLASS>
    <RFALSE>>

<OBJECT STAGE
    (LOC FIRST-CLASS)
    (DESC "stage")
    (DESCFCN STAGE-D)
    (SYNONYM STAGE PLATFORM)
    (ADJECTIVE NORTHERN NORTH)
    (FLAGS ;NDESCBIT SURFACEBIT)
    (CAPACITY 200)>

<ROUTINE STAGE-D ()
    <COND (<FIRST? ,STAGE>
           <OPEN-ANYTHING ,STAGE <>>)>>



<ROUTINE FIND-DOOR-PANEL (DOOR)
    <COND (<EQUAL? .DOOR ,SECOND-CLASS-ACCESS-DOOR>
           ,SECOND-CLASS-PANEL)
          (<EQUAL? .DOOR ,CAR-PARK-ACCESS-DOOR>
           ,CAR-PARK-PANEL)
          (<EQUAL? .DOOR ,SECOND-CLASS-PANEL>
           ,SECOND-CLASS-ACCESS-DOOR)
          (<EQUAL? .DOOR ,CAR-PARK-PANEL>
           ,CAR-PARK-ACCESS-DOOR)>>


<ROUTINE MANAGEMENT-PANEL-F ()
    <COND (<AND <VERB? PUT>
                <NOT <EQUAL? ,PRSO ,SECOND-CLASS-PANEL ,CAR-PARK-PANEL>>>
           <COND (<FSET? <FIND-DOOR-PANEL ,PRSI> ,OPENBIT>
                  <TELL "It's already open!" CR>)
                 (<EQUAL? ,PRSO ,FIRST-CLASS-CARD>
                  <TELL "You flash the card against the panel, and the door slides open." CR>
                  <COND (<EQUAL? ,PRSI ,SECOND-CLASS-PANEL>
                         <FSET ,SECOND-CLASS-ACCESS-DOOR ,OPENBIT>
                         <QUEUE CLOSE-SECOND-DOOR 2>)
                        (<EQUAL? ,PRSI ,CAR-PARK-PANEL>
                         <FSET ,CAR-PARK-PANEL ,OPENBIT>
                         <QUEUE CLOSE-CAR-DOOR 2>)>)
                 (ELSE
                  <COND (,MAX-ALLOWED
                         <TELL "I can't see that ">
                         <THE-J ,PRSO T>
                         <TELL " would be helpful in opening the door." CR>)
                        (ELSE 
                         <TELL "\"Access denied,\" calls a robotic voice." CR>)>)>)
          (<VERB? EXAMINE>
           <TELL "It's ">
           <THE-J ,PRSO T>
           <TELL ". It seems to control access to ">
           <THE-J <FIND-DOOR-PANEL ,PRSO> T>
           <TELL ". Currently " he+verb ,PRSO "is" " lit up ">
           <COND (<FSET? <FIND-DOOR-PANEL ,PRSO> ,OPENBIT>
                  <TELL "green">)
                 (ELSE
                  <TELL "red">)>
           <TELL ,PAUSES>)>>







"PART 11 - THE STUNT SHIP"

<ROOM STUNT-SHIP
    (LOC ROOMS)
    (SYNONYM HGRF)
    (SDESC "Darkness")
    (OUT PER OUT-STUNT)
    (DOWN PER OUT-STUNT)
    (IN PER IN-STUNT)
    (THINGS (STUNT PERFOMANCE SMALL EMPTY BLACK SPACIOUS) (SHIP SPACESHIP) STUNT-GLOBAL-ROOM)
    (GLOBAL STAR KAKRAFOON WINDOW)
    (ACTION STUNT-SHIP-F)>

<ROUTINE STUNT-GLOBAL-ROOM ()
    <COND (<VERB? STOP>
           <TELL "Just thought of that? Bravo. Brav"><ITALICIZE "issi"><TELL "mo.
(Just in case you are as low as I think you are right now, that means WELL DONE.)" CR>)
          (<GLOBAL-ROOM-F>
           <RTRUE>)>>

<GLOBAL USED-LOOK-DARK <>>

<ROUTINE STUNT-SHIP-F (RARG)
    <COND (<EQUAL? .RARG ,M-ENTER>
           ;"Clear score"
           ;<TELL CR
"... And all of the knowledge is gone. You forget what you were thinking about,
whatever miserable thing it was. You congratulate yourself for stopping the
descent of your score." CR>
		   ;<INCREMENT-SCORE 25 T>
           <FCLEAR ,MARVIN ,SADRADIOBIT>
           <FCLEAR ,MARVIN ,RADPLUGBIT>
		   <DEQUEUE I-LOSE-IT-EVERY-TURN>
           <SETG SCOREOUT 32>
           ;"Moving"
           <MOVE ,ZAPHOD ,STUNT-SHIP>
           <MOVE ,TRILLIAN ,STUNT-SHIP>
           <MOVE ,FORD ,STUNT-SHIP>
           <MOVE ,MARVIN ,STUNT-SHIP>
           ;<BOLDEN "Dark">
           ;<TELL CR "It is pitch dark. You can't see a thing." CR>
           <V-LOOK>
           <FUCKING-CLEAR>
           ;<RTRUE>)
          (<AND <EQUAL? .RARG ,M-BEG>
                <NOT <FSET? ,STUNT-SHIP ,LIGHTBIT>>>
           <FCLEAR ,GRUES ,INVISIBLE>
		   <COND ;(<VERB? LOOK>
                  <BOLDEN "Dark">
                  <TELL CR "It is pitch dark. You can't see a thing." CR>)
                 (ELSE
                  <COND (<OR <EQUAL? ,GRUES ,PRSI ,PRSO>
                             <AND <VERB? LAMP-ON>
                                  <DOBJ? LIGHT-GLOBAL>>>
                         <RFALSE>)
                        (<OR <VERB? LOOK>
                             <AND ,LOOKING-DARK
                                  <NOT ,USED-LOOK-DARK>>>
                         <BOLDEN "Dark">
                         <TELL CR "It is pitch dark. You can't see a thing." CR>
                         <SETG USED-LOOK-DARK T>
                         <RTRUE>)
                        (<SEE-VERB?>
                         <TOO-DARK>)
                        (<VERB? WAIT-FOR WAIT-UNTIL>
                         <RFALSE>)
                        (<VERB? WALK>
                         <TELL "I wouldn't move just yet." CR>)
                        (ELSE
                         <TELL "All I would be thinking about right now is how dark it is." CR>)>)>
		   ;<FUCKING-CLEAR>
           ;<RTRUE>)
          (<AND <EQUAL? .RARG ,M-BEG>
                <FSET? ,ESCAPE-POD ,SADRADIOBIT>>
           <COND (<VERB? DROP>
                  <COND (<IDROP>
                         <TELL "Dropped." CR>
                         <MOVE ,PRSO ,ESCAPE-POD>)>
                  <RTRUE>)
                 (<OR <VERB? STAND ;DISEMBARK>
                      <AND <VERB? DISEMBARK LEAVE>
                           <DOBJ? ESCAPE-POD>>>
                  <DO-WALK ,P?OUT>
                  <RTRUE>)
                 (<AND <VERB? BOARD THROUGH CLIMB-ON WALK-AROUND CLIMB-UP>
                       <DOBJ? ESCAPE-POD>>
                  <ALREADY ,PLAYER "inside the escape pod">
                  <RTRUE>)
                 (<AND <OR <REMOTE-VERB?>
                           <AND <TOUCHING?>
                                <VISIBLE? ,PRSO>
                                <VISIBLE? ,PRSI>>>
                       <NOT <ORDERING?>>>
                  <TOO-BAD-SIT-HIDE>
                  <RTRUE>)>)
          (<EQUAL? .RARG ,M-LOOK>
           <COND (<FSET? ,STUNT-SHIP ,SADRADIOBIT>
                  <COND (<=? 2 ,VERBOSITY>
                         <TELL
"The stunt ship is nearly as dark on the
inside as it appeared to be on the outside. ">)>
                  <TELL "A console ">
                  <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
                         <TELL "on the other side of the ship">)
                        (ELSE
                         <TELL "to fore">)>
                  <TELL
" below a window consists of a radio (which is
made up of a loudspeaker built into the wall">
                  <COND (<FSET? ,LOUDSPEAKER ,TOUCHBIT>
                         <TELL " that looks very broken,">)>
                  <TELL
" and a microphone on the console); and one red button. ">
                  <COND (<=? 2 ,VERBOSITY>
                         <TELL
"That's it; nothing more, which seems quite odd.
But hey, this is a stunt ship - it's not meant
to support people. ">)>
                  <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
                         <TELL "You are standing inside">)
                        (ELSE
                         <TELL "Along the back wall is">)>
                  <TELL
" an escape pod (literally just a platform labeled TELEPORT)." CR>
                  <COND (<FIRST? ,ESCAPE-POD>
                         <PRINT-CONT ,ESCAPE-POD <> 0 <> T>)>)
                 (ELSE
                  <FSET ,STUNT-SHIP ,SADRADIOBIT>
                  ;<FSET ,STUNT-SHIP ,BADRADIOBIT>
                  <RTRUE>)>)
          (<EQUAL? .RARG ,M-END>
           <SETG USED-LOOK-DARK <>>)>>

<ROUTINE OUT-STUNT ()
    <TELL "You">
    <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
           <TELL " step out." CR>
           <FCLEAR ,ESCAPE-POD ,SADRADIOBIT>)
          (ELSE
           <TELL "'ve been looking, but there's no obvious way to leave!" CR>)>
    <RFALSE>>

<ROUTINE IN-STUNT ()
    <TELL "You ">
    <COND (<NOT <FSET? ,ESCAPE-POD ,SADRADIOBIT>>
           <TELL "step in the escape pod." CR>
           <FSET ,ESCAPE-POD ,SADRADIOBIT>)
          (ELSE
           <TELL "can't go in any further!" CR>)>
    <RFALSE>>

<GLOBAL STUNT-COUNTER 0>

<ROUTINE I-STUNT-SHIP ("AUX" X)
    <COND (<1? ,STUNT-COUNTER>
           <TELL CR "You hear a deep throbbing." CR>)
          (<EQUAL? ,STUNT-COUNTER 3>
           <TELL CR
"\"Hey, look where we are!\" pipes a familiar voice. It's " D ,FORD "'s!" CR>)
          (<EQUAL? ,STUNT-COUNTER 4>
           <TELL CR
"\"Shush, " D ,FORD ",\" replies a second voice that seems familiarly like "
D ,TRILLIAN "'s voice. \"I can't see anything yet. Don't spoil the surprise.\"" CR>)
          (<EQUAL? ,STUNT-COUNTER 5>
           <TELL CR
"\"No, that's exactly it! It's pitch dark!\" says " D ,FORD
". \"Froody! I love flotation tanks.\"" CR>)
          (<EQUAL? ,STUNT-COUNTER 6>
           <TELL CR
"\"Alright, guys.\" " D ,ZAPHOD "'s deep voice echoes around the invisible room, which
gives you a good idea of the size of the area you're in - small - in fact, very small.
\"I was" ,PRESIDENT ", so I should know where we are.\"||\"I have no idea where we are,\"
a proud " D ,ZAPHOD " confirms, after a long silence." CR>)
          (<EQUAL? ,STUNT-COUNTER 8>
           <TELL CR
"There is a deep humming that shakes you to the core." CR>)
          (<EQUAL? ,STUNT-COUNTER 9>
           <TELL CR
"The humming becomes louder, until it is deafening..." CR>)
          (<EQUAL? ,STUNT-COUNTER 10>
           <TELL CR
"Suddenly, one side of the chamber explodes into a
flashing array of lights, and you find yourself in
the interior of a small ship, which is rapidly
hurtling towards a large red sun visible outside
the window. So much for going out in style...">
           <SIXCR>
           <SET X <INPUT 1>>
           <SIXCR>
           <PUTP ,STUNT-SHIP ,P?SDESC "Small, Empty Ship">
           <FSET ,STUNT-SHIP ,LIGHTBIT>
           <FSET ,STUNT-SHIP ,ONBIT>
           <V-LOOK>
           <DEQUEUE I-STUNT-SHIP>
           <FSET ,GRUES ,INVISIBLE>
           ;<QUEUE I-REALISE 1>
           <I-REALISE>)>
    <SETG STUNT-COUNTER <+ ,STUNT-COUNTER 1>>
    <FUCKING-CLEAR>>

<ROUTINE I-REALISE ()
    ;<FCLEAR ,STUNT-SHIP ,BADRADIOBIT>
    <PUTP ,STUNT-SHIP ,P?SDESC "Stunt Ship">
    <TELL CR
"\"This ain't no personal ship of Hotblack Desiato's!\"
cries Ford. \"It's a stunt ship! Oh, Arthur, how do you
always somehow get us into this sort of stuff...\"" CR>>

<GLOBAL GROGGY 0>

<ROUTINE I-GROGGY ()
    <QUEUE I-GROGGY 2>
    <COND (<1? ,GROGGY>
           <TELL CR "You begin to feel a little hungry and tired, even after the meal you're sure you just had." CR>)
          (<EQUAL? ,GROGGY 2>
           <TELL CR "Not only are you feeling hungry, but tired and a little emotional." CR>)
          (<EQUAL? ,GROGGY 4>
           <TELL CR "You are becoming very tired and hungry." CR>)
          (<EQUAL? ,GROGGY 5>
           <FCLEAR ,STUNT-SHIP ,SADRADIOBIT>
           <JIGS-UP
"|In actual fact, that ride took away quantitudes of protein from your
system, which led to a violent allergic reaction, and your sudden death.
Your friends, being useless, never do find a way out of the stunt ship so
they ungracefully embrace death by radiation poisoning and a much quicker
zero-point-one degree burn, and they also die.|
|The only one who survives in this situation appears to be Marvin. He uses
a matter tranference beam onboard the ship to escape, yet not all goes well
for him either, because he spends the rest of time on the marsh planet
Squornshellous Zeta, whose only inhabitants are a race of mattresses, all
of whom are called Zem and are very happy. This is awufully bad luck for
Marvin, but who really cares about Marvin?|Look, what I'm really trying to
get across to you is the fact that you have died, and that's final. Just
once more for a luckier run next time:">)>
    <SETG GROGGY <+ ,GROGGY 1>>>

<OBJECT CONSOLE
    (LOC STUNT-SHIP)
    (DESC "console")
    (ADJECTIVE CONTROL)
    (SYNONYM CONSOLE BRIDGE PANEL)
    (FLAGS NDESCBIT SURFACEBIT)
    (CAPACITY 200)
    (ACTION CONSOLE-F)>

<ROUTINE CONSOLE-F ()
    <COND (<AND <VERB? PUT>
                <IDROP>>
           <TELL "It slides gracefully to the floor." CR>)
          (<VERB? EXAMINE SEARCH LOOK-ON>
           <TELL "On the console is a " D ,BIG-RED-BUTTON ,PAUSES>)>>

<OBJECT BIG-RED-BUTTON
    (LOC CONSOLE)
    (DESC "big red button")
    (ADJECTIVE BIG RED)
    (SYNONYM BUTTON MASHER)
    (FLAGS NDESCBIT)
    (ACTION BIG-RED-BUTTON-F)>

<ROUTINE BIG-RED-BUTTON-F ("AUX" OBJ)
    <COND (<OR <VERB? SLAP PUSH>
               <AND <VERB? ATTACK>
                    <VERB-WORD? ,W?HIT>>>
           <COND (ELSE ;<FSET? ,REMOTE-CONTROL ,RADPLUGBIT>
                  <TELL "The escape pod crackles and emits a very bright light. ">
                  <COND (<AND <FSET? ,ESCAPE-POD ,SADRADIOBIT>
                              <ORDERING?>
                              <EQUAL? ,WINNER ,MARVIN>>
                         <TELL
"As the room around you fades and splutters, you wonder if this
time the beam will fail. It always happens almost immediately.
The humming of the " D ,ESCAPE-POD " increases in power, until
you feel your arms fading. Just as you begin to step out and
embrace the sun heading right towards you - almost touching it
now - " D ,FORD " bounds into the teleporter at full speed.
\"You're not leaving wihout me!\" he yells, grinning wildly.
\"Come on, let's get out of here.\"|
|Then the whole world winks out, and so does your brain, but
only for a millisecond - and the rest of the story up until
the next game is all in your imagination." CR>
                         ;<SIXCR>
                         <INCREMENT-SCORE 25 T>
                         <INIT-STATUS-LINE>
                         <UPDATE-STATUS-LINE>
                         <FINISH>
                         <RFATAL>)
                        (<AND <SET OBJ <FIRST? ,ESCAPE-POD>>
                              <NEXT? .OBJ>>
                         <TELL "All of the things">)
                        (.OBJ
                         <THE-J .OBJ T T><TELL " along with a layer of dust">)>
                  <ROB ,ESCAPE-POD ,HATCHWAY>
                  <COND (.OBJ
                         <TELL " disappear in a flash. ">)>
                  <TELL "Then the light fades." CR>)>)>>

<OBJECT REMOTE-CONTROL
    (LOC ESCAPE-POD)
    (DESC "remote control")
    (SYNONYM CONTROL DEVICE)
    (ADJECTIVE REMOTE)
    (FLAGS SURFACEBIT TAKEBIT)
    (ACTION REMOTE-CONTROL-F)>

<ROUTINE REMOTE-CONTROL-F ()
    <COND (<VERB? PUT>
           <WONT-HELP>)
          (<VERB? EXAMINE RUB SEARCH>
           <TELL
"The " D ,REMOTE-CONTROL " has five buttons on it -
one in each corner, and one directly in the middle." CR>)>>

<OBJECT TL-BUTTON
    (LOC REMOTE-CONTROL)
    (DESC "top left button")
    (ADJECTIVE TOP LEFT)
    (SYNONYM BUTTON)
    (FLAGS NDESCBIT)
    (ACTION REMOTE-BUTTON-F)>

<OBJECT TR-BUTTON
    (LOC REMOTE-CONTROL)
    (DESC "top right button")
    (ADJECTIVE TOP RIGHT)
    (SYNONYM BUTTON)
    (FLAGS NDESCBIT)
    (ACTION REMOTE-BUTTON-F)>

<OBJECT MI-BUTTON
    (LOC REMOTE-CONTROL)
    (DESC "middle button")
    (ADJECTIVE MIDDLE CENTER CENTRE CENTRAL MID)
    (SYNONYM BUTTON)
    (FLAGS NDESCBIT)
    (ACTION REMOTE-BUTTON-F)>

<OBJECT BL-BUTTON
    (LOC REMOTE-CONTROL)
    (DESC "bottom left button")
    (ADJECTIVE BOTTOM LEFT)
    (SYNONYM BUTTON)
    (FLAGS NDESCBIT)
    (ACTION REMOTE-BUTTON-F)>

<OBJECT BR-BUTTON
    (LOC REMOTE-CONTROL)
    (DESC "bottom right button")
    (ADJECTIVE BOTTOM RIGHT)
    (SYNONYM BUTTON)
    (FLAGS NDESCBIT)
    (ACTION REMOTE-BUTTON-F)>

<ROUTINE REMOTE-BUTTON-F ()
    <COND (<OR <VERB? SLAP PUSH>
               <AND <VERB? ATTACK>
                    <VERB-WORD? ,W?HIT>>>
           <OKAY>
           <REARRANGE-BUTTONS 
            <COND (<DOBJ? TL-BUTTON>  1)
                  (<DOBJ? TR-BUTTON>  2)
                  (<DOBJ? MI-BUTTON>  3)
                  (<DOBJ? BL-BUTTON>  4)
                  (ELSE               5)>>
           <RTRUE>)
          (<VERB? EXAMINE>
           <THE-J ,PRSO T T>
           <TELL " on the remote." CR>)
          (<VERB? TAKE>
           <PART-OF ,PRSO ,REMOTE-CONTROL>)>>

<ROUTINE REARRANGE-BUTTONS (BTN)
    <COND (<NOT <0? <GET ,ESCAPE-SET 3>>>
           %<DEBUG-CODE 
               <COND (<T? ,P-DBUG>
                      <HLIGHT ,H-BOLD>
                      <TELL "|[DEBUG: Changing code to ">)>>
           <DO (X 0 2)
               <PUT ,ESCAPE-SET .X <GET ,ESCAPE-SET <+ .X 1>>>
               %<DEBUG-CODE 
                   <COND (<T? ,P-DBUG>
                          <TELL N <GET ,ESCAPE-SET .X>>)>>>
           %<DEBUG-CODE
               <COND (<T? ,P-DBUG>
                      <TELL N .BTN "]|">
                      <HLIGHT ,H-NORMAL>)>>
           ;<PUT ,ESCAPE-SET 3 0>)>
    <PUT ,ESCAPE-SET 3 .BTN>
    <COND (<AND <GET ,ESCAPE-CODE 0>
                ;<EQUAL? ,ESCAPE-CODE ,ESCAPE-SET>
                <EQUAL? <GET ,ESCAPE-SET 0> <GET ,ESCAPE-CODE 0>>
                <EQUAL? <GET ,ESCAPE-SET 1> <GET ,ESCAPE-CODE 1>>
                <EQUAL? <GET ,ESCAPE-SET 2> <GET ,ESCAPE-CODE 2>>
                <EQUAL? <GET ,ESCAPE-SET 3> <GET ,ESCAPE-CODE 3>>>
           <CRLF>
           <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
                  <TELL "You are blinded as t">)
                 (ELSE
                  <TELL !\T>)>
           <TELL
"he escape pod suddenly bursts into life with a flourish of lights,
and starts beeping, quite like that teleporter in the " D ,PDW !\! CR>
           <FSET ,REMOTE-CONTROL ,RADPLUGBIT>)>>



<OBJECT LOUDSPEAKER
    (LOC STUNT-SHIP)
    (DESC "loudspeaker")
    (SYNONYM SPEAKER LOUDSPEAKER)
    (ADJECTIVE LOUD BROKEN)
    (FLAGS NDESCBIT)
    (ACTION LOUDSPEAKER-F)>

<ROUTINE LOUDSPEAKER-F ()
    <COND (<VERB? EXAMINE LISTEN SEARCH>
           <TELL "It's pretty broken right now." CR>
           <COND (<AND <FSET? ,MICROPHONE ,RADPLUGBIT>
                       <NOT <VERB? SEARCH>>>
                  <TELL "You hear a crackled voice over the microphone, saying \"">
                  <VOICE>)>
           <COND (<VERB? EXAMINE SEARCH>
                  <TELL "On one side is a plug, to attach to some other object">
                  <COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                         <TELL ". It's plugged into the radio">)>
                  <TELL ,PAUSES>)
                 (ELSE
                  <CRLF>)>)
          (<VERB? PLUG PUT-IN>
		   <COND ;(<EQUAL? ,PRSI ,RADIO>
		       	  ;<TELL "You can't do that." CR>
		       	  <RFALSE>)
		         (<IOBJ? PLANT>
		          <PERFORM ,V?PLUG ,LOUDSPEAKER ,RADIO>
                  <RTRUE>)
		         (ELSE
		          <RFALSE>)>)>>

<OBJECT MICROPHONE
	(LOC STUNT-SHIP)
	(DESC "microphone")
    (ADJECTIVE MICRO)
	(SYNONYM PHONE MICROPHONE)
	(FLAGS NDESCBIT)
    (GENERIC PHONE-G)
	(ACTION MICROPHONE-F)>

<ROUTINE MICROPHONE-F ()
    <COND (<VERB? EXAMINE>
           <TELL "An ordinary microphone, which you appear to be able to speak into." CR>)
          (<VERB? TELL>
           <PERFORM ,V-$CALL ,HALLWAY3 ,MICROPHONE>)>>


;"0 - Undefined.
  1 - Top left.
  2 - Top right.
  3 - Middle.
  4 - Bottom left.
  5 - Bottom right."
<GLOBAL ESCAPE-CODE
    <ITABLE 4 (BYTE) 0>>

<GLOBAL ESCAPE-SET
    <ITABLE 4 (BYTE) 0>>

<ROUTINE VOICE ("AUX" A Z)
    <COND (<0? <GET ,ESCAPE-CODE 0>>
           %<DEBUG-CODE
               <COND (<T? ,P-DBUG>
                      <HLIGHT ,H-BOLD>
                      <TELL "|[DEBUG: The code is ">)>>
           <DO (X 0 3)
               <PUT ,ESCAPE-CODE .X <RANDOM 5>>
               %<DEBUG-CODE
                   <COND (<T? ,P-DBUG>
                          <TELL N <GET ,ESCAPE-CODE .X>>)>>>
           %<DEBUG-CODE <COND (<T? ,P-DBUG><BOLDEN "]|">)>>)>
    <COND (<FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                      <TELL
<PICK-ONE <PLTABLE "Do you copy?" "I repeat:" "You hear?" "I repeat,">> !\ >)>
    <DO (Y 0 3)
        <SET A <GET ,ESCAPE-CODE .Y>>
        <COND (<OR <FSET? ,LOUDSPEAKER ,RADPLUGBIT>
                   <AND <NOT .Z>
                        <OR <PROB 20>
                            <EQUAL? .Y 3>>>>
               <SET Z T>
               <COND (<=? 1 .A>     <TELL "Top left">)
                     (<=? 2 .A>    <TELL "Top right">)
                     (<=? 3 .A>       <TELL "Middle">)
                     (<=? 4 .A>  <TELL "Bottom left">)
                     (ELSE      <TELL "Bottom right">)>
               <TELL !\, !\ >)
              (ELSE
               <TELL
<PICK-ONE <PLTABLE "Kkhrrrrss" "arrKkYYUUi" "Jhahsttts" "OIJOI" "Ggght" "Ea-ea">> !\. !\.>)>>
    <TELL "..\" And then it trails off." CR>>

<OBJECT ESCAPE-POD
    (LOC STUNT-SHIP)
    (DESC "escape pod")
    (SYNONYM POD TELEPORTE PLATFORM LANDING)
    (ADJECTIVE ESCAPE TELEPORTI TELEPORTA TELEPORT ;MATTER ;TRANSFERE MASSIVE)
    (GENERIC BEAM-G)
    (FLAGS CONTBIT OPENBIT TRANSBIT SURFACEBIT NDESCBIT VOWELBIT)
    (ACTION ESCAPE-POD-F)>

<ROUTINE ESCAPE-POD-F ()
    <COND (<VERB? BOARD THROUGH CLIMB-ON WALK-AROUND CLIMB-UP>
           <COND (<FSET? ,ESCAPE-POD ,SADRADIOBIT>
                  <TELL ,YOU-ARE CR>)
                 (ELSE
                  <TELL "You step on." CR>
                  <FSET ,ESCAPE-POD ,SADRADIOBIT>)>)>>