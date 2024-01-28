"COMPILE/LOAD FILE for MILLIWAYS
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<SETG ZDEBUGGING? <>>
<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,ZDEBUGGING? .X) (ELSE .Y)>>

<SETG NEW-PARSER? T>
<SETG EXTRA-FLAGS '(SADRADIOBIT RADPLUGBIT BADRADIOBIT DARKBIT CAPTAINBIT BODYPARTBIT ;PLAYERBIT)>
;"The 3 RAD-BITs are the generic 'differing from thing to thing' here. DARKBIT is only for the Dark."
;" 
   ALL USES OF RAD-BITs:

 - The Morpher Captain uses BADRADIOBIT to show if he has to move room or not this turn
 - The Bathroom of the Ship uses it to see if you are describing the captain or not
 - The access card uses it to see if you've got the points yet
 - The frobs use RADPLUGBIT to prove when you've shown them to Slarty
 - And others..."



<FREQUENT-WORDS?>
<LONG-WORDS?>
;<NEVER-ZAP-TO-SOURCE-DIRECTORY?>
<ZIP-OPTIONS MOUSE UNDO ;DISPLAY>
<VERSION ;8 XZIP>
<CONSTANT RELEASEID 301>
<CONSTANT ZORKID 302>

<IFFLAG (IN-ZILCH
	 <PRINC "Compiling">)
	(T <PRINC "Loading">)>

<PRINC " MILLIWAYS
    the Restaurant at the End of the Universe!
    An interactive fiction by Max Fog

">

ON!-INITIAL	"for ZIL debugging"
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<SET REDEFINE T>


<ROUTINE GO ()
	<COLOR 9 12>
    <CLEAR -1>
	<START-QUEUES>
	<INIT-STATUS-LINE>
	<V-VERSION>
	<INTRO>
	<MAIN-LOOP>
	<V-LOOK>
	<AGAIN>>


<INSERT-FILE "DEFS">

<XFLOAD "parser.h2">

<INSERT-FILE "MACROS">
<INSERT-FILE "MISC">
<INSERT-FILE "SYNTAX">
<INSERT-FILE "VERBS">

<INSERT-FILE "MAGRATHEA">   
<INSERT-FILE "DARK">        
<INSERT-FILE "MILLIWAYS">   ;"You're at the end of the universe!"										 
<INSERT-FILE "PRESENT">     ;"Back to your time."														 
<INSERT-FILE "EARTH">       ;"Going further back..."													 
<INSERT-FILE "PAST">        ;"Until you reach 2 million years behind your own time, and then to the Big Bang!"

;<INSERT-FILE "SOFT">

<INSERT-FILE "PEOPLE">
<INSERT-FILE "HINTS">
<INSERT-FILE "GLOBAL">
;<INSERT-FILE "PRARE">

<PROPDEF SIZE 5>
<PROPDEF UP <>>
<PROPDEF DOWN <>>
