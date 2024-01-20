"PRARE file for NEW PARSER
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<ZZPACKAGE "parser">

<RENTRY	PRINT-LEXV
	TELL-CTHE
	TELL-THE>

<INCLUDE "basedefs" "pbitdefs" "pdefs">

<USE "pmem" "pstack" "reds">

<FILE-FLAGS MDL-ZIL? CLEAN-STACK?>

<BEGIN-SEGMENT 0>

<DEFAULTS-DEFINED
	CANT-FIND-OBJECT
	CANT-USE-MULTIPLE
	DONT-UNDERSTAND
	;PARSER-REPORT
	PRINT-INTQUOTE
	PRINT-LEXV
	REFRESH
	;SAMPLE-COMMANDS
	SETUP-ORPHAN
	SETUP-ORPHAN-NP
	TOO-MANY-NOUNS
	WHICH-LIST?
	WHICH-PRINT
	WINNER-SAYS-WHICH?
	YES?>

<DEFINE TOO-MANY-NEW (WHAT)
	<TELL "[There are too many new " .WHAT "s.]" CR>>

<DEFINE NAKED-OOPS () <TELL "[Please type a word(s) after OOPS.]" CR>>

<DEFINE CANT-OOPS ()
	<TELL "[There was no word to replace in that sentence.]" CR>>

<DEFINE CANT-AGAIN () <TELL "[What do you want to do again?]" CR>>

<DEFAULT-DEFINITION CANT-USE-MULTIPLE
<DEFINE CANT-USE-MULTIPLE (LOSS WD)
	<SETG CLOCK-WAIT T>
	;<COND (<==? .LOSS 2> <TELL "in">)>
	;<TELL "direct ">
	<TELL "[You can't use more than one object at a time with \"">
	<PRINT-VOCAB-WORD .WD>
	<TELL "\"!]" CR>>>

<DEFINE MAKE-ROOM-FOR-TOKENS (CNT LEXV WHERE "OPT" (BEG ,P-LEXSTART)
			      "AUX" LEN MAXLEN)
	<SET MAXLEN <GETB .LEXV 0>>
	<SET LEN <* 2 .MAXLEN>>
	<COND (<L? .LEN <+ .WHERE <* ,P-LEXELEN .CNT>>>
	       <SET CNT </ <- .LEN .WHERE> ,P-LEXELEN>>
	       <TOO-MANY-NEW "word">)>
	<SET LEN <GETB .LEXV ,P-LEXWORDS>>
	<PUTB .LEXV ,P-LEXWORDS <+ .CNT .LEN>>	;"update count"
	<COND (T ;<OR <CHECK-EXTENDED? XZIP>
		      <CHECK-EXTENDED? YZIP>>		;"make space in dest."
	       <SET LEXV <ZREST .LEXV <* 2 .WHERE>>>
	       <SET CNT <* .CNT <* 2 ,P-LEXELEN>>>
	       <COPYT .LEXV
		      <ZREST .LEXV .CNT>
		      <- <* 2 <- .MAXLEN 1>> .WHERE>
		      ;<* 2 <- <* 2 .LEN> <- .WHERE .BEG>>>>)
	      ;(T
	       <PROG ()
		     <SET CNT <* ,P-LEXELEN .CNT>>
		     <SET LEN <* ,P-LEXELEN .LEN>>
		     <REPEAT ()
			     <ZPUT .LEXV <+ .CNT .LEN> <ZGET .LEXV .LEN>>
			     <COND (<L? <SET LEN <- .LEN 1>> .WHERE>
				    <RETURN>)>>>)>>

<DEFINE REPLACE-ONE-TOKEN (N FROM-LEXV PTR TO-LEXV WHERE "AUX" CNT)
	<SET CNT <- .N 1>>
	<COND (<NOT <0? .CNT>>
	       <MAKE-ROOM-FOR-TOKENS .CNT .TO-LEXV .WHERE>)>
	<SET CNT .N>
	<REPEAT (X)	;"copy tokens"
		<COND (<L? <SET CNT <- .CNT 1>> 0>
		       <RETURN>)>
		<SET PTR <+ .PTR ,P-LEXELEN>>
		<ZPUT .TO-LEXV .WHERE <ZGET .FROM-LEXV .PTR>>
		<SET X <+ <* .PTR ,P-LEXELEN> 2>>
		<COND (<ZERO? <INBUF-ADD <GETB .FROM-LEXV .X>
					 <GETB .FROM-LEXV <+ .X 1>>
					 <+ <* .WHERE ,P-LEXELEN> 3>>>
		       <TOO-MANY-NEW "letter">
		       <RETURN>)>
		<SET WHERE <+ .WHERE ,P-LEXELEN>>>>

<DEFAULT-DEFINITION REFRESH
;<SYNTAX $REFRESH = V-$REFRESH>
<DEFINE V-$REFRESH ()
	 <LOWCORE FLAGS <BAND <LOWCORE FLAGS> <BCOM ,F-REFRESH>>>
	 <COLOR ,FOREGROUND-COLOR ,BACKGROUND-COLOR>
     <CLEAR -1>
	 <INIT-STATUS-LINE>
	 <COND (<EQUAL? ,P-CAN-UNDO 2>
		    <SIXCR>
            <HLIGHT ,H-BOLD>
            <PRINT-PLAYER-LOC>
            <HLIGHT ,H-NORMAL>
            <TELL CR "[Undone.]" CR>)>
     <RTRUE>>>

<DEFAULT-DEFINITION PRINT-INTQUOTE
<DEFINE PRINT-INTQUOTE ("AUX" (NP <GET-NP ,INTQUOTE>))
	<PRINT-LEXV -1
		    <ZREST <NP-LEXBEG .NP> ,LEXV-ELEMENT-SIZE-BYTES>
		    <+ -1 </ <- <NP-LEXEND .NP> <NP-LEXBEG .NP>>
			     ,LEXV-ELEMENT-SIZE-BYTES>>>
	;<BUFFER-PRINT <ZREST <NP-LEXBEG .NP> <* 2 ,LEXV-ELEMENT-SIZE-BYTES>>
		      <NP-LEXEND .NP>
		      <>
		      T>>>

<DEFAULT-DEFINITION PRINT-LEXV
<DEFINE PRINT-LEXV ("OPT" (QUIET 0)
			(X <ZREST ,TLEXV <* .QUIET ,LEXV-ELEMENT-SIZE-BYTES>>)
			(LEN <- ,P-LEN .QUIET>))
	<COND (<OR <ZERO? .QUIET> <G? 0 ,P-OFLAG>>
	       <COND (<T? ,P-RESPONDED>
		      <BE-PATIENT <- 0 ,P-RESPONDED>>) ;"finish partial response"
		     (T
		      <SETG P-RESPONDED 1>)>
	       <TELL "[In other words:" ;,I-ASSUME>)>
	<REPEAT (WD (IN-QUOTE <>)
		 (OWD <COND (<EQUAL? .QUIET -1> ,W?APOSTROPHE) (T 0)>))
		<SET WD <ZGET .X 0>>
		<COND (<EQUAL? .WD
			       ,W?PERIOD ,W?COMMA ,W?APOSTROPHE ,W?NO.WORD>
		       T)
		      (<EQUAL? .OWD ,W?APOSTROPHE>
		       T)
		      (<AND <EQUAL? .OWD ,W?QUOTE>
			    <F? .IN-QUOTE>>
		       <SET IN-QUOTE T>)
		      (<AND <EQUAL? .WD ,W?QUOTE>
			    <T? .IN-QUOTE>>
		       <SET IN-QUOTE <>>)
		      (T
		       <TELL !\ >)>
		<COND (<EQUAL? .WD ,W?NO.WORD>
		       T)
		      (<CAPITAL-NOUN? .WD>
		       <CAPITALIZE .X>)
		      (<EQUAL? .WD 0 ,W?INT.NUM ,W?INT.TIM>
		       <BUFFER-PRINT .X <+ .X ,P-WORDLEN> <> T>)
		      (T
		       <PRINT-VOCAB-WORD .WD>)>
		<COND (<DLESS? LEN 1>
		       <RETURN>)>
		<COND (<NOT <EQUAL? .WD ,W?NO.WORD>>
		       <SET OWD .WD>)>
		<SET X <ZREST .X ,LEXV-ELEMENT-SIZE-BYTES>>>
	<COND (<OR <ZERO? .QUIET> <G? 0 ,P-OFLAG>>
	       <TELL "]" CR>)>
	;<SETG P-OFLAG 0>>>

