"SYNTAX for MILLIWAYS
Copyright (C) 1988 Infocom, Inc.  All rights reserved."



<SYNONYM WITH USING ;BY>
<SYNONYM THROUGH THRU>
<SYNONYM ON ONTO AGAINST>
<SYNONYM UNDER BELOW UNDERNEATH BENEATH>
<SYNONYM UNTIL TILL>
<SYNONYM TO TOWARD TOWARDS>
<SYNONYM AROUND ALONG>
;<SYNONYM BEFORE NEAR NEXT AGAINST>
<SYNONYM ALL BOTH EVERYTHING EVERYONE EVERY ANY>

<SYNONYM IN INSIDE INTO>
<SYNONYM OUT OUTSIDE>

<SYNONYM NORTH N FORE F FOREWARD FOREWARDS>
<SYNONYM SOUTH S AFT>
<SYNONYM EAST E STARBOARD SB>
<SYNONYM WEST W PORT P>
<SYNONYM DOWN D DOWNSTAIRS DOWNWARD DOWNWARDS>
<SYNONYM UP U UPSTAIRS UPWARD UPWARDS>
<SYNONYM NW NORTHWEST NORTH-WEST>
<SYNONYM NE NORTHEAST NORTH-EAST>
<SYNONYM SW SOUTHWEST SOUTH-WEST>
<SYNONYM SE SOUTHEAST SOUTH-EAST>

<SYNONYM DONT DON\'T>


<SYNONYM BIG GRAND MASSIVE ENORMOUS LARGE POWERFUL VAST WIDE TALL GREAT MIGHTY AWESOME>
<SYNONYM SMALL LITTLE TINY MINISCULE ;MINUSCULE INSIGNIFI ;BABY ;DIMINUITI ;MINIATURE>
<SYNONYM COOL INCREDIBL FROODY HOOPY>
<SYNONYM STRANGE ODD WEIRD CONFUSING CRAZY ;ODD-LOOKI>
<SYNONYM PASSAGE ;PASSAGEWA WAY ;EXIT TUNNEL DOORWAY PATH TRAIL>

<BUZZ DONT ;DON\'T NOW SOON ;WELL THERE PLEASE ;MAYBE BACK ANYWAY OH ;OF>

<SYNTAX $ID = V-$ID>
<SYNTAX $REFRESH = V-$REFRESH>

<SYNTAX $VERIFY = V-$VERIFY>
<SYNTAX $VERIFY OBJECT = V-$VERIFY>

%<DEBUG-CODE
[	;<SYNTAX $CHEAT OBJECT = V-$CHEAT>
	;<SYNTAX \#QUEUE = V-$QUEUE>
	;<SYNTAX \#RANDOM OBJECT = V-$RANDOM>
	<SYNTAX \#COMMAND = V-$COMMAND>
	<SYNTAX \#RECORD = V-$RECORD>
	<SYNTAX \#UNRECORD = V-$UNRECORD>]>

<SYNONYM ABOUT CREDITS NOTES NOTE>
<SYNTAX ABOUT = V-ABOUT>

;[<SYNTAX COLOR = V-COLOR>
<SYNTAX COLOR ON OBJECT (FIND ROOMSBIT) = V-COLOR PRE-COLOR-ON>
<SYNTAX COLOR OFF OBJECT (FIND ROOMSBIT) = V-COLOR PRE-COLOR-OFF>]

<SYNTAX ADDRESS OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM MANY) = V-TELL PRE-ASK>

<VERB-SYNONYM POINT AIM>
<SYNTAX POINT ;(AIM) OBJECT	AT OBJECT = V-AIM ;PRE-AIM>
<SYNTAX POINT OBJECT TO OBJECT = V-AIM ;PRE-AIM>
<SYNTAX POINT OBJECT OBJECT = V-AIM ;PRE-AIM>
<SYNTAX POINT AT OBJECT = V-SHOW>
<SYNTAX POINT AT OBJECT WITH OBJECT = V-SAIM PRE-SAIM>
<SYNTAX POINT TO OBJECT = V-SHOW>

<VERB-SYNONYM CHECK TEST ANALYSE ANALYZE>
<SYNTAX CHECK OBJECT = V-EXAMINE PRE-EXAMINE>
<SYNTAX CHECK OBJECT FOR OBJECT = V-EXAMINE PRE-EXAMINE>
<SYNTAX CHECK OUT OBJECT = V-EXAMINE PRE-EXAMINE>
<SYNTAX CHECK UNDER OBJECT = V-LOOK-UNDER PRE-LOOK-UNDER>
<SYNTAX CHECK OBJECT IN OBJECT = V-LOOK-UP>
<SYNTAX CHECK OBJECT ON OBJECT = V-SANALYZE PRE-SANALYZE>

<VERB-SYNONYM ANSWER REPLY RESPOND>
<SYNTAX ANSWER ;(REPLY RESPOND) = V-ANSWER>
<SYNTAX ANSWER OBJECT = V-REPLY>
<SYNTAX ANSWER TO OBJECT = V-REPLY>

<VERB-SYNONYM ASK QUERY QUESTION INQUIRE CONSULT>
<SYNTAX ASK ;(QUERY QUESTION INQUIRE CONSULT)
	OBJECT (FIND PERSONBIT) = V-ASK PRE-ASK>
<SYNTAX ASK ABOUT OBJECT (EVERYWHERE) = V-ASK-CONTEXT-ABOUT PRE-ASK-CONTEXT-ABOUT>
<SYNTAX ASK FOR OBJECT (EVERYWHERE) = V-ASK-CONTEXT-FOR PRE-ASK-CONTEXT-FOR>
<SYNTAX ASK OBJECT ABOUT OBJECT ;(MANY) (EVERYWHERE) = V-ASK-ABOUT PRE-ASK>
<SYNTAX ASK OBJECT FOR OBJECT (EVERYWHERE) = V-ASK-FOR PRE-ASK>
<SYNTAX ASK OBJECT ON OBJECT ;(MANY) (EVERYWHERE) = V-ASK-ABOUT PRE-ASK>

<VERB-SYNONYM ATTACK FIGHT HIT KICK DAMAGE HARM PUNCH REPEL ;KILL STAB WHACK>
<SYNTAX ATTACK OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNTAX ATTACK OFF OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNTAX ATTACK OBJECT (ON-GROUND IN-ROOM)
	WITH OBJECT ;(FIND WEAPONBIT) (HELD ;CARRIED HAVE TAKE)
	= V-ATTACK>

<SYNTAX BRIEF = V-BRIEF>

<SYNONYM WHERE WHERES WHERE\'S>
<SYNTAX WHERE OBJECT (EVERYWHERE) = V-WHERE>
<SYNTAX WHERE IS OBJECT (EVERYWHERE) = V-WHERE>
<SYNTAX WHERE AM OBJECT (EVERYWHERE) = V-WHERE>
<SYNTAX WHERE ARE OBJECT (EVERYWHERE MANY) = V-WHERE>

<SYNTAX WHO OBJECT (EVERYWHERE) = V-WHO>
<SYNTAX WHO IS OBJECT (EVERYWHERE) = V-WHO>
<SYNTAX WHO AM OBJECT (EVERYWHERE) ;(FIND PLAYERBIT) = V-WHO>
<SYNTAX WHO ARE OBJECT (EVERYWHERE MANY) = V-WHO>
<SYNONYM WHO WHOS WHO\'S>

