"MISC for MILLIWAYS
Copyright (c) 1988 Infocom, Inc.  All rights reserved."

<GLOBAL SCORE:NUMBER 0>
<GLOBAL MOVES:NUMBER 0>
<GLOBAL HERE:OBJECT RAMP>
<GLOBAL OHERE:OBJECT <>>

<GLOBAL SCREENWIDTH:NUMBER 0>

<ROUTINE START-QUEUES ()
	;<QUEUE RESET-WINNER -1>
	<QUEUE I-CFSW -1>
	;<CHOOSE-PASSAGES>
	<QUEUE I-RADIO -1>
	;<THIS-IS-IT <>>
	<QUEUE I-MARVIN -1>>

<ROUTINE INTRO ()
	;<TELL "[LEN=" N <LOWCORE SCRV> " WID=" N ,SCREENWIDTH "]">
	<CRLF><CRLF>
	<V-LOOK>
	<CRLF>>

<ROUTINE PRINT-THE (OBJ)	;"the"
	<COND (<AND <EQUAL? .OBJ ,TURN> <L? 1 ,P-NUMBER>>
	       <TELL !\  N ,P-NUMBER " turns">)
	      (<EQUAL? .OBJ ,WINDOW>
	       <TELL "the window">)
	      ;(<AND <EQUAL? .OBJ ,P-IT-OBJECT>
		    <FSET? ,IT ,TOUCHBIT>>
	       <TELL " it">
	       <RTRUE>)
	      (T
	       <THE? .OBJ>
	       <D-J .OBJ>)>>

<ROUTINE THE? (OBJ)
	<COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
	       <COND (<OR ;<NOT <FSET? .OBJ ,PERSONBIT>>
			  <IN? .OBJ ,ROOMS>
			  <FSET? .OBJ ,SEENBIT>
			  ;<EQUAL? .OBJ ,SKY ,CEILING ,WALLS ,ONRAMP ,FLOOR>>
		      <TELL "the ">)
		     (<FSET? .OBJ ,VOWELBIT>
		      <TELL "an ">)
		     (T <TELL "a ">)>)>
	<COND (T ;<FSET? .OBJ ,PERSONBIT>
	       <FSET .OBJ ,SEENBIT>)>>

<ROUTINE START-SENTENCE (OBJ)	;"The"
	;<THIS-IS-IT .OBJ>
	<COND (<EQUAL? .OBJ ,PLAYER> <TELL "You">		 <RTRUE>)
	      (<EQUAL? .OBJ ,HANDS>	 <TELL "Your hand">	 <RTRUE>)
	      (<EQUAL? .OBJ ,HEAD>	 <TELL "Your head">	 <RTRUE>)
	      (<EQUAL? .OBJ ,EYES>	 <TELL "Your eyes">	 <RTRUE>)
	      (<EQUAL? .OBJ ,TEETH>	 <TELL "Your teeth"> <RTRUE>)
	      (<EQUAL? .OBJ ,EARS>	 <TELL "Your ears">	 <RTRUE>)>
	<COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
	       <COND (<OR ;<NOT <FSET? .OBJ ,PERSONBIT>>
			  <FSET? .OBJ ,SEENBIT>>
		      <TELL "The ">)
		     (<FSET? .OBJ ,VOWELBIT>
		      <TELL "An ">)
		     (T <TELL "A ">)>)>
	<FSET .OBJ ,SEENBIT>
	;"<TELL D" <D-J .OBJ>>

<ROUTINE PRINTA (O)	;"a"
	 <COND (<OR ;<FSET? .O ,PERSONBIT> <FSET? .O ,NARTICLEBIT>> T)
	       (<FSET? .O ,VOWELBIT> <TELL "an ">)
	       (T <TELL "a ">)>
	 ;"<TELL D" <D-J .O>>