<DEFINE COPY-INPUT ("OPT" (QUIET 0) "AUX" LEN)
	<COPYT ,G-LEXV ,P-LEXV ,LEXV-LENGTH-BYTES>
	<SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
	<SETG TLEXV <ZGET ,OOPS-TABLE ,O-START ;,O-AGAIN>>
	<COPYT ,G-INBUF ,P-INBUF <+ 1 ,INBUF-LENGTH>>
	<SET LEN <* <* 2 ,P-LEXELEN:FIX>
		    <GETB ,P-LEXV ,P-LEXWORDS>>>
	<ZPUT ,OOPS-TABLE ,O-END
	      <+ <GETB ,TLEXV <SET LEN <- .LEN 1>>>
		 <GETB ,TLEXV <SET LEN <- .LEN 1>>>>>
	<COND (<NOT .QUIET>
	       <PRINT-LEXV .QUIET>)>
	;<COND (<L? 0 ,P-OFLAG>
	       <SETG P-OFLAG 0>)>>

<COND (<NOT <OR <CHECK-VERSION? XZIP>
		<CHECK-VERSION? YZIP>>>
<DEFINE COPY-INBUF (SRC DEST "AUX" CNT:FIX)
	<SET CNT <- <GETB .SRC 0> 1>>
	<REPEAT ()
		<PUTB .DEST .CNT <GETB .SRC .CNT>>
		<COND (<L? <SET CNT <- .CNT 1>> 0>
		       <RETURN>)>>>

<DEFINE COPY-LEXV (SRC DEST "OPT" (MAX:FIX ,LEXV-LENGTH) "AUX" (CTR:FIX 1))
	<PUTB .DEST 0 <GETB .SRC 0>>
	<PUTB .DEST 1 <GETB .SRC 1>>
	<SET DEST <ZREST .DEST <* ,P-LEXSTART:FIX 2>>>
	<SET SRC <ZREST .SRC <* ,P-LEXSTART:FIX 2>>>
	<REPEAT ()
		<ZPUT .DEST 0 <ZGET .SRC 0>>
		<PUTB .DEST 2 <GETB .SRC 2>>
		<PUTB .DEST 3 <GETB .SRC 3>>
		<COND (<G? <SET CTR <+ .CTR 1>> .MAX>
		       <RETURN>)>
		<SET DEST <ZREST .DEST <* 2 ,P-LEXELEN:FIX>>>
		<SET SRC <ZREST .SRC <* 2 ,P-LEXELEN:FIX>>>>>)>

<END-SEGMENT>

;"<DEFAULT-DEFINITION SAMPLE-COMMANDS"
<IFN-P-BE-VERB

<BEGIN-SEGMENT HINTS>

<SYNTAX $NUDGE = V-$NUDGE>
<SYNTAX $NUDGE OBJECT = V-$NUDGE>

<ROUTINE V-$NUDGE ()
	<SETG CLOCK-WAIT T>
	<LEXV-WORD ,TLEXV ,W?SHOULD>	;"force sample command"
    <TELL "[">
	;<PRINT "Please use commands">
	<TELL-SAMPLE-COMMANDS>
	;<TELL ".]" CR>>

<GLOBAL P-ERRS:NUMBER 0>
;<GLOBAL P-THRESH:NUMBER 10>

<DEFINE COUNT-ERRORS ("OPT" (NUM 1)
		      "AUX" (THRESH ;<IF-P-ZORK0 <COND (<FSET? ,GREAT-HALL ,TOUCHBIT> 10)(T 2)>>
                            4))
	<SETG P-ERRS <+ .NUM ,P-ERRS>>
	<COND (<G? ,P-ERRS .THRESH>
	       <SETG P-ERRS 0>
	       <TELL
"[I'm having trouble understanding you. Maybe it's because you're not
used to the rules for commands. ">
	       <COND ;(<AND <NOT <FSET? ,GREAT-HALL ,TOUCHBIT>>
			   <T? ,PROLOGUE-NOVICE-COUNTER>>
		      <TELL "Here's the command you should type now:|
	"
			    <ZGET ,NOVICE-MOVES ,PROLOGUE-NOVICE-COUNTER>
			    "|
Please try that.]" CR>)
		     (T
              <TELL-SAMPLE-COMMANDS>)>)>>

<DEFINE FIND-UEXIT-STR ACT ("AUX" (P 0))
 <REPEAT ()
	 <COND (<L? <SET P <NEXTP ,HERE .P>> ,LOW-DIRECTION>
		<RETURN <> .ACT>)
	       (T
		<COND (<EQUAL? <PTSIZE <GETPT ,HERE .P>> ,UEXIT>
		       <RETURN <DIR-TO-STRING .P> .ACT>)>)>>>

<CONSTANT TELL-SAMPLE-COMMANDS-NUMBER 3>

<DEFINE TELL-SAMPLE-COMMANDS ("AUX" VERB PIN SYN (OBJ <>) (NUM 0))
	<TELL