<SYNTAX BUT WHY OBJECT (FIND ROOMSBIT) = V-WHY>
<SYNTAX BUT WHY\? OBJECT (FIND ROOMSBIT) = V-WHY>
<SYNTAX WHY = V-WHY>
<SYNTAX WHY NOT OBJECT (FIND ROOMSBIT) = V-WHY>
<SYNTAX WHY NOT\? OBJECT (FIND ROOMSBIT) = V-WHY>
<VERB-SYNONYM WHY WHY\?>

<SYNTAX BUT = V-NOT-WHAT>
<SYNONYM BUT EXCEPT THOUGH ALTHOUGH>

<SYNTAX WORD = V-NOT-WHAT>
<SYNONYM WORD VERB>

<SYNTAX WHAT = V-NOT-WHAT>
<VERB-SYNONYM WHAT WHAT\?>
<SYNTAX WHAT OBJECT (EVERYWHERE) = V-WHAT>
<SYNTAX WHAT ABOUT OBJECT (EVERYWHERE) = V-WHAT-ABOUT>
<SYNTAX WHAT IS OBJECT (EVERYWHERE) = V-WHAT>
<SYNTAX WHAT AM OBJECT (EVERYWHERE) = V-WHAT>
<SYNTAX WHAT ARE OBJECT (EVERYWHERE) = V-WHAT>
<SYNTAX WHAT OBJECT OBJECT = V-WHAT-TIME>
<SYNTAX WHAT OBJECT (EVERYWHERE) IS OBJECT = V-WHAT>
<SYNONYM WHAT WHATS WHAT\'S>

;<SYNTAX BRIBE OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (MANY HELD HAVE TAKE)
	= V-SGIVE PRE-SGIVE>

<VERB-SYNONYM CLEAN BRUSH WIPE WASH TIDY SCRAPE SCRATCH FRESHEN DRY CLEAR>
<SYNTAX CLEAN OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM MANY)
	= V-BRUSH PRE-BRUSH>
;<SYNTAX CLEAN IN OBJECT (ON-GROUND IN-ROOM) = V-BOARD>	"WASH IN OBJECT"
<SYNTAX CLEAN OBJECT
	OFF ;OF OBJECT (ON-GROUND IN-ROOM ;MANY)
	= V-BRUSH PRE-BRUSH>
<SYNTAX CLEAN OBJECT (ON-GROUND IN-ROOM MANY)
	WITH OBJECT (HELD CARRIED TAKE HAVE)
	= V-BRUSH PRE-BRUSH>
<SYNTAX CLEAN OFF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM MANY)
	= V-BRUSH PRE-BRUSH>
<SYNTAX CLEAN UP OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM MANY)
	= V-BRUSH PRE-BRUSH>

<SYNTAX ORDER OBJECT = V-BUY>
<SYNONYM ORDER BUY PURCHASE>

<VERB-SYNONYM CALL SUMMON RING PHONE>

<SYNTAX CALL OBJECT (EVERYWHERE) = V-$CALL ;PRE-ASK>
<SYNTAX CALL IN OBJECT (EVERYWHERE) = V-$CALL ;PRE-ASK>
<SYNTAX CALL FOR OBJECT (EVERYWHERE) = V-$CALL ;PRE-ASK>

<SYNTAX CALL OBJECT (EVERYWHERE) ON OBJECT = V-$CALL>
<SYNTAX CALL OBJECT (EVERYWHERE) IN OBJECT = V-$CALL>
<SYNTAX CALL OBJECT (EVERYWHERE) WITH OBJECT = V-$CALL>
<SYNTAX CALL FOR OBJECT (EVERYWHERE) IN OBJECT = V-$CALL>
<SYNTAX CALL FOR OBJECT (EVERYWHERE) ON OBJECT = V-$CALL>
<SYNTAX CALL FOR OBJECT (EVERYWHERE) WITH OBJECT = V-$CALL>

<SYNTAX CALL IN OBJECT FOR OBJECT (EVERYWHERE) = V-FOO PRE-SCALL>
<SYNTAX CALL ON OBJECT FOR OBJECT (EVERYWHERE) = V-FOO PRE-SCALL>
<SYNTAX CALL WITH OBJECT FOR OBJECT (EVERYWHERE) = V-FOO PRE-SCALL>


;"<SYNTAX CHANGE OBJECT (FIND ROOMSBIT) = V-CHANGE>
<SYNTAX CHANGE IN OBJECT (FIND WEARBIT) (HAVE TAKE) = V-WEAR>
<SYNTAX CHANGE FOR OBJECT (EVERYWHERE) = V-DRESS>
<SYNTAX CHANGE TO OBJECT (FIND WEARBIT) (HAVE TAKE) = V-WEAR>"

<VERB-SYNONYM CLIMB BOARD SCALE SCRAMBLE CRAWL>
<SYNTAX CLIMB OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-BOARD>
<SYNTAX CLIMB IN OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-BOARD>
<SYNTAX CLIMB OFF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX CLIMB ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB OUT OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-DISEMBARK>
<SYNTAX CLIMB OVER OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB THROUGH OBJECT = V-THROUGH PRE-THROUGH>
<SYNTAX CLIMB UP OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-CLIMB-UP>
<SYNTAX CLIMB DOWN OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-CLIMB-DOWN>
<SYNTAX CLIMB UNDER OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-CLIMB-DOWN>
<SYNTAX CLIMB OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM EVERYWHERE) WITH OBJECT = V-BOARD PRE-BOARDING>
<SYNTAX CLIMB ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) WITH OBJECT = V-CLIMB-ON PRE-BOARDING>

<VERB-SYNONYM CLOSE SHUT>
<SYNTAX CLOSE OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-CLOSE>
<SYNTAX CLOSE OFF OBJECT ;(FIND LIGHTBIT) (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	= V-LAMP-OFF>

<SYNTAX COUNT OBJECT = V-COUNT>

<SYNTAX COVER OBJECT WITH OBJECT (HELD MANY) = V-SPUT-ON PRE-SPUT-ON>

<SYNTAX WEAR OBJECT (FIND WEARBIT) (HAVE TAKE) = V-WEAR ;PRE-WEAR>
<VERB-SYNONYM WEAR DON>
<SYNTAX PUT ON OBJECT (FIND WEARBIT) (HAVE TAKE) = V-WEAR ;PRE-WEAR>

<VERB-SYNONYM DAMAGE DEMOLISH DESTROY BREAK SMASH CRUSH CRACK HURT WRECK>
<SYNTAX DAMAGE OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	= V-MUNG>
<SYNTAX DAMAGE UP OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	= V-MUNG>
<SYNTAX DAMAGE OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH OBJECT (HELD CARRIED HAVE TAKE)
	= V-MUNG>
<SYNTAX DAMAGE OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	DOWN ;WITH OBJECT (HELD CARRIED HAVE TAKE)
	= V-MUNG>
<SYNTAX DAMAGE DOWN OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH OBJECT (HELD CARRIED HAVE TAKE)
	= V-MUNG>

<SYNTAX DIAGNOSE OBJECT (FIND ROOMSBIT) = V-DIAGNOSE>

<SYNTAX DINE ON OBJECT (FIND ROOMSBIT)
	(HELD CARRIED ON-GROUND IN-ROOM HAVE TAKE ;MANY)
	= V-EAT PRE-EAT>

<SYNONYM DISEMBARK DEBARK>
<SYNTAX DISEMBARK OBJECT (EVERYWHERE) = V-DISEMBARK>
<SYNTAX DISEMBARK FROM OBJECT (EVERYWHERE) = V-DISEMBARK>

<SYNONYM DRAPE WRAP>
<SYNTAX DRAPE OBJECT IN OBJECT (HELD MANY) = V-SPUT-ON PRE-SPUT-ON>
<SYNTAX DRAPE OBJECT (HELD MANY) ON OBJECT = V-PUT PRE-PUT>
<SYNTAX DRAPE OBJECT (HELD MANY) AROUND OBJECT = V-PUT PRE-PUT>
<SYNTAX DRAPE OBJECT (HELD MANY) OVER OBJECT = V-PUT PRE-PUT>

<VERB-SYNONYM DRINK SWALLOW SIP GUZZLE>
<SYNTAX DRINK OBJECT ;(FIND DRINKBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-DRINK>
<SYNTAX DRINK FROM OBJECT (HELD CARRIED) = V-DRINK>

<SYNTAX DROP OBJECT (HELD MANY HAVE TAKE) = V-DROP PRE-PUT>
<SYNTAX DROP OBJECT (HELD ;CARRIED MANY HAVE TAKE) DOWN ;ON OBJECT
	= V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD ;CARRIED MANY HAVE TAKE) IN OBJECT (FIND CONTBIT)
	= V-PUT-IN PRE-PUT-IN>
<SYNTAX DROP OBJECT (HELD ;CARRIED MANY HAVE TAKE) ON OBJECT
	= V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD ;CARRIED MANY HAVE TAKE)
    THROUGH OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-THROUGH PRE-THROW-THROUGH>