;<GLOBAL QCONTEXT:OBJECT FORD>
<GLOBAL LIT:OBJECT <>>
;<GLOBAL P-IT-WORDS <TABLE <VOC DRESSING ADJ> <VOC GOWN NOUN>>>
<GLOBAL P-IT-OBJECT:OBJECT <>>
;<GLOBAL P-HER-OBJECT:OBJECT TRILLIAN>
;<GLOBAL P-HIM-OBJECT:OBJECT FORD>
;<GLOBAL P-ONE-NOUN <VOC "FROB">>

<ROUTINE THIS-IS-IT (OBJ)
 <COND (<EQUAL? .OBJ <> ,NOT-HERE-OBJECT ,PLAYER>
	<RTRUE>)
       (<EQUAL? .OBJ ,INTDIR ,GLOBAL-HERE ,ROOMS>
	<RTRUE>)
       (<AND <DIR-VERB?> <==? .OBJ ,PRSO>>
	<RTRUE>)>
 <COND (<OR <NOT <FSET? .OBJ ,PERSONBIT>>
            <EQUAL? .OBJ ,BLUR>>
	;<PUT ,P-IT-WORDS 0 <GET ,P-ADJW ,NOW-PRSI>>
	;<PUT ,P-IT-WORDS 1 <GET ,P-NAMW ,NOW-PRSI>>
	<FSET ,IT ,TOUCHBIT>	;"to cause pronoun 'it' in output"
	<SETG P-IT-OBJECT .OBJ>)
       (<FSET? .OBJ ,FEMALEBIT>
	<FSET ,HER ,TOUCHBIT>
	<SETG P-HER-OBJECT .OBJ>)
       (<FSET? .OBJ ,PLURALBIT>
	<FSET ,THEM ,TOUCHBIT>
	<SETG P-THEM-OBJECT .OBJ>)
       (T
	<FSET ,HIM ,TOUCHBIT>
	<SETG P-HIM-OBJECT .OBJ>)>
 <RTRUE>>

<ROUTINE NO-PRONOUN? (OBJ "OPTIONAL" (CAP <>))
	<COND (<EQUAL? .OBJ ,PLAYER>
	       <RFALSE>)
          ;(<NOT <FSET? .OBJ ,PERSONBIT>>
	       <COND (<AND <EQUAL? .OBJ ,P-IT-OBJECT>
			   <FSET? ,IT ,TOUCHBIT>>
		      <RFALSE>)>)
	      (<EQUAL? .OBJ ,FIRST-CLASS-IDIOT ,BLUR>)
          ;(<FSET? .OBJ ,FEMALEBIT>
	       <COND (<AND <EQUAL? .OBJ ,P-HER-OBJECT>
			   <FSET? ,HER ,TOUCHBIT>>
		      <RFALSE>)>)
	      ;(<FSET? .OBJ ,PLURALBIT>
	       <COND (<AND <EQUAL? .OBJ ,P-THEM-OBJECT>
			   <FSET? ,THEM ,TOUCHBIT>>
		      <RFALSE>)>)
	      (T
	       ;<THIS-IS-IT .OBJ>
           <RFALSE>
           ;<COND (<AND <EQUAL? .OBJ ,P-HIM-OBJECT>
			   <FSET? ,HIM ,TOUCHBIT>>
		      <RFALSE>)>)>
	<COND (<NOT .CAP>
           <TELL !\ >)>
    <THE-J .OBJ T .CAP>
	;<THIS-IS-IT .OBJ>
	<RTRUE>>