"Commands tell the computer what you want to do in the
story. Here are some commands that you can type right
now, although they may or may not be useful:|">
	;"0 objects:"
   <REPEAT ((CT <ZGET ,SAMPLE-COMMANDS-TABLE-0 0>)
	    (N <COND (<T? ,PRSO> .CT) (T ,TELL-SAMPLE-COMMANDS-NUMBER)>))
	<SET VERB <ZGET ,SAMPLE-COMMANDS-TABLE-0
			<COND (<T? ,PRSO> .N) (T <RANDOM .CT>)>>>
	<COND (<DLESS? N 0>
	       <RETURN>)
	      (<OR <NOT <EQUAL? .VERB ,W?GO>>
		   <SET OBJ <FIND-UEXIT-STR>>>
	       <INC NUM>
	       <TELL "  ">
	       <PRINT-VOCAB-WORD .VERB>
	       <COND (.OBJ
		      <TELL !\  .OBJ>)>
	       <CRLF>
	       <COND (<F? ,PRSO>
		      <RETURN>)>)>>
	;"1 object:"
   <REPEAT ((CT <ZGET ,SAMPLE-COMMANDS-TABLE-1 0>)
	    (N <COND (<T? ,PRSO> .CT) (T ,TELL-SAMPLE-COMMANDS-NUMBER)>))
	<SET VERB <ZGET ,SAMPLE-COMMANDS-TABLE-1
			<COND (<T? ,PRSO> .N) (T <RANDOM .CT>)>>>
	<COND (<DLESS? N 0>
	       <RETURN>)
	      (<AND <SET SYN <VERB-ONE <WORD-VERB-STUFF .VERB>>>
		    <GET-SYNTAX .SYN 1 0 T>
		    <SET OBJ <DETERMINE-OBJ <> 1 T>>
		    <SET OBJ <NOUN-PHRASE-OBJ1 .OBJ>>>
	       <INC NUM>
	       <TELL "  ">
	       <PRINT-VOCAB-WORD .VERB>
	       <TELL !\ ><D-J .OBJ><CRLF>
	       <COND (<F? ,PRSO>
		      <RETURN>)>)>>
	;"2 objects:"
   <REPEAT ((CT </ <ZGET ,SAMPLE-COMMANDS-TABLE-2 0> 2>)
	    (N <COND (<T? ,PRSO> .CT) (T ,TELL-SAMPLE-COMMANDS-NUMBER)>))
	<COND (<0? .N>
	       <RETURN>)>
	<SET VERB <- <* <COND (<T? ,PRSO> .N) (T <RANDOM .CT>)> 2> 1>>
	<SET SYN <ZGET ,SAMPLE-COMMANDS-TABLE-2 .VERB>>
	<COND (<0? <WORD-CLASSIFICATION-NUMBER .SYN>>	;"a synonym"
	       <SET SYN <WORD-SEMANTIC-STUFF .SYN>>)>
	<COND (<DLESS? N 0>
	       <RETURN>)
	      (<AND <SET SYN <VERB-TWO <WORD-VERB-STUFF .SYN>>>
		    <PARSE-PARTICLE2 ,PARSE-RESULT
				<ZGET ,SAMPLE-COMMANDS-TABLE-2 <+ 1 .VERB>>>
		    <GET-SYNTAX .SYN 2 0 T>
		    <SET OBJ <DETERMINE-OBJ <> 1 T>>
		    <SET OBJ <NOUN-PHRASE-OBJ1 .OBJ>>
		    <SET SYN <DETERMINE-OBJ <> 2 T>>
		    <SET SYN <NOUN-PHRASE-OBJ1 .SYN>>>
	       <INC NUM>
	       <TELL "  ">
	       <PRINT-VOCAB-WORD <ZGET ,SAMPLE-COMMANDS-TABLE-2 .VERB>>
	       <TELL !\ ><D-J .OBJ><TELL !\ >
	       <PRINT-VOCAB-WORD <ZGET ,SAMPLE-COMMANDS-TABLE-2 <+ 1 .VERB>>>
	       <TELL !\ ><D-J .SYN><CRLF>
	       <COND (<F? ,PRSO>
		      <RETURN>)>)>>
    ;"3 objects:"
   <REPEAT ((CT </ <ZGET ,SAMPLE-COMMANDS-TABLE-3 0> 3>)
	    (N <COND (<T? ,PRSO> .CT) (T ,TELL-SAMPLE-COMMANDS-NUMBER)>))
	<COND (<0? .N>
	       <RETURN>)>
    <SET VERB <- <* <COND (<T? ,PRSO> .N) (T <RANDOM .CT>)> 3> 2>>
    <SET SYN <ZGET ,SAMPLE-COMMANDS-TABLE-3 .VERB>>
    <COND (<0? <WORD-CLASSIFICATION-NUMBER .SYN>>	;"a synonym"
	       <SET SYN <WORD-SEMANTIC-STUFF .SYN>>)>
	<COND (<DLESS? N 0>
	       <RETURN>)
	      (<AND <SET SYN <VERB-THREE <WORD-VERB-STUFF .SYN>>>
		    <PARSE-PARTICLE2 ,PARSE-RESULT
				<ZGET ,SAMPLE-COMMANDS-TABLE-3 <+ 1 .VERB>>>
            <PARSE-PARTICLE3 ,PARSE-RESULT
				<ZGET ,SAMPLE-COMMANDS-TABLE-3 <+ 2 .VERB>>>
		    <GET-SYNTAX .SYN 3 0 T>
		    <SET OBJ <DETERMINE-OBJ <> 1 T>>
		    <SET OBJ <NOUN-PHRASE-OBJ1 .OBJ>>
		    <SET SYN <DETERMINE-OBJ <> 2 T>>
		    <SET SYN <NOUN-PHRASE-OBJ1 .SYN>>
            <SET PIN <DETERMINE-OBJ <> 3 T>>
		    <SET PIN <NOUN-PHRASE-OBJ1 .PIN>>>
	       <INC NUM>
	       <TELL "  ">
	       <PRINT-VOCAB-WORD <ZGET ,SAMPLE-COMMANDS-TABLE-3 .VERB>>
	       <TELL !\ >
           <COND (<EQUAL? .VERB 1>
                  <TELL "\"">
	              <SET PIN <ZREST ,VOCAB <+ 1 <GETB ,VOCAB 0>>>>
	              <REPEAT (N (M <GETB .PIN 0>))
	            	<SET N <ZREST .PIN <+ 3 <* .M	;"size of entry"
	            				   <- <RANDOM <ZGET <ZREST .PIN 1> 0>
	            				       ;"number of entries">
	            				      1>>>>>
	            	<COND (<AND <G=? .N ,W?A>
	            		    <T? <WORD-CLASSIFICATION-NUMBER .N>>
	            		    <NOT <EQUAL? .N ,W?END.OF.INPUT ,W?NO.WORD
	            				    ,W?INT.NUM ,W?INT.TIM>>>
	            	       <PRINT-VOCAB-WORD .N>
	            	       <RETURN>)>>
	              <TELL "\"">)
                 (ELSE
                  <D-J .PIN>)>
           <TELL !\ >
           <PRINT-VOCAB-WORD <ZGET ,SAMPLE-COMMANDS-TABLE-3 <+ 1 .VERB>>>
	       <TELL !\ ><D-J .OBJ><TELL !\ >
	       <PRINT-VOCAB-WORD <ZGET ,SAMPLE-COMMANDS-TABLE-3 <+ 2 .VERB>>>
	       <TELL !\ ><D-J .SYN><CRLF>
	       <COND (<F? ,PRSO>
		      <RETURN>)>)>>
    ;"SAY [something]"
   <COND (<OR <T? ,P-WON> <1? <RANDOM 2>>> ;<NOT <IGRTR? NUM 3>>
	  <TELL "  say \"">
	  <SET SYN <ZREST ,VOCAB <+ 1 <GETB ,VOCAB 0>>>>
	  <REPEAT (N (M <GETB .SYN 0>))
		<SET N <ZREST .SYN <+ 3 <* .M	;"size of entry"
					   <- <RANDOM <ZGET <ZREST .SYN 1> 0>
					       ;"number of entries">
					      1>>>>>
		<COND (<AND <G=? .N ,W?A>
			    <T? <WORD-CLASSIFICATION-NUMBER .N>>
			    <NOT <EQUAL? .N ,W?END.OF.INPUT ,W?NO.WORD
					    ,W?INT.NUM ,W?INT.TIM>>>
		       <PRINT-VOCAB-WORD .N>
		       <RETURN>)>>
	  <TELL "\"|">)>
   <IFFLAG (P-ZORK0
    <COND (<IN? ,JESTER ,HERE> ;<NOT <IGRTR? NUM 3>>
    	  <TELL "  jester, give me the key|">)>)
           (T
    <COND (<AND <IN? ,SLARTY ,HERE>
                <HELD? ,BLUE-TUBE ,SLARTY>>
           <TELL "  slartibartfast, give me the blue test tube|">)
          (<AND <IN? ,PLAYER ,CAR-PARK>
                <NOT <FSET? ,MARVIN ,BADRADIOBIT>>>
           <TELL "  marvin, unlock hotblack desiato's ship|">)>)>
   <TELL "Now you can try again.]" CR>>

<CONSTANT SAMPLE-COMMANDS-TABLE-0 <PLTABLE
	<VOC "GO">	;"[a direction]"
	<VOC "INVENTORY">
	<VOC "LOOK">
	<VOC "WAIT">>>

<CONSTANT SAMPLE-COMMANDS-TABLE-1 <PLTABLE
	<VOC "TAKE">
	<VOC "DROP">
	<VOC "EXAMINE">	;"[a visible object]"
	<VOC "READ">
	<VOC "OPEN">	;"[a closed container]"
	<VOC "CLOSE">	;"[an open container]"
	<VOC "BOARD">	;"[a vehicle you're not in]"
	<VOC "EXIT">	;"[a vehicle you're in]"
	<VOC "WEAR">
	<VOC "REMOVE">>>

<CONSTANT SAMPLE-COMMANDS-TABLE-2 <PLTABLE
	<VOC "PUT"> <VOC "IN">	;"[a held object] INTO [an open container]"
	<VOC "GIVE"> <VOC "TO">
	<VOC "ASK"> <VOC "ABOUT"> ;"[a character] ABOUT [one of several topics]
	[a character], HELLO
	[a character], GO [a direction]">>

<CONSTANT SAMPLE-COMMANDS-TABLE-3 <PLTABLE
	<VOC "WRITE"> <VOC "ON"> <VOC "WITH">	;"[a quotation] ON [a writable object] WITH [a held object]"
	<VOC "POUR"> <VOC "IN"> <VOC "USING">	;"[a liquid] IN [a container] USING [a held object]">>

<END-SEGMENT>
>
;">"

<BEGIN-SEGMENT 0>

<ADD-WORD NO.WORD ADJ>