<VERB-SYNONYM EAT ;TASTE ;LICK GOBBLE DEVOUR ;CONSUME>
<SYNTAX EAT OBJECT (FIND EATBIT) (HELD CARRIED ON-GROUND IN-ROOM HAVE TAKE)
	= V-EAT PRE-EAT>
<SYNTAX EAT FROM OBJECT (FIND EATBIT) (HELD CARRIED ON-GROUND IN-ROOM HAVE TAKE)
	= V-EAT PRE-EAT>

<VERB-SYNONYM TASTE LICK>
<SYNTAX TASTE OBJECT (FIND DARKBIT) = V-LICK>

<SYNONYM ENJOY ADMIRE>
<SYNTAX ENJOY OBJECT = V-ENJOY>

<SYNTAX ENTER OBJECT ;(FIND ROOMSBIT) (EVERYWHERE) = V-THROUGH PRE-THROUGH>

<VERB-SYNONYM EXAMINE X INSPECT DESCRIBE STUDY OBSERVE EXPLORE WATCH SEE>
<SYNTAX EXAMINE OBJECT ;(HELD CARRIED IN-ROOM ON-GROUND ;MANY) (FIND DARKBIT)
	= V-EXAMINE PRE-EXAMINE>
<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM TAKE) (FIND DARKBIT)
	THROUGH OBJECT (ON-GROUND IN-ROOM HELD CARRIED HAVE TAKE)
	= V-READ PRE-READ> 
<SYNTAX EXAMINE OBJECT ;(HELD CARRIED IN-ROOM ON-GROUND ;MANY) (FIND DARKBIT)
	WITH OBJECT (ON-GROUND IN-ROOM HELD CARRIED HAVE TAKE)
	= V-READ PRE-READ>
<SYNTAX EXAMINE UNDER OBJECT = V-LOOK-UNDER PRE-LOOK-UNDER>

<SYNTAX EXPLAIN OBJECT (EVERYWHERE) = V-TALK-ABOUT PRE-TALK-ABOUT>
<SYNTAX EXPLAIN OBJECT (EVERYWHERE) TO OBJECT = V-STELL-ABOUT PRE-STELL-ABOUT>
<SYNTAX EXPLAIN ABOUT OBJECT (EVERYWHERE) = V-TALK-ABOUT PRE-TALK-ABOUT>
<SYNTAX EXPLAIN TO OBJECT (IN-ROOM) ABOUT OBJECT (EVERYWHERE)
	= V-TELL-ABOUT PRE-TELL-ABOUT>

<VERB-SYNONYM SLEEP FAINT DOZE NAP SNOOZE>
<SYNTAX SLEEP = V-FAINT>
<SYNTAX SLEEP IN OBJECT (ON-GROUND IN-ROOM) = V-FAINT>
<SYNTAX SLEEP ON OBJECT (ON-GROUND IN-ROOM) = V-FAINT>

<SYNTAX FIDDLE WITH OBJECT (FIND DARKBIT) = V-RUB>