<ROUTINE HE-SHE-IT (OBJ "OPTIONAL" (CAP 0) (VERB <>))	;"He/he/+verb"
	<COND (<AND <NOT <EQUAL? .CAP -1>>
                <NO-PRONOUN? .OBJ .CAP>>
	       T)
	      (<NOT <FSET? .OBJ ,PERSONBIT>>
	       <COND (<ZERO? .CAP> <TELL "it">)
		     (<ONE? .CAP> <TELL "It">)>)
	      (<==? .OBJ ,PLAYER>
	       <COND (<ZERO? .CAP> <TELL "you">)
		     (<ONE? .CAP> <TELL "You">)>)
	      (<FSET? .OBJ ,FEMALEBIT>
	       <COND (<ZERO? .CAP> <TELL "she">)
		     (<ONE? .CAP> <TELL "She">)>)
	      (<FSET? .OBJ ,PLURALBIT>
	       <COND (<ZERO? .CAP> <TELL "they">)
		     (<ONE? .CAP> <TELL "They">)>)
	      (T
	       <COND (<ZERO? .CAP> <TELL "he">)
		     (<ONE? .CAP> <TELL "He">)>)>
	<COND (<NOT <ZERO? .VERB>>
	       <PRINTC 32>
	       <COND (<OR <EQUAL? .OBJ ,PLAYER>
			  ;<FSET? .OBJ ,PLURALBIT>>
		      <COND (<=? .VERB "is"> <TELL "are">)
			    (<=? .VERB "has"><TELL "have">)
			    (<=? .VERB "tri"><TELL "try">)
			    (<=? .VERB "empti"><TELL "empty">)
                (<=? .VERB "fli"><TELL "fly">)
			    (T <TELL .VERB>)>)
		     (T
		      <TELL .VERB>
		      <COND (<OR <EQUAL? .VERB "do" "kiss" "push">
				 <EQUAL? .VERB "tri" "empti">>
			     <TELL !\e>)>
		      <COND (<NOT <EQUAL? .VERB "is" "has">>
			     <TELL !\s>)>)>)>>

<ROUTINE HIM-HER-IT (OBJ "OPTIONAL" (CAP 0) (POSSESS? <>))	;"His/his/him"
 <COND (<EQUAL? .OBJ ,PLAYER>
    <COND (<NOT <ZERO? .CAP>> <TELL "You">) (T <TELL " you">)>
    <COND (<NOT <ZERO? .POSSESS?>> <TELL !\r>)>)
       (<NO-PRONOUN? .OBJ .CAP>
	<COND (<NOT <ZERO? .POSSESS?>> <TELL "'s">)>)
       (<NOT <FSET? .OBJ ,PERSONBIT>>
	<COND (<ZERO? .CAP> <TELL " it">) (T <TELL "It">)>
	<COND (<NOT <ZERO? .POSSESS?>> <TELL !\s>)>)
       (<FSET? .OBJ ,PLURALBIT>
	<COND (<NOT <ZERO? .POSSESS?>>
	       <COND (<ZERO? .CAP> <TELL " their">)
		     (T <TELL "Their">)>)
	      (T
	       <COND (<ZERO? .CAP> <TELL " them">)
		     (T <TELL "Them">)>)>)
       (<FSET? .OBJ ,FEMALEBIT>
	<COND (<ZERO? .CAP> <TELL " her">) (T <TELL "Her">)>)
       (T
	<COND (<NOT <ZERO? .POSSESS?>>
	       <COND (<ZERO? .CAP> <TELL " his">)
		     (T <TELL "His">)>)
	      (T
	       <COND (<ZERO? .CAP> <TELL " him">)
		     (T <TELL "Him">)>)>)>
 <RTRUE>>

<ROUTINE THAT-THEY (OBJ "OPT" (CAP? 0) (VER:STRING <>) (LOOK-DOWN <>))
    <COND (<NO-PRONOUN? .OBJ .CAP?>)
          (<FSET? .OBJ ,PLURALBIT>
           <COND (.CAP?
                  <TELL !\T>)
                 (ELSE
                  <TELL !\  !\t>)>
           <TELL "he">
           <COND (.CAP?
                  <TELL "y">)
                 (T
                  <TELL "m">)>)
          (<FSET? .OBJ ,PERSONBIT>
           <COND (<ONE? .CAP?> <HE-SHE-IT .OBJ .CAP?>)
                 (ELSE  <HIM-HER-IT .OBJ>)>)
          (ELSE
           <COND (.CAP?
                  <TELL !\T>)
                 (ELSE
                  <TELL !\  !\t>)>
           <TELL "hat">)>
    <COND (.VER
           ;<TELL !\ >
           <HE-SHE-IT .OBJ -1 .VER>)>>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;SHE HER MADAM MISS HERSELF)
	(DESC "her")
	(FLAGS NARTICLEBIT)>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;HE HIM SIR HIMSELF)
	(DESC "him")
	(FLAGS NARTICLEBIT)>