<DEFINE BUFFER-PRINT (BEG END "OPT" (CP <>) (NOSP <>) ;(ALL <>)
		      "AUX" WRD NW (FIRST?? T) (PN <>) TMP)
 <REPEAT ()
	 <COND (<EQUAL? .BEG .END> <RETURN>)>
	 <COND (<OR <T? .NOSP>
		    <EQUAL? .NW ,W?PERIOD ,W?COMMA ,W?APOSTROPHE>>
		<SET NOSP <>>)
	       (T <TELL !\ >)>
	 <SET WRD <ZGET .BEG 0>>
	 <COND (<EQUAL? .END <ZREST .BEG ,P-WORDLEN>>
		<SET NW 0>)
	       (T <SET NW <ZGET .BEG ,P-LEXELEN>>)>
	 <COND (<EQUAL? .WRD ,W?NO.WORD>
		<SET NOSP T>)
	       (<EQUAL? .WRD ,W?MY>
		<PRINTB ,W?YOUR>)
	       (<EQUAL? .WRD ,W?ME>
		<PRINTB ,W?YOU>
		<SET PN T>)
           (<EQUAL? .WRD ,W?MRIVG ,W?MRIUG ,W?MRKUG>
		<TELL "that">)
	       (<EQUAL? .WRD ,W?ONE>
		<TELL "object">)
	       (<AND ;<T? .ALL>
		     <IFFLAG (P-APOSTROPHE-BREAKS-WORDS
			<NOT <EQUAL? .WRD <> ,W?ALL ,W?PERIOD ,W?APOSTROPHE>>)
			     (T
			<NOT <EQUAL? .WRD <> ,W?ALL ,W?PERIOD>>)>
		     <OR <AND <0? <SET TMP <WORD-CLASSIFICATION-NUMBER .WRD>>>
			      <F? <WORD-SEMANTIC-STUFF .WRD>>>	;"BUZZ"
			 ;<COMPARE-WORD-TYPES .TMP <GET-CLASSIFICATION PREP>>>
		     <NOT <COMPARE-WORD-TYPES .TMP <GET-CLASSIFICATION ADJ>>>
		     <NOT <COMPARE-WORD-TYPES .TMP <GET-CLASSIFICATION NOUN>>>>
		<SET NOSP T>)
	       (<CAPITAL-NOUN? .WRD>
		<CAPITALIZE .BEG>
		<SET PN T>)
	       (T
		<COND (<AND <T? .FIRST??> <ZERO? .PN> <T? .CP>>
		       <COND (<NOT <EQUAL? .WRD ,W?HER ,W?HIM ,W?YOUR>>
			      ;"? others?"
			      <TELL "the ">)>)>
		<COND ;(<AND <T? ,P-OFLAG>
			    <T? .WRD>>
		       <PRINT-VOCAB-WORD .WRD>)
		      (<AND <EQUAL? .WRD ,W?IT>
			    <VISIBLE? ,P-IT-OBJECT>>
		       <TELL D ,P-IT-OBJECT>)
		      (<AND <EQUAL? .WRD ,W?THEM>
			    <VISIBLE? ,P-THEM-OBJECT>>
		       <TELL D ,P-THEM-OBJECT>)
		      (<AND <EQUAL? .WRD ,W?HER>
			    <ZERO? .PN>>
		       <TELL D ,P-HER-OBJECT>)
		      (<AND <EQUAL? .WRD ,W?HIM>
			    <ZERO? .PN>>
		       <TELL D ,P-HIM-OBJECT>)
		      (<EQUAL? .WRD ,W?INT.NUM ,W?INT.TIM>
		       <TELL N <ZGET .BEG 1>>)
		      (T
		       <WORD-PRINT .BEG>)>
		<SET FIRST?? <>>)>
	 <SET BEG <ZREST .BEG ,P-WORDLEN>>>>

<ROUTINE CAPITALIZE (PTR)
	 <COND ;(<T? ,P-OFLAG>
		<PRINT-VOCAB-WORD <LEXV-WORD .PTR>>)
	       (T
		<PRINTC <- <GETB ,P-INBUF <LEXV-WORD-OFFSET .PTR>>
			   <- !\a !\A>>>
		<WORD-PRINT .PTR
			    <- <LEXV-WORD-LENGTH .PTR> 1>
			    <+ <LEXV-WORD-OFFSET .PTR> 1>>)>>

<DEFINE PRINT-PARSER-FAILURE ("AUX"
	(CLASS <ZGET ,ERROR-ARGS 1>) (OTHER <ZGET ,ERROR-ARGS 2>)
	(OTHER2<ZGET ,ERROR-ARGS 3>) (TEST <>) (PRTEST <>))
 ;<ZPUT ,ERROR-ARGS 1 0>
 <COND (<==? .CLASS ,PARSER-ERROR-ORPH-S>
	<PROG (TMP PR N)
	      <SETG P-OFLAG </ <- <ZGET ,ORPHAN-S ,O-LEXPTR> ,P-LEXV> 2>>
	      <FIND-RES-COUNT ,ORPHAN-SR 0>
	      <COPYT ,G-LEXV ,O-LEXV ,LEXV-LENGTH-BYTES>
	      <COPYT ,G-INBUF ,O-INBUF <+ 1 ,INBUF-LENGTH>>
	      <ZPUT ,OOPS-TABLE ,O-AGAIN <ZGET ,OOPS-TABLE ,O-START>>
	      <MAKE-ROOM-FOR-TOKENS 1 ,O-LEXV ,P-OFLAG>
	      <ZPUT ,O-LEXV ,P-OFLAG ,W?NO.WORD ;0>
	      <TELL "[Wh">
	      <COND (<DIR-VERB-WORD? <ZGET ,ORPHAN-S ,O-VERB>>
		     <TELL "ere">)
		    (<==? ,PERSONBIT
			  <COND (<1? <ZGET ,ORPHAN-S ,O-WHICH>>
				 <SYNTAX-FIND ;B4
				      <ZGET ,ORPHAN-S ,O-SYNTAX> 1>)
				(T <SYNTAX-FIND ;B8
				      <ZGET ,ORPHAN-S ,O-SYNTAX> 2>)>>
		     <TELL "om">)
		    (T <TELL "at">)>
	      <TELL !\ >
	      <COND (<AND <SET PR <ZGET ,ORPHAN-S ,O-SUBJECT>>
			  <BAND ,PAST-TENSE
				<WORD-FLAGS <SET TMP <ZGET ,ORPHAN-S ,O-VERB>>>>>
		     <TELL "did ">
		     <TELL-THE .PR>
		     <THIS-IS-IT .PR>
		     <TELL !\ >)
		    (T
		     <TELL "do you want ">
		     <COND (<NOT <EQUAL? ,WINNER ,PLAYER>>
			    <TELL D ,WINNER " ">)>
		     <TELL "to ">)>
	      <PRINT-VOCAB-WORD <ROOT-VERB <ZGET ,ORPHAN-S ,O-VERB>>>
	      <SET TMP <ZGET ,ORPHAN-S ,O-PART>>
	      <COND (<NOT <EQUAL? .TMP 0 1>>
		     <TELL !\ >
		     <PRINT-VOCAB-WORD .TMP>)>
	      <COND (<SET TMP <ZGET ,ERROR-ARGS 2>>
		     <TELL !\ >
		     <COND (<SET PR <ZGET ,ORPHAN-S ,O-OBJECT>>
			    <TELL-THE .PR>
			    <THIS-IS-IT .PR>)
			   (T
			    <NP-PRINT .TMP>)>
		     <COND (<SET TMP <ZGET ,ORPHAN-S ,O-SYNTAX>>
			    <SET TMP <COND (<1? <ZGET ,ORPHAN-S ,O-WHICH>>
					    <SYNTAX-PREP .TMP 1>)
					   (T
					    <SYNTAX-PREP .TMP 2>)>>
			    <COND (<T? .TMP>
				   <SET N <GETB ,O-LEXV ,P-LEXWORDS>>
				   <SET PR <ZGET ,O-LEXV <- ,P-OFLAG ,P-LEXELEN>>>
				   <COND (<0? <WORD-CLASSIFICATION-NUMBER .PR>>
					  ;"synonym"
					  <SET PR <WORD-SEMANTIC-STUFF .PR>>)>
				   <COND (<N==? .TMP .PR>
					  <MAKE-ROOM-FOR-TOKENS 1 ,O-LEXV ,P-OFLAG>
					  <SET N <+ 1 .N>>
					  ;<PUTB ,O-LEXV ,P-LEXWORDS .N>
					  <ZPUT ,O-LEXV ,P-OFLAG .TMP>
					  <SETG P-OFLAG	<+ ,P-OFLAG ,P-LEXELEN>>)>
				   ;<MAKE-ROOM-FOR-TOKENS 1 ,O-LEXV ,P-OFLAG> ;"?"
				   <ZPUT ,O-LEXV ,P-OFLAG ,W?NO.WORD ;0>
				   <INBUF-PRINT .TMP ,O-INBUF
						,O-LEXV <+ 1 <* ,P-WORDLEN .N>>>
				   <TELL !\ >
				   <PRINT-VOCAB-WORD .TMP>)>)>)>
	      <TELL "?]" CR>
	      <RTRUE>>)
       (<==? .CLASS ,PARSER-ERROR-ORPH-NP>
	<COND (<WHICH-PRINT .OTHER>
	       <RTRUE>)>)>
 ;<SETG P-OFLAG 0>
 <COND (<==? .CLASS ,PARSER-ERROR-QUIET>
	<RTRUE>)
       (<==? .CLASS ,PARSER-ERROR-NOMULT>
	<CANT-USE-MULTIPLE .OTHER .OTHER2>
	<RTRUE>)
       (<EQUAL? .CLASS ,PARSER-ERROR-NOOBJ>
	<CANT-FIND-OBJECT .OTHER .OTHER2 ;.OTHER3>
	<RTRUE>)
       (<EQUAL? .CLASS ,PARSER-ERROR-TMNOUN>
	<TOO-MANY-NOUNS <PARSE-VERB ,PARSE-RESULT>>
	<RTRUE>)
       (T ;<OR <==? .CLASS ,PARSER-ERROR-NOUND>
	    <NOT <L? ,ERROR-PRIORITY 255>>>
	<COND ;"Try to handle TAKE THIS JOB AND SHOVE IT --"
	      (<AND <G? ,P-LEN 0>
		    <OR <CHANGE-AND-TO-THEN? <SET OTHER2
					      <ZBACK ,OTLEXV<* 2 ,P-LEXELEN>>>>
			<CHANGE-AND-TO-THEN? <SET OTHER2 ,OTLEXV>>>>
	       <SETG P-LEN <ZGET ,OOPS-TABLE ,O-LENGTH>>
	       <SETG TLEXV <ZGET ,OOPS-TABLE ,O-START>>
	       <PRINT-LEXV>
	       <RETURN <PARSE-IT <>>>)>
	<SET OTHER2 ,OTLEXV>	;"Try to handle PUSH RED --"
	<COND (<OR <AND <ZERO? ,P-LEN>
			<NAKED-ADJECTIVE? .OTHER2>>
		   <AND <L? ,P-LEXV
			    <SET OTHER2 <ZBACK ,OTLEXV <* 2 ,P-LEXELEN>>>>
			<L? 0 ,P-LEN>
			<NAKED-ADJECTIVE? .OTHER2>
			<IFFLAG (P-ZORK0
				 <WORD-TYPE? <ZGET ,OTLEXV 0>
					     ,P-EOI-CODE ,P-COMMA-CODE>)
				(T
				 <OR <EQUAL? <ZGET ,OTLEXV 0> ,W?COMMA ,W?AND ,W?&>
				     <COMPARE-WORD-TYPES <WCN <ZGET ,OTLEXV 0>>
					       <GET-CLASSIFICATION END-OF-INPUT>>>)>>>
	       <SET CLASS <+ ,P-LEXELEN </ <- .OTHER2 ,P-LEXV> 2>>>
	       <MAKE-ROOM-FOR-TOKENS 1 ,P-LEXV .CLASS>
	       <MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .CLASS>
	       <CHANGE-LEXV <ZREST .OTHER2 <* 2 ,P-LEXELEN>> ,W?ONE>
	       <SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>
			   ;<+ 1 <ZGET ,OOPS-TABLE ,O-LENGTH>>>
	       <SETG TLEXV <ZGET ,OOPS-TABLE ,O-START>>
	       ;<PRINT-LEXV>
	       <RETURN <PARSE-IT <>>>)>
    <DONT-UNDERSTAND>
	;<RTRUE>)>>

