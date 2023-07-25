"MACROS for MILLIWAYS
Copyright (c) 1988 Infocom, Inc.  All rights reserved."

<DEFMAC PROB ('BASE?)
	<FORM NOT <FORM L? .BASE? '<RANDOM 100>>>>

<ADD-TELL-TOKENS
		a *		               <PRINTA .X>
		the *		           <PRINT-THE .X>
		The *		           <START-SENTENCE .X>
		CHE+VERB * *:STRING    <HE-SHE-IT .X 1 .Y>
		CHE *		           <HE-SHE-IT .X 1>
		HE+VERB * *:STRING     <HE-SHE-IT .X 0 .Y>
		HE *		           <HE-SHE-IT .X>
		verb * *:STRING	       <HE-SHE-IT .X -1 .Y>
		him *		           <HIM-HER-IT .X>
		HIS *		           <HIM-HER-IT .X 0 T>
		CHIS *		           <HIM-HER-IT .X 1 T>
        CTHAT *                <THAT-THEY .X 1>
        THAT *                 <THAT-THEY .X>
        CTHAT+VERB * *:STRING  <THAT-THEY .X 1 .Y>
        THAT+VERB * *:STRING   <THAT-THEY .X 0 .Y>>

<REPLACE-DEFINITION SEE-VERB?
<ROUTINE SEE-VERB? ()
	<VERB? ;ANALYZE ;SANALYZE CHASTISE ;COUNT EXAMINE FIND
	       ;INVENTORY LOOK LOOK-BEHIND LOOK-DOWN LOOK-INSIDE LOOK-ON
	       LOOK-OUTSIDE LOOK-THROUGH LOOK-UNDER LOOK-UP
	       READ SEARCH SEARCH-FOR SSEARCH-FOR>>>

<REPLACE-DEFINITION SPEAKING-VERB?
<ROUTINE SPEAKING-VERB? ("OPTIONAL" (PER 0))
 <COND (<VERB? ANSWER ASK ASK-ABOUT ASK-FOR ;FORGIVE
	       ;GOODBYE HELLO NO REPLY SORRY TELL TELL-ABOUT YES $CALL SAY>
	<COND (<EQUAL? .PER 0 ,PRSO>
	       <RTRUE>)>)
       (<VERB? ASK-CONTEXT-ABOUT ASK-CONTEXT-FOR TALK-ABOUT>
	<COND (<EQUAL? .PER 0>
	       <RTRUE>)>)>>>

;<ROUTINE TELL-FIND-NOT-HERE (PER NUM)
	       <COND (<NOT <EQUAL? .PER 0 ,PLAYER>>
		      <START-SENTENCE .PER>
		      <TELL " looks confused. ">)>
	       <TELL "\"I don't know wh">
	       <COND (<0? .NUM>
		      <TELL "at you mean by">
		      <NOT-HERE-PRINT>)
		     (T
		      <TELL "ich">
		      <NOT-HERE-PRINT>
		      <TELL " you mean">)>
	       <TELL "!\"" CR>>

<DEFMAC ONE? ('TERM)
	<FORM EQUAL? .TERM 1 T>>

<SETG CANT "You can't ">

<SETG C-ENABLED? 0>
<SETG C-ENABLED 1>
<SETG C-DISABLED 0>

<COND (<CHECK-VERSION? ZIP>
       <DEFMAC GET/B ('TBL 'PTR) <FORM GETB .TBL .PTR>>
       <DEFMAC PUT/B ('TBL 'PTR 'OBJ) <FORM PUTB .TBL .PTR .OBJ>>
       <DEFMAC ZMEMQ/B ('OBJ 'TBL "OPT" ('SIZ <>))
	       <COND (<NOT .SIZ>
		      <FORM ZMEMQB .OBJ .TBL>)
		     (T <FORM ZMEMQB .OBJ .TBL .SIZ>)>>
       <DEFMAC RMGL-SIZE ('TBL) <FORM - <FORM PTSIZE .TBL> 1>>)
      (T
       <DEFMAC GET/B ('TBL 'PTR) <FORM GET .TBL .PTR>>
       <DEFMAC PUT/B ('TBL 'PTR 'OBJ) <FORM PUT .TBL .PTR .OBJ>>
       <DEFMAC ZMEMQ/B ('OBJ 'TBL "OPT" ('SIZ <>))
	       <COND (<NOT .SIZ>
		      <FORM ZMEMQ .OBJ .TBL>)
		     (T <FORM ZMEMQ .OBJ .TBL .SIZ>)>>
       <DEFMAC RMGL-SIZE ('TBL) <FORM - <FORM / <FORM PTSIZE .TBL> 2> 1>>)>