<OBJECT THEM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM THEM THEMSELVES)
	(DESC "them")
	(FLAGS NARTICLEBIT)>

<CONSTANT P-PROMPT-START 4>
<GLOBAL P-PROMPT:NUMBER 4>

<ROUTINE I-PROMPT ("OPTIONAL" (GARG <>))
     %<DEBUG-CODE <COND (<EQUAL? .GARG ,G-DEBUG> <RFALSE>)>>
     <SETG P-PROMPT <- ,P-PROMPT 1>>
     <RFALSE>>

<ROUTINE DONT-F ()
	 <COND (<VERB? PANIC>
		    <COND (<1? <RANDOM 2>>
		           <TELL 
"Very clever. It looks as if there's a lot you should be panicking about." CR>)
		          (T
		           <TELL
"Why not? Your position appears quite hopeless." CR>)>)
	       (<AND <IN? ,PLAYER ,STUNT-SHIP>
                 <VERB? LOOK-INSIDE LOOK-THROUGH LOOK-OUTSIDE EXAMINE>>
            <TELL
"All right! All right! It's right there! The sun is enormous! I get it! Don't panic!" CR>)
	       (<VERB? ;WAIT WAIT-FOR WAIT-UNTIL>
		    <TELL "Time doesn't pass..." CR>)
	       (<VERB? TAKE>
		    <TELL "Not taken." CR>)
	       (T
		    <TELL "Not done." CR>)>>

<ROUTINE NOT-FOUND (OBJ "AUX" (WT <>))
	<COND (<FSET? .OBJ ,CAPTAINBIT>
		   <TELL ,NOPE "see that here." CR>
		   <RTRUE>)
          (ELSE
           <RTRUE>)>
	<COND (<VERB? WALK-TO>
	       <SET WT T>)>
	<COND (<ZERO? .WT>
	       <SETG CLOCK-WAIT T>
	       <TELL "[Y">)
	      (T <TELL "But y">)>
	<TELL "ou haven't found" him .OBJ " yet!">
	<COND (<ZERO? .WT>
	       <PRINT "]">)>
	<CRLF>
	<RTRUE>>

<ROUTINE VERB-PRINT ("OPTIONAL" (GERUND <>) "AUX" TMP)
	<SET TMP <PARSE-VERB ,PARSE-RESULT>>
	<COND (<==? .TMP 0>
	       <COND (<ZERO? .GERUND> <TELL "tell"> <RTRUE>)
		     (T <TELL "walk">)>)
	      (<OR <T? .GERUND> ;<0? <GETB ,P-VTBL 2>>>
	       <SET TMP <GET .TMP 0>>
	       <COND (<==? .TMP ,W?L> <PRINTB ,W?LOOK>)
		     (<==? .TMP ,W?X> <PRINTB ,W?EXAMINE>)
		     (<==? .TMP ,W?Z> <PRINTB ,W?WAIT>)
		     (<T? .GERUND>
		      <COND (<==? .TMP ,W?BATHE> <TELL "bath">)
			    (<==? .TMP ,W?DIG> <TELL "digg">)
			    (<==? .TMP ,W?GET> <TELL "gett">)
			    (T <PRINTB .TMP>)>)
		     (T <PRINTB .TMP>)>)
	      (T
	       <WORD-PRINT .TMP>
	       ;<PUTB ,P-VTBL 2 0>)>
	<COND (<T? .GERUND> <TELL "ing?">)>>