<IFFLAG (P-ZORK0
	 <DEFINE NAKED-ADJECTIVE? (PTR "AUX" (WD <ZGET .PTR 0>))
	    <AND <WORD-TYPE? .WD ,P-ADJ-CODE>
		 <NOT <WORD-TYPE? .WD ,P-DIR-CODE>>
		 ;<NOT <EQUAL? .WD ,W?S>>	;"possessive"
		 <NOT <EQUAL? .WD ,W?ONE>>>>
	 <DEFINE CHANGE-AND-TO-THEN? (PTR "AUX" X)
	    <COND (<AND <EQUAL? <ZGET .PTR 0> ,W?AND ,W?COMMA>
			<OR <WORD-TYPE? <ZGET <SET X <ZREST .PTR <* 2 ,P-LEXELEN>>> 0>
					,P-VERB-CODE ,P-DIR-CODE>
			    <WORD-TYPE? <ZGET .X 0> ,P-EOI-CODE>>>
		   <CHANGE-LEXV .PTR ,W?THEN>
		   T)
		  (<AND <EQUAL? <ZGET .PTR 0> ,W?COMMA>
			<EQUAL? <ZGET <ZBACK .PTR <* 2 ,P-LEXELEN>> 0>
				,W?CALL ,W?SAY>>
		   <CHANGE-LEXV .PTR ,W?NO.WORD>
		   T)>>)
	(T
	 <DEFINE NAKED-ADJECTIVE? (PTR "AUX" (WD <ZGET .PTR 0>))
	    <AND <COMPARE-WORD-TYPES <WCN .WD> <GET-CLASSIFICATION ADJ>>
		 <NOT <COMPARE-WORD-TYPES <WCN .WD> <GET-CLASSIFICATION DIR>>>
		 <NOT <EQUAL? .WD ,W?ONE>>>>
	 <DEFINE CHANGE-AND-TO-THEN? (PTR "AUX" X)
	    <COND (<AND <EQUAL? <ZGET .PTR 0> ,W?AND ,W?COMMA>
			<OR <COMPARE-WORD-TYPES
			     <WCN <ZGET <SET X <ZREST .PTR <* 2 ,P-LEXELEN>>> 0>>
			     <GET-CLASSIFICATION VERB>>
			    <COMPARE-WORD-TYPES <WCN <ZGET .X 0>>
						<GET-CLASSIFICATION DIR>>
			    <COMPARE-WORD-TYPES <WCN <ZGET .X 0>>
						<GET-CLASSIFICATION END-OF-INPUT>>>>
		   <CHANGE-LEXV .PTR ,W?THEN>
		   T)
		  (<AND <EQUAL? <ZGET .PTR 0> ,W?COMMA>
			<EQUAL? <ZGET <ZBACK .PTR <* 2 ,P-LEXELEN>> 0>
				,W?CALL ,W?SAY>>
		   <CHANGE-LEXV .PTR ,W?NO.WORD>
		   T)>>)>

<DEFAULT-DEFINITION DONT-UNDERSTAND
<DEFINE DONT-UNDERSTAND ()
 <SETG CLOCK-WAIT T>
 <COND (<AND <EQUAL? 1 <GETB ,P-LEXV ,P-LEXWORDS>>
	     <IFFLAG (P-ZORK0
		      <WORD-TYPE? <ZGET ,P-LEXV ,P-LEXSTART> ,P-NOUN-CODE ,P-ADJ-CODE>)
		     (T
		      <OR <COMPARE-WORD-TYPES <WCN <ZGET ,P-LEXV ,P-LEXSTART>>
					      <GET-CLASSIFICATION NOUN>>
			  <COMPARE-WORD-TYPES <WCN <ZGET ,P-LEXV ,P-LEXSTART>>
					      <GET-CLASSIFICATION ADJ>>>)>>
	<MISSING "verb">
	<RETURN T>)>
 <IF-P-ZORK0
	<COND (<COUNT-ERRORS 1>
	       <RETURN T>)>>
 <TELL
"[Sorry, but I don't understand. Please say that another way, or try
something else.]" CR>>>

<DEFINE MISSING (NV)
	<TELL "[I think there's a " .NV " missing in that sentence!]" CR>>

<DEFAULT-DEFINITION CANT-FIND-OBJECT
<DEFINE CANT-FIND-NPP (NPP PART)
   <REPEAT ((OBJ <NPP-NOUN-PHRASE .NPP>))
	   <COND (<EQUAL? <NOUN-PHRASE-OBJ1 .OBJ> <> ,NOT-HERE-OBJECT>
		  <NP-CANT-SEE <NOUN-PHRASE-NP1 .OBJ> .PART>
		  <RTRUE>)
		 (<AND <SET NPP <NPP-NEXT .NPP>>
		       <SET OBJ <NPP-NOUN-PHRASE .NPP>>>
		  T)
		 (T
		  <RFALSE>)>>>

<DEFINE CANT-FIND-OBJECT (NP PART ;NUM "AUX" TMP)
 <COND (<AND <PMEM-TYPE? .NP NPP>
	     <CANT-FIND-NPP .NP .PART>>
	T)
       (<AND <PMEM-TYPE? .NP NP>
	     <ZERO? <NP-QUANT .NP>>>
	<NP-CANT-SEE .NP .PART>
	T)
       (T
	;<SET TMP <PARSE-ACTION ,PARSE-RESULT>>
	;<COND (<==? .NUM 1>	<SET TMP <SYNTAX-FIND ;B4 .TMP 1>>)
	      (T		<SET TMP <SYNTAX-FIND ;B8 .TMP 2>>)>
	<TELL "[There isn't any">
	<COND ;(<EQUAL? .TMP ,PERSONBIT>
	       <TELL "one">)
	      (T <TELL "thing">)>
	<TELL " to ">
	<COND (<SET TMP <PARSE-VERB ,PARSE-RESULT>>
	       <PRINT-VOCAB-WORD .TMP>
	       <COND (<NOT <EQUAL? .PART 0 1>>
		      <TELL !\ >
		      <PRINT-VOCAB-WORD .PART>)>)
	      (T <TELL "do that to">)>
	<TELL "!]" CR>)>>

