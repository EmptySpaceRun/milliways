"REDS file: imitates old parser.
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<ZZPACKAGE "reds">

<ENTRY	RED-SP RED-ADV RED-PART
	RED-SV RED-SVN RED-SVPNPN RED-SVD
	RED-PERS RED-VP RED-NP RED-OF RED-QT RED-QN RED-NPP RED-PP
	RED-POSS RED-ADJ RED-ADJS RED-QUOTE>

<IF-P-THIRD-PART <ENTRY RED-SVPNPNPN>>

<ENTRY	RED-O-ADJ RED-O-PP RED-O-NP NUMERIC-ADJ? DIR-VERB-WORD?>

<ENTRY ABS>

<INCLUDE "basedefs" "find" "pbitdefs" "pdefs">

<USE ;"NEWSTRUC" "parser" "pmem" "pstack">

<FILE-FLAGS MDL-ZIL? ;ZAP-TO-SOURCE-DIRECTORY?>

<BEGIN-SEGMENT 0>

<DEFAULTS-DEFINED
	DIR-VERB-PRSI?
	DIR-VERB-WORD?
	NOT-HERE-VERB?>

;"This enables a hack in RED-O-NP that may allow some obscure orphaning
  stuff to work."
<COMPILATION-FLAG-DEFAULT HACK-ORPHAN-NOUNS T>

<DEFAULT-DEFINITION DIR-VERB-PRSI?
<DEFINE DIR-VERB-PRSI? (NP)
	<AND <EQUAL? <PARSE-ACTION ,PARSE-RESULT>
		     ,V?MOVE-DIR ,V?RIDE-DIR ,V?ROLL-DIR ,V?SET-DIR>
         ;<TELL "|||[PARSED ACTION FOR DIR-VERB]|||">
	     <NOT <EQUAL? <NOUN-PHRASE-OBJ1 .NP> ,INTDIR ,LEFT-RIGHT>>>>>