<ROUTINE VERB-WORD? (AR1 "OPT" AR2 AR3 AR4 "AUX" VAL)
    <SET VAL <WORD-VERB-STUFF ,P-PRSA-WORD>>
    <COND (<EQUAL? .VAL .AR1 .AR2 .AR3 .AR4>
           <RTRUE>)>
    <RFALSE>>

<ROUTINE NOT-IT (WHO)
 <COND (<EQUAL? .WHO ,P-HER-OBJECT>
	<FCLEAR ,HER ,TOUCHBIT>)
       (<EQUAL? .WHO ,P-HIM-OBJECT>
	<FCLEAR ,HIM ,TOUCHBIT>)
       (<EQUAL? .WHO ,P-THEM-OBJECT>
	<FCLEAR ,THEM ,TOUCHBIT>)
       (<EQUAL? .WHO ,P-IT-OBJECT>
	<FCLEAR ,IT  ,TOUCHBIT>)>>

<REPLACE-DEFINITION CAPITAL-NOUN?
 <ROUTINE CAPITAL-NOUN? (WRD)
    <OR <TITLE-NOUN? .WRD>
	    <EQUAL? .WRD ,W?FORD ,W?ZAPHOD ,W?BEEBLEBROX>
	    <EQUAL? .WRD ,W?TRILLIAN ,W?TRICIA ,W?MCMILLAN>
	    <EQUAL? .WRD ,W?MARV ,W?MARVIN ,W?PREFECT>
        <EQUAL? .WRD ,W?SLART ,W?SLARTY ,W?SLARTIBAR>
        <EQUAL? .WRD ,W?EARTH ,W?KAKRAFOON ,W?CLYDE>
        <EQUAL? .WRD ,W?FLOYD ,W?CLYDE\'S ,W?CLYDE>
        <EQUAL? .WRD ,W?LIFE ,W?UNIVERSE ,W?EVERYTHING>>>>

<ROUTINE TITLE-NOUN? (WRD)
    <OR ;<EQUAL? .WRD ,W?MR ,W?MS>
	<EQUAL? .WRD ;,W?MISTER ;,W?MISS ,W?SIR>
	;<EQUAL? .WRD ,W?MRS ,W?DR ,W?DOCTOR>>>


<ROUTINE REPLACE-ADJ? (OBJ OLD NEW "AUX" TBL LEN)
	 <SET TBL <GETPT .OBJ ,P?ADJECTIVE>>
	 <COND (<ZERO? .TBL>
		<RFALSE>)>
	 <SET LEN </ <PTSIZE .TBL> 2>>
	 <DO (NUM 0 .LEN) ;"REPEAT ()"
	    <COND (<DLESS? LEN 0>
		   <RFALSE>)
		  (<EQUAL? <GET .TBL .LEN> .OLD>
		   <PUT .TBL .LEN .NEW>
		   <RTRUE>)>>>

<ROUTINE REPLACE-NOUN? (OBJ OLD NEW "AUX" TBL LEN)
	 <SET TBL <GETPT .OBJ ,P?SYNONYM>>
	 <COND (<ZERO? .TBL>
		<RFALSE>)>
	 <SET LEN </ <PTSIZE .TBL> 2>>
	 <DO (NUM 0 .LEN) ;"REPEAT ()"
	    <COND (<DLESS? LEN 0>
		   <RFALSE>)
		  (<EQUAL? <GET .TBL .LEN> .OLD>
		   <PUT .TBL .LEN .NEW>
		   <RTRUE>)>>>

"CLOCK routines
    by Max Fog (using the new parser)"

<GLOBAL CLOCKER-RUNNING:NUMBER 0>

<CONSTANT C-TABLELEN 138>	;"and one for good measure"

<GLOBAL C-TABLE
 <TABLE 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 0 I-REPLY
	1 1 I-PROMPT	;"last to run">>

<GLOBAL CLOCK-WAIT <>>

<GLOBAL C-INTS 60> ;"2x largest number of concurrent of interrupts"