<VERB-SYNONYM FILL FLOOD>
<SYNTAX FILL OBJECT (FIND CONTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-FILL ;PRE-FILL>
<SYNTAX FILL OBJECT ;(FIND CONTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT = V-FILL ;PRE-FILL>

<VERB-SYNONYM FIND DETECT DISCOVER LOCATE SEEK>
<SYNTAX FIND OBJECT ;(MANY) (EVERYWHERE) = V-FIND PRE-FIND>
<SYNTAX FIND OBJECT IN OBJECT = V-SSEARCH-FOR PRE-SSEARCH-FOR>
<SYNTAX FIND OBJECT ON OBJECT = V-SSEARCH-FOR PRE-SSEARCH-FOR>
<SYNTAX FIND OUT OBJECT (EVERYWHERE) = V-ASK-CONTEXT-ABOUT PRE-ASK-CONTEXT-ABOUT>

<VERB-SYNONYM FIX REPAIR ADJUST UNJAM>
<SYNTAX FIX OBJECT = V-FIX>
<SYNTAX FIX OBJECT WITH OBJECT ;(FIND TOOLBIT) = V-FIX>

<VERB-SYNONYM FOLLOW PURSUE CHASE STALK ;TRACE>
<SYNTAX FOLLOW OBJECT (FIND PERSONBIT) (EVERYWHERE) = V-FOLLOW>
<SYNTAX FOLLOW OBJECT (FIND PERSONBIT) (EVERYWHERE) OBJECT = V-FOLLOW>    "Follow me north."
<SYNTAX FOLLOW OBJECT (FIND PERSONBIT) (EVERYWHERE) TO OBJECT (EVERYWHERE) = V-FOLLOW> "F. me to office."

<SYNTAX FOOTNOTE = V-FOOTNOTE>
<SYNTAX FOOTNOTE OBJECT = V-FOOTNOTE>

<SYNTAX GET OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY)
	= V-TAKE PRE-TAKE>
<SYNTAX GET OBJECT (IN-ROOM CARRIED MANY) FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX GET OBJECT (IN-ROOM CARRIED MANY) IN OBJECT = V-TAKE PRE-TAKE>
<SYNTAX GET OBJECT (CARRIED IN-ROOM MANY) OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX GET OBJECT (CARRIED IN-ROOM MANY) OUT ;OF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX GET OBJECT ;(FIND TAKEBIT) (MANY TAKE) TO OBJECT (EVERYWHERE) = V-TAKE-TO>
<SYNTAX GET IN OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD>
<SYNTAX GET OFF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX GET ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX GET OUT ;OF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-DISEMBARK>
<SYNTAX GET RID ;OF OBJECT = V-DROP PRE-PUT>
<SYNTAX GET UP OBJECT (FIND ROOMSBIT) = V-STAND>

<VERB-SYNONYM HAND GIVE SELL OFFER PASS FEED ;" DONATE ASSIGN">
;<SYNTAX FEED OBJECT (FIND PERSONBIT) = V-FEED>
<SYNTAX HAND OBJECT (MANY HELD HAVE) TO OBJECT (FIND PERSONBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<SYNTAX HAND OBJECT ;(FIND PERSONBIT) (ON-GROUND)
	OBJECT (MANY HELD HAVE)
	= V-SGIVE PRE-SGIVE>
<SYNTAX HAND OUT OBJECT (FIND ROOMSBIT) = V-FAINT>
<SYNTAX HAND UP OBJECT (FIND ROOMSBIT) = V-QUIT>

<SYNONYM HANG HOOK LASSO>
<SYNTAX HANG ;UP OBJECT (HELD ;CARRIED MANY HAVE TAKE) IN OBJECT (FIND CONTBIT)
	= V-PUT-IN PRE-PUT-IN>
<SYNTAX HANG ;UP OBJECT (HELD ;CARRIED ;MANY HAVE TAKE) ON OBJECT
	= V-PUT PRE-PUT>
<SYNTAX HANG OBJECT WITH OBJECT (HELD ;CARRIED ;MANY HAVE TAKE)
	= V-SPUT-ON PRE-SPUT-ON>

<VERB-SYNONYM HELLO HI GREET GREETINGS HOWDY HEY>
<SYNTAX HELLO OBJECT (FIND ROOMSBIT) = V-HELLO PRE-HELLO>
<SYNTAX SAY HELLO ;TO OBJECT (FIND ROOMSBIT) = V-HELLO PRE-HELLO>

<VERB-SYNONYM HELP HINT HINTS CLUE CLUES VISICLUES INVISICLUES>
<SYNTAX HELP = V-HELP>
<SYNTAX HELP OBJECT (FIND PERSONBIT) = V-HELP>

<SYNTAX HELP OFF OBJECT (FIND ROOMSBIT) = V-HINTS-NO>
<SYNTAX NO HELP OBJECT (FIND ROOMSBIT) = V-HINTS-NO>

<SYNTAX HELP ON OBJECT (FIND ROOMSBIT) = V-HINTS-ON>

<VERB-SYNONYM HIDE CONCEAL ;CROUCH>
<SYNTAX HIDE = V-HIDE>
<SYNTAX HIDE BEHIND OBJECT = V-HIDE>
<SYNTAX HIDE IN OBJECT (EVERYWHERE) = V-THROUGH PRE-THROUGH>
<SYNTAX HIDE ON OBJECT = V-THROUGH PRE-THROUGH>
<SYNTAX HIDE UNDER OBJECT = V-HIDE>
<SYNTAX HIDE OBJECT (HELD ;CARRIED MANY HAVE TAKE) UNDER OBJECT
	= V-PUT-UNDER>
<SYNTAX HIDE OBJECT (HELD ;CARRIED MANY HAVE TAKE) IN OBJECT (FIND CONTBIT)
	= V-PUT-IN PRE-PUT-IN>

;<SYNONYM HITCHH HITCH>
;<SYNTAX HITCHH = V-HITCHHIKE>

<SYNTAX HOLD OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY)
	= V-TAKE PRE-TAKE>
<SYNTAX HOLD OBJECT (IN-ROOM CARRIED TAKE HAVE) TO OBJECT = V-HOLD-UP>
<SYNTAX HOLD OBJECT (IN-ROOM CARRIED TAKE HAVE) UP ;TO OBJECT = V-HOLD-UP>
<SYNTAX HOLD UP OBJECT (IN-ROOM CARRIED TAKE HAVE) = V-HOLD-UP>

<VERB-SYNONYM I INVENTORY INV>
<SYNTAX I = V-INVENTORY>

<VERB-SYNONYM JUMP LEAP DIVE DANCE REACH>
<SYNTAX JUMP = V-LEAP>
<SYNTAX JUMP ACROSS OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP FROM OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX JUMP IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD ;V-LEAP>
<SYNTAX JUMP ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD ;V-LEAP>
<SYNTAX JUMP FOR OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD>
<SYNTAX JUMP OUT ;OF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-DISEMBARK>
<SYNTAX JUMP OFF OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX JUMP OVER OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP THROUGH OBJECT = V-THROUGH PRE-THROUGH>
<SYNTAX JUMP FOR OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) WITH OBJECT = V-BOARD PRE-BOARDING>
<SYNTAX JUMP ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) WITH OBJECT = V-BOARD PRE-BOARDING>
<SYNTAX JUMP UP OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-CLIMB-UP>
<SYNTAX JUMP DOWN OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM EVERYWHERE) = V-CLIMB-DOWN>

<VERB-SYNONYM MURDER WASTE OBLITERATE ANNIHALATE DESTROY KILL ;STRANGLE>
<SYNTAX MURDER OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-KILL>
<SYNTAX MURDER OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE ;TAKE)
	= V-KILL>

<SYNTAX SCRIPT = V-SCRIPT>
<SYNTAX SCRIPT ON OBJECT (FIND ROOMSBIT) = V-SCRIPT>
<SYNTAX SCRIPT OFF OBJECT (FIND ROOMSBIT) = V-UNSCRIPT>
<VERB-SYNONYM SCRIPT TRANSCRIPT>
<SYNTAX UNSCRIPT = V-UNSCRIPT>
<VERB-SYNONYM UNSCRIPT NOSCRIPT>

<VERB-SYNONYM CONSOLE KISS HUG COMFORT FLIRT LOVE SNOG SMOOCH>
<SYNTAX CONSOLE OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-KISS>
<SYNTAX CONSOLE WITH OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-KISS>

<VERB-SYNONYM KNOCK RAP BANG>
<SYNTAX KNOCK ON OBJECT = V-KNOCK>
<SYNTAX KNOCK AT OBJECT = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNTAX KNOCK OFF OBJECT (FIND PERSONBIT) (IN-ROOM ON-GROUND) = V-PUSH>
<SYNTAX KNOCK OUT OBJECT (FIND PERSONBIT) (IN-ROOM ON-GROUND) = V-SLAP>
<SYNTAX KNOCK OBJECT (IN-ROOM ON-GROUND MANY) OFF ;OF OBJECT (FIND ROOMSBIT)
	= V-PUSH>
<SYNTAX KNOCK OBJECT ;(FIND PERSONBIT) (IN-ROOM ON-GROUND) ON OBJECT = V-SLAP>

<VERB-SYNONYM LEAVE EXIT DEPART WITHDRAW ESCAPE>
<SYNTAX LEAVE = V-LEAVE>
<SYNTAX LEAVE OBJECT (EVERYWHERE) = V-LEAVE>
<SYNTAX LEAVE FROM OBJECT (EVERYWHERE) = V-LEAVE>

<SYNTAX LET GO ;OF OBJECT (;HELD MANY HAVE ;TAKE) = V-DROP PRE-PUT>

<SYNONYM LIE COLLAPSE FALL>
<SYNTAX LIE DOWN ;ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-LIE PRE-LIE>
<SYNTAX LIE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-LIE PRE-LIE>
<SYNTAX LIE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-LIE PRE-LIE>