<DEFINE NP-CANT-SEE ("OPT" (NP <GET-NP>) (SYN 0) "AUX" TMP (SHAVE <>))
	<COND (<SET TMP <NP-NAME .NP>>
	       <TELL "[">
	       <TELL-CTHE ,WINNER>
	       <THIS-IS-IT ,WINNER>
	       <TELL " ">
	       <COND (<AND ;<T? .SYN>
			   <BTST .SYN ,SEARCH-MUST-HAVE>
			   <NOT <BTST .SYN ,SEARCH-MOBY>>>
		      <SET SHAVE T>
		      <TELL "do">
		      <COND (<NOT <EQUAL? ,WINNER ,PLAYER ;,ME>>
			     <TELL "es">)>
		      <TELL "n't have">)
		     (T
		      <TELL "can't see">)>
	       <TELL " ">
	       <COND (<OR <CAPITAL-NOUN? .TMP>
			  <AND <SET TMP <NP-ADJS .NP>>
			       <ADJS-POSS .TMP>>>
		      <NP-PRINT .NP T>)
		     (T
		      <TELL "any ">
		      <NP-PRINT .NP>)>
	       <COND (<NOT .SHAVE>
		      <TELL !\ >
		      <COND (<AND <SET TMP <NP-LOC .NP>>
				  <OR <AND ;<EQUAL? .NP ,ORPHAN-NP>
					   ;"removed for HIT MAN ON HEAD WITH ROCK"
					   <PMEM-TYPE? .TMP NOUN-PHRASE>
					   <TELL "in">>
				      <AND <PMEM-TYPE? .TMP LOCATION>
					   <SET TMP <LOCATION-OBJECT .TMP>>
					   <PRINT-VOCAB-WORD <LOCATION-PREP .TMP>>>>>
			     <TELL " ">
			     <TELL-THE <NOUN-PHRASE-OBJ1 .TMP>>
			     <THIS-IS-IT <NOUN-PHRASE-OBJ1 .TMP>>)
			    (T
			     <COND ;(<MOBY-FIND? .SEARCH>
				     <TELL "anyw">)
				   (T <TELL "right ">)>
			     <TELL "here">)>)>
	       <TELL ".]" CR>)
	      (T <MORE-SPECIFIC>)>>>

<DEFAULT-DEFINITION WINNER-SAYS-WHICH?
<DEFINE WINNER-SAYS-WHICH? (NP)
	<>>>

<DEFAULT-DEFINITION WHICH-LIST?
<DEFINE WHICH-LIST? (NP SR "AUX" (CT <FIND-RES-COUNT .SR>))
 <COND (<AND <L=? .CT <FIND-RES-SIZE .SR>>
	     <OR <NOT <EQUAL? .CT 1>>
		 <NOT <EQUAL? <ZGET <REST-TO-SLOT ,ORPHAN-SR FIND-RES-OBJ1> 0>
			      ,PSEUDO-OBJECT>>>>
	T)>>>

<DEFAULT-DEFINITION WHICH-PRINT
<DEFINE WHICH-PRINT ("OPT" (NP <GET-NP>))
	<REPEAT ((PTR <NP-LEXEND .NP>)
		 (NOUN <NP-NAME .NP>))
		<COND (<==? .NOUN <ZGET .PTR 0>>
		       <SETG P-OFLAG </ <- .PTR ,P-LEXV> 2>>
		       <COPYT ,G-LEXV ,O-LEXV ,LEXV-LENGTH-BYTES>
		       <COPYT ,G-INBUF ,O-INBUF <+ 1 ,INBUF-LENGTH>>
		       <ZPUT ,OOPS-TABLE ,O-AGAIN <ZGET ,OOPS-TABLE ,O-START>>
		       <RETURN>)
		      (<G? ,P-LEXV <SET PTR <- .PTR ,LEXV-ELEMENT-SIZE-BYTES>>>
		       <RFALSE>)>>
    <PROG ((SR ,ORPHAN-SR) (TMP <>)
	   (LEN <FIND-RES-COUNT .SR>) (SZ <FIND-RES-SIZE .SR>))
	<COND (<AND <NOT <==? ,WINNER ,PLAYER>>
		    <NOT <SET TMP <WINNER-SAYS-WHICH? .NP>>>>
	       <TELL "\"I don't understand ">
	       <COND (<WHICH-LIST? .NP .SR>
		      <TELL "if">)
		     (T
		      <TELL "which">
		      <COND (<T? .NP>
			     <TELL !\ >
			     <NP-PRINT .NP>)>)>)
	      (<EQUAL? .TMP T>
	       <RTRUE>)
	      (T
	       <TELL "[Which">
	       <COND (<T? .NP>
		      <TELL !\ >
		      <NP-PRINT .NP>)>
	       <TELL " do">)>
	<TELL " you mean">
	<COND (<WHICH-LIST? .NP .SR>
	       <COND (<OR .TMP <==? ,WINNER ,PLAYER>>
		      <TELL !\,>)>
	       <REPEAT ((REM .LEN) (VEC <REST-TO-SLOT .SR FIND-RES-OBJ1>))
		<TELL !\ >
		<TELL-THE <ZGET .VEC 0>>
		<COND (<==? .REM 2>
		       <COND (<NOT <==? .LEN 2>>
			      <TELL !\,>)>
		       <TELL " or">)
		      (<G? .REM 2>
		       <TELL !\,>)>
		<COND (<L? <SET REM <- .REM 1>> 1>
		       <RETURN>)
		      (<L? <SET SZ <- .SZ 1>> 1>
		       <COND (T ;<ZERO? <SET SR <FIND-RES-NEXT .SR>>>
			      <RETURN>)>
		       ;<SET SZ ,FIND-RES-MAXOBJ>
		       ;<SET VEC <REST-TO-SLOT .SR OBJLIST-NEXT>>)
		      (T <SET VEC <ZREST .VEC 2>>)>>)>
	<COND (<AND <NOT <==? ,WINNER ,PLAYER>>
		    <NOT .TMP>>
	       <TELL ,PIC>)
	      (T
	       <TELL "?]" CR>)>>>>

<DEFINE NP-PRINT (NP:PMEM "OPT" (DO-QUANT <>) "AUX" LEN)
 <COND (<OBJECT? .NP>
	<TELL-THE .NP>)
       (<PMEM-TYPE? .NP NPP>	;3
	<REPEAT ()
		<COND (<SET LEN <NPP-NOUN .NP>>
		       <NP-PRINT .LEN>
		       ;<TELL " ">)>
		;<COND (<SET LEN <NPP-NOUN-PHRASE .NP>>
		       <NP-PRINT .LEN>
		       <TELL " ">)>
		<COND (<NOT <SET NP <NPP-NEXT .NP>>>
		       <RETURN>)
		      (T <TELL " and ">)>>)
       (<PMEM-TYPE? .NP NOUN-PHRASE>
	<COND (<SET LEN <NOUN-PHRASE-COUNT .NP>>
	       <DEC LEN>
	       <REPEAT (OBJ (CT 0))
		<COND (<SET OBJ <ZGET .NP <+ ,NOUN-PHRASE-HEADER-LEN
					     <* .CT 2>>>>
		       <TELL-THE .OBJ>)>
		<COND (<G? <SET CT <+ .CT 1>> .LEN>
		       <RETURN>)
		      (T <TELL ", ">)>>)>)
       (T
	<COND (<AND <T? .DO-QUANT>
		    <SET LEN <NP-QUANT .NP>>>	;"sounds bad after 'any'"
	       <PRINTB <GET-QUANTITY-WORD .LEN>>
	       <COND (<NP-NAME .NP>
		      <TELL !\ >)>)>
	<COND (<SET LEN <NP-ADJS .NP>>
	       <ADJS-PRINT .LEN>)>
	<COND (<AND <SET LEN <NP-LEXEND .NP>>
		    <OR <==? <ZGET .LEN 0> <NP-NAME .NP>>
			<AND <COMPARE-WORD-TYPES
			      <WORD-CLASSIFICATION-NUMBER <ZGET .LEN 0>>
			      <GET-CLASSIFICATION END-OF-INPUT>>
			     <L? ,P-LEXV
			       <SET LEN <ZBACK .LEN ,LEXV-ELEMENT-SIZE-BYTES>>>
			     <==? <ZGET .LEN 0> <NP-NAME .NP>>>>>
	       <BUFFER-PRINT .LEN <ZREST .LEN ,P-WORDLEN> <> T>)
	      (<SET LEN <NP-NAME .NP>>
	       <PRINT-VOCAB-WORD .LEN>)>
	<COND (<AND <SET LEN <NP-OF .NP>>
		    <PMEM? .LEN>
		    <PMEM-TYPE? .LEN NP>>
	       <TELL " of ">
	       <NP-PRINT .LEN>)>
	<COND (<AND <SET LEN <NP-EXCEPT .NP>>
		    <PMEM? .LEN>
		    <PMEM-TYPE? .LEN NP>>
	       <TELL " except ">
	       <NP-PRINT .LEN>)>)>>