<GLOBAL C-MAXINTS 60> ;"2x largest number of concurrent of interrupts"

<GLOBAL CLOCK-HAND <>>

<CONSTANT C-TABLELEN 60>
<CONSTANT C-INTLEN 4>	;"length of an interrupt entry"
<CONSTANT C-RTN 0>	;"offset of routine name"
<CONSTANT C-TICK 1>	;"offset of count"

<ROUTINE CLOCKER ("AUX" E TICK RTN (FLG <>) (Q? <>) OWINNER)
	 <COND (,CLOCK-WAIT
		    <SETG CLOCK-WAIT <>>
		    <RFALSE>)
	       ;(,TIME-STOPPED           ;"If you have, say, a spell that does this."
		    ;"don't run interrupts, but do increment moves"
		    <SETG MOVES <+ ,MOVES 1>>
		    <RFALSE>)>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET OWINNER ,WINNER>
	 <SETG WINNER ,PLAYER>
	 <REPEAT ()
	  <COND (<EQUAL? ,CLOCK-HAND .E>
	         ;<SETG CLOCK-HAND .E>
	         <SETG MOVES <+ ,MOVES 1>>
	         <SETG WINNER .OWINNER>
	         <RETURN .FLG>)
	        (<NOT <ZERO? <GET ,CLOCK-HAND ,C-RTN>>>
	         <SET TICK <GET ,CLOCK-HAND ,C-TICK>>
	         <COND (<L? .TICK -1>
	                <PUT ,CLOCK-HAND ,C-TICK <- -3 .TICK>>
	                <SET Q? ,CLOCK-HAND>)
	               (<NOT <ZERO? .TICK>>
	                <COND (<G? .TICK 0>
	                       <SET TICK <- .TICK 1>>
	                       <PUT ,CLOCK-HAND ,C-TICK .TICK>)>
	                <COND (<NOT <ZERO? .TICK>>
	                       <SET Q? ,CLOCK-HAND>)>
	                <COND (<NOT <G? .TICK 0>>
	                       <SET RTN
	                            <IFFLAG (IN-ZILCH
	                                     <GET ,CLOCK-HAND ,C-RTN>)
	                                    (T
	                                     <NTH ,CLOCK-HAND
	                                          <+ <* ,C-RTN 2> 1>>)>>
	                       <COND (<ZERO? .TICK>
	                              <PUT ,CLOCK-HAND ,C-RTN 0>)>
	                       <COND (<APPLY .RTN>
	                              <SET FLG T>)>
	                       <COND (<NOT <OR .Q?
	                                       <ZERO?
                                            <GET ,CLOCK-HAND
	                                             ,C-RTN>>>>
	                              <SET Q? T>)>)>)>)>
	  <SETG CLOCK-HAND <REST ,CLOCK-HAND ,C-INTLEN>>
	  <COND (<NOT .Q?>
	        <SETG C-INTS <+ ,C-INTS ,C-INTLEN>>)>>>

<ROUTINE DEQUEUE (RTN)
	 <COND (<SET RTN <QUEUED? .RTN>>
		    <PUT .RTN ,C-RTN 0>)>>

<ROUTINE QUEUED? (RTN "AUX" C E)
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
	  <COND (<EQUAL? .C .E>
	         <RFALSE>)
	        (<EQUAL? <GET .C ,C-RTN> .RTN>
	         <COND (<ZERO? <GET .C ,C-TICK>>
	                <RFALSE>)
	               (T
	                <RETURN .C>)>)>
	  <SET C <REST .C ,C-INTLEN>>>>

<ROUTINE RUNNING? (RTN "AUX" (TBL <REST ,C-TABLE ,C-INTS>) ;"SWG 10-Mar-89"
			     (LEN </ <- ,C-TABLELEN ,C-INTS> ,C-INTLEN>))
	 <COND (<AND <NOT <ZERO? .LEN>>
		         <SET TBL <INTBL? .RTN .TBL .LEN <+ *200* ,C-INTLEN>>>>
		    <COND (<OR <ZERO? <GET .TBL ,C-TICK>>
		    	   <G? <GET .TBL ,C-TICK> 1>>
		           <RFALSE>)
		          (T
		           <RTRUE>)>)>>