<SYNTAX LIGHT OBJECT ;(FIND LIGHTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LAMP-ON>

<VERB-SYNONYM LISTEN HEAR EAVESDROP>
<SYNTAX LISTEN    OBJECT (FIND DARKBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-LISTEN PRE-LISTEN>
<SYNTAX LISTEN TO OBJECT (FIND DARKBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-LISTEN PRE-LISTEN>
<SYNTAX LISTEN ON OBJECT (FIND DARKBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-LISTEN PRE-LISTEN>

<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) = V-LOCK>
<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (TAKE) = V-LOCK>

<VERB-SYNONYM LOOK PEEP L STARE GAZE PEEK PEER ;SEE ;REACH>
<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK OBJECT = V-CHASTISE>
<SYNTAX LOOK AROUND OBJECT (FIND ROOMSBIT) = V-LOOK>
<SYNTAX LOOK AT OBJECT (FIND DARKBIT) = V-EXAMINE PRE-EXAMINE>
<SYNTAX LOOK BEHIND OBJECT = V-LOOK-BEHIND>
<SYNTAX LOOK DOWN OBJECT (FIND ROOMSBIT) = V-LOOK-DOWN>
<SYNTAX LOOK FOR OBJECT (EVERYWHERE) = V-FIND PRE-FIND>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM) (FIND ROOMSBIT)
	= V-LOOK-INSIDE PRE-LOOK-INSIDE>
<SYNTAX LOOK-INSIDE OBJECT (HELD CARRIED ON-GROUND IN-ROOM) (FIND ROOMSBIT)
	= V-LOOK-INSIDE PRE-LOOK-INSIDE>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM) FOR OBJECT (EVERYWHERE)
	= V-SEARCH-FOR PRE-SEARCH-FOR>
<SYNTAX LOOK ON OBJECT (ON-GROUND IN-ROOM) = V-LOOK-ON>
<SYNTAX LOOK OUT OBJECT (FIND ROOMSBIT) = V-LOOK-OUTSIDE>
<SYNTAX LOOK OVER OBJECT ;(HELD CARRIED ON-GROUND IN-ROOM) (FIND DARKBIT)
	= V-EXAMINE PRE-EXAMINE>
<SYNTAX LOOK THROUGH OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LOOK-THROUGH>
<SYNTAX LOOK UNDER OBJECT = V-LOOK-UNDER PRE-LOOK-UNDER>
<SYNTAX LOOK UP OBJECT (FIND ROOMSBIT) (EVERYWHERE) = V-LOOK-UP>
<SYNTAX LOOK UP OBJECT (EVERYWHERE) IN OBJECT = V-LOOK-UP>

;"<SYNONYM NAME NAME\'S NAMES>
<SYNTAX MY OBJECT IS OBJECT (EVERYWHERE) = V-MY-NAME>
<VERB-SYNONYM I I\'M IM>
<SYNTAX I AM OBJECT (EVERYWHERE) = V-MY-NAME>"

<SYNONYM NO NOPE NAH INCORRECT MEH NOT NAHH NEGATIVE>
<SYNTAX NO = V-NO>
<SYNTAX NO WAY OBJECT (FIND ROOMSBIT) = V-NO>
<SYNTAX NO THANKS OBJECT (FIND ROOMSBIT) = V-NO>

<SYNTAX NOD OBJECT (FIND ROOMSBIT) = V-NOD>
<SYNTAX NOD AT OBJECT = V-HELLO PRE-HELLO>
<SYNTAX NOD TO OBJECT = V-HELLO PRE-HELLO>

<SYNONYM MRKUG MRIUG MRIVG>
<SYNTAX MRKUG = V-MRKUG>

<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN>
<SYNTAX OPEN UP OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN>
<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT ;(FIND TOOLBIT) (ON-GROUND IN-ROOM HELD CARRIED HAVE TAKE)
	= V-OPEN>

<SYNTAX PANIC = V-PANIC>

<SYNTAX PAY FOR OBJECT = V-BUY>


<VERB-SYNONYM POUR SPILL SPRINKLE SPLASH EMPTY>
<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) WITH OBJECT (HELD CARRIED HAVE TAKE) = V-POUR PRE-POUR-WITH>
;<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) FROM OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) IN OBJECT (FIND CONTBIT) = V-PUT-IN PRE-PUT-IN>
<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) ON OBJECT (FIND SURFACEBIT) = V-PUT PRE-PUT>
<SYNTAX POUR OBJECT (HELD CARRIED HAVE TAKE) OVER OBJECT (FIND SURFACEBIT) = V-PUT PRE-PUT>

<VERB-SYNONYM PULL TUG MOVE YANK DRAG>
<SYNTAX PULL OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-MOVE>
<SYNTAX PULL OBJECT (ON-GROUND IN-ROOM) OBJECT = V-MOVE-DIR PRE-MOVE-DIR>
<SYNTAX PULL OBJECT ;(FIND TAKEBIT) (CARRIED IN-ROOM MANY)
	OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX PULL OBJECT WITH OBJECT (HELD CARRIED HAVE TAKE) = V-REMOVE>
<SYNTAX PULL OBJECT TO OBJECT = V-AIM>
<SYNTAX PULL ON OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-MOVE>
<SYNTAX PULL TOGETHER OBJECT = V-PULL-TOGETHER> ;"pull myself together"

<SYNTAX TEAR OBJECT (HELD CARRIED HAVE TAKE) = V-PULL-APART PRE-APART>
<SYNTAX TEAR APART OBJECT (HELD CARRIED HAVE TAKE) = V-PULL-APART PRE-APART>
<SYNTAX TEAR OBJECT (HELD CARRIED HAVE TAKE) APART OBJECT (FIND ROOMSBIT) = V-PULL-APART PRE-APART>
;<SYNTAX TEAR OBJECT IN HALF OBJECT (FIND ROOMSBIT) = V-PULL-APART PRE-APART>
<VERB-SYNONYM TEAR PULL TWIST RIP DECOUPLE>

<VERB-SYNONYM PUSH PRESS SHOVE POKE>
<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) = V-PUSH>
<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) OBJECT = V-MOVE-DIR PRE-MOVE-DIR>
<SYNTAX PUSH OBJECT (HELD CARRIED MANY HAVE TAKE) IN OBJECT (FIND CONTBIT)
	= V-PUT-IN PRE-PUT-IN>
<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND MANY) OFF ;OF OBJECT (FIND ROOMSBIT)
	= V-PUSH>
<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND MANY) TO OBJECT
	= V-MOVE-DIR PRE-MOVE-DIR>
<SYNTAX PUSH OBJECT (HELD CARRIED MANY HAVE TAKE) UNDER OBJECT = V-PUT-UNDER>
<SYNTAX PUSH ON OBJECT (IN-ROOM ON-GROUND) = V-PUSH>

<VERB-SYNONYM PLACE PUT STUFF LAY INSERT SET FLASH SWIPE ;(SWIPE CARD AGAINST PANEL) ;" INSTALL DEPOSIT DIP">
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) ON OBJECT (FIND SURFACEBIT)
	= V-PUT PRE-PUT>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) ACROSS OBJECT = V-PUT PRE-PUT>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) AROUND OBJECT = V-PUT PRE-PUT>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) DOWN ;ON OBJECT = V-PUT PRE-PUT>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) IN OBJECT (FIND CONTBIT) = V-PUT-IN PRE-PUT-IN>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) OVER OBJECT = V-PUT PRE-PUT>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) THROUGH OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-THROUGH PRE-THROW-THROUGH>
<SYNTAX PLACE OBJECT (HELD MANY HAVE TAKE) UNDER OBJECT = V-PUT-UNDER>
<SYNTAX PLACE AWAY OBJECT (HELD MANY HAVE TAKE) IN OBJECT (FIND CONTBIT) = V-PUT-IN PRE-PUT-IN>
<SYNTAX PLACE DOWN OBJECT (HELD MANY HAVE) = V-DROP PRE-PUT>

