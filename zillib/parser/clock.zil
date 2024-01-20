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