<ROUTINE QUEUE (RTN TICK "AUX" C E (INT <>)) ;"automatically enables as well"
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
	  <COND (<EQUAL? .C .E>
	         <COND (.INT
	                <SET C .INT>)
	               (T
	                <COND (<L? ,C-INTS ,C-INTLEN>
	                       <TELL "** Too many ints! **" CR>)>
	                <SETG C-INTS <- ,C-INTS ,C-INTLEN>>
	                <COND (<L? ,C-INTS ,C-MAXINTS>
	                       <SETG C-MAXINTS ,C-INTS>)>
	                <SET INT <REST ,C-TABLE ,C-INTS>>)>
	         <PUT .INT ,C-RTN .RTN>
	         <RETURN>)
	        (<EQUAL? <GET .C ,C-RTN> .RTN>
	         <SET INT .C>
	         <RETURN>)
	        (<ZERO? <GET .C ,C-RTN>>
	         <SET INT .C>)>
	  <SET C <REST .C ,C-INTLEN>>>
	 <COND (<AND ,CLOCK-HAND
	             <IFFLAG (IN-ZILCH
	                      <G? .INT ,CLOCK-HAND>)
	                     (T
	                      <L? <LENGTH .INT> <LENGTH ,CLOCK-HAND>>)>>
	        <SET TICK <- <+ .TICK 3>>>)>
	 <PUT .INT ,C-TICK .TICK>
	 .INT>

;<ROUTINE DONT-ALL (OBJ1 "AUX" (L <LOC .OBJ1>))
	 ;"RFALSE if OBJ1 should be included in the ALL, otherwise RTRUE"
	 <COND (<EQUAL? .OBJ1 ,NOT-HERE-OBJECT>
		<SETG P-NOT-HERE <+ ,P-NOT-HERE 1>>
		<RTRUE>)
	       (<AND <VERB? TAKE> ;"TAKE prso FROM prsi and prso isn't in prsi"
		     ,PRSI
		     <NOT <IN? ,PRSO ,PRSI>>>
		<RTRUE>)
	       (<NOT <ACCESSIBLE? .OBJ1>> ;"can't get at object"
		<RTRUE>)
	       (<EQUAL? ,P-GETFLAGS ,P-ALL> ;"cases for ALL"
		<COND (<AND ,PRSI
			    <PRSO? ,PRSI>>
		       <RTRUE>)
		      (<VERB? TAKE> 
		       ;"TAKE ALL and object not accessible or takeable"
		       <COND (<AND <NOT <FSET? .OBJ1 ,TAKEBIT>>
				   <NOT <FSET? .OBJ1 ,TRYTAKEBIT>>>
			      <RTRUE>)
			     (<AND <NOT <EQUAL? .L ,WINNER ,HERE ,PRSI>>
				   <NOT <EQUAL? .L <LOC ,WINNER>>>>
			      <COND (<AND <FSET? .L ,SURFACEBIT>
				     	  <NOT <FSET? .L ,TAKEBIT>>> ;"tray"
				     <RFALSE>)
				    (T
				     <RTRUE>)>)
			     (<AND <NOT ,PRSI>
				   <ULTIMATELY-IN? ,PRSO>> ;"already have it"
			      <RTRUE>)
			     (T
			      <RFALSE>)>)
		      (<AND <VERB? DROP PUT PUT-ON GIVE SGIVE>
			    ;"VERB ALL, object not held"
			    <NOT <IN? .OBJ1 ,WINNER>>>
		       <RTRUE>)
		      (<AND <VERB? PUT PUT-ON> ;"PUT ALL IN X,obj already in x"
			    <NOT <IN? ,PRSO ,WINNER>>
			    <ULTIMATELY-IN? ,PRSO ,PRSI>>
		       <RTRUE>)>)>>