<VERB-SYNONYM PLAY FIDDLE TOY> ;"Fiddle with, actually..."
<SYNTAX PLAY OBJECT (HAVE TAKE HELD CARRIED) = V-PLAY>
<SYNTAX PLAY WITH OBJECT (HAVE TAKE HELD CARRIED) = V-PLAY>
<SYNTAX PLAY OBJECT (HAVE TAKE HELD CARRIED) WITH OBJECT (FIND PERSONBIT) = V-PLAY>

<SYNTAX PLUG OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE)
    IN OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE) = V-PLUG PRE-PLUG>
<SYNTAX PLUG OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE)
    TO OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE) = V-PLUG PRE-PLUG>
<SYNTAX PLUG IN OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE)
    TO OBJECT (FIND CANPLUGBIT) ;(HELD HAVE TAKE) = V-PLUG PRE-PLUG>
<VERB-SYNONYM PLUG CONNECT ATTACH INSERT>

<SYNTAX UNPLUG OBJECT = V-UNPLUG ;PRE-UNPLUG>
<SYNTAX UNPLUG OBJECT FROM OBJECT (FIND RADPLUGBIT) = V-UNPLUG ;PRE-UNPLUG>
<VERB-SYNONYM UNPLUG DISCONNECT ;REMOVE DETACH>

<VERB-SYNONYM QUIT Q LOGOUT LOGOFF RAGEQUIT>
<SYNTAX QUIT = V-QUIT>

<SYNTAX QWERTY = V-COMPUTER-WHAT>
<VERB-SYNONYM QWERTY ZXCVBNM ZXCVB CVBNM ASDF ASDFGHJKL QWERTYUIOP XYZZY PLUGH PLOVER ODYSSEUS ULYSSES ECHO>

<VERB-SYNONYM READ SKIM ;PERUSE>
<SYNTAX READ OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	= V-READ PRE-READ>
<SYNTAX READ OBJECT ;(FIND PERSONBIT)
	OBJECT (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	= V-SREAD PRE-SREAD> 
<SYNTAX READ OBJECT (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	TO OBJECT ;(FIND PERSONBIT)
	= V-READ PRE-READ> 
<SYNTAX READ ABOUT OBJECT
	IN OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM TAKE HAVE)
	= V-LOOK-UP>

<SYNTAX REFUSE OBJECT (IN-ROOM) = V-REFUSE>

<VERB-SYNONYM RELAX MEDITATE REST ZEN CHILL>
<SYNTAX RELAX = V-RELAX>

<VERB-SYNONYM REMOVE DOFF UNWEAR>
<SYNTAX REMOVE OBJECT (FIND WORNBIT) = V-REMOVE>
<SYNTAX REMOVE OBJECT WITH OBJECT (HELD CARRIED HAVE TAKE) = V-REMOVE>
<SYNTAX REMOVE OBJECT (IN-ROOM CARRIED MANY) FROM OBJECT = V-TAKE PRE-TAKE>

<SYNTAX REQUEST OBJECT (EVERYWHERE) = V-ASK-CONTEXT-FOR PRE-ASK-CONTEXT-FOR>

<SYNTAX RESTART = V-RESTART>

<VERB-SYNONYM RESTORE ;CONTINUE RESUME>
<SYNTAX RESTORE = V-RESTORE>

<VERB-SYNONYM RING ;PEAL BLOW BLAST HONK TOOT BEEP>
<SYNTAX RING OBJECT = V-RING>
<SYNTAX RING ON OBJECT = V-RING>
<SYNTAX RING OBJECT (HELD CARRIED HAVE TAKE) AT OBJECT
	= V-SSHOOT PRE-SSHOOT>	"BLOW BLOWGUN AT person"
<SYNTAX RING OBJECT WITH OBJECT = V-RING>

<VERB-SYNONYM RUB TOUCH FEEL STROKE SQUEEZE>
<SYNTAX RUB OBJECT (FIND DARKBIT) = V-RUB>
<SYNTAX RUB OBJECT (FIND DARKBIT) WITH OBJECT (TAKE HAVE) = V-RUB>
<SYNTAX RUB OBJECT (HELD HAVE TAKE) IN OBJECT (FIND CONTBIT) = V-PUT-IN PRE-PUT-IN>

<SYNTAX SAVE = V-SAVE>
<SYNTAX SAVE OBJECT (EVERYWHERE) ;(FIND PERSONBIT) = V-HELP>

<VERB-SYNONYM SAY TALK SPEAK WHISPER STATE CHAT GAB CONVERSE ;TELL ;CONSULT>

<SYNTAX TELL OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM MANY) = V-TELL PRE-ASK>
<SYNTAX TELL OBJECT (IN-ROOM) OBJECT (EVERYWHERE) = V-TELL-ABOUT PRE-TELL-ABOUT>
<SYNTAX TELL OBJECT (IN-ROOM) ABOUT OBJECT ;(MANY) (EVERYWHERE)
	= V-TELL-ABOUT PRE-TELL-ABOUT>
<SYNTAX TELL ABOUT OBJECT ;(MANY) (EVERYWHERE) = V-TALK-ABOUT PRE-TALK-ABOUT>

<SYNTAX SAY OBJECT (EVERYWHERE) TO OBJECT (FIND PERSONBIT) (IN-ROOM) = V-SAY>
<SYNTAX SAY OBJECT (EVERYWHERE) = V-SAY>
<SYNTAX SAY ABOUT OBJECT (EVERYWHERE) = V-TALK-ABOUT PRE-TALK-ABOUT>
<SYNTAX SAY IN OBJECT (ON-GROUND IN-ROOM MANY) = V-TELL PRE-ASK>
<SYNTAX SAY TO OBJECT (ON-GROUND IN-ROOM MANY) = V-TELL PRE-ASK>
<SYNTAX SAY TO OBJECT (IN-ROOM) ABOUT OBJECT (EVERYWHERE)
	= V-TELL-ABOUT PRE-TELL-ABOUT>
<SYNTAX SAY WITH OBJECT (ON-GROUND IN-ROOM MANY) = V-TELL PRE-ASK>
<SYNTAX SAY WITH OBJECT (IN-ROOM) ABOUT OBJECT (EVERYWHERE)
	= V-ASK-ABOUT PRE-ASK>

<SYNONYM NOTIFY NOTIFICAT WARNING ALARM>
<SYNTAX NOTIFY = V-NOTIFY>

<SYNONYM SCORE POINT POINTS LEVEL STAT STATS>
<SYNTAX SCORE = V-SCORE>

<SYNTAX SCRIPT = V-SCRIPT>

<VERB-SYNONYM SEARCH DIG RUMMAGE FRISK SHUFFLE RIFFLE>
<SYNTAX SEARCH OBJECT = V-SEARCH PRE-SEARCH>
<SYNTAX SEARCH OBJECT FOR OBJECT (EVERYWHERE)
	= V-SEARCH-FOR PRE-SEARCH-FOR>
<SYNTAX SEARCH THROUGH OBJECT FOR OBJECT (EVERYWHERE)
	= V-SEARCH-FOR PRE-SEARCH-FOR>
<SYNTAX SEARCH FOR OBJECT (EVERYWHERE) = V-FIND PRE-FIND>
<SYNTAX SEARCH IN OBJECT = V-SEARCH PRE-SEARCH>
<SYNTAX SEARCH UNDER OBJECT = V-LOOK-UNDER PRE-LOOK-UNDER>
<SYNTAX SEARCH UP OBJECT = V-SEARCH PRE-SEARCH>
<SYNTAX SEARCH THROUGH OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
    = V-LOOK-THROUGH>