<DEFINE ADJS-PRINT (ADJT "AUX" LEN)
 <COND (<SET LEN <ADJS-POSS .ADJT>>
	<COND (<EQUAL? .LEN ,PLAYER ;,ME>
	       <TELL "your ">)
	      (T
	       <NP-PRINT ;TELL-THE .LEN>
	       <TELL "'s ">)>)>
 <COND (<SET LEN <ADJS-COUNT .ADJT>>
	<SET ADJT <REST-TO-SLOT .ADJT ADJS-COUNT 1>>
	<COND (<G? .LEN ,ADJS-MAX-COUNT>
	       <SET LEN ,ADJS-MAX-COUNT>)>
	<DEC LEN>
	<SET ADJT <ZREST .ADJT <* 2 .LEN>>>
	<REPEAT (WD (CT 0) TMP)
	 <COND (<SET WD <ZGET .ADJT 0>> ;"kludge to avoid WD/ 0 (pdl)"
		<COND (<EQUAL? .WD ,W?MY>
		       <TELL "your ">)
		      (<EQUAL? .WD ,W?INT.NUM ,W?INT.TIM>
		       <TELL N ,P-NUMBER>	;"good enough?"
		       <TELL !\ >)
		      (<NOT <EQUAL? .WD ,W?NO.WORD>>
		       <COND (<AND <CAPITAL-NOUN? .WD>
				   <SET TMP <GETB ,P-LEXV ,P-LEXWORDS>>
				   <SET TMP
					<INTBL? .WD
						<REST-TO-SLOT ,P-LEXV
							      LEXV-START>
						.TMP *204*>>>
			      <CAPITALIZE .TMP>)
			     (T
			      <PRINT-VOCAB-WORD .WD>)>
		       <TELL !\ >)>)>
	 <COND (<G? <SET CT <+ .CT 1>> .LEN>
		<RETURN>)
	       (T <SET ADJT <ZBACK .ADJT 2>>)>>)>>