<DEFAULT-DEFINITION DIR-VERB-WORD?
	<DEFMAC DIR-VERB-WORD? ('WD)
		<FORM EQUAL? .WD ',W?WALK ',W?GO ',W?RUN>>>

<DEFAULT-DEFINITION NOT-HERE-VERB?
	<DEFMAC NOT-HERE-VERB? ('V) <FORM EQUAL? .V ',V?WALK-TO>>> 

<DEFMAC ABS ('NUM)
	<FORM COND (<FORM L? .NUM 0> <FORM - 0 .NUM>)
	           (T .NUM)>>



;"FOR MY OWN GOOD:
   The first argument in the set, here N, counts the number of parts
to the PRODUCTION. Use this to separate from one another.
   <POP-PSTACK ,DATA-STACK> takes the top part of the command (the
last one in the list) and removes it from the mix. This allows you
to proceed to the next one in the list."


"Generic reduction, which just returns a list of frobs"
<DEFINE RED-FCN ("OPT" N:FIX TYP:FIX)
	<COND (<==? .N 0>
	       T)
	      (<==? .N 1>
	       <POP-PSTACK ,DATA-STACK>)>>

<DEFINE RED-PART RP ("OPT" N:FIX TYP:FIX "AUX" WD)
	<COND (<==? .N 0>
	       <RETURN T .RP>)>
	<SET WD <POP-PSTACK ,DATA-STACK>>
	<COND (<AND <NOT <EQUAL? .WD T ,W?OF>>
		    <IFFLAG (P-ZORK0
			     <NOT <WORD-TYPE? .WD ,P-PARTICLE-CODE>>)
			    (T
			     <NOT <COMPARE-WORD-TYPES <WCN .WD>
					     <GET-CLASSIFICATION PARTICLE>>>)>>
	       <RETURN <> .RP>)
	      (<==? .N 1>
	       <RETURN .WD .RP>)
	      (T
	       <POP-PSTACK ,DATA-STACK>)>>

<DEFINE GET-SYNTAX GS (VA:TABLE NUM "OPT" (PREP 0) (GWIM <>) (SHUT-UP <>) "AUX" LEN)
  <COND (<==? .PREP 1>
	 <SET PREP 0>)>
  <COND (<1? .NUM>
	 <SET LEN ,VERB-ONE-SYNTAX-LEN ;6>)
    <IF-P-THIRD-PART
        (<=? 3 .NUM>
         <SET LEN ,VERB-THREE-SYNTAX-LEN>)>
    (T
	 <SET LEN ,VERB-TWO-SYNTAX-LEN ;10>)>
  <REPEAT ((CT:FIX <ZGET .VA 0>) S2 (P2 <PARSE-PARTICLE2 ,PARSE-RESULT>)
	   S3 (P3 <IFFLAG (P-THIRD-PART <PARSE-PARTICLE3 ,PARSE-RESULT>) (T <>)>) ;"BY MAX FOG"
       (GWIM-NOW <>)
	   (SYN <IF-MUDDLE <CHTYPE <ZREST .VA 2> VERB-SYNTAX>
			   <ZREST .VA 2>>))
    <COND (<AND <==? .PREP <SYNTAX-PREP ;1 .SYN 1>>
		<OR <1? .NUM>
		    <EQUAL? .P2
			    <SET S2 <SYNTAX-GET .SYN ,SYN-PREP 2>>>
		    <IF-P-THIRD-PART
             <EQUAL? .P3
			     <SET S3 <SYNTAX-GET .SYN ,SYN-PREP 3>>>>
            <AND <0? .S2>
			 <1? .P2>>
            <IF-P-THIRD-PART
             <AND <0? .S3>
			  <1? .P3>>>
		    <AND <T? .GWIM-NOW>
			 <T? <SET S2 <COND (<=? .NUM 1 3> .PREP) (T .S2)>>>
			 <ZPUT ,GWIM-MSG 0 .S2>>
            <IF-P-THIRD-PART
             <AND <T? .GWIM-NOW>
			  <T? <SET S3 <COND (<=? .NUM 1 2> .PREP) (T .S3)>>>
			  <ZPUT ,GWIM-MSG 0 .S3>>>>>
	   <PARSE-SYNTAX ;3 ,PARSE-RESULT .SYN>
	   <PARSE-ACTION ;4 ,PARSE-RESULT <SYNTAX-ID .SYN>>
	   <PARSE-PARTICLE1 ,PARSE-RESULT .PREP>
	   <IF-P-ZORK0
	      <COND (<AND <NOT .SHUT-UP>
			  ; "Don't say anything if we can't succeed"
			  <EQUAL? <PARSE-ACTION ,PARSE-RESULT>
				  ,V?RESEARCH ,V?SRESEARCH>>
		     <COND (<T? ,P-RESPONDED>
			    <BE-PATIENT <- 0 ,P-RESPONDED>>) ;"finish partial response"
			   (T
			    <SETG P-RESPONDED 1>)>
		     <PRINTI "You begin flipping the pages...|
   ">)>>
	   <RETURN .SYN .GS>)
	  (<L? <SET CT <- .CT 1>> 1>
	   <COND (<AND <T? .GWIM>
		       <F? .GWIM-NOW>>
		  <SET CT <ZGET .VA 0>>
		  <SET GWIM-NOW T>
		  <SET SYN <IF-MUDDLE <CHTYPE <ZREST .VA 2> VERB-SYNTAX>
				      <ZREST .VA 2>>>
		  <AGAIN>)
		 (T
		  <RETURN <> .GS>)>)
	  (T
	   <SET SYN <IF-MUDDLE <CHTYPE <ZREST .SYN .LEN> VERB-SYNTAX>
			       <ZREST .SYN .LEN>>>)>>>

"Reduction for case of verb with no objects.  If OK, win.  Otherwise,
 try defaulting (and go to case of verb with one object)/orphaning..."

<DEFINE RED-SV ("OPT" N:FIX TYP:FIX "AUX" SYN VERB PART DATA:VERB-DATA (OBJ <>))
    <SET PART <POP-PSTACK ,DATA-STACK>>
    <POP-PSTACK ,DATA-STACK>
    <COND (<SET VERB <ROOT-VERB <PARSE-VERB ,PARSE-RESULT>>>
	   <COND (<ZERO? <SET DATA <WORD-VERB-STUFF .VERB>>>
		  <RFALSE>)>
	   <IFFLAG (P-ZORK0
		    <COND (<AND <1? .PART>
				<L=? 0 <VERB-ZERO .DATA>:FIX>>
			   ;"Verb can take no args, so this flies"
			   <PARSE-ACTION ,PARSE-RESULT <VERB-ZERO .DATA>>
			   T)
			  (T
			   <COND (<AND <SET SYN <VERB-ONE .DATA>>
				       <SET SYN <GET-SYNTAX .SYN 1 .PART T T>>>
				  ; "Check for 1-arg syntax (quietly)"
				  <COND (<EQUAL? <PARSE-ACTION ,PARSE-RESULT>
						 ,V?RESEARCH ,V?SRESEARCH>
					 ; "if it's READ ABOUT, set up orphaning
					    and fail"
					 <DETERMINE-OBJ <> 1 <> T>
					 <RFALSE>)
					(T
					 ; "Otherwise look up the object.  If
					    succeed, win"
					 <COND (<SET OBJ <DETERMINE-OBJ <> 1>>
						<PARSE-OBJ1 ,PARSE-RESULT .OBJ>
						<RTRUE>)>)>)>
			   ; "Only come here if no one-object syntax, or no object
			      found (in non-RESEARCH case)"
			   <COND (<AND <SET SYN <VERB-TWO .DATA>>
				       <SET SYN <GET-SYNTAX .SYN 2 .PART T>>
				       <SET OBJ <DETERMINE-OBJ <> 1>>>
				  <PARSE-OBJ1 ,PARSE-RESULT .OBJ>
				  <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ>>
				  <COND (<SET OBJ <DETERMINE-OBJ <> 2>>
					 <PARSE-OBJ2 ,PARSE-RESULT .OBJ>
                     T)>)
                     
                    <IF-P-THIRD-PART
                     (<AND <SET SYN <VERB-THREE .DATA>>
				       <SET SYN <GET-SYNTAX .SYN 3 .PART T>>
				       <SET OBJ <DETERMINE-OBJ <> 1>>>
				  <PARSE-OBJ1 ,PARSE-RESULT .OBJ>
				  <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ>>
				  <COND (<SET OBJ <DETERMINE-OBJ <> 2>>
					 <PARSE-OBJ2 ,PARSE-RESULT .OBJ>
                     <COND (<SET OBJ <DETERMINE-OBJ <> 3>>
					    <PARSE-OBJ3 ,PARSE-RESULT .OBJ>
                        T)>)>)>>)>)
		   (T
		    <COND (<AND <1? .PART>
				<L=? 0 <VERB-ZERO .DATA>:FIX>>
			   ;"Verb can take no args, so this flies"
			   <PARSE-ACTION ,PARSE-RESULT <VERB-ZERO .DATA>>
			   T)
			  (<AND <SET SYN <VERB-ONE .DATA>>
				<SET SYN <GET-SYNTAX .SYN 1 .PART T>>
				<SET OBJ <DETERMINE-OBJ <> 1>>>
			   <PARSE-OBJ1 ,PARSE-RESULT .OBJ>
			   T)
			  (<AND <SET SYN <VERB-TWO .DATA>>
				<SET SYN <GET-SYNTAX .SYN 2 .PART T>>
				<SET OBJ <DETERMINE-OBJ <> 1>>>
			   <PARSE-OBJ1 ,PARSE-RESULT .OBJ>
			   <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ>>
			   <COND (<SET OBJ <DETERMINE-OBJ <> 2>>
				  <PARSE-OBJ2 ,PARSE-RESULT .OBJ>
				  T)>)
              <IF-P-THIRD-PART
               (<AND <SET SYN <VERB-THREE .DATA>>
				 <SET SYN <GET-SYNTAX .SYN 3 .PART T>>
				 <SET OBJ <DETERMINE-OBJ <> 1>>>
			    <PARSE-OBJ1 ,PARSE-RESULT .OBJ>
			    <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ>>
			    <COND (<SET OBJ <DETERMINE-OBJ <> 2>>
			       <PARSE-OBJ2 ,PARSE-RESULT .OBJ>
			       <COND (<SET OBJ <DETERMINE-OBJ <> 3>>
					    <PARSE-OBJ3 ,PARSE-RESULT .OBJ>
                        T)>)>)>>)>)>>

<DEFINE ROOT-VERB (VERB "AUX" DATA)
	<COND (<AND <BAND ,PAST-TENSE <WORD-FLAGS .VERB>> ;"other tenses?"
		    <SET DATA <WORD-SEMANTIC-STUFF .VERB>>>
	       <SET VERB .DATA>)>
	.VERB>

<DEFINE RED-SVN ("OPT" N:FIX TYP:FIX "AUX" VERB PART1 PART2 DATA OBJ)
   <SET PART2 <POP-PSTACK ,DATA-STACK>>
   <SET OBJ <POP-PSTACK ,DATA-STACK>>
   <SET PART1 <POP-PSTACK ,DATA-STACK>>
   <POP-PSTACK ,DATA-STACK>
   <COND (<AND <SET VERB <ROOT-VERB <PARSE-VERB ,PARSE-RESULT>>>
	       <SET DATA <WORD-VERB-STUFF .VERB>>>
	  <COND (<EQUAL? .PART1 T>
		 <COND (<SVN .PART2 .DATA .OBJ>
			<RTRUE>)>
		 <PARSE-PARTICLE2 ,PARSE-RESULT .PART2>)>
	  <SVN .PART1 .DATA .OBJ>)>>

<DEFINE SVN (PART DATA OBJ "AUX" SYN OBJ1 OBJ2 OBJ3)
   <COND (<AND <ZERO? <PARSE-PARTICLE2 ,PARSE-RESULT>>
	       <SET SYN <VERB-ONE .DATA>>
	       <SET SYN <GET-SYNTAX .SYN 1 .PART>>>
	  <COND (<NOT <SET OBJ1 <DETERMINE-OBJ .OBJ 1>>>
		 <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .OBJ
			       .PART <SYNTAX-SEARCH .SYN 1>>)
		(<AND <EQUAL? ,INTDIR <NOUN-PHRASE-OBJ1 .OBJ1>>
		      <DIR-VERB-WORD? <PARSE-VERB ,PARSE-RESULT>>
		      <PUSH-PSTACK ,DATA-STACK <NP-NAME .OBJ>>>
		 <RED-SD 1>)
		(T
		 <PARSE-OBJ1 ,PARSE-RESULT .OBJ1>
		 ,PARSE-RESULT)>)
	 (<AND <SET SYN <VERB-TWO .DATA>>
	       <SET SYN <GET-SYNTAX .SYN 2 .PART T>>>
	  <COND (<NOT <SET OBJ1 <DETERMINE-OBJ .OBJ 1>>>
		 <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .OBJ
			       .PART <SYNTAX-SEARCH .SYN 1>>)
		(T
		 <PARSE-OBJ1 ,PARSE-RESULT .OBJ1>
		 <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ1>>
		 <COND (<SET OBJ2 <DETERMINE-OBJ <> 2>>
			<PARSE-OBJ2 ,PARSE-RESULT .OBJ2>
			,PARSE-RESULT)>)>)
     <IF-P-THIRD-PART
     (<AND <SET SYN <VERB-THREE .DATA>>
	       <SET SYN <GET-SYNTAX .SYN 3 .PART T>>>
	  <COND (<NOT <SET OBJ1 <DETERMINE-OBJ .OBJ 1>>>
		 <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .OBJ
			       .PART <SYNTAX-SEARCH .SYN 1>>)
		(T
		 <PARSE-OBJ1 ,PARSE-RESULT .OBJ1>
		 <ZPUT ,ORPHAN-S ,O-OBJECT <NOUN-PHRASE-OBJ1 .OBJ1>>
		 <COND (<SET OBJ3 <DETERMINE-OBJ <> 3>>
			<PARSE-OBJ3 ,PARSE-RESULT .OBJ3>
			,PARSE-RESULT)>)>)>>>

<DEFINE RED-SVPNPN ("OPT" N:FIX TYP:FIX "AUX" N1 N2 (PART <>) P2 OBJ1 OBJ2 SYN)
	;<TELL "|||[RUNNING 2 NOUN]|||">
    <SET N2 <POP-PSTACK ,DATA-STACK>>
	<SET P2 <POP-PSTACK ,DATA-STACK>>
	<COND (<EQUAL? .P2 T>
	       <PARSE-PARTICLE2 ;8 ,PARSE-RESULT <OR <ZGET ,GWIM-MSG 0> 1>>)
	      (T
	       <PARSE-PARTICLE2 ;8 ,PARSE-RESULT .P2>)>
	<SET N1 <POP-PSTACK ,DATA-STACK>>
	<COND (T ;<==? .N 4>
	       <SET PART <POP-PSTACK ,DATA-STACK>>)>
	;<COND (<AND <EQUAL? <PARSE-VERB ,PARSE-RESULT> ,W?SAY>
		    <EQUAL? .P2 ,W?TO>
		    <PMEM? .N1>
		    <PMEM-TYPE? .N1 NOUN-PHRASE>
		    <EQUAL? <NOUN-PHRASE-OBJ1 .N1> ,INTQUOTE>>
	       ;"etc."
	       )>
	<COND (<NOT <SET SYN <ROOT-VERB <PARSE-VERB ,PARSE-RESULT>>>>
	       <PARSER-ERROR 0 ;"No syntax" ,PARSER-ERROR-NOUND>)
	      (<NOT <SET SYN <WORD-VERB-STUFF .SYN>>>
	       <>)
	      (<NOT <SET SYN <VERB-TWO .SYN>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-TMNOUN>)
	      (<NOT <SET SYN <GET-SYNTAX .SYN 2 .PART>>>
	       <PARSER-ERROR 0 ;"No syntax" ,PARSER-ERROR-NOUND>)
	      (<NOT <SET OBJ1 <DETERMINE-OBJ .N1 1>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .N1 .PART <SYNTAX-SEARCH .SYN 1>>)
	      (<NOT <SET OBJ2 <DETERMINE-OBJ .N2 2>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .N2 .PART <SYNTAX-SEARCH .SYN 2>>)
	      (<DIR-VERB-PRSI? .OBJ2>
	       <PARSER-ERROR 0 ;"Not a direction" ,PARSER-ERROR-NOUND>)
	      (T
	       <POP-PSTACK ,DATA-STACK>
	       <PARSE-OBJ1 ,PARSE-RESULT .OBJ1>
	       <PARSE-OBJ2 ,PARSE-RESULT .OBJ2>
	       T)>>

<IF-P-THIRD-PART
<DEFINE RED-SVPNPNPN ("OPT" N:FIX TYP:FIX "AUX" N1 N2 N3 (PART <>) P2 P3 OBJ1 OBJ2 OBJ3 SYN SYNTHREE)
    ;<TELL "|||[RUNNING 3 NOUN]|||">
    <SET N3 <POP-PSTACK ,DATA-STACK>>
	<SET P3 <POP-PSTACK ,DATA-STACK>>
	<COND (<EQUAL? .P3 T>
	       <PARSE-PARTICLE3 ;8 ,PARSE-RESULT <OR <ZGET ,GWIM-MSG 0> 1>>)
	      (T
	       <PARSE-PARTICLE3 ;8 ,PARSE-RESULT .P3>)>
    
    ;<TELL "||[FINISHED THE THIRD NOUNS]||">
    <SET N2 <POP-PSTACK ,DATA-STACK>>
	<SET P2 <POP-PSTACK ,DATA-STACK>>
	<COND (<EQUAL? .P2 T>
	       <PARSE-PARTICLE2 ;8 ,PARSE-RESULT <OR <ZGET ,GWIM-MSG 0> 1>>)
	      (T
	       <PARSE-PARTICLE2 ;8 ,PARSE-RESULT .P2>)>
	
    ;<TELL "||[FINISHED THE SECOND NOUN]||">
    <SET N1 <POP-PSTACK ,DATA-STACK>>
	<COND (T ;<==? .N 4>
	       <SET PART <POP-PSTACK ,DATA-STACK>>)>
	;<COND (<AND <EQUAL? <PARSE-VERB ,PARSE-RESULT> ,W?SAY>
		    <EQUAL? .P2 ,W?TO>
		    <PMEM? .N1>
		    <PMEM-TYPE? .N1 NOUN-PHRASE>
		    <EQUAL? <NOUN-PHRASE-OBJ1 .N1> ,INTQUOTE>>
	       ;"etc."
	       )>
	<COND (<NOT <SET SYN <ROOT-VERB <PARSE-VERB ,PARSE-RESULT>>>>
	       <PARSER-ERROR 0 ;"No syntax" ,PARSER-ERROR-NOUND>)
	      (<NOT <SET SYN <WORD-VERB-STUFF .SYN>>>
	       <>)
	      (<AND ;<IF-P-DEBUGGING-PARSER <TELL "|||[WORD-VERB-STUFF DONE]|||">>
                <NOT <SET SYNTHREE <VERB-THREE .SYN>>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-TMNOUN>)
	      (<AND ;<IF-P-DEBUGGING-PARSER <TELL "|||[VERB-THREE DONE]|||">>
                <NOT <SET SYNTHREE <GET-SYNTAX .SYNTHREE 3 .PART>>>>
	       <PARSER-ERROR 0 ;"No syntax" ,PARSER-ERROR-NOUND>)
	      (<AND ;<IF-P-DEBUGGING-PARSER <TELL "|||[GET-SYNTAX 3 DONE]|||">>
                <NOT <SET OBJ1 <DETERMINE-OBJ .N1 1>>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .N1 .PART <SYNTAX-SEARCH .SYN 1>>)
	      (<NOT <SET OBJ2 <DETERMINE-OBJ .N2 2>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .N2 .PART <SYNTAX-SEARCH .SYN 2>>)
          (<NOT <SET OBJ3 <DETERMINE-OBJ .N3 3>>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .N3 .PART <SYNTAX-SEARCH .SYN 3>>)
	      (<DIR-VERB-PRSI? .OBJ3>
	       <PARSER-ERROR 0 ;"Not a direction" ,PARSER-ERROR-NOUND>)
          (<DIR-VERB-PRSI? .OBJ2>
	       <PARSER-ERROR 0 ;"Not a direction" ,PARSER-ERROR-NOUND>)
	      (T
	       ;<IF-P-DEBUGGING-PARSER <TELL "||[POPPING THE STACK]||">>
           <POP-PSTACK ,DATA-STACK>
	       <PARSE-OBJ1 ,PARSE-RESULT .OBJ1>
	       <PARSE-OBJ2 ,PARSE-RESULT .OBJ2>
           <PARSE-OBJ3 ,PARSE-RESULT .OBJ3>
	       T)>>>

<DEFINE RED-SVD ("OPT" N:FIX TYP:FIX "AUX" DIR)
	<SET DIR <POP-PSTACK ,DATA-STACK>>
	<COND (<DIR-VERB-WORD? <PARSE-VERB ,PARSE-RESULT>>
	       <POP-PSTACK ,DATA-STACK>
	       <PUSH-PSTACK ,DATA-STACK .DIR>
	       <RED-SD <- .N 1> .TYP>)>>

<DEFINE RED-SP ("OPT" N:FIX TYP:FIX "AUX" A)
	<SET A <POP-PSTACK ,DATA-STACK>>
	<DEC N>
	<COND (<AND <EQUAL? .N 2>
		    <N==? T .A>>
	       <PARSE-ADV ,PARSE-RESULT <OR <WORD-SEMANTIC-STUFF .A> .A>>)>
	<FLUSH-PSTACK ,DATA-STACK .N>
	,PARSE-RESULT>

<GLOBAL SEARCH-FLAGS:NUMBER 0>

<DEFINE IREDUCE-EXCEPTION (ENP:PMEM NP:PMEM)
  ;"Both ENP and NP are NPs"
  <COND (<==? <NP-NAME .ENP> ,W?ONE>
	 ;"All books except the red one..."
	 <NP-NAME .ENP <NP-NAME .NP>>)>
  <COND (<NOT <NP-QUANT .ENP>>
	 <NP-QUANT .ENP ,NP-QUANT-ALL>)>
  <SETG SEARCH-FLAGS <BOR ,SEARCH-ALL ;15 ,SEARCH-MANY ;16>>
  <DETERMINE-NP 0 0 .ENP>>

<DEFINE REDUCE-EXCEPT-IT (PHR NP)	;"? others?"
	<COND (<AND <==? 1 <NOUN-PHRASE-COUNT .PHR>>
		    <==? ,IT <NOUN-PHRASE-OBJ1 .PHR>>>
	       <COND (<ZERO? ,P-IT-OBJECT>
		      <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .NP>)
		     ;(<NOT <VISIBLE? ,P-IT-OBJECT>>
		      <NOT-HERE ,P-IT-OBJECT>)
		     (T
		      <NOUN-PHRASE-OBJ1 .PHR ,P-IT-OBJECT>)>)>>

<DEFINE REDUCE-EXCEPTION RE (PP:PMEM NP:PMEM "AUX"
			  (ENP:PMEM <PP-NOUN .PP>) NOUN-PHRASE)
  <COND
   (<PMEM-TYPE? .ENP NP>
    ;"Just one thing"
    <COND (<SET NOUN-PHRASE <IREDUCE-EXCEPTION .ENP .NP>>
	   ;"Returns a noun-phrase, which we can then stuff into
	      an NPP to be stuffed into the EXCEPT slot"
	   <REDUCE-EXCEPT-IT .NOUN-PHRASE .ENP>
	   <NP-EXCEPT .NP <PMEM-ALLOC NPP
				      NOUN .ENP
				      NOUN-PHRASE .NOUN-PHRASE>>
	   .NP)>)
   (T
    ;"NPP"
    <REPEAT (RES (NNP:<OR PMEM FALSE> .ENP) (GOOD <>) BAD)
      <COND (<SET RES <IREDUCE-EXCEPTION <SET BAD <NPP-NOUN .NNP>> .NP>>
	     <SET GOOD T>
	     <REDUCE-EXCEPT-IT .RES .BAD>
	     <NPP-NOUN-PHRASE .NNP .RES>)>
      <COND (<NOT <SET NNP <NPP-NEXT .NNP>>>
	     <COND (<T? .GOOD>
		    <NP-EXCEPT .NP .ENP>
		    <RETURN .NP .RE>)
		   (T
		<RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .BAD> .RE>)>)>>)>>

<CONSTANT P-NO-INSIDE "No inside">
<CONSTANT P-NO-SURFACE "No surface">
<CONSTANT P-NOTHING "Nothing">

<CONSTANT PREP-BIT <ITABLE 3 0>>

<DEFINE REDUCE-LOCATION RL (PP ;PP:PMEM
                            "OPT" (SYN:<OR FALSE VERB-SYNTAX> <>)
                                  (WHICH:<OR FIX FALSE> <>)
                            "AUX" (SEARCH
                                   <COND (.SYN
                            	          <COND (<==? .WHICH 1>
                            		             <SYNTAX-SEARCH .SYN 1>)
                            		            (T
                            		             <SYNTAX-SEARCH .SYN 2>)>)>)
                                  (TEST
                                   <COND (.SYN
                                          <COND (<==? .WHICH 1>
                                                 <SYNTAX-FIND .SYN 1>)
                                                (T
                                                 <SYNTAX-FIND .SYN 2>)>)>)
                                  (PREP:VWORD <PP-PREP .PP>)
                                  (NP:PMEM <PP-NOUN .PP>) (RLOC <>)
                                  (BIT 0) (MSG <>) "VALUE" <OR TABLE FALSE>)
  <COND (<NOT .SEARCH> <SET SEARCH <BOR ,SEARCH-HELD ,SEARCH-ON-GROUND> ;5>)>
  ;<COND (<NOT .TEST> <SET TEST ,TEST-PREP>)>
  <COPYT ,PREP-BIT 0 6>
  <COND
   (<EQUAL? .PREP ,W?BUT ,W?EXCEPT>
    <RETURN <> .RL>)
   ;(<EQUAL? .PREP ,W?UNDER>
	   <SET BIT ,F?HAS-UNDER>
	   <SET MSG ,P-NO-UNDERSIDE>)
   ;(<EQUAL? .PREP ,W?ABOUT ,W?FOR ,W?TO>)
   (<AND <EQUAL? .PREP ,W?IN ,W?INSIDE>>
    <SET BIT ,CONTBIT>
    <SET MSG ,P-NO-INSIDE>)
   (<AND <EQUAL? .PREP ,W?ON ,W?OFF>
         ;<NOT <EQUAL? ,P-PRSA-WORD ,W?PUT>>>
    <SET BIT ,SURFACEBIT>
    <SET MSG ,P-NO-SURFACE>)
   ;(<EQUAL? .PREP ,W?BEHIND>
     <SET BIT ,F?HAS-BEHIND>
     <SET MSG ,P-NO-BACKSIDE>)
   (<EQUAL? .PREP ,W?FROM ;,W?OF>
    <SET BIT ,SURFACEBIT>
    <ZPUT ,PREP-BIT 1 ,PERSONBIT>
    <ZPUT ,PREP-BIT 2 ,CONTBIT>
    <SET MSG ,P-NOTHING>)
   (T
    <RETURN <> .RL>)>
  <ZPUT ,PREP-BIT 0 .BIT>
  <COND (<PMEM-TYPE? .NP NP>
	 <COND (<SET RLOC <NP-LOC .NP>:PMEM>
		<SET RLOC <NOUN-PHRASE-OBJ1 <LOCATION-OBJECT .RLOC>:PMEM>>)>
	 <MAKE-FINDER 'FINDER ,FINDER
			'FIND-APPLIC .TEST
			'FIND-RES ,SEARCH-RES
			'FIND-ADJS <NP-ADJS .NP>
			'FIND-NOUN <NP-NAME .NP>
			'FIND-NUM <NUMERIC-ADJ? .NP>>
	 <SET SEARCH <FIND-OBJECTS <COND (<NOT .RLOC> .SEARCH) (T 0)>
				   .RLOC>>
	 ;<FIND-NUM ,FINDER 0>
	 <COND (.SEARCH
		<SET RLOC <PMEM-ALLOC NOUN-PHRASE
					COUNT 1
					LENGTH ,NOUN-PHRASE-MIN-LENGTH
					OBJ1 <FIND-RES-OBJ1 ,SEARCH-RES>
					NP1 .NP>>
		<PMEM-ALLOC LOCATION PREP .PREP OBJECT .RLOC>)
	       (<0? <FIND-RES-COUNT ,SEARCH-RES>:FIX>
		<PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .NP .PREP>)
	       (<READY-TO-DISAMBIGUATE? .NP>
		<PARSER-ERROR 0 ,PARSER-ERROR-ORPH-NP
			      .NP <PARSE-VERB ,PARSE-RESULT>>)
	       ;(T
		<PARSER-ERROR ,P-TOO-MANY-OBJECTS-FOR-LOCATION 0 .NP>)>)>>

;<DEFINE DO-TEST-PREP DTP (OBJ:OBJECT VERB:VWORD "AUX" (BIT:TABLE ,PREP-BIT))
  <COND (<0? <ZGET .BIT 0>:FIX> T)
	(T
	 <REPEAT ((CT 0))
	   <COND (<FSET? .OBJ <ZGET .BIT .CT>:FIX> <RETURN T .DTP>)>
	   <COND (<OR <G? <SET CT <+ .CT 1>> 2>
		      <0? <ZGET .BIT .CT>:FIX>>
		  <RETURN <> .DTP>)>>)>>

<COND (<GASSIGNED? DO-TEST-PREP> <SETG TEST-PREP <TABLE ,DO-TEST-PREP>>)>

"Decide what object(s) OBJ refers to.  If OBJ is false, we're looking to
GWIM something.  Otherwise, it's one of NP, NPP, or NOUN-PHRASE.  In the
last case, just return it, because it's already been reduced."

<DEFINE DETERMINE-OBJ DO (OBJ:<OR FALSE PMEM> "OPT" (NUM:FIX 0) (PICK <>)
						    (DONT-LOOK <>)
			  "AUX" (VAL <>) RES (COUNT:FIX 0)
			  (SYN:VERB-SYNTAX
			   <COND (<==? .NUM 0> 0)
				 (T <PARSE-SYNTAX ;3 ,PARSE-RESULT>)>)
			  (S-FLAGS:FIX
			   <COND (<==? .NUM 0>	,SEARCH-MOBY)
				 (<==? .NUM 1>	<SYNTAX-SEARCH ;B5 .SYN 1>)
				 (T		<SYNTAX-SEARCH ;B9 .SYN 2>)>)
			  (SEARCH-ACT:FIX
			   <COND (<==? .NUM 0>	0)
				 (<==? .NUM 1>	<SYNTAX-FIND ;B4 .SYN 1>)
				 (T		<SYNTAX-FIND ;B8 .SYN 2>)>))
	<COND (<NOT .OBJ>	;"Get What I Mean!"
	       <MAKE-FINDER 'FINDER ,FINDER
			    'FIND-APPLIC .SEARCH-ACT
			    'FIND-FLAGS ,FIND-FLAGS-GWIM
			    'FIND-SYNTAX .SYN
			    'FIND-WHICH .NUM
			    'FIND-RES ,SEARCH-RES>
	       <COND (<T? .PICK>
		      <FIND-QUANT ,FINDER ,NP-QUANT-ALL>
		      ;<SET S-FLAGS <BOR .S-FLAGS ,SEARCH-ALL>>)>
	       <COND (<AND <NOT .DONT-LOOK>
			   <OR <AND <EQUAL? .SEARCH-ACT ,ROOMSBIT>
				    <FIND-RES-OBJ1 ,SEARCH-RES ,ROOMS>>
			       <AND <T? .S-FLAGS>
				    <OR <FIND-OBJECTS .S-FLAGS>
					<AND .PICK <FIND-RES-COUNT ,SEARCH-RES>>>
				    <ZPUT ,GWIM-MSG 0 <COND (<1? .NUM>
							     <SYNTAX-PREP .SYN 1>)
							    (T
							     <SYNTAX-PREP .SYN 2>)>>
				    <ZPUT ,GWIM-MSG 1 <FIND-RES-OBJ1 ,SEARCH-RES>>>>>
		      ;"Found one thing, so be happy"
		      ;<FIND-NUM ,FINDER 0>
		      <SET RES <PMEM-ALLOC NOUN-PHRASE
					   LENGTH ,NOUN-PHRASE-MIN-LENGTH
					   COUNT 1
					   ;FLAGS ;,NP-FLAG-MULTI
					   OBJ1 <FIND-RES-OBJ1 ,SEARCH-RES>
					   NP1 <>>>)
		     (T
		      ;"This will return an appropriate lossage so the
			 parser will know to continue."
		      <ZPUT ,ORPHAN-S ,O-VERB <PARSE-VERB ,PARSE-RESULT>>
		      <ZPUT ,ORPHAN-S ,O-LEXPTR
			    <COND (<0? ,P-LEN>
				   <ZREST ,TLEXV ;,P-RUNNING <* 2 ,P-LEXELEN>>)
				  (T ,TLEXV ;,P-RUNNING)>>
		      <ZPUT ,ORPHAN-S ,O-SYNTAX <PARSE-SYNTAX ,PARSE-RESULT>>
		      <ZPUT ,ORPHAN-S ,O-WHICH .NUM>
		      <ZPUT ,ORPHAN-S ,O-PART <PARSE-PARTICLE1 ,PARSE-RESULT>>
		      <ZPUT ,ORPHAN-S ,O-OBJECT
			    <NOUN-PHRASE-OBJ1 <PARSE-OBJ1 ,PARSE-RESULT>>>
		      <COND (<SET VAL <PARSE-CHOMPER ,PARSE-RESULT>>
			     <SET VAL <NOUN-PHRASE-OBJ1 .VAL>>)>
		      <ZPUT ,ORPHAN-S ,O-SUBJECT .VAL>
		      <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-ORPH-S
					    <PARSE-OBJ1 ,PARSE-RESULT>>
			      .DO>)>)
	      (<PMEM-TYPE? .OBJ NOUN-PHRASE>
	       ;"Already a winner, so just return it"
	       <RETURN .OBJ .DO>)
	      (<PMEM-TYPE? .OBJ NP>
	       <SETG SEARCH-FLAGS .S-FLAGS>
	       <DETERMINE-NP 0 ;.SEARCH-ACT .NUM .OBJ>)
	      ;(<AND <SET PICK <NPP-NEXT .OBJ>> ;"UNLOCK CHEST AND OPEN IT"
		    <SET PICK <NPP-NOUN .PICK>>
		    <EQUAL? <NP-NAME .PICK> ,W?IT>
		    <SET PICK <NP-ADJS .PICK>>
		    <WORD-TYPE? <ZGET <REST-TO-SLOT .PICK ADJS-COUNT 1> 0>
				,P-VERB-CODE>>
	       <RFALSE>)
	      (<0? <ANDB .S-FLAGS ,SEARCH-MANY ;16>>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOMULT
			       .NUM <PARSE-VERB ,PARSE-RESULT>>)
	      (T
	       ;"Do each noun phrase in turn, since we can take multiple objects"
	       <SETG SEARCH-FLAGS .S-FLAGS>
	       <REPEAT ((NO .OBJ) (CT <>) PTR)
	         <COND (<SET PTR <DETERMINE-NP 0 ;.SEARCH-ACT .NUM .NO T>>
			;"Remember how many objects we have"
			<SET COUNT <+ .COUNT
				      <NOUN-PHRASE-COUNT
				       <NPP-NOUN-PHRASE .NO:PMEM>:PMEM>>>
			;"And how many real objects we have"
			<COND (<ZERO? .CT>
			       <SET PTR <REST-TO-SLOT .PTR NOUN-PHRASE-OBJ1>>
			       <REPEAT ((CNT .COUNT))
				<COND (<DLESS? CNT 0>
				       <RETURN>)
				      (<NOT <EQUAL? ,NOT-HERE-OBJECT
						    <ZGET .PTR 0>>>
				       <SET CT T>
				       <RETURN>)
				      (T <SET PTR <ZREST .PTR 4>>)>>)>
			<COND (<NOT <SET NO <NPP-NEXT .NO:PMEM>>>
			       <COND (<ZERO? .CT>
				      <RETURN <> .DO>)>
			       <RETURN>)>)
		       (T
			<RETURN <> .DO>)>>
	       ;"Build a single noun phrase"
	       <SET RES <PMEM-ALLOC NOUN-PHRASE
				    ;FLAGS ;,NP-FLAG-MULTI
				    LENGTH <+ ,NOUN-PHRASE-MIN-LENGTH
					      <* .COUNT 2> -2>
				    COUNT .COUNT>>
	       ;"Copy everything into the single noun phrase"
	       <REPEAT ((NO .OBJ) (RR <REST-TO-SLOT .RES NOUN-PHRASE-OBJ1>)
			PHRASE TMP)
	         <SET PHRASE <NPP-NOUN-PHRASE .NO:PMEM>>
		 <SET TMP <* 4 <NOUN-PHRASE-COUNT .PHRASE>:FIX>>
		 <COPYT <REST-TO-SLOT .PHRASE NOUN-PHRASE-OBJ1> .RR .TMP>
		 <SET RR <ZREST .RR .TMP>>
		 <COND (<NOT <SET NO <NPP-NEXT .NO:PMEM>>>
			<RETURN>)>>
	       .RES)>>

;<GLOBAL CHECK-DIR-ADJS-OBJ:OBJECT 0>
<DEFINE CHECK-DIR-ADJS (ADJS:PMEM)
  <REPEAT ((AV <REST-TO-SLOT .ADJS ADJS-COUNT 1>)
	   (CT <ADJS-COUNT .ADJS>) ADJ PT)
    <COND (<L? <SET CT <- .CT 1>> 0>
	   <RFALSE>)
	  (<AND <SET ADJ <ZGET .AV .CT>>
		<IFFLAG (P-ZORK0
			 <WORD-TYPE? .ADJ ,P-DIR-CODE>)
			(T
			 <COMPARE-WORD-TYPES <WCN .ADJ>
				    <GET-CLASSIFICATION DIR>>)>
		<SET PT <GETPT ,HERE <WORD-DIR-ID .ADJ>>>
		<EQUAL? <PTSIZE .PT> ,DEXIT>>
	   <ZPUT .AV .CT ,W?NO.WORD>
	   <COND (<NOT <MATCH-OBJECT <GET .PT ,DEXITOBJ> ,FINDER T>>
		  ;<SETG CHECK-DIR-ADJS-OBJ <GET .PT ,DEXITOBJ>>
		  <ZPUT .AV .CT .ADJ>
		  <RTRUE>)>
	   <ZPUT .AV .CT .ADJ>)>>>

<DEFINE NUMERIC-ADJ? (NP:PMEM "AUX" ADJS (VAL 0))
 <COND (<SET ADJS <NP-ADJS .NP>>
	<REPEAT ((AV <REST-TO-SLOT .ADJS ADJS-COUNT 1>) (CT <ADJS-COUNT .ADJS>)
		 ADJ)
	  <COND (<L? <SET CT <- .CT 1>> 0>
		 <RETURN>)
		(<EQUAL? <SET ADJ <ZGET .AV .CT>> ,W?INT.NUM>
		 <REPEAT ((VV <NP-LEXEND .NP>))
			 <COND (<EQUAL? .ADJ <ZGET .VV 0>>
				<SET VAL <ZGET .VV 1>>
				<RETURN>)
			       (<G? ,P-LEXV <SET VV <ZBACK .VV ,P-LEXELEN>>>
				<RETURN>)>>)>>
	.VAL)>>

<COMPILATION-FLAG-DEFAULT P-GENDERS T>
<VOC "HIMSELF" NOUN>
;<VOC "ITSELF" NOUN>
<IF-P-GENDERS <VOC "HERSELF" NOUN>>

<DEFINE DETERMINE-NP DN (SEARCH-ACT:<OR FIX TABLE> WHICH:FIX OBJ:PMEM
			 "OPT" (MULTI <>)
			 "AUX" (SYN:<OR VERB-SYNTAX FALSE>
				<COND (<0? .WHICH> <>)
				      (T <PARSE-SYNTAX ,PARSE-RESULT>)>)
			       (ROBJ:PMEM .OBJ) (RLOC:<OR FALSE PMEM> <>) ;RNP
			       QUANT:<OR FIX FALSE> OWNER
			       RES COUNT:FIX TMP)
  <COND (<PMEM-TYPE? .OBJ NPP>
	 <SET ROBJ <NPP-NOUN .OBJ>>)>
  <COND (<SET RLOC <NP-LOC .ROBJ>>
	 <SET RLOC <LOCATION-OBJECT .RLOC>:PMEM>
	 ;<SET RNP <NOUN-PHRASE-NP1 .RLOC>>
	 <SET RLOC <NOUN-PHRASE-OBJ1 .RLOC>>)>
  <SET QUANT <NP-QUANT .ROBJ>>
  <COND (<AND .QUANT
	      <G? .QUANT ,NP-QUANT-A>
	      <0? <ANDB ,SEARCH-FLAGS ,SEARCH-MANY ;16>>>
	 <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOMULT
			       .WHICH <PARSE-VERB ,PARSE-RESULT>>
		 .DN>)>
  <COND (<AND <OR <SET OWNER <NP-OF .ROBJ>>
		  <AND <SET OWNER <NP-ADJS .ROBJ>>
		       <SET OWNER <ADJS-POSS .OWNER>>>
		  ;<SET OWNER .RNP>
		  ;<AND <SET OWNER <NP-LOC .ROBJ>>
		       <SET OWNER <LOCATION-OBJECT .OWNER>>
		       <SET OWNER <NOUN-PHRASE-NP1 .OWNER>>>>
	      <PMEM? .OWNER>>
	 ;<COND (<PMEM-TYPE? .OWNER NOUN-PHRASE>
		<SET OWNER <NOUN-PHRASE-NP1 .OWNER>>)>
	 <FIND-RES-NEXT ,SEARCH-RES <>>
	 <COND (<EQUAL? ,W?IT <NP-NAME .OWNER>>	;"? others?"
		<FIND-RES-COUNT ,SEARCH-RES 1>
		<FIND-RES-OBJ1 ,SEARCH-RES ,P-IT-OBJECT>
		<COND (<VISIBLE? ,P-IT-OBJECT>
		       <COPYT ,SEARCH-RES
			      ,OWNER-SR-HERE <* 2 ,FIND-RES-LENGTH>>)
		      (T
		       <COPYT ,SEARCH-RES
			      ,OWNER-SR-THERE <* 2 ,FIND-RES-LENGTH>>)>)
	       (T
		<MAKE-FINDER
			'FINDER ,FINDER
			'FIND-APPLIC .SEARCH-ACT
			;'FIND-QUANT ;<NP-QUANT .OWNER>
			'FIND-SYNTAX .SYN
			'FIND-WHICH .WHICH
			'FIND-RES ,SEARCH-RES
			'FIND-ADJS <NP-ADJS .OWNER>
			'FIND-NUM <NUMERIC-ADJ? .OWNER>
			'FIND-NOUN <NP-NAME .OWNER>
			'FIND-OF <NP-OF .OWNER> ;<OR <NP-OF .ROBJ> .RNP>
			;'FIND-EXCEPTIONS ;<NP-EXCEPT .OWNER>>
		<FIND-RES-COUNT ,SEARCH-RES 0>
		;<FIND-RES-NEXT ,SEARCH-RES <>>
		<FIND-OBJECTS ,SEARCH-ALL>	;"Find owner in HERE"
		<COPYT ,SEARCH-RES ,OWNER-SR-HERE <* 2 ,FIND-RES-LENGTH>>
		<FIND-RES-COUNT ,SEARCH-RES 0>
		<FIND-RES-NEXT ,SEARCH-RES <>>
		<FIND-OWNERS ,OWNERS>	;"Search for other owners."
		<COPYT ,SEARCH-RES ,OWNER-SR-THERE <* 2 ,FIND-RES-LENGTH>>)>)>
  <SET RES <>>
  <COND (<EQUAL? <NP-NAME .ROBJ> ,W?HIMSELF>	;"ASK TROLL ABOUT HIMSELF"
	     <COND (<AND <EQUAL? 2 .WHICH>
	    	         <SET COUNT <PARSE-OBJ1 ,PARSE-RESULT>>
	    	         <SET COUNT <NOUN-PHRASE-OBJ1 .COUNT>>
	    	         <FSET? .COUNT ,PERSONBIT>>
	    	    <SET RES .COUNT>
	    	    <IF-P-GENDERS
	    	     <COND (<FSET? .COUNT ,FEMALEBIT>
	    	            <SET RES ,P-HIM-OBJECT>)>>)
	           (T
	    	    <SET RES ,P-HIM-OBJECT>)>)>
  <IF-P-GENDERS
  <COND (<EQUAL? <NP-NAME .ROBJ> ,W?HERSELF ;"<VOC 'HERSELF' NOUN>">
	 <COND (<AND <EQUAL? 2 .WHICH>
		         <SET COUNT <PARSE-OBJ1 ,PARSE-RESULT>>
		         <SET COUNT <NOUN-PHRASE-OBJ1 .COUNT>>
		         <FSET? .COUNT ,PERSONBIT>
		         <FSET? .COUNT ,FEMALEBIT>>
		<SET RES .COUNT>)
	       (T
		<SET RES ,P-HER-OBJECT>)>)>>

  <COND (<T? .RES>
	 <RETURN <PMEM-ALLOC NOUN-PHRASE
			LENGTH ,NOUN-PHRASE-MIN-LENGTH
			COUNT 1
			OBJ1 .RES
			NP1 .ROBJ>
		 .DN>)>
  <MAKE-FINDER	'FINDER ,FINDER
		'FIND-APPLIC .SEARCH-ACT
		'FIND-QUANT .QUANT
		'FIND-SYNTAX .SYN
		'FIND-WHICH .WHICH
		'FIND-RES ,SEARCH-RES
		'FIND-ADJS <NP-ADJS .ROBJ>
		'FIND-NUM <NUMERIC-ADJ? .ROBJ>
		'FIND-NOUN <NP-NAME .ROBJ>
		'FIND-OF <OR <NP-OF .ROBJ> ;.RNP>
		'FIND-EXCEPTIONS <NP-EXCEPT .ROBJ>>
  <FIND-OBJECTS ,SEARCH-FLAGS .RLOC>
  <COND (<AND <ZERO? <FIND-RES-COUNT ,SEARCH-RES>>
	      <T? <NP-ADJS .ROBJ>>>
	 <COND (<CHECK-DIR-ADJS <NP-ADJS .ROBJ>>
		<ZPUT ,GWIM-MSG 2 .ROBJ>
		<ZPUT ,GWIM-MSG 3 <FIND-RES-OBJ1 ,SEARCH-RES>>)>)>
  <COND (<AND <ZERO? <SET COUNT <FIND-RES-COUNT ,SEARCH-RES>>>
	      <SET TMP <NP-NAME .ROBJ>>
	      <T? <ANDB ,PLURAL-FLAG <WORD-FLAGS .TMP>>>>
	 <NP-QUANT .ROBJ ,NP-QUANT-ALL ;,NP-QUANT-PLURAL>
	 <NP-NAME .ROBJ <WORD-SEMANTIC-STUFF .TMP>>
	 <AGAIN>)
	(<ZERO? .COUNT>
	 <COND (<AND <ZERO? .RLOC>
		     <OR <T? .MULTI>
			 <DET-NP-NOT-HERE?>>>
		<SET RES <PMEM-ALLOC NOUN-PHRASE
				     LENGTH ,NOUN-PHRASE-MIN-LENGTH
				     COUNT 1
				     OBJ1 ,NOT-HERE-OBJECT
				     NP1 .ROBJ>>)>)
	(<OR <1? .COUNT>
	     <T? .QUANT>
	     <SET RES <ZAPPLY <GETP <FIND-RES-OBJ1 ,SEARCH-RES>
				    ,P?GENERIC>
			      ,SEARCH-RES ,FINDER>>
	     ;"Protocol: returns .OBJ if that's the one to use,
				 ,NOT-HERE-OBJECT if 'are none',
				 ,ROOMS if case was handled and msg TELLed,
				 <> if WHICH-PRINT should be called"
	     <SET RES <DET-NP-OWNEE?>>
	     ;<AND <SET RES ,P-IT-OBJECT>	;"per PDL 17-Jun-88"
		  <NOT <NOT-IN-FIND-RES? .RES ,SEARCH-RES T>>>>
	 <COND (<EQUAL? .RES ,NOT-HERE-OBJECT>
		<RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .OBJ> .DN>)
	       (<EQUAL? .RES ,ROOMS>
		<RETURN <PARSER-ERROR 0 ,PARSER-ERROR-QUIET <>> .DN>)
	       (<T? .RES>
		<SET COUNT 1>
		<FIND-RES-COUNT ,SEARCH-RES 1>
		<FIND-RES-NEXT ,SEARCH-RES <>>
		<FIND-RES-OBJ1 ,SEARCH-RES
			       <COND (<EQUAL? .RES ,HERE> ,GLOBAL-HERE)
				     (T .RES)>>)>
	 <SET RES <PMEM-ALLOC NOUN-PHRASE
			      ;FLAGS ;<COND (.QUANT ,NP-FLAG-MULTI)
					    (T 0)>
			      LENGTH <+ <* .COUNT 2>
					,NOUN-PHRASE-MIN-LENGTH
					-2>
			      COUNT .COUNT>>
	 <COND (<OR <SET SYN <NP-OF .ROBJ>>	;"Store the owner that was found."
		    <AND <SET SYN <NP-ADJS .ROBJ>>
			 <SET SYN <ADJS-POSS .SYN>>>
		    ;<SET SYN .RNP>>
		<COND (<NOT <OBJECT? .SYN>>
		       <SET SYN <FIND-RES-OWNER ,SEARCH-RES>>
		       <COND (<NP-OF .ROBJ>
			      <NP-OF .ROBJ .SYN>)
			     (T ;<NP-ADJS .ROBJ>
			      <ADJS-POSS <NP-ADJS .ROBJ> .SYN>)
			     ;(T
			      <NOUN-PHRASE-NP1 <LOCATION-OBJECT <NP-LOC .ROBJ>>
					       .SYN>)>)>)>
	 <COND (<SET SYN <DETERMINE-NP-XFER .COUNT .ROBJ ,SEARCH-RES
					 <REST-TO-SLOT .RES NOUN-PHRASE-OBJ1>>>
		<NOUN-PHRASE-COUNT .RES <- .COUNT .SYN>>)>)
	(<READY-TO-DISAMBIGUATE? .ROBJ>
	 <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-ORPH-NP
			       .ROBJ <PARSE-VERB ,PARSE-RESULT>>
		 .DN>)>
  <COND (<AND .RES <PMEM-TYPE? .OBJ NPP>>
	 <NPP-NOUN-PHRASE .OBJ .RES>)>
  ;<FIND-NUM ,FINDER 0>
  .RES>

<DEFINE DET-NP-NOT-HERE? ()
 <COND (<OR <BAND ,PAST-TENSE <WORD-FLAGS <PARSE-VERB ,PARSE-RESULT>>>
	    <NOT-HERE-VERB? <PARSE-ACTION ,PARSE-RESULT>>>
	T)>>

<DEFINE DET-NP-OWNEE? ACT ("AUX" ADJS)
 <COND (<SET ADJS <FIND-ADJS ,FINDER>>
	<SET ADJS <ADJS-POSS .ADJS>>)>
 <COND (<ZERO? .ADJS>
	<RETURN <> .ACT>)>
 <REPEAT ((OBJ <>) OBJ1 (LEN <FIND-RES-COUNT ,SEARCH-RES>)
	  (PTR <REST-TO-SLOT ,SEARCH-RES FIND-RES-OBJ1>))
	 <COND (<L? <SET LEN <- .LEN 1>> 0>
		<RETURN .OBJ .ACT>)
	       (<EQUAL? .ADJS <GETP <SET OBJ1 <ZGET .PTR 0>> ,P?OWNER>>
		<COND (.OBJ <RETURN <> .ACT>)
		      (T <SET OBJ .OBJ1>)>)>
	 <SET PTR <ZREST .PTR 2>>>>

<DEFINE FIND-OWNERS (TBL)
 <REPEAT (OOBJ (LEN <ZGET .TBL 0>))
	<COND (<L? .LEN 1>
	       <RETURN>)
	      (<OBJECT? <SET OOBJ <ZGET .TBL .LEN>>>
	       <COND (<NOT <MATCH-OBJECT .OOBJ ,FINDER T>>
		      <RETURN>)>)
	      (T	;"It's another table!"
	       <FIND-OWNERS .OOBJ>)>
	<SET LEN <- .LEN 1>>>>

<DEFINE READY-TO-DISAMBIGUATE? RTD (NP "AUX" PTR NOUN)
 <COND (<AND <SET PTR <NP-LEXEND .NP>>
	     <SET NOUN <NP-NAME .NP>>>
	<REPEAT ()
		<COND (<==? .NOUN <ZGET .PTR 0>>
		       <RETURN .PTR .RTD>)
		      (<G? ,P-LEXV <SET PTR <- .PTR ,LEXV-ELEMENT-SIZE-BYTES>>>
		       <RETURN <> .RTD>)>>)>>

<DEFINE DETERMINE-NP-XFER ACT (COUNT ROBJ SRES DV "AUX" CT V)
  <SET CT <FIND-RES-SIZE .SRES>>
  <SET V <REST-TO-SLOT .SRES FIND-RES-OBJ1>>
  <REPEAT ()
	<COND (<G? .CT .COUNT>
	       <SET CT .COUNT>)>
	<SET COUNT <- .COUNT .CT>>
	<REPEAT (TMP (NUM 0))
		<COND (<SET TMP <ZGET .V 0>>
		       <ZPUT .DV 0 .TMP>
		       <ZPUT .DV 1 .ROBJ>)
		      (T
		       <INC NUM>)>
		<SET DV <ZREST .DV 4>>
		<SET V <ZREST .V 2>>
		<COND (<L? <SET CT <- .CT 1>> 1>
		       <COND (<ZERO? <SET SRES <FIND-RES-NEXT .SRES>>>
			      <RETURN .NUM .ACT>)>
		       <SET CT ,FIND-RES-MAXOBJ ;<OBJLIST-SIZE .SRES>>
		       <SET V <REST-TO-SLOT .SRES OBJLIST-OBJ1>>
		       <COND (<G? .CT .COUNT>
			      <SET CT .COUNT>)>
		       <SET COUNT <- .COUNT .CT>>)>>>>

<DEFINE DO-ORPHAN-TEST ("OPT" N:FIX TYP:FIX) <RETURN ,P-OFLAG>>

<DEFINE RED-O-ADJ ("OPT" N:FIX TYP:FIX)
	<COND (<AND <T? ,P-OFLAG>
		    <FIND-RES-COUNT ,ORPHAN-SR>>
	       <COPYT ,O-LEXV ,G-LEXV ,LEXV-LENGTH-BYTES>
	       <COPYT ,O-INBUF ,G-INBUF <+ 1 ,INBUF-LENGTH>>
	       <ZPUT ,OOPS-TABLE ,O-START <ZGET ,OOPS-TABLE ,O-AGAIN>>
	       <INSERT-ADJS <POP-PSTACK ,DATA-STACK>>
	       <COPY-INPUT T>
	       <SETG P-OFLAG 0>
	       ;<FIND-RES-COUNT ,ORPHAN-SR 0>
	       <THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>>

<DEFINE RED-O-PP ("OPT" N:FIX TYP:FIX "AUX" PP A PREP)
 <COND (<AND <T? <SET PP <ABS ,P-OFLAG>>>
	     <EQUAL? ,W?NO.WORD <ZGET ,O-LEXV .PP>>
	     <SET A <ZGET ,O-LEXV <- .PP ,P-LEXELEN>>>
	     <SET PP <POP-PSTACK ,DATA-STACK>>
	     <OR <AND <==? .N 2 ;1> ;<PMEM-TYPE? .PP PP>
		      ;<EQUAL? .A <PP-PREP .PP>>>
		 <AND ;<PMEM-TYPE? .PP NP>
		      <SET PREP <POP-PSTACK ,DATA-STACK>> ;<EQUAL? .A >>>>
	;<ZPUT ,O-LEXV .PP ,W?NO.WORD>
	<COPYT ,O-LEXV ,G-LEXV ,LEXV-LENGTH-BYTES>
	<COPYT ,O-INBUF ,G-INBUF <+ 1 ,INBUF-LENGTH>>
	<ZPUT ,OOPS-TABLE ,O-START <ZGET ,OOPS-TABLE ,O-AGAIN>>
	<INSERT-NP <COND (<EQUAL? .A .PREP> 1) (T 0)>>
	<COPY-INPUT T>
	<SETG P-OFLAG 0>
	;<FIND-RES-COUNT ,ORPHAN-SR 0>
	<THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>>

<DEFINE INSERT-NP ("OPT" (NUM 0) (NP <>) "AUX" (GPTR <ABS ,P-OFLAG>) PPTR TMP)
	<COND (<SET TMP <PARSE-VERB-LEXV ,PARSE-RESULT>>
	       <SET PPTR <ZREST .TMP <* .NUM <* 2 ,P-LEXELEN>>>>
	       <SET TMP <+ 1 </ <- ,TLEXV .TMP> ,LEXV-ELEMENT-SIZE-BYTES>>>)
	      (T
	       <COND ;(.NP
		      <SET PPTR <NP-LEXBEG .NP>>	;"unreliable"
		      <SET TMP <+ 1 </ <- <NP-LEXEND .NP> .PPTR>
				       ,LEXV-ELEMENT-SIZE-BYTES>>>)
		     (T
		      <SET PPTR <ZGET ,OOPS-TABLE ,O-START>>
		      <SET TMP <ZGET ,OOPS-TABLE ,O-LENGTH>>)>
	       <SET PPTR <ZREST .PPTR <* .NUM <* 2 ,P-LEXELEN>>>>)
	      ;(T
	       <SET PPTR <ZREST ,P-LEXV
				<* 2 <+ ,P-LEXSTART <* .NUM ,P-LEXELEN>>>>>
	       <SET TMP <GETB ,P-LEXV ,P-LEXWORDS>>)>
	<SET NUM <- .TMP .NUM>>
	<MAKE-ROOM-FOR-TOKENS <+ -1 .NUM> ,G-LEXV .GPTR>
	<REPEAT ()
		<COND (<DLESS? NUM 0> <RETURN>)>
		<INBUF-ADD <LEXV-WORD-LENGTH .PPTR>
			   <LEXV-WORD-OFFSET .PPTR>
			   <SET TMP <+ 3 <* .GPTR 2>>>>
		<SET TMP <ZGET .PPTR 0>>
		<ZPUT ,G-LEXV .GPTR .TMP>
		<COND (<EQUAL? .TMP ,W?INT.NUM ,W?INT.TIM>
		       <ZPUT ,G-LEXV <+ 1 .GPTR> <ZGET .PPTR 1>>)>
		<SET GPTR <+ .GPTR ,LEXV-ELEMENT-SIZE>>
		<SET PPTR <+ .PPTR ,LEXV-ELEMENT-SIZE-BYTES>>>>

<DEFINE TEST-SR ACT (NP "AUX" A (CT 0))
	<COND (<ZERO? <FIND-RES-COUNT ,ORPHAN-SR>>
	       <RETURN <> .ACT>)>
	<IFFLAG (P-ZORK0
		 <COND (<WORD-TYPE? <SET A <NP-NAME .NP>> ,P-QUANT-CODE>
			<RETURN .A .ACT>)>)
		(T
		 <COND (<COMPARE-WORD-TYPES <WCN <SET A <NP-NAME .NP>>>
				   <GET-CLASSIFICATION QUANT>>
			<RETURN .A .ACT>)>)>
	<COND (<ZERO? <SET A <NP-ADJS .NP>>>
	       <SET A <PMEM-ALLOC ADJS LEXPTR <NP-LEXBEG .NP>>>)
	      (<NOT <G? ,ADJS-MAX-COUNT <SET CT <ADJS-COUNT .A>>>>
	       <RETURN <> .ACT>)>
	<ZPUT <REST-TO-SLOT .A ADJS-COUNT 1> .CT <NP-NAME .NP>>
	<ADJS-COUNT .A <+ 1 .CT>>
	<FIND-ADJS ,FINDER .A>
	<FIND-NUM ,FINDER <NUMERIC-ADJ? .NP>>
	<FIND-NOUN ,FINDER <NP-NAME ,ORPHAN-NP>>
	<FIND-RES-COUNT ,SEARCH-RES 0>
	<FIND-RES-NEXT ,SEARCH-RES <>>
	<COND (<TEST-O-SR>
	       <RETURN .A .ACT>)>
	<COND (<NOT <0? .CT>>
	       <ADJS-COUNT .A .CT>)>
	<COND (<NOT <0? <FIND-RES-COUNT ,SEARCH-RES>>>
	       .A)>>

<DEFINE TEST-O-SR ACT ()
   <REPEAT ((VEC <REST-TO-SLOT ,ORPHAN-SR FIND-RES-OBJ1>)
	    (SZ <FIND-RES-SIZE ,ORPHAN-SR>)
	    (REM <FIND-RES-COUNT ,ORPHAN-SR>))
      <COND (<NOT <MATCH-OBJECT <ZGET .VEC 0> ,FINDER T>>
	     <RETURN T ;.A .ACT>)>
      <COND (<L? <SET REM <- .REM 1>> 1>
	     <RETURN <> .ACT>)
	    (<L? <SET SZ <- .SZ 1>> 1>
	     <COND (T ;<ZERO? <SET SR <FIND-RES-NEXT ,ORPHAN-SR>>>
		    <RETURN <> .ACT>)>
	     ;<SET SZ ,FIND-RES-MAXOBJ ;<OBJLIST-SIZE ,ORPHAN-SR>>
	     ;<SET VEC <REST-TO-SLOT ,ORPHAN-SR OBJLIST-NEXT>>)
	    (T <SET VEC <ZREST .VEC 2>>)>>>

<DEFINE RED-O-NP ("OPT" N:FIX TYP:FIX "AUX" A NP (PP <>) WD NNAME)
 <COND (<EQUAL? .N 3>
	<SET PP <POP-PSTACK ,DATA-STACK>>)>
 <SET NP <POP-PSTACK ,DATA-STACK>>
 <COND (<AND <PMEM-TYPE? .NP NOUN-PHRASE>
	     <EQUAL? <NOUN-PHRASE-OBJ1 .NP> ,INTQUOTE>>
	<SET NP <NOUN-PHRASE-NP1 .NP>>
	<COND (<G=? 0 ,P-OFLAG>	;"was ZERO? but Yabu scene changed it"
	       <SET PP </ <- <NP-LEXBEG .NP> ,P-LEXV> 2>>
	       <MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PP>
	       <ZPUT ,G-LEXV .PP ,W?SAY>
	       <COPY-INPUT>
	       <SETG P-OFLAG 0>
	       <THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>)>
 <COND (<T? ,P-OFLAG>
	<SET NNAME <NP-NAME .NP>>
	<COND (<AND <ZERO? .PP>
		    <IFFLAG (P-ZORK0
			     <WORD-TYPE? .NNAME ,P-ADJ-CODE>)
			    (T
			     <COMPARE-WORD-TYPES <WCN .NNAME>
						 <GET-CLASSIFICATION ADJ>>)>    
		    ;<ZERO? <NP-LOC .NP>>
		    <ZERO? <NP-QUANT .NP>>
		    <SET A <TEST-SR .NP>>>	;"Try as adjective instead."
	       <PUSH-PSTACK ,DATA-STACK .A>
	       <RED-O-ADJ 1 .TYP>		;"Never returns?"
	       <RFALSE>)>
	<COPYT ,O-LEXV ,G-LEXV ,LEXV-LENGTH-BYTES>
	<COPYT ,O-INBUF ,G-INBUF <+ 1 ,INBUF-LENGTH>>
	<SET N <ABS ,P-OFLAG>>
	<COND (<IFFLAG (HACK-ORPHAN-NOUNS
			<OR <EQUAL? <SET WD <ZGET ,G-LEXV .N>>
				    ,W?NO.WORD .NNAME>
			    ;"The following code is intended to make
			      l at man
			      ...the apelike man or the priest?
			      priest
			      work.  What it used to do was complain that it couldn't
			      understand 'l at man priest', which isn't a big help.
			      If there was already a noun, and we're supplying a new
			      noun, this should just trash the old one, which isn't
			      necessarily always right, but..."
			    <AND .NNAME
				 <IFFLAG (P-ZORK0
					  <AND <NOT <WORD-TYPE? .WD ,P-ADJ-CODE>>
					       <NOT <WORD-TYPE? .NNAME ,P-ADJ-CODE>>>)
					 (T
					  <AND <NOT <COMPARE-WORD-TYPES 
						     <WCN .WD>
						     <GET-CLASSIFICATION ADJ>>>
					       <NOT <COMPARE-WORD-TYPES
						     <WCN .NNAME>
						     <GET-CLASSIFICATION ADJ>>>>)>>>)
		       (T
			<EQUAL? <SET WD <ZGET ,G-LEXV .N>>
				,W?NO.WORD .NNAME>)>
	       ;<PUTB ,G-LEXV ,P-LEXWORDS <- <GETB ,G-LEXV ,P-LEXWORDS> 1>>
	       <INSERT-NP 0 .NP>)
	      (T
	       <PROG ((A1 <>))
		;<COND (<IFFLAG (P-ZORK0
				<WORD-TYPE? .WD ,P-ADJ-CODE>)
			       (T
				<COMPARE-WORD-TYPES <WCN .WD>
						    <GET-CLASSIFICATION ADJ>>)>
		       <SET N <+ .N ,P-LEXELEN>>)>	;"Skip over adjective."
		<COND (<T? .A>
		       <MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .N>
		       <ZPUT ,G-LEXV .N .A>
		       <SET A <NP-LEXEND .NP>>
		       <INBUF-ADD <LEXV-WORD-LENGTH .A>
				  <LEXV-WORD-OFFSET .A>
				  <+ 3 <* .N 2>>>)>
		<COND (<SET A <NP-ADJS .NP>>
		       <INSERT-ADJS .A>)>
		<COND (<T? .PP>
		       ;<SET PP <NP-LOC .NP>>
		       <MAKE-ROOM-FOR-TOKENS 2 ,G-LEXV <+ .N ,P-LEXELEN>>
		       <ZPUT ,G-LEXV <+ .N ,P-LEXELEN> <LOCATION-PREP .PP>>
		       <SET A <LOCATION-OBJECT .PP>>
		       <COND (<PMEM-TYPE? .A NOUN-PHRASE>
			      <SET A <NOUN-PHRASE-NP1 .A>>)
			     (<PMEM-TYPE? .A NPP>
			      <SET A <NPP-NOUN .A>>)>
		       <ZPUT ,G-LEXV <+ .N <* 2 ,P-LEXELEN>> <NP-NAME .A>>)>
		<COND (<AND <SET A <NP-QUANT .NP>>
			    ;<T? <NP-NAME .NP>>>
		       <PROG ((PTR .N))
			<REPEAT (WD)
			 <COND (<G? 0 <SET PTR <- .PTR ,P-LEXELEN>>>
				<SET PTR <OR .A1 .N>>
				<MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PTR>
				<RETURN>)
			       (<OR <EQUAL? <SET WD <ZGET ,G-LEXV .PTR>>
					    ,W?THE>
				    <IFFLAG (P-ZORK0
					     <WORD-TYPE? .WD ,P-QUANT-CODE>)
					    (T
					     <COMPARE-WORD-TYPES
					      <WCN .WD>
					      <GET-CLASSIFICATION QUANT>>)>>
				<RETURN>)
			       (<IFFLAG (P-ZORK0
					 <WORD-TYPE? .WD ,P-ADJ-CODE>)
					(T
					 <COMPARE-WORD-TYPES <WCN .WD>
							     <GET-CLASSIFICATION ADJ>>)>
				
				<SET A1 .PTR>)
			       (T
				<SET PTR <OR .A1 .N>>
				<MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PTR>
				<RETURN>)>>
			<ZPUT ,G-LEXV .PTR <GET-QUANTITY-WORD .A>>>)>>)>
	<ZPUT ,OOPS-TABLE ,O-START <ZGET ,OOPS-TABLE ,O-AGAIN>>
	<COPY-INPUT ;T>
	<SETG P-OFLAG 0>
	<THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>>

<DEFINE RED-PERS ACT ("OPT" N:FIX TYP:FIX "AUX" X:PMEM)
 <COND (<NOT <EQUAL? .N 2 3>>
	T)
       (<OR <AND <==? <SET X <POP-PSTACK ,DATA-STACK>> ,W?COMMA>
		 <EQUAL? .N 2>>
	    <AND <==? .X ,W?TO>
		 ;<EQUAL? .N 3>>>
	<SET X <POP-PSTACK ,DATA-STACK>>
	<COND (<EQUAL? .N 3>
	       <COND ;(<NOT <ASKING-VERB-WORD? <POP-PSTACK ,DATA-STACK>>>
		      <RETURN <> .ACT>)
		     (<IFFLAG (P-ZORK0
			       <NOT <WORD-TYPE? <ZGET ,P-RUNNING 0> ,P-VERB-CODE>>)
			      (T
			       <NOT <COMPARE-WORD-TYPES
				     <WCN <ZGET ,P-RUNNING 0>>
				     <GET-CLASSIFICATION VERB>>>)>		      
		      <RETURN <> .ACT>)>)>
	<HACK-TELL .X>)>>

<DEFINE HACK-TELL ACT (X "AUX" NP)
	<PARSE-VERB ,PARSE-RESULT ,W?TELL>
	<GET-SYNTAX <VERB-ONE <WORD-VERB-STUFF ,W?TELL>> 1 <>>
	<COND (<OR <NOT <SET NP <DETERMINE-OBJ .X 1>>>
		   <EQUAL? <NOUN-PHRASE-OBJ1 .NP> ,NOT-HERE-OBJECT>>
	       <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOOBJ .X> .ACT>)>
	<PARSE-VERB-LEXV ,PARSE-RESULT ,TLEXV>
	<PARSE-CHOMPER ,PARSE-RESULT .NP>
	<SET X <NOUN-PHRASE-OBJ1 .NP>>
	<COND (<EQUAL? .X ,WINNER ,PLAYER ;,ME>
	       T)
	      <IFN-P-ZORK0
	      (<EQUAL? .X ,YOU-YOU>
	       T)>
	      (T
	       ;<COND (<EQUAL? <ZGET ,TLEXV 0> ,W?YOU>
		      <IGNORE-FIRST-WORD ;,W?YOU>)>
	       <COND (<L? ,P-LEN 1>
		      <SETG P-CONT <>>)
		     (T
		      <SETG P-CONT ,TLEXV>)>
	       <COND (<OR <EQUAL? ,M-FATAL <HACK-TELL-1 .NP>>
			  <ZERO? ,P-CONT>>
		      <SETG P-CONT -1>
		      <THROW ,PARSER-RESULT-DEAD
			     ,PARSE-SENTENCE-ACTIVATION>)>
	       ;<SETG WINNER <PARSE-CHOMPER ,PARSE-RESULT>>)>
	T>

<DEFINE HACK-TELL-1 ACT (NP "AUX" X NUM CT)
	<SETG PRSO-NP <NOUN-PHRASE-NP1 .NP>>
	<SET X <NOUN-PHRASE-OBJ1 .NP>>
	<COND (<AND <T? ,P-WON>
		    <L? 1 <SET CT <NOUN-PHRASE-COUNT .NP>>>>
	       <COND (<L=? .CT <SET NUM <NOUN-PHRASE-FLAGS .NP>>>
		      <RETURN <> .ACT>)>
	       <NOUN-PHRASE-FLAGS .NP <+ 1 .NUM>>
	       <SETG PRSO-NP	<ZGET <REST-TO-SLOT .NP NOUN-PHRASE-NP1>
					<* 2 .NUM>>>
	       <SET X		<ZGET <REST-TO-SLOT .NP NOUN-PHRASE-OBJ1>
				      <* 2 .NUM>>>
	       <COND (<NOT <PERF-MANY .X <> ,PRSO-NP ":|">>
		      <RETURN ,M-FATAL .ACT>)>)>
	<IF-P-BE-VERB
		<SETG PRSQ <>>
		<SETG PRSS <>>>
	<COND (<T? ,P-RESPONDED>
	       <BE-PATIENT <- 0 ,P-RESPONDED>>)	;"finish partial response"
	      ;(T
	       <SETG P-RESPONDED 1>)>
	<SET X <PERFORM ,V?TELL .X>>
	<PARSE-ACTION ,PARSE-RESULT 0 ;"for DONT-UNDERSTAND">
	.X>

;"FOR MY OWN GOOD:
   The first argument in the set, here N, counts the number of parts
to the PRODUCTION. Use this to separate from one another.
   <POP-PSTACK ,DATA-STACK> takes the top part of the command (the
last one in the list) and removes it from the mix (before returning it).
This allows you to proceed to the next one in the list."

<DEFINE RED-VP ("OPT" N:FIX TYP:FIX "AUX" VERBED (A1 T) (A2 T) (PART3 T) (NOUN3 T) (X <>))
	<IFFLAG (P-THREE-NOUNS
        <COND (<G? .N 2> ;"Must either be an adverb or a third noun-etc"
	           <SET A1 <POP-PSTACK ,DATA-STACK>>
               <COND (<NOT <=? .A1 ,W?DONT ,W?DON\'T ,W?ONCE ,W?TWICE ,W?THRICE>>
                      <COND (<OBJECT? .A1>
                             <SET NOUN3 .A1>
                             <SET A1 T>
                             <COND (<NOT <COMPARE-WORD-TYPES <WCN <SET PART3 <POP-PSTACK ,DATA-STACK>>>
                                                             <GET-CLASSIFICATION PARTICLE>>>
                                    ;<NOT <PMEM-TYPE? <SET PART3 <POP-PSTACK ,DATA-STACK>> PARTICLE>>
                                    <DONT-UNDERSTAND>
                                    <SETG P-CONT <>>
                                    <RFATAL>)>)
                            (<NOT <COMPARE-WORD-TYPES .A1 <GET-CLASSIFICATION VERB>>>
                             <SET VERBED .A1>
                             <SET A1 T>
                             <SET X T>)
                            (ELSE ;"Might want to edit this if it is not just for nouns"
                             <DONT-UNDERSTAND>
                             <SETG P-CONT <>>
                             <RFATAL>)>)>)>
	    <COND (<NOT .X>
               <SET VERBED <POP-PSTACK ,DATA-STACK>>)>)
            (T
        <COND (<G? .N 2>
	       <SET A1 <POP-PSTACK ,DATA-STACK>>)>
	    <SET VERBED <POP-PSTACK ,DATA-STACK>>)>

	<COND (<G? .N 2>
	       <SET A2 <POP-PSTACK ,DATA-STACK>>
	       <COND (<EQUAL? .N 4>
		      <POP-PSTACK ,DATA-STACK>)>)>
    
	<IF-P-THREE-NOUNS
        <COND (<N==? T .NOUN3 .PART3>
               <SETG PRST <PARSE-OBJ1 ,PARSE-RESULT
                              <OR <WORD-SEMANTIC-STUFF .NOUN3>
                                                       .NOUN3>>>)>>
    <PARSE-VERB ,PARSE-RESULT .VERBED>
	<PARSE-VERB-LEXV ,PARSE-RESULT ,TLEXV>
	<COND (<N==? .A1 T>
	       <PARSE-ADV ,PARSE-RESULT <OR <WORD-SEMANTIC-STUFF .A1> .A1>>)
	      (<N==? .A2 T>
	       <PARSE-ADV ,PARSE-RESULT <OR <WORD-SEMANTIC-STUFF .A2> .A2>>)>
	T>

"Basic NP reduction.  Doesn't do any checking at this level, just copies
 everything into a structure for later use."

<DEFINE RED-NP ("OPT" N:FIX TYP:FIX
		 "AUX" NAME (QUANT ,NP-QUANT-NONE) LEXB (LEXE ,TLEXV) ADJ NAME2)
  <SET NAME <POP-PSTACK ,DATA-STACK>>
  <COND (<EQUAL? .NAME 1>
	 <SET NAME <>>)>
  <SET ADJ <ZGET .LEXE 0>>
  <COND (<IFFLAG (P-ZORK0
		  <WORD-TYPE? .ADJ ,P-COMMA-CODE ,P-EOI-CODE>)
		 (T
		  <OR <EQUAL? .ADJ ,W?COMMA ,W?AND ,W?&>
		      <COMPARE-WORD-TYPES <WCN .ADJ>
					  <GET-CLASSIFICATION END-OF-INPUT>>>)>	 
	 <SET LEXE <ZBACK .LEXE ,LEXV-ELEMENT-SIZE-BYTES>>)>
  <SET ADJ <POP-PSTACK ,DATA-STACK>>
  <IFFLAG (P-ARTHUR
	   <COND (<==? .N 3>		;"Thomas the rhymer,..."
		  <SET NAME2 <POP-PSTACK ,DATA-STACK>>
		  <IFFLAG (P-PS-THEWORD
			   <SET ADJ <PMEM-ALLOC ADJS
				       LEXPTR
				       <BACK ,TLEXV <* ,LEXV-ELEMENT-SIZE-BYTES 2>>
				       COUNT 1>>)
			  (T
			   <COND (<N==? .ADJ ,W?THE> <RFALSE>)>
			   <SET ADJ <PMEM-ALLOC ADJS
				       LEXPTR
				       <BACK ,TLEXV <* ,LEXV-ELEMENT-SIZE-BYTES 2>>
				       COUNT 1>>)>
		  <ZPUT <REST-TO-SLOT .ADJ ADJS-COUNT 1> 0 .NAME2>)>)>
  <COND (<==? .ADJ 1>
	 <SET LEXB .LEXE>
	 <SET ADJ <>>)
	(T
	 <SET LEXB <ADJS-LEXPTR .ADJ>>
	 <COND (<T? <ADJS-QUANT .ADJ>>
		<SET QUANT <ADJS-QUANT .ADJ>>)>)>
  <PMEM-ALLOC NP NAME .NAME ADJS .ADJ
		 LEXBEG .LEXB LEXEND .LEXE QUANT .QUANT>>

"Reduction for FOO OF BARS"
<DEFINE RED-OF ("OPT" N:FIX TYP:FIX "AUX" ONP:PMEM NP:PMEM TMP A)
	<SET ONP <POP-PSTACK ,DATA-STACK>>
	<COND (<==? <POP-PSTACK ,DATA-STACK> ,W?OF>
	       <COND (<AND <NP-QUANT <SET NP <POP-PSTACK ,DATA-STACK>>>
			   <NOT <NP-NAME .NP>>
			   <NOT <NP-ADJS .NP>>>
		      ;"ALL OF THE BOOKS = ALL BOOKS"
		      <NP-QUANT .ONP <NP-QUANT .NP>>
		      .ONP)
		     (T
		      ;<NP-OF .NP .ONP>
		      .NP)>)>>

"Reduction for case of a quantity by itself"
<DEFINE RED-QT ("OPT" N:FIX TYP:FIX "AUX" Q)
 <SET Q <POP-PSTACK ,DATA-STACK>>
 <COND (<NOT <EQUAL? .Q ,W?A ,W?AN>>
	<PMEM-ALLOC NP QUANT <GET-QUANTITY .Q>
			LEXBEG ,TLEXV LEXEND ,TLEXV>)>>

<DEFINE GET-QUANTITY-WORD (Q "AUX" TBL)
 <COND (<SET TBL <INTBL? .Q ,NP-QUANT-TBL ,NP-QUANT-TBL-LEN *204*>>
	<ZGET .TBL 1>)>>

<DEFINE GET-QUANTITY (Q:VWORD "AUX" TBL)
 <COND (<SET TBL <INTBL? .Q <ZREST ,NP-QUANT-TBL 2> ,NP-QUANT-TBL-LEN *204*>>
	<ZGET <ZBACK .TBL 2> 0>)>>

"Quantity followed by a noun phrase:  ALL RED BOOKS"
<DEFINE RED-QN ("OPT" N:FIX TYP:FIX "AUX" NP:PMEM Q)
	<SET NP <POP-PSTACK ,DATA-STACK>>
	<COND ;(<NOT <EQUAL? <NP-QUANT .NP> ,NP-QUANT-NONE ,NP-QUANT-PLURAL>>
	       <PARSER-ERROR ,P-DONT-UNDERSTAND-TWO-QUANTITIES>)
	      (T
	       ;"We don't distinguish ALL THE BOOKS from ALL THE BOOK."
	       <NP-LEXBEG .NP <- <NP-LEXBEG .NP> ,LEXV-ELEMENT-SIZE-BYTES>>
	       <NP-QUANT .NP <GET-QUANTITY <POP-PSTACK ,DATA-STACK>>>
	       .NP)>>

"Basic top-level noun phrase reduction"
<DEFINE RED-NPP RED ("OPT" N:FIX TYP:FIX
		"AUX" NPP:PMEM ONPP:PMEM PP:PMEM NP (RLOC <>)
		      (X1 <>) (X2 <>) (KLUDGE-FLAG <>))
  <COND (<==? .N 1>
	 ;"Just an NP, so nothing interesting to do"
	 <POP-PSTACK ,DATA-STACK>)
	(<==? .N 2>
	 ;"NP/NPP followed by PP"
	 <SET PP <POP-PSTACK ,DATA-STACK>>
	 <SET ONPP <POP-PSTACK ,DATA-STACK>>
	 <COND (<EQUAL? <PP-PREP .PP> ,W?BUT ,W?EXCEPT>
		;"An exception, which isn't the same as a location"
		<COND
		 (<NOT <PMEM-TYPE? .ONPP NP>> ;"Can't have exceptions to an NPP"
		  <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOUND> .RED>)
		 (<NOT <NP-QUANT .ONPP>>
		  <COND	;"PUT ALL IN FOO BUT BAR?"
			(<NOT <PSTACK-EMPTY? ,DATA-STACK>>
			 <SET X1 <POP-PSTACK ,DATA-STACK>>
			 <COND (<NOT <PSTACK-EMPTY? ,DATA-STACK>>
				<SET X2 <POP-PSTACK ,DATA-STACK>>
				<COND (<AND <PMEM? .X2>
					    <PMEM-TYPE? .X2 NP>
					    <NP-QUANT .X2>
					    <REDUCE-EXCEPTION .PP .X2>>
				       <SET KLUDGE-FLAG T>)>
				<PUSH-PSTACK ,DATA-STACK .X2>)>
			 <PUSH-PSTACK ,DATA-STACK .X1>)>
		  <COND (<NOT .KLUDGE-FLAG> ;"Doesn't make much sense otherwise"
			 <RETURN <PARSER-ERROR 0 ,PARSER-ERROR-NOUND> .RED>)>)
		 (<NOT <REDUCE-EXCEPTION .PP .ONPP>> ;"Try to make sense of it"
		  <RETURN <> .RED>)>)
	       (<AND <IF-P-THIRD-PART
                  <NOT <=? <PARSE-ACTION ,PARSE-RESULT>
                           ,V?PUT-IN ,V?POUR ,V?PUT>>>
                 <NOT <SET RLOC <REDUCE-LOCATION .PP>>>>
		;"Died, set up orphaning and severity"
		<RETURN <> .RED>)>
	 <COND (<NOT .RLOC> .ONPP)
	       (<PMEM-TYPE? .ONPP NP>
		;"We have NP (disguised as NPP) followed by PP, so glue them together"
		<COND (<NP-LOC .ONPP>
		       <PARSER-ERROR 0 ,PARSER-ERROR-TMNOUN
				     <LOCATION-PREP .RLOC>>)
		      (T
		       <NP-LOC .ONPP .RLOC>
		       .ONPP)>)
	       (T
		;"We have NPP followed by PP. NPP is produced only by NP CONJ NP"
		<REPEAT ((OONPP:<OR PMEM FALSE> .ONPP) NP:PMEM)
			<COND (<NOT <NP-LOC <SET NP <NPP-NOUN .OONPP>>>>
			       <NP-LOC .NP .RLOC>)>
			<COND (<NOT <SET OONPP <NPP-NEXT .OONPP>>>
			       <RETURN .ONPP .RED>)
			      (<PMEM-TYPE? .OONPP NP>
			       <NP-LOC .OONPP .RLOC>
			       <RETURN .ONPP .RED>)>>)>)
	(T
	 ;"Case of NPP AND NP"
	 <SET NP <POP-PSTACK ,DATA-STACK>>
	 <COND (<EQUAL? <POP-PSTACK ,DATA-STACK>
			,W?AND ;,W?OR ,W?COMMA ,W?&>
		<COND (<AND <PMEM-TYPE? <SET NPP <POP-PSTACK ,DATA-STACK>> NP>
			    <NP-EXCEPT .NPP>>
		       ;"Prefer all (but foo and bar) over (all but foo) and bar..."
		       <RETURN <> .RED>)>
		<SET NP <PMEM-ALLOC NPP NOUN .NP>>
		<COND (<PMEM-TYPE? .NPP NP>
		       <PMEM-ALLOC NPP NEXT .NP
				   NOUN .NPP>)
		      (T
		       <REPEAT ((NN:PMEM .NPP) TEMP:<OR FALSE PMEM>)
		         <COND (<NOT <SET TEMP <NPP-NEXT .NN>>>
				<NPP-NEXT .NN .NP>
				<RETURN>)>
			 <SET NN .TEMP>>
		       .NPP)>)>)>>

<DEFINE RED-PP PP ("OPT" N:FIX TYP:FIX
		   "AUX" TMP NOUN:PMEM (PREP:<OR VWORD FALSE> <>))
  <SET NOUN <POP-PSTACK ,DATA-STACK>>
  <COND (<==? .N 2>
	 <SET PREP <POP-PSTACK ,DATA-STACK>>
	 ;<COND (<==? .PREP ,W?NOT>
		<RETURN <> .PP>)>)
	(<==? <SET TMP <POP-PSTACK ,DATA-STACK>> ,W?OF>
	 <COND (<==? <SET PREP <POP-PSTACK ,DATA-STACK>> ,W?OUT>
		<SET PREP ,W?FROM>)
	       (T
		<RETURN <> .PP>)>)
	;(<==? .TMP ,W?NOT>
	 <COND (<NOT <EQUAL? <SET PREP <POP-PSTACK ,DATA-STACK>>
			     ,W?BUT ,W?EXCEPT>>
		<RETURN <> .PP>)>)>
  <COND (.PREP <PMEM-ALLOC PP PREP .PREP NOUN .NOUN>)>>

<ADD-WORD MY ADJ>
<ADD-WORD ME NOUN>
<ADD-WORD YOUR ADJ>
<ADD-WORD YOU NOUN>
<ADD-WORD ITS ADJ>
<ADD-WORD IT NOUN>
<ADD-WORD HIS ADJ>
<ADD-WORD HIM NOUN>
<IFN-P-GENDERS
	<ADD-WORD HER ADJ>
	<ADD-WORD HER NOUN>>
;<ADD-WORD OUR ADJ>
;<ADD-WORD US NOUN>
<ADD-WORD THEIR ADJ>
<ADD-WORD THEM NOUN>

<DEFINE RED-POSS RP ("OPT" N:FIX TYP:FIX "AUX" (OBJ 0) WD A)
 <COND (<==? .N 3>
	<COND (<N==? <POP-PSTACK ,DATA-STACK> ,W?S>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOUND>)
	      (<N==? <POP-PSTACK ,DATA-STACK> ,W?APOSTROPHE>
	       <PARSER-ERROR 0 ,PARSER-ERROR-NOUND>)
	      (T
	       <POP-PSTACK ,DATA-STACK>)>)>>

<CONSTANT LAST-OBJECT 0>

<DEFINE RED-ADJS RA ("OPT" N:FIX TYP:FIX "AUX" A1 ART)
   <SET A1 <POP-PSTACK ,DATA-STACK>>
   <COND (<EQUAL? 1 .N>
	  .A1)
	 (T
	  <COND (<EQUAL? 1 .A1>
		 <SET A1 <PMEM-ALLOC ADJS LEXPTR ,TLEXV>>)>
	  <SET ART <POP-PSTACK ,DATA-STACK>>
	  <COND (<PMEM? .ART>	;"NP"
		 <ADJS-POSS .A1 .ART>
		 <RETURN .A1 .RA>)
		(<EQUAL? .ART ,W?A ,W?AN ;,W?ANY>
		 <ADJS-QUANT .A1 ,NP-QUANT-A>)
		(<NOT <EQUAL? .ART ,W?THE>>
		 <RETURN <> .RA>)>
	  .A1)>>

<DEFINE RED-ADJ RA ("OPT" N:FIX TYP:FIX "AUX" A1 A2 CT AD)
  ;"We die after four adjectives for now, since we don't have arbitrary
     storage allocation.  Other possibilities exist for the future..."
  <COND (<0? .N> 1)
	(T
	 <COND (<==? <SET A1 <POP-PSTACK ,DATA-STACK>> 1>
		<SET A1 <PMEM-ALLOC ADJS LEXPTR ,TLEXV>>)>
	 <SET A2 <POP-PSTACK ,DATA-STACK>>
	 <COND (<EQUAL? .A2 ,W?MY>
	        <ADJS-POSS .A1 ,PLAYER>
		<RETURN .A1 .RA>)
	       (<EQUAL? .A2 ,W?YOUR>
		<COND (T ;<NOT <==? ,WINNER ,PLAYER>>
		       <ADJS-POSS .A1 ,WINNER>)>
		<RETURN .A1 .RA>)
	       (<EQUAL? .A2 ,W?HIS>	;"ASK TROLL ABOUT HIS AX"
		<COND (<AND <SET AD <PARSE-OBJ1 ,PARSE-RESULT>>
			    <SET AD <NOUN-PHRASE-OBJ1 .AD>>
			    <FSET? .AD ,PERSONBIT>>
		       <ADJS-POSS .A1 .AD>
		       <IF-P-GENDERS
				<COND (<FSET? .AD ,FEMALEBIT>
				       <ADJS-POSS .A1 ,P-HIM-OBJECT>)>>)
		      (T
		       <ADJS-POSS .A1 ,P-HIM-OBJECT>)>
		<RETURN .A1 .RA>)>
	 <IF-P-GENDERS
	 <COND (<EQUAL? .A2 ,W?HER>
		<COND (<AND <SET AD <PARSE-OBJ1 ,PARSE-RESULT>>
			    <SET AD <NOUN-PHRASE-OBJ1 .AD>>
			    <FSET? .AD ,PERSONBIT>
			    <FSET? .AD ,FEMALEBIT>>
		       <ADJS-POSS .A1 .AD>)
		      (T
		       <ADJS-POSS .A1 ,P-HER-OBJECT>)>
		<RETURN .A1 .RA>)>>
	 <COND (<EQUAL? .A2 ,W?THEIR>
		<COND (<AND <SET AD <PARSE-OBJ1 ,PARSE-RESULT>>
			    <SET AD <NOUN-PHRASE-OBJ1 .AD>>
			    <FSET? .AD ,PLURALBIT>>
		       <ADJS-POSS .A1 .AD>)
		      (T
		       <ADJS-POSS .A1 ,P-THEM-OBJECT>)>)
	       (<EQUAL? .A2 ,W?ITS>
		<COND (<AND <SET AD <PARSE-OBJ1 ,PARSE-RESULT>>
			    <SET AD <NOUN-PHRASE-OBJ1 .AD>>
			    <NOT <FSET? .AD ,PERSONBIT>>>
		       <ADJS-POSS .A1 .AD>)
		      (T
		       <ADJS-POSS .A1 ,P-IT-OBJECT>)>)
	       (<BAND ,POSSESSIVE <WORD-FLAGS .A2>>
		<ADJS-POSS .A1 <WORD-SEMANTIC-STUFF .A2>>)
	       (<IFFLAG (P-ZORK0
			 <WORD-TYPE? .A2 ,P-ADJ-CODE>)
			(T
			 <COMPARE-WORD-TYPES <WCN .A2>
					     <GET-CLASSIFICATION ADJ>>)>
		<SET AD <COND (T ;<CHECK-EXTENDED?> .A2)
			      ;(T <WORD-ADJ-ID .A2>)>>
		<COND (<L? <SET CT <ADJS-COUNT .A1:PMEM>>:FIX ,ADJS-MAX-COUNT>
		       ;"Make sure the adjective isn't already here..."
		       <REPEAT ((VV:<PRIMTYPE TABLE>
				 <REST-TO-SLOT .A1:PMEM ADJS-COUNT 1>)
				(TCT:FIX <ADJS-COUNT .A1:PMEM>))
			       <COND (<0? .TCT>
				      <ZPUT .VV 0 .A2>
				      <ADJS-COUNT .A1 <+ .CT 1>>
				      <RETURN>)>
			       <COND (<==? .AD <COND (T ;<CHECK-EXTENDED?>
						      <ZGET .VV 0>)
						     ;(T <WORD-ADJ-ID
							 <ZGET .VV 0>>)>>
				      <RETURN>)>
			       <SET VV <ZREST .VV 2>>
			       <SET TCT <- .TCT 1>>>)>)
	       (T <RETURN <> .RA>)>
	 .A1)>>

<OBJECT INTQUOTE
	(LOC GLOBAL-OBJECTS)
	(DESC "quotation")>

<DEFINE RED-QUOTE ACT ("OPT" N:FIX TYP:FIX "AUX" NP)
 <COND (<EQUAL? ,W?QUOTE <POP-PSTACK ,DATA-STACK>>
	;<COND (<EQUAL? .N 3>
	       <SET NP <POP-PSTACK ,DATA-STACK>>
	       <COND (<EQUAL? ,W?QUOTE <POP-PSTACK ,DATA-STACK>>
		      <RETURN .NP .ACT>)
		     (T <RETURN <> .ACT>)>)
	      (<NOT <SPEAKING-VERB? <PARSE-ACTION ,PARSE-RESULT>>>
	       <RETURN <> .ACT>)>
	<SET NP <PMEM-ALLOC NP NAME ,W?QUOTE
			    LEXBEG <ZBACK ,P-RUNNING <* 2 ,P-LEXELEN>>
			    ;"Back up over NO.WORD">>
	<REPEAT ()
	 <SET N <ZGET ,P-RUNNING 0>>
	 <COND (<OR <L? <SETG P-LEN <- ,P-LEN 1>> 0>
		    <EQUAL? .N ,W?QUOTE ,W?END.OF.INPUT>>
		<COND (<EQUAL? .N ,W?QUOTE>
		       <NP-LEXEND .NP ,P-RUNNING>
		       <SETG P-RUNNING <ZREST ,P-RUNNING <* 2 ,P-LEXELEN>>>)
		      (T
		       <NP-LEXEND .NP <ZBACK ,P-RUNNING <* 2 ,P-LEXELEN>>>)>
		<COND (T ;<NOT <EQUAL? .N ,W?QUOTE>>	;"LOOK UP 'WORM'"
		       <SETG P-WORDS-AGAIN </ <- ,P-RUNNING
						 <ZGET ,OOPS-TABLE ,O-START>>
					      <* 2 ,P-LEXELEN>>>
		       ;<SETG P-WORDS-AGAIN <- ,P-WORDS-AGAIN 1>>)>
		<RETURN>)>
	 <SETG P-RUNNING <ZREST ,P-RUNNING <* 2 ,P-LEXELEN>>>>
	<PMEM-ALLOC NOUN-PHRASE
		    COUNT 1 LENGTH ,NOUN-PHRASE-MIN-LENGTH
		    OBJ1 ,INTQUOTE NP1 .NP>)>>

<END-SEGMENT>
<ENDPACKAGE>