<VERB-SYNONYM SHAKE RATTLE>
<SYNTAX SHAKE OBJECT = V-SHAKE>
<SYNTAX SHAKE OBJECT WITH OBJECT (FIND PERSONBIT) = V-SHAKE> ;"SHAKE HANDS"

<VERB-SYNONYM FIRE SHOOT SPRAY SPAM ZAP STUN>
;<SYNTAX FIRE OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	= V-SHOOT>
<SYNTAX FIRE OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	WITH OBJECT	(FIND WEAPONBIT)	(HELD CARRIED HAVE ;TAKE)
	= V-SHOOT>
<SYNTAX FIRE AT OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	WITH OBJECT	(FIND WEAPONBIT)	(HELD CARRIED HAVE ;TAKE)
	= V-SHOOT>
<SYNTAX FIRE OBJECT	(FIND WEAPONBIT)	(HELD CARRIED HAVE ;TAKE)
	AT OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	= V-SSHOOT PRE-SSHOOT>
;<SYNTAX FIRE AT OBJECT	(FIND WEAPONBIT)	(HELD CARRIED HAVE ;TAKE)
	AT OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	= V-SSHOOT PRE-SSHOOT>
<SYNTAX FIRE OBJECT	(FIND WEAPONBIT)	(HELD CARRIED HAVE ;TAKE)
	ON OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	= V-SSHOOT PRE-SSHOOT>
;<SYNTAX FIRE AT OBJECT	;(FIND PERSONBIT)	(ON-GROUND IN-ROOM)
	= V-SHOOT>

<VERB-SYNONYM SHOW DISPLAY>
<SYNTAX SHOW OBJECT = V-SHOW>
<SYNTAX SHOW OBJECT (HELD MANY HAVE) TO OBJECT ;(FIND PERSONBIT) = V-SHOW>
<SYNTAX SHARE OBJECT = V-SHOW>
<SYNTAX SHARE OBJECT WITH OBJECT = V-SHOW>
<SYNTAX SHOW OBJECT ;(FIND PERSONBIT) OBJECT (HELD MANY HAVE)
	= V-SSHOW PRE-SSHOW>

<VERB-SYNONYM SIT CROUCH SQUAT ;" HUNKER STOOP">
<SYNTAX SIT ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-SIT PRE-SIT>
<SYNTAX SIT AT OBJECT (ON-GROUND IN-ROOM) = V-SIT-AT>
<SYNTAX SIT BESIDE OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-SIT-AT>
<SYNTAX SIT DOWN ;ON OBJECT (FIND ROOMSBIT) (ON-GROUND IN-ROOM) = V-SIT PRE-SIT>
<SYNTAX SIT IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-SIT PRE-SIT>

<VERB-SYNONYM PUNCH SLAP HIT KICK WHACK HURT INJURE STRIKE ;BITE BEAT>
<SYNTAX PUNCH OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM) = V-SLAP>
<SYNTAX PUNCH OBJECT (ON-GROUND IN-ROOM) AROUND OBJECT (FIND ROOMSBIT)= V-SLAP>
<SYNTAX PUNCH OBJECT (ON-GROUND IN-ROOM)
	WITH OBJECT (HELD CARRIED ON-GROUND IN-ROOM HAVE TAKE) = V-SLAP>

<SYNONYM SLIDE FIT FIX>
<SYNTAX SLIDE OBJECT = V-PUSH>
<SYNTAX SLIDE OBJECT (HELD MANY HAVE TAKE) UNDER OBJECT
	= V-PUT-UNDER>
<SYNTAX SLIDE OBJECT (HELD MANY HAVE TAKE) IN OBJECT (FIND CONTBIT)
	= V-PUT-IN PRE-PUT-IN>

<VERB-SYNONYM SMELL SNIFF WHIFF>
<SYNTAX SMELL OBJECT (FIND DARKBIT) = V-SMELL>

<VERB-SYNONYM SMILE GRIN WINK BEAM LAUGH>
<SYNTAX SMILE = V-SMILE>
<SYNTAX SMILE AT OBJECT (FIND PERSONBIT) = V-SMILE>

<VERB-SYNONYM SORRY APOLOGIZE>
<SYNTAX SORRY OBJECT (FIND ROOMSBIT) = V-SORRY PRE-HELLO>
<SYNTAX SAY SORRY ;TO OBJECT (FIND ROOMSBIT) = V-SORRY PRE-HELLO>
<SYNTAX SORRY TO OBJECT (FIND ROOMSBIT) = V-SORRY PRE-HELLO>

<SYNTAX SOUND OBJECT = V-RING>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX STAND ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX STAND UP OBJECT (FIND ROOMSBIT) = V-STAND>

<VERB-SYNONYM START ACTIVATE>
<SYNTAX START OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-LAMP-ON>
<SYNTAX START OVER OBJECT (FIND ROOMSBIT) = V-RESTART>

<VERB-SYNONYM PARK STOP>
<SYNTAX PARK OBJECT (FIND ROOMSBIT) = V-STOP>

<SYNTAX SUPERBRIEF = V-SUPER-BRIEF>

<VERB-SYNONYM SWIM WADE BATHE>
<SYNTAX SWIM IN OBJECT = V-SWIM>
<SYNTAX SWIM OBJECT = V-WALK>

<VERB-SYNONYM TAKE CARRY STEAL SEIZE GRAB ;CONFISCATE PRY RAISE LIFT PICK PLUCK>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY)
	= V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) IN OBJECT = V-TAKE PRE-TAKE>
;<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) OFF OBJECT (FIND ROOMSBIT) = V-TAKE PRE-DOFF ;PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) ON OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) OUT ;OF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (IN-ROOM CARRIED TAKE HAVE) UP ;TO OBJECT = V-HOLD-UP>
<SYNTAX TAKE OFF OBJECT (FIND WORNBIT) ;(HAVE) = V-TAKE-OFF>
<SYNTAX TAKE OUT OBJECT (CARRIED IN-ROOM MANY) = V-TAKE PRE-TAKE>
<SYNTAX TAKE UP OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY)
	= V-TAKE PRE-TAKE>

<VERB-SYNONYM THANK THANKS>
<SYNTAX THANK = V-THANK>
<SYNTAX THANK OBJECT = V-THANK>

[
<VERB-SYNONYM THROW HURL TOSS CHUCK FLING>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE) = V-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	AT OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM)
	= V-THROW-AT>
<SYNTAX THROW AWAY OBJECT (HELD CARRIED HAVE) = V-DROP PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	AGAINST OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-AT>
<SYNTAX THROW OBJECT (HELD MANY HAVE TAKE) IN OBJECT (FIND CONTBIT) = V-PUT-IN PRE-PUT-IN>
<SYNTAX THROW OBJECT (HELD MANY HAVE TAKE)
	ON OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	OPEN OBJECT (FIND ROOMSBIT) = V-OPEN>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	OUT ;OF OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-THROUGH PRE-THROW-THROUGH>
<SYNTAX THROW OBJECT (HELD ;CARRIED MANY HAVE TAKE)
	OVER OBJECT (ON-GROUND IN-ROOM)
	= V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	THROUGH OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-THROUGH PRE-THROW-THROUGH>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	TO OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM)
	= V-THROW-AT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	OBJECT (FIND PERSONBIT) (ON-GROUND IN-ROOM)
	= V-THROW-AT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE TAKE)
	UP OBJECT (FIND ROOMSBIT)
	= V-THROW-AT>
<SYNTAX THROW IN OBJECT (EVERYWHERE) = V-THROW-IN-TOWEL>
]

;<SYNTAX TRY ON OBJECT (FIND WEARBIT) (HAVE TAKE) = V-WEAR>