<DEFAULT-DEFINITION TOO-MANY-NOUNS
<DEFINE TOO-MANY-NOUNS (WD)
	<TELL "[I can't understand that many nouns with ">
	<COND (<T? .WD>
	       <TELL !\">
	       <PRINT-VOCAB-WORD .WD>
	       <TELL !\">)
	      (T <TELL "that verb">)>
	<TELL ".]" CR>>>

<DEFINE INBUF-ADD (LEN:FIX BEG:FIX SLOT:FIX "AUX" DBEG:FIX TMP)
	 <SET TMP <ZGET ,OOPS-TABLE ,O-END>>
	 <COND (<T? .TMP>
		<SET DBEG .TMP>)
	       (T
		<SET TMP <* ,P-WORDLEN <ZGET ,OOPS-TABLE ,O-LENGTH>>>
		<SET DBEG <+ <GETB ,G-LEXV .TMP>
			     <GETB ,G-LEXV <+ .TMP 1>>>>)>
	 <COND (<L? ,INBUF-LENGTH <+ .DBEG <- .LEN 1>>>
		<COND (<G? .LEN 6>
		       <COND (<L? ,INBUF-LENGTH <+ .DBEG 5>>
			      <RFALSE>)
			     (ELSE <SET LEN 6>)>)
		      (ELSE <RFALSE>)>)>
	 <ZPUT ,OOPS-TABLE ,O-END <+ .DBEG .LEN>>
	 <COND (T ;<OR <CHECK-EXTENDED? XZIP>
		    <CHECK-EXTENDED? YZIP>>
		<COPYT <ZREST ,P-INBUF .BEG> <ZREST ,G-INBUF .DBEG> .LEN>)
	       ;(T
		<REPEAT ((CTR:FIX 0))
			<PUTB ,G-INBUF <+ .DBEG .CTR>
			      <GETB ,P-INBUF <+ .BEG .CTR>>>
			<SET CTR <+ .CTR 1>>
			<COND (<EQUAL? .CTR .LEN>
			       <RETURN>)>>)>
	 <PUTB ,G-LEXV .SLOT .DBEG>
	 <PUTB ,G-LEXV <- .SLOT 1> .LEN>
	 T>

<DEFINE INBUF-PRINT (WD INBUF LEXV SLOT:FIX
		     "AUX" DBEG:FIX (CTR:FIX 0) TMP (LEN:FIX 11))
	 <SET TMP <ZGET ,OOPS-TABLE ,O-END>>
	 <COND (<T? .TMP>
		<SET DBEG .TMP>)
	       (T
		<SET TMP <* ,P-WORDLEN <ZGET ,OOPS-TABLE ,O-LENGTH>>>
		<SET DBEG <+ <GETB .LEXV .TMP>
			     <GETB .LEXV <+ .TMP 1>>>>)>
	 <COND (<L? <GETB .INBUF 0> <+ .DBEG <- .LEN 1>>>
		<RFALSE>)>
	 <COND ;(<NOT <CHECK-EXTENDED?>> <RFALSE>)
	       (T
		<DIROUT ,D-TABLE-ON <ZREST .INBUF .DBEG>>
		<PRINT-VOCAB-WORD .WD>
		<DIROUT ,D-TABLE-OFF>
		<SET LEN <GETB .INBUF <+ 1 .DBEG>>>)>
	 <SET DBEG <+ 2 .DBEG>>
	 <ZPUT ,OOPS-TABLE ,O-END <+ .DBEG .LEN>>
	 <PUTB .LEXV .SLOT .DBEG>
	 <PUTB .LEXV <- .SLOT 1> .LEN>
	 T>

<DEFAULT-DEFINITION YES?

<ROUTINE YES? ("AUX" X)
	 <REPEAT ()
         <TELL "|>">
	     <SET X <INPUT 1>>
	     <COND (<EQUAL? .X !\Y !\y ,CLICK1 ,CLICK2>
		        <TELL "Y">
                <SET X T>
		        <RETURN>)
		       (<EQUAL? .X !\N !\n>
		        <TELL "N">
                <SET X <>>
		        <RETURN>)
		       (T
		        <TELL "[Please type Y or N.]">)>>
	 <CRLF>
	 <RETURN .X>>

;[<CONSTANT YES-INBUF <ITABLE 19 (BYTE LENGTH) 0>>
<CONSTANT YES-LEXV  <ITABLE 3 (LEXV) 0 0>>

<DEFINE YES? ("OPT" (NO-Q <>) "AUX" WORD VAL)
	;<COND (<NOT .NO-Q>
	       <TELL !\?>)>
	<REPEAT ()
		<PRINTI "|>">
		<COND (T ;<OR <CHECK-EXTENDED? XZIP>
			   <CHECK-EXTENDED? YZIP>>
		       <PUTB ,YES-INBUF 1 0>)>
		<COND (,DEMO-VERSION? <READ-DEMO ,YES-INBUF ,YES-LEXV>)
		      (T <ZREAD ,YES-INBUF ,YES-LEXV>)>
		<COND (<AND <NOT <0? <GETB ,YES-LEXV ,P-LEXWORDS>>>
			    <SET WORD <ZGET ,YES-LEXV ,P-LEXSTART>>>
		       <COND (<COMPARE-WORD-TYPES
			       <WORD-CLASSIFICATION-NUMBER .WORD>
			       <GET-CLASSIFICATION VERB>>
			      <SET VAL <WORD-VERB-STUFF .WORD>>)
			     (T <SET VAL <>>)>
		       <COND (<OR <EQUAL? .VAL ,ACT?YES ,W?YES %<ASCII !\Y> ,W?Y !\Y !\y>
				          <EQUAL? .WORD ,ACT?YES ,W?YES %<ASCII !\Y> ,W?Y !\Y !\y>>
			      <SET VAL T>
			      <RETURN>)
			     (<OR <EQUAL? .VAL ,ACT?NO ,W?NO %<ASCII !\N> ,W?N !\N !\n>
				      <EQUAL? .WORD ,ACT?NO ,W?NO %<ASCII !\N> ,W?N !\N !\n>>
			      <SET VAL <>>
			      <RETURN>)
			     (<OR <EQUAL? .VAL ,ACT?RESTART>
				      <EQUAL? .WORD ,W?RESTART>>
			      <V-RESTART>)
			     (<OR <EQUAL? .VAL ,ACT?RESTORE ,W?RESTORE %<ASCII !\R> !\R !\r>
				      <EQUAL? .WORD ,ACT?RESTORE ,W?RESTORE %<ASCII !\R> !\R !\r>>
			      <V-RESTORE>)
			     (<OR <EQUAL? .VAL ,ACT?QUIT ,W?QUIT %<ASCII !\Q> !\Q !\q>
				      <EQUAL? .WORD ,ACT?QUIT ,W?QUIT %<ASCII !\Q> !\Q !\q>>
			      <V-QUIT T>)>)>
		<TELL "[Please type YES or NO.]">>
	.VAL>]>

<DEFAULT-DEFINITION SETUP-ORPHAN
<DEFINE SETUP-ORPHAN (STR "OPT" (A <>) (B <>))
	<DIROUT ,D-TABLE-ON ,O-INBUF>
	<TELL .STR>
	<COND (<T? .A>
	       <COND (T ;<OBJECT? .A>
		      <D-J .A>)
		     ;(T <TELL .A>)>
	       <COND (<T? .B>
		      <COND ;(<OBJECT? .B>
			     <TELL D .B>)
			    (T <TELL .B>)>)>)>
	;<PRINTC 0>	;"Some ZIPs might need this."
	<DIROUT ,D-TABLE-OFF>
	<PUTB ,O-INBUF 0 ,INBUF-LENGTH>
	<PUTB ,O-LEXV 0 ,LEXV-LENGTH>
	<LEX ,O-INBUF ,O-LEXV>
	<COND (<ZERO? <SET A <GETB ,O-LEXV ,P-LEXWORDS>>>	;"any words?"
	       <>)
	      (<INTBL? 0 <ZREST ,O-LEXV <* 2 ,P-LEXSTART>> .A *204*>
							;"any unknown words?"
	       <>)
	      (T
	       <SETG P-OFLAG <+ 1 <* ,P-LEXELEN <GETB ,O-LEXV ,P-LEXWORDS>>>>
	       <MAKE-ROOM-FOR-TOKENS 1 ,O-LEXV ,P-OFLAG>
	       <ZPUT ,O-LEXV ,P-OFLAG ,W?NO.WORD ;0>
	       <SETG P-OFLAG <- 0 ,P-OFLAG>>	;"for verbose response"
	       <FIND-RES-COUNT ,ORPHAN-SR 0>
	       <ZPUT ,OOPS-TABLE ,O-AGAIN ;,O-START
				 <ZREST ,P-LEXV <* 2 ,P-LEXSTART>>>
	       T)>>>

<DEFAULT-DEFINITION SETUP-ORPHAN-NP

;"<SYNTAX SWG = V-SWG>
<DEFINE V-SWG ()
 <COND (<SETUP-ORPHAN-NP 'take frob' ,RED-FROB ,GREEN-FROB>
	<TELL 'Which frob do you want?' CR>)
       (T <TELL 'Nope.' CR>)>>"

<DEFINE SETUP-ORPHAN-NP (STR OBJ1 OBJ2 "OPT" (OBJ3 <>) "AUX" NUM VEC)
	<DIROUT ,D-TABLE-ON ,O-INBUF>
	<TELL .STR>
	;<PRINTC 0>	;"Some ZIPs might need this."
	<DIROUT ,D-TABLE-OFF>
	<PUTB ,O-INBUF 0 ,INBUF-LENGTH>
	<PUTB ,O-LEXV 0 ,LEXV-LENGTH>
	<LEX ,O-INBUF ,O-LEXV>
	<COND (<ZERO? <SET NUM <GETB ,O-LEXV ,P-LEXWORDS>>>	;"any words?"
	       <>)
	      (<INTBL? 0 <ZREST ,O-LEXV <* 2 ,P-LEXSTART>> .NUM *204*>
							;"any unknown words?"
	       <>)
	      (T
	       <SETG P-OFLAG <- 1 <* ,P-LEXELEN <GETB ,O-LEXV ,P-LEXWORDS>>>>
	       <ZPUT ,OOPS-TABLE ,O-END <+ 2 <GETB ,O-INBUF 1>>>
	       <ZPUT ,OOPS-TABLE ,O-AGAIN ;,O-START
				 <ZREST ,P-LEXV <* 2 ,P-LEXSTART>>>
	       <SET VEC <REST-TO-SLOT ,ORPHAN-SR FIND-RES-OBJ1>>
	       <ZPUT .VEC 0 .OBJ1>
	       <ZPUT .VEC 1 .OBJ2>
	       <SET NUM 2>
	       <COND (<T? .OBJ3>
		      <INC NUM>
		      <ZPUT .VEC 2 .OBJ3>)>
	       <FIND-RES-COUNT ,ORPHAN-SR .NUM>
	       T)>>>

<DEFINE INSERT-ADJS (E "AUX" CT (PTR <ABS ,P-OFLAG>))
 <COND (<NOT <EQUAL? .E <> T>>
	<COND (<SET CT <ADJS-POSS .E>>
	       <COND (<PMEM? .CT>
		      <SET CT <NP-NAME .CT>>)
		     (<EQUAL? .CT ,PLAYER>
		      <SET CT ,W?MY>)
		     (T
		      <SET CT <ZGET <GETPT .CT ,P?SYNONYM> 0>>)>
	       <COND (<EQUAL? .CT ,W?MY>
		      <SET PTR <INSERT-ADJS-WD .PTR .CT>>)
		     (T
		      <IFFLAG (P-APOSTROPHE-BREAKS-WORDS
			       <SET PTR <INSERT-ADJS-WD .PTR .CT>>
			       <SET PTR <INSERT-ADJS-WD .PTR ,W?APOSTROPHE>>
			       <SET PTR <INSERT-ADJS-WD .PTR ,W?S>>)
			      (T	;"Find next word in vocabulary."
			       <SET CT <+ .CT <GETB <ZREST ,VOCAB
							 <+ 1 <GETB ,VOCAB 0>>>
						    0>>>
			       <SET PTR <INSERT-ADJS-WD .PTR .CT>>)>)>)>
	<COND (<SET CT <ADJS-COUNT .E>>
	       <SET E <REST-TO-SLOT .E ADJS-COUNT 1>>
	       <REPEAT (WD)
		       <COND (<DLESS? CT 0>
			      <RETURN>)
			     (<EQUAL? <SET WD <ZGET .E .CT>>
				      <ZGET ,ERROR-ARGS 3>>	;"e.g. OPEN"
			      <AGAIN>)>
		       <SET PTR <INSERT-ADJS-WD .PTR .WD>>>)>)>>

<DEFINE INSERT-ADJS-WD (PTR WD)
	<MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PTR>
	<ZPUT ,G-LEXV .PTR .WD>
	<SET PTR <+ .PTR ,P-LEXELEN>>
	<INBUF-PRINT .WD ,G-INBUF ,G-LEXV <- <* 2 .PTR> 1>>
	.PTR>

;<DEFAULT-DEFINITION PARSER-REPORT
<DEFINE PARSER-REPORT ()
 <PRINTI "[Parser used: ">
 <PRINTN <* 2 <- ,PMEM-STORE-LENGTH ,PMEM-STORE-WARN>>>
 <PARSER-REPORT-STACK ,STATE-STACK>
 <PARSER-REPORT-STACK ,DATA-STACK>
 <PRINTC !\+>
 <REPEAT ((PTR <ZREST ,SPLIT-STACK 2>) (N <- ,MAX-PSTACK-SIZE 1>))
	<COND (<SET PTR <INTBL? 0 .PTR .N>>
	       <COND (<AND <0? <ZGET .PTR 1>>
			   <0? <ZGET .PTR 2>>>
		      <PRINTN <- .PTR <ZREST ,SPLIT-STACK 2>>>
		      <RETURN>)
		     (T
		      <SET PTR <ZREST .PTR 2>>
		      <SET N <+ -1 <- ,MAX-PSTACK-SIZE
				      </ <- .PTR ,SPLIT-STACK> 2>>>>)>)
	      (T
	       <PRINTN <* 2 <- ,MAX-PSTACK-SIZE 1>>>
	       <RETURN>)>>
 <PRINTI " bytes.]">
 <CRLF>>

<DEFINE PARSER-REPORT-STACK (STK "AUX" N)
 <PRINTC !\+>
 <SET N ,MAX-PSTACK-SIZE>
 <REPEAT ()
	<COND (<OR <DLESS? N 1>
		   <0? <ZGET .STK .N>>>
	       <PRINTN <* 2 <- <- ,MAX-PSTACK-SIZE .N> 1>>>
	       <RTRUE>)>>>>

<END-SEGMENT>
<ENDPACKAGE>