"THINGS & PLACES"

<OBJECT ROOMS
	(DESC "that")
	(FLAGS NARTICLEBIT PLURALBIT BADRADIOBIT SADRADIOBIT)>

<ROUTINE DOOR-ROOM (RM DR "AUX" (P 0) TBL)
	 <REPEAT ()
		 <COND (<OR <0? <SET P <NEXTP .RM .P>>>
			    <L? .P ,LOW-DIRECTION>>
			<RFALSE>)
		       (<AND <==? ,DEXIT <PTSIZE <SET TBL <GETPT .RM .P>>>>
			     <==? .DR <GET/B .TBL ,DEXITOBJ>>>
			<RETURN <GET/B .TBL ,REXIT>>)>>>

<ROUTINE FIND-IN (RM FLAG "OPTIONAL" (EXCLUDED <>) "AUX" O)
	<SET O <FIRST? .RM>>
	<REPEAT ()
	 <COND (<NOT .O> <RFALSE>)
	       (<AND <FSET? .O .FLAG>
		     <NOT <FSET? .O ,INVISIBLE>>
			 <NOT <FSET? .O ,SECRETBIT>>
		     <NOT <==? .O .EXCLUDED>>>
		<RETURN .O>)
	       (T <SET O <NEXT? .O>>)>>>

<ROUTINE FIND-FLAG-NOT (RM FLAG ;"OPTIONAL" ;(EXCLUDED <>) "AUX" O)
	<SET O <FIRST? .RM>>
	<REPEAT ()
	 <COND (<NOT .O> <RFALSE>)
	       (<AND <NOT <FSET? .O .FLAG>>
		     <NOT <FSET? .O ,INVISIBLE>>
		     ;<NOT <==? .O .EXCLUDED>>>
		<RETURN .O>)
	       (T <SET O <NEXT? .O>>)>>>

<ROUTINE FIND-FLAG-LG (RM FLAG "OPTIONAL" (FLAG2 0) "AUX" TBL O (CNT 0) SIZE)
	 <COND (<SET TBL <GETPT .RM ,P?GLOBAL>>
		<SET SIZE <RMGL-SIZE .TBL>>
		<REPEAT ()
			<SET O <GET/B .TBL .CNT>>
			<COND (<AND <FSET? .O .FLAG>
				    <NOT <FSET? .O ,INVISIBLE>>
				    <OR <0? .FLAG2> <FSET? .O .FLAG2>>>
			       <RETURN .O>)
			      (<IGRTR? CNT .SIZE> <RFALSE>)>>)>>

<ROUTINE FIND-FLAG-HERE (FLAG "OPTIONAL" (NOT1 <>) (NOT2 <>) "AUX" O)
	<SET O <FIRST? ,HERE>>
	<REPEAT ()
	 <COND (<NOT .O> <RFALSE>)
	       (<AND <FSET? .O .FLAG>
		     <AND ;OR <NOT <FSET? .O ,INVISIBLE>>
			 	 <NOT <FSET? .O ,SECRETBIT>>>
		     <NOT <EQUAL? .O .NOT1 .NOT2>>>
		<RETURN .O>)
	       (T <SET O <NEXT? .O>>)>>>

<ROUTINE FIND-FLAG-HERE-NOT (FLAG NFLAG "OPTIONAL" (NOT2 <>) "AUX" O)
	<SET O <FIRST? ,HERE>>
	<REPEAT ()
	 <COND (<NOT .O> <RFALSE>)
	       (<AND <FSET? .O .FLAG>
		     <NOT <FSET? .O .NFLAG>>
		     <NOT <FSET? .O ,INVISIBLE>>
		     <NOT <EQUAL? .O .NOT2>>>
		<RETURN .O>)
	       (T <SET O <NEXT? .O>>)>>>

<ROUTINE OUTSIDE? (RM) <GLOBAL-IN? ,SKY .RM>>