<VERB-SYNONYM SWITCH TURN FLIP FLICK TOGGLE SET ROTATE SCREW ;SWING>
<SYNTAX SWITCH OBJECT = V-TURN>
<SYNTAX SWITCH AROUND OBJECT (FIND ROOMSBIT) = V-TURN>
<SYNTAX SWITCH OFF OBJECT ;(FIND LIGHTBIT) ;(TAKE) = V-LAMP-OFF>
<SYNTAX SWITCH ON OBJECT ;(FIND LIGHTBIT) = V-LAMP-ON>
<SYNTAX SWITCH OBJECT ;(FIND LIGHTBIT) ;(TAKE) OFF OBJECT (FIND ROOMSBIT) = V-LAMP-OFF>
<SYNTAX SWITCH OBJECT ;(FIND LIGHTBIT) ON OBJECT (FIND ROOMSBIT) = V-LAMP-ON>
<SYNTAX SWITCH OBJECT TO OBJECT = V-AIM ;PRE-AIM>

<SYNTAX UNDO = V-UNDO>

<SYNONYM UNLOCK UNJAM>
<SYNTAX UNLOCK OBJECT (ON-GROUND IN-ROOM) = V-UNLOCK>
<SYNTAX UNLOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (HAVE) = V-UNLOCK>

<SYNTAX UNSCRIPT = V-UNSCRIPT>

<SYNTAX USE OBJECT = V-USE>
<SYNTAX USE OBJECT AGAINST OBJECT = V-USE>
<SYNTAX USE OBJECT ON OBJECT = V-USE>
<SYNTAX USE OBJECT WITH OBJECT = V-USE>

<SYNONYM CHANGE ADJUST TWEAK>
<SYNTAX CHANGE OBJECT = V-CHANGE>
<SYNTAX CHANGE OBJECT ON OBJECT = V-CHANGE>
<SYNTAX CHANGE OBJECT TO OBJECT = V-AIM>

<SYNTAX VERBOSE = V-VERBOSE>

<VERB-SYNONYM RELEASE REVISION VERSION ;EDITION VARIATION>
<SYNTAX RELEASE = V-VERSION>
;"<SYNTAX RELEASE OBJECT = V-UNTIE>"

<VERB-SYNONYM WAIT Z STAY PAUSE>
<SYNTAX WAIT OBJECT (FIND ROOMSBIT) = V-WAIT-FOR>
<SYNTAX WAIT FOR OBJECT ;(FIND ROOMSBIT) (EVERYWHERE) = V-WAIT-FOR>
<SYNTAX WAIT UNTIL OBJECT = V-WAIT-UNTIL>

<VERB-SYNONYM WAKE AWAKE ROUSE SURPRISE STARTLE>
<SYNTAX WAKE OBJECT (FIND ROOMSBIT ;PERSONBIT) (ON-GROUND IN-ROOM) = V-ALARM>
<SYNTAX WAKE UP OBJECT (FIND ROOMSBIT ;PERSONBIT) (ON-GROUND IN-ROOM)
	= V-ALARM>

<SYNONYM WRITE SCRIBBLE DOODLE NOTE RECORD COMPOSE INSCRIBE SIGN>
<SYNTAX WRITE OBJECT (EVERYWHERE) = V-WRITE-WHAT>
<SYNTAX WRITE IN OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE OBJECT (EVERYWHERE) IN OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE ABOUT OBJECT (EVERYWHERE) IN OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE WITH OBJECT (HELD CARRIED HAVE TAKE) IN OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE IN OBJECT (FIND READBIT) WITH OBJECT (HELD CARRIED HAVE TAKE) = V-SWRITE PRE-SWRITE-WHAT>
<SYNTAX WRITE ON OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE OBJECT (EVERYWHERE) ON OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE ABOUT OBJECT (EVERYWHERE) ON OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE WITH OBJECT (HELD CARRIED HAVE TAKE) ON OBJECT (FIND READBIT) = V-WRITE-WHAT>
<SYNTAX WRITE ON OBJECT (FIND READBIT) WITH OBJECT (HELD CARRIED HAVE TAKE) = V-SWRITE PRE-SWRITE-WHAT>
<SYNTAX WRITE OBJECT (EVERYWHERE) WITH OBJECT (HELD CARRIED HAVE TAKE) = V-WRITE>

<VERB-SYNONYM HEAD WALK GO COME RUN PROCEED STEER DRIVE RETURN STEP APPROACH>
<SYNTAX HEAD OBJECT = V-WALK>
<SYNTAX HEAD AFTER OBJECT (EVERYWHERE) = V-FOLLOW>
<SYNTAX HEAD AROUND OBJECT = V-WALK-AROUND>
<SYNTAX HEAD AWAY OBJECT (FIND ROOMSBIT) (EVERYWHERE) = V-LEAVE>
<SYNTAX HEAD BEHIND OBJECT = V-THROUGH PRE-THROUGH>
<SYNTAX HEAD DOWN OBJECT (EVERYWHERE) = V-CLIMB-DOWN>
<SYNTAX HEAD IN OBJECT (EVERYWHERE) = V-THROUGH PRE-THROUGH>
<SYNTAX HEAD OFF OBJECT (EVERYWHERE) = V-WALK-TO>
<SYNTAX HEAD ON OBJECT = V-WALK-AROUND>
<SYNTAX HEAD OUT OBJECT (EVERYWHERE) = V-LEAVE>
<SYNTAX HEAD OVER OBJECT = V-LEAP>
<SYNTAX HEAD THROUGH OBJECT (EVERYWHERE) = V-THROUGH PRE-THROUGH>
<SYNTAX HEAD TO OBJECT (EVERYWHERE) = V-WALK-TO>
<SYNTAX HEAD UP OBJECT (EVERYWHERE) = V-CLIMB-UP>
<SYNTAX HEAD WITH OBJECT (EVERYWHERE) = V-FOLLOW>
<SYNTAX HEAD OBJECT OVER OBJECT = V-RUN-OVER>
<SYNTAX HEAD OBJECT THROUGH OBJECT (EVERYWHERE) = V-THROUGH PRE-THROUGH>

<VERB-SYNONYM YELL SCREAM SHOUT HOWL BELLOW SING CHEER>
<SYNTAX YELL = V-YELL>
<SYNTAX YELL AT OBJECT (ON-GROUND IN-ROOM EVERYWHERE MANY) = V-TELL PRE-ASK>
<SYNTAX YELL IN OBJECT = V-YELL>
<SYNTAX YELL TO OBJECT (ON-GROUND IN-ROOM EVERYWHERE MANY) = V-TELL PRE-ASK>
<SYNTAX YELL OBJECT (EVERYWHERE) = V-SAY>

<SYNONYM YES Y OK OKAY SURE YUP YEP YEAH AYE INDEED CORRECT
              K KK ALRIGHT COURSE FINE YA YAH YES-OBJECT POSITIVE>
<SYNTAX YES = V-YES>
<SYNTAX OF COURSE OBJECT (FIND ROOMSBIT) = V-YES>

<SYNTAX SHUSH = V-SHUSH>
<SYNTAX BE QUIET OBJECT (FIND ROOMSBIT) = V-SHUSH>
<SYNTAX STOP TALKING OBJECT (FIND ROOMSBIT) = V-SHUSH>
<SYNTAX SHUT UP OBJECT (FIND ROOMSBIT) = V-SHUSH>
<SYNONYM SHUSH QUIET>
<SYNTAX HEAD = V-WALK-AROUND>