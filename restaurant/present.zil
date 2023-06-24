"PRESENT for
        the Restaurant at the End of the Universe"


"PART 4 - PLANETARY DESIGN WORKSHOP"

;<ROUTINE I-PDW-SET ()
    <COND (<AND <EQUAL? <LOC ,PLAYER> ,TELEPORTER>
                <FSET? ,TELEPORTER ,RADPLUGBIT>>
           <TELL "You are allowed a few seconds inside before Slarty waves at you, and nods.">
           <COND (<FSET? ,TELEPORTER ,SADRADIOBIT>
                  <SETG DARK-FLAG ,GLACIER-1>
                  <SETG IMMOVABLE T>)>
           <FCLEAR ,TELEPORTER ,RADPLUGBIT>
           <GO-TO-DARK>)>>

<ROOM PDW
    (LOC ROOMS)
    (OWNER SLARTY)
    (DESC "Planetary Design Workshop")
    (OUT PER OUT-PDW)
    (IN PER IN-PDW)
    (FLAGS LIGHTBIT ONBIT)
    (ACTION PDW-F)
    (THINGS (PLANETARY DESIGN SLARTY\'S SLARTIBAR) (WORKSHOP FACTORY) GLOBAL-ROOM-F
            <> (PASSAGE EXIT DOOR) NO-EXIT-F
            <> (PEN PENCIL) UNIMPORTANT-THING-F
            <> (MACHINES DEVICES) UNIMPORTANT-THING-F
            (NICE GOOD BEAUTIFUL COOL) (LIGHTS LIGHTING LIGHT LAMP) JUST-LIGHT-F)>

<ROUTINE PDW-F (RARG)
    <COND (<EQUAL? .RARG ,M-BEG>
           <COND (<0? ,VERBOSITY>
                  <FCLEAR ,NOTEBOOK ,NDESCBIT>
                  <FCLEAR ,TELEPORTER ,NDESCBIT>
                  <FCLEAR ,PILL-JAR ,NDESCBIT>
                  <FCLEAR ,TUBE-RACK ,NDESCBIT>
                  <FCLEAR ,COMPUTER ,NDESCBIT>
                  <FCLEAR ,CABINET ,NDESCBIT>
                  ;<RFALSE>)
                 (ELSE
                  <FSET ,NOTEBOOK ,NDESCBIT>
                  <FSET ,TELEPORTER ,NDESCBIT>
                  <FSET ,TUBE-RACK ,NDESCBIT>
                  <FSET ,COMPUTER ,NDESCBIT>
                  <FSET ,CABINET ,NDESCBIT>
                  ;<RFALSE>)>
           <COND (<AND <VERB? TAKE>
                       <DOBJ? BLUE-TUBE RED-TUBE GREEN-TUBE ;KNIFE RED-FROB GREEN-FROB>
                       <NOT <FSET? ,TELEPORTER ,SADRADIOBIT>>>
                  <TELL "\"Leave it here,\" he says." CR>
                  <RTRUE>)>
           <RFALSE>)>
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <COND (<IN? ,PLAYER ,TELEPORTER>
                         <TELL
"From inside the teleporter, you can see the whole of the room. The room contains ">)
                        (ELSE
                         <TELL "You stand in the centre of a large room which has ">)>
                  <COND (<FSET? ,PILLS ,NDESCBIT>
                         <TELL "a jar of pills standing beside ">)>
                  <TELL "an ancient computer by one wall - the sort of ancientness
which you associate playing text-based games with. The screen seems to show
a download of some sort, stuck in its loading phase. To the left of it is a
lamp shining over a notepad"><COND (<FSET? ,NOTEBOOK ,OPENBIT><TELL" (open)">)><TELL
" with some scribbles along the page. On that note, one thing you noticed here
that you haven't during your \"adventures\" across the galaxy area is proper
lighting. It's always either too bright or too dark, or that there is no
time to admire the lighting unless you would be eaten or killed in a new and
interesting way.||A " D ,TUBE-RACK " line the table in the centre of the room,
and a " D ,CABINET " along one wall ">
                  <COND (<FIRST? ,CABINET>
                         <TELL "contains lots of stuff, but of the more interesting objects, you can see">
                         <PRINT-CONTENTS ,CABINET>)
                        (ELSE
                         <TELL "is empty (not really, but it's too complicated for you to understand)">)>
                  <TELL ,PAUSES CR>
                  <PERFORM ,V?EXAMINE ,TELEPORTER>
                  <TELL
"There are no directions to go in, so you assume you have to use the "
D ,TELEPORTER " to get in or out." CR>)

                 (ELSE
                  <COND (<IN? ,PLAYER ,TELEPORTER>
                         <TELL "From inside the teleporter, you can see the whole of the room. One one side">)
                        (ELSE
                         <TELL "You are in the middle of a large room. On one side of the room">)>
                  <COND (<FSET? ,PILLS ,NDESCBIT>
                         <TELL ", beside a jar of pills">)>
                  <TELL ", there is a computer which seems
to be stuck on a loading screen. Ignoring the nice lighting situation, you
look to the other side, where there a cabinet along one wall and a tube rack.|
|It appears that you can't leave - there are no exits. You can also see a notepad">
<COND (<FSET? ,NOTEBOOK ,OPENBIT> <TELL" (open)">)><TELL ", but don't worry yourself
just yet (if you have been doing so for some reason) - it doesn't look important.
Also, a " D ,CABINET " along one wall ">
                  <COND (<FIRST? ,CABINET>
                         <TELL "contains ">
                         <PRINT-CONTENTS ,CABINET>)
                        (ELSE
                         <TELL "is empty">)>
                  <TELL ,PAUSES>
                  <PERFORM ,V?EXAMINE ,TELEPORTER>)>
           <COND (<AND <NOT <FSET? ,PDW ,RADPLUGBIT>>
                       <FSET? ,GLACIER-1 ,SADRADIOBIT>>
                  <TELL CR
"\"Welcome back!\" Slarty says. He guides you over to the computer
and tells you to put the red frob inside it, so that it can change
its form using the word that you spoke on returning here." CR CR>
                  <FSET ,PDW ,RADPLUGBIT>)>)>>

<ROUTINE OUT-PDW ()
    <COND ;(<EQUAL? <LOC ,PLAYER> ,TELEPORTER>
           ;<TELL "You step out of the teleporter." CR CR>
           ;[<OWN-FEET><CRLF>
           <V-LOOK>
           <RFALSE>]
           ,PDW)
          (ELSE
           <TELL "There are no exits." CR>
           <RFALSE>)>>

<ROUTINE IN-PDW ()
    <COND ;(<IN? ,PLAYER ,TELEPORTER>
           <TELL "There's nowhere to go into." CR>
           <RFALSE>)
          (ELSE
           ;<TELL "You step into the chamber." CR>
           <PERFORM ,V?BOARD ,TELEPORTER>
           <FUCKING-CLEAR>
           <RFALSE>)>>

<OBJECT COMPUTER
    (LOC PDW)
    (DESC "computer")
    (LDESC "A computer rests against the wall.")
    (ADJECTIVE OLD ANALOG TEXT ANCIENT)
    (SYNONYM COMPUTER SCREEN)
    (FLAGS ONBIT READBIT NDESCBIT ;BADRADIOBIT ;"FIXED")
    (ACTION COMPUTER-F)>

<ROUTINE COMPUTER-F ()
    <COND (<VERB? EXAMINE READ>
           <TELL
"It looks very old. You could probably find an Infocom game on it, or something.">
           <COND (<NOT <FSET? ,COMPUTER ,BADRADIOBIT>>
                  <TELL " But at the moment, it looks quite stuck.">)>
           <CRLF>)
          (<VERB? PLAY FIX CHANGE>
           <COND (<NOT <FSET? ,COMPUTER ,BADRADIOBIT>>
                  <TELL "You can't seem to change it from the loading screen." CR>)
                 (ELSE
                  <TELL
"\"Just leave it.\" " D ,SLARTY " looks at you sternly, as if you were a bad child and he was
giving you a lecture on why accidentally smashing windows is not a hobby to be proud of." CR>)>)
          (<VERB? LAMP-OFF>
           <TELL "\"Don't,\" says " D ,SLARTY ", putting a hand on your arm." CR>)
          (<VERB? TAKE>
           <TELL "Way too big." CR>)
          (<AND <VERB? PUT PUT-IN>
                <IOBJ? COMPUTER>>
           <COND (<DOBJ? RED-FROB>
                  <TELL
"You place it inside a compartment on the computer, and
it disappears. Already the computer starts whirring." CR>
                  <MOVE ,RED-FROB ,DARK-OBJECT>
                  <QUEUE I-COMPUTER 2>)>)>>

<GLOBAL COMPUTER-BASH <>>

<ROUTINE I-COMPUTER ()
    <COND (<NOT ,COMPUTER-BASH>
           <TELL "The top line of the computer apears with the text:">
           <SIXCR>
           <TELL "    ****   Philosophy compiler online   ****" CR>
           <TELL "    ****      Accessing inner frob      ****" CR>
           <TELL "    *************CIRCUITS BROKEN************" CR>
           <SETG COMPUTER-BASH T>
           <QUEUE I-COMPUTER 2>)
          (ELSE
           <TELL
"... And with that, the computer explodes, leaving no trace of a burn
mark or the computer itself, and only a red rhombicosidodecahedron." CR>
           <REMOVE ,COMPUTER>
           <MOVE ,RED-FROB ,HERE>
           <PUTP ,RED-FROB ,P?SDESC "red rhombicosidodecahedron">
           <INCREMENT-SCORE 20>)>>

<ROUTINE NO-EXIT-F ()
    <TELL "There isn't any exit!" CR>>

<ROUTINE JUST-LIGHT-F ()
    <TELL "It's just some good lighting, that's all. Now get over it." CR>>

<OBJECT NOTEBOOK
    (LOC PDW)
    (DESC "notebook")
    (LDESC "There is a notebook here.")
    (ADJECTIVE NOTE FAMOUS LAST)
    (SYNONYM NOTEPAD NOTEBOOK NOTES BOOK SCRIBBLES SCRIBBLE IDEAS IDEA WORD WORDS)
    (FLAGS OPENABLEBIT TRYTAKEBIT TAKEBIT READBIT NDESCBIT)
    (ACTION NOTEBOOK-F)>

<ROUTINE NOTEBOOK-F ()
    <COND (<VERB? OPEN>
           <COND (<FSET? ,NOTEBOOK ,OPENBIT>
                  <ALREADY ,NOTEBOOK "open">)
                 (ELSE
                  <FSET ,NOTEBOOK ,OPENBIT>
                  <TELL "You open it and read a few lines:" CR>
                  <PERFORM ,V?READ ,NOTEBOOK>)>)
          (<VERB? CLOSE>
           <COND (<NOT <FSET? ,NOTEBOOK ,OPENBIT>>
                  <ALREADY ,NOTEBOOK "closed">)
                 (ELSE
                  <FCLEAR ,NOTEBOOK ,OPENBIT>
                  <TELL "Closed." CR>)>)
          (<AND <VERB? READ EXAMINE LOOK-ON>
                ;<NOT <NOUN-USED? ,PRSO ,W?PEN ,W?PENCIL ,W?LAMP>>>
           <COND (<NOT <FSET? ,NOTEBOOK ,OPENBIT>>
                  <COND (<VERB? EXAMINE>
                         <TELL "It says IDEAS on the front." CR>
                         <RTRUE>)
                        (ELSE
                         <FIRST-YOU "opening" ,NOTEBOOK>
                         <FSET ,NOTEBOOK ,OPENBIT>)>)>
           <BOLDEN "FAMOUS LAST WORDS:"><TELL CR !\">
           ;<ITALICIZE <PICK-ONE ,FAMOUS-QUOTE>>
           <COND (<AND ;<GET ,FIRST-BUFFER 0>
                       ,CARELESS-WORDS-FLAG
                       <PROB 50>>
                  <HLIGHT ,H-ITALIC>
                  <RESTORE-INPUT ,FIRST-BUFFER>
                  <HLIGHT ,H-NORMAL>
                  <TELL !\">)
                 (ELSE
                  <ITALICIZE <PICK-ONE ,FAMOUS-QUOTE>>)>
           <CRLF>)
          (<VERB? TAKE>
           <TELL "You decide to leave it here." CR>)>>


<OBJECT CABINET
    (LOC PDW)
    (DESC "glass cabinet")
    (SYNONYM CABINET CUPBOARD)
    (ADJECTIVE TRANSPARE GLASS DOORLESS COMPLICAT)
    (FLAGS NDESCBIT CONTBIT OPENBIT ;SEARCHBIT TRANSBIT)
    (ACTION CABINET-F)
    (CAPACITY 500)>

<ROUTINE CABINET-F ()
    <COND (<NOUN-USED? ,CABINET ,W?CUPBOARD>
           <TELL "[Tut tut! It isn't a "><ITALICIZE "cupboard"><TELL ", it's a cabinet! Anyway...]" CR CR>)>
    <COND (<VERB? EXAMINE>
           <TELL "It is a " D ,CABINET " with no doors. All manner of objects can be found in here. ">
           <PERFORM ,V?SEARCH ,CABINET>)
          (<VERB? SEARCH LOOK-INSIDE>
           <COND (<FIRST? ,CABINET>
                  <OPEN-ANYTHING ,CABINET <> 0>)
                 (ELSE
                  <TELL
"There's nothing in it which isn't too complicated for you to understand." CR>)>)
          (<VERB? CLOSE>
           <TELL "It's a cabinet with no doors." CR>)
          (<OR <NOT <VERB? PUT PUT-IN>>
               <AND <VERB? TAKE>
                    <NOT <IOBJ? CABINET>>>>
           <TELL "That's just scenery." CR>)>>


<OBJECT TUBE-RACK
    (LOC PDW)
    (DESC "rack of tubes")
    (SYNONYM TUBE TUBES RACK)
    (ADJECTIVE ;TEST CRYSTAL CRYSTALLI)
    (FLAGS NDESCBIT SURFACEBIT OPENBIT)
    (ACTION TUBE-RACK-F)>

<ROUTINE TUBE-RACK-F ("AUX" BLU BUR GRE)
    <COND (<VERB? EXAMINE>
           <TELL "The rack is crystalline, and has three container pockets." CR>)>
    <COND (<VERB? EXAMINE SEARCH LOOK-ON LOOK-INSIDE>
           <COND (<FIRST? ,TUBE-RACK>
                  <TELL "On the rack is:" CR>
                  <COND (<IN? ,BLUE-TUBE ,TUBE-RACK>
                         <TELL <GET ,INDENTS 1> "a test tube with a blue rim">
                         <COND (<SET BLU <FIRST? ,BLUE-TUBE>>
                                <TELL " (containing "><THE-J .BLU <>><TELL !\)>)>
                         <CRLF>)>
                  <COND (<IN? ,RED-TUBE ,TUBE-RACK>
                         <TELL <GET ,INDENTS 1> "a red-tinted container">
                         <COND (<SET BUR <FIRST? ,RED-TUBE>>
                                <TELL " (holding "><THE-J .BUR <>><TELL !\)>)>
                         <CRLF>)>
                  <COND (<IN? ,GREEN-TUBE ,TUBE-RACK>
                         <TELL <GET ,INDENTS 1> "a cubical flask with a green label on it">
                         <COND (<SET GRE <FIRST? ,GREEN-TUBE>>
                                <TELL " (containing "><THE-J .GRE <>><TELL !\)>)>
                         <CRLF>)>
                  <RTRUE>)
                 (ELSE
                  <RFALSE>)>)
          (<VERB? PUT PUT-IN>
           <COND (<DOBJ? BLUE-TUBE RED-TUBE GREEN-TUBE>
                  <COND (<NOT <IN? ,PRSO ,TUBE-RACK>>
                         <TELL "Done." CR>
                         <MOVE ,PRSO ,TUBE-RACK>)
                        (ELSE
                         <ALREADY ,PRSO>)>)
                 (ELSE
                  <COND (<L? <GETP ,PRSO ,P?SIZE> 5>
                         <TELL He+verb ,PRSO "fall" " right through, and " verb ,PRSO "land" " on the floor." CR>
                         <MOVE ,PRSO ,HERE>)
                        (ELSE
                         <TELL He+verb ,PRSO "do" "n't fit." CR>
                         <RTRUE>)>)>)>>

<OBJECT BLUE-TUBE
    (LOC SLARTY)
    (DESC "blue test tube")
    (SYNONYM TUBE RIM)
    (ADJECTIVE BLUE BLUE-RIMM TEST)
    (FLAGS CONTBIT ;SEARCHBIT TRANSBIT TAKEBIT)
    (ACTION BLUE-TUBE-F)>

<ROUTINE BLUE-TUBE-F ("AUX" BLU)
    <COND (<AND <VERB? PUT-IN>
                <IOBJ? BLUE-TUBE>>
           <COND (<AND <DOBJ? BLUE-FROB>
                       <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">>
                  <TELL "\"First find its true form,\" calls " D ,SLARTY " from the other side of the room." CR>)
                 (<AND <DOBJ? BLUE-FROB>
                       ;<EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "small penknife" "blue frob of power">>
                  <TELL "It fits perfectly." CR>
                  <MOVE ,BLUE-FROB ,BLUE-TUBE>)
                 (<L? <GETP ,PRSO ,P?SIZE> 5>
                  <THE-J ,PRSO T T><TELL verb ,PRSO "is" "n't meant to go in the tube." CR>)
                 (ELSE
                  <TELL He+verb ,PRSO "do" "n't fit.">
                  <COND (<DOBJ? RED-FROB GREEN-FROB>
                         <TELL "Plus, that isn't the right tube to put that in." CR>)>)>)
          (<VERB? SEARCH LOOK-INSIDE EXAMINE>
           <TELL "The " D ,BLUE-TUBE>
           <COND (<IN? ,BLUE-TUBE ,TUBE-RACK>
                  <TELL "is on the " D ,TUBE-RACK>
                  <COND (<FIRST? ,BLUE-TUBE>
                         <TELL ", and">)>)
                 (<IN? ,BLUE-TUBE ,SLARTY>
                  <TELL "is being held by " D ,SLARTY>
                  <COND (<FIRST? ,BLUE-TUBE>
                         <TELL ", and">)>)>
           <COND (<SET BLU <FIRST? ,BLUE-TUBE>>
                  <TELL " contains "><THE-J .BLU <>>)
                 (ELSE
                  <TELL " is ">
                  <COND (<VERB? EXAMINE>
                         <TELL "called that because it's got a blue-tinted rim, probably to specify what goes in it">)
                        (ELSE
                         <TELL "empty">)>)>
           <TELL ,PAUSES>)>>

<OBJECT RED-TUBE
    (LOC TUBE-RACK)
    (DESC "red test tube")
    (SYNONYM TUBE PLASTIC CONTAINER)
    (ADJECTIVE RED TINTED TINT RED-TINTE PINK TEST PLASTIC)
    (FLAGS CONTBIT ;SEARCHBIT TRANSBIT TAKEBIT)
    (ACTION RED-TUBE-F)>

<ROUTINE RED-TUBE-F ("AUX" BUR)
    <COND (<AND <VERB? PUT-IN>
                <IOBJ? RED-TUBE>>
           <COND (<AND <DOBJ? RED-FROB>
                       <EQUAL? <GETP ,RED-TUBE ,P?SDESC> "red frob">>
                  <TELL "\"First find its true form,\" calls " D ,SLARTY " from the other side of the room." CR>)
                 (<DOBJ? RED-FROB>
                  <TELL "It fits perfectly." CR>
                  <MOVE ,RED-FROB ,RED-TUBE>)
                 (<L? <GETP ,PRSO ,P?SIZE> 10>
                  <THE-J ,PRSO T T><TELL verb ,PRSO "is" "n't meant to go in the tube." CR>)
                 (ELSE
                  <TELL He+verb ,PRSO "do" "n't fit.">
                  <COND (<DOBJ? BLUE-FROB GREEN-FROB>
                         <TELL "Plus, that isn't the right tube to put that in." CR>)>)>)
          (<VERB? SEARCH LOOK-INSIDE EXAMINE>
           <TELL "The " D ,RED-TUBE>
           <COND (<IN? ,RED-TUBE ,TUBE-RACK>
                  <TELL "is on the " D ,TUBE-RACK>
                  <COND (<FIRST? ,RED-TUBE>
                         <TELL ", but it also">)>)>
           <COND (<SET BUR <FIRST? ,RED-TUBE>>
                  <TELL " holds "><THE-J .BUR <>>)
                 (ELSE
                  <TELL " is ">
                  <COND (<VERB? EXAMINE>
                         <TELL "red-tinted. It might be made of plastic">)
                        (ELSE
                         <TELL "empty">)>)>
           <TELL ,PAUSES>)>>

<OBJECT GREEN-TUBE
    (LOC TUBE-RACK)
    (DESC "green test tube")
    (SYNONYM TUBE LABEL CUBE FLASK)
    (ADJECTIVE GREEN TEST CUBICAL)
    (FLAGS CONTBIT ;SEARCHBIT TRANSBIT TAKEBIT)
    (ACTION GREEN-TUBE-F)>

<ROUTINE GREEN-TUBE-F ("AUX" GRE)
    <COND (<AND <NOT <VERB? EXAMINE SEARCH LOOK-INSIDE READ>>
                <NOUN-USED? ,GREEN-TUBE ,W?LABEL>>
           <ACTUALLY ,GREEN-TUBE>)>
    <COND (<AND <VERB? PUT-IN>
                <IOBJ? GREEN-TUBE>>
           <COND (<DOBJ? GREEN-FROB>
                  <TELL "It fits perfectly." CR>
                  <MOVE ,GREEN-FROB ,GREEN-TUBE>)
                 (<L? <GETP ,PRSO ,P?SIZE> 6>
                  <THE-J ,PRSO T T><TELL verb ,PRSO "is" "n't meant to go in the tube." CR>)
                 (ELSE
                  <TELL He+verb ,PRSO "do" "n't fit.">
                  <COND (<DOBJ? RED-FROB GREEN-FROB>
                         <TELL "Plus, that isn't the right tube to put that in." CR>)>)>)
          (<VERB? EXAMINE SEARCH LOOK-INSIDE READ>
           <COND (<NOUN-USED? ,GREEN-TUBE ,W?LABEL>
                  <TELL "The label is there to mark it as the 'green container', ">
                  <COND (<FIRST? ,GREEN-TUBE>
                         <TELL "for the green frob">)
                        (ELSE
                         <TELL "whatever that means">)>
                  <TELL ,PAUSES>
                  <RTRUE>)>
           <TELL "The " D ,GREEN-TUBE>
           <COND (<IN? ,GREEN-TUBE ,TUBE-RACK>
                  <TELL "is on the " D ,TUBE-RACK>
                  <COND (<FIRST? ,GREEN-TUBE>
                         <TELL ", and you can see that it">)>)>
           <COND (<SET GRE <FIRST? ,GREEN-TUBE>>
                  <TELL " supports "><THE-J .GRE <>>)
                 (ELSE
                  <TELL " has ">
                  <COND (<VERB? EXAMINE>
                         <TELL "a green label on it">)
                        (ELSE
                         <TELL "nothing inside it">)>)>
           <TELL ,PAUSES>)>>

<ROUTINE I-TURN-ON-MACHINE? ()
    <COND (<AND <EQUAL? ,TUBE-RACK <LOC ,BLUE-TUBE> <LOC ,RED-TUBE> <LOC ,GREEN-TUBE>>
                <IN? ,BLUE-FROB ,BLUE-TUBE>
                <IN? ,RED-FROB ,RED-TUBE>
                <NOT <EQUAL? <GETP ,RED-FROB ,P?SDESC> "red frob">>
                <IN? ,GREEN-FROB ,GREEN-TUBE>>
           <COND (<FSET? ,TELEPORTER ,SADRADIOBIT>
                  <TELL CR
"Suddenly, the teleporter lights up! \"Working!\" " D ,SLARTY
" exclaims. \"Finally! Now you can leave!" CR "\"Come, enter
the machine, and return to " D ,RESTAURANT ".\"" CR>
                  <FCLEAR ,TELEPORTER ,SADRADIOBIT>
                  <FCLEAR ,TELEPORTER ,BADRADIOBIT>
                  <FSET ,TELEPORTER ,RADPLUGBIT>)>)
          (ELSE
           <COND (<FSET? ,GLACIER-1 ,SADRADIOBIT>
                  <FSET ,TELEPORTER ,BADRADIOBIT>)
                 (ELSE
                  <FSET ,TELEPORTER ,SADRADIOBIT>)>)>>

<OBJECT PILL-JAR
    (LOC PDW)
    (DESC "pill jar")
    (TEXT "WARNING: Use for cybrids only.")
    (SYNONYM PILL JAR WRITING ;PILLS)
    (ADJECTIVE PILL DRUG)
    (FLAGS CONTBIT OPENABLEBIT READBIT TAKEBIT NDESCBIT)
    (ACTION PILL-JAR-F)
    (GENERIC PILLS-G)
    (SIZE 4)
    (CAPACITY 8)>

<ROUTINE PILL-JAR-F ()
    <COND (<VERB? EAT LICK>
           <COND (<AND <NOT <FSET? ,PILL-JAR ,OPENBIT>>
                       <NOUN-USED? ,PILL-JAR ,W?PILLS ,W?PILL>>
                  <FIRST-YOU "opening" ,PILL-JAR>
                  <FCLEAR ,PILL-JAR ,NDESCBIT>)
                 (<AND <FIRST? ,PILL-JAR>
                       <FSET? ,PILL-JAR ,OPENBIT>>
                  <ACTUALLY ,PILLS>)>
           <COND (<NOT <FIRST? ,PILL-JAR>>
                  <TELL "It's empty.">
                  <FCLEAR ,PILL-JAR ,NDESCBIT>)
                 (ELSE
                  <PERFORM ,V?EAT ,PILLS>)>)
          (<VERB? ;SMELL EXAMINE>
           <TELL "A pill jar with some writing along the side. ">
           <COND (<FSET? ,PILL-JAR ,OPENBIT>
                  <PERFORM ,V?SEARCH ,PILL-JAR>)
                 (ELSE
                  <CRLF>)>)
          (<AND <VERB? FILL>
                <NOT ,PRSI>
                ;<NOT <FIRST? ,PRSI>>
                <EQUAL? ,PILLS ,HERE>>
           <ACTUALLY ,PILLS>
           <PERFORM ,V?PUT-IN ,PILLS ,PILL-JAR>)
          (<AND <VERB? FILL>
                <IOBJ? PILLS>>
           <PERFORM ,V?PUT-IN ,PILLS ,PILL-JAR>)
          (<VERB? LOOK-INSIDE SEARCH>
           <COND (<FIRST? ,PILL-JAR>
                  <TELL "You can see some pills inside the jar." CR>)
                 (ELSE
                  <TELL "It's empty." CR>)>)
          (<OR <AND <VERB? FILL>
                    <IOBJ? PILL-JAR>>
               <AND <VERB? PUT-IN>
                    <NOT <DOBJ? PILLS>>
                    <IOBJ? PILL-JAR>>>
           <TELL "That's meant for pills." CR>)>>

<OBJECT PILLS
    (LOC PILL-JAR)
    (SDESC "pills")
    (SYNONYM PILLS PILL DRUG DRUGS PILE HEAP)
    (FLAGS PLURALBIT EATBIT TRYTAKEBIT ;NARTICLEBIT)
    (ACTION PILLS-F)
    (GENERIC PILLS-G)
    (SIZE 7)>

<ROUTINE PILLS-F ()
    <COND (<VERB? EAT LICK TAKE>
           <TELL "You eat a pill, and find yourself growing woozy..." CR CR>
           <V-FAINT T>)
          (<VERB? SMELL EXAMINE>
           <TELL "The normal sort. They have a very strong smell." CR>)
          ;(<VERB? TAKE>
           <TELL "They spill through your hands, so you give up." CR>)
          (<AND <VERB? PUT>
                <IOBJ? HERE>
                <NOT <EQUAL? <LOC ,PILLS> ,HERE>>>
           <THE-J ,PILLS T T><TELL " spill into a pile on the floor." CR>
           <MOVE ,PILLS ,HERE>
           <PUTP ,PILLS ,P?SDESC "pile of pills">)
          (<AND <VERB? PUT-IN>
                <IOBJ? PILL-JAR>
                <NOT <EQUAL? <LOC ,PILLS> ,PILL-JAR>>>
           <THE-J ,PILLS T T><TELL " fit back in." CR>
           <MOVE ,PILLS ,PILL-JAR>)>>


<OBJECT WRENCH
    (LOC PDW)
    (DESC "wrench")
    (SYNONYM WRENCH TOOL)
    (FLAGS TAKEBIT)
    (SIZE 8)
    (ACTION WRENCH-F)>

<ROUTINE WRENCH-F ()
    <COND (<VERB? EXAMINE>
           <TELL "It's a normal-looking wrench. It's decently heavy." CR>)>>


<OBJECT DEVICE
    (LOC LOCAL-GLOBALS)
    (DESC "bug-testing device")
    (ADJECTIVE 
;DEVICE BETA PLANET PLANETARY BUG TESTING FIXING BUG-TEST BUG-FIXIN
                                  ;DIAL BLACK            ;POINT EMPTY             ;BUTTON WHITE)
    (SYNONYM
;DEVICE DEVICE MACHINE CONTROLLE BUG BUG-TEST
                                  ;DIAL DIAL CIRCLE KNOB ;POINT POINT PRONG STICK ;BUTTON BUTTON)

    (FLAGS ;ONBIT ;DEVICEBIT TAKEBIT  ;BADRADIOBIT ;"LEVEL1"  ;SADRADIOBIT ;"LEVEL2"  ;RADPLUGBIT ;"LEVEL3")
    (GENERIC DEVICE-G)
    (SIZE 10)
    (ACTION DEVICE-F)>

<GLOBAL DIAL-SETTING:FIX 0>
<GLOBAL CODE-NUM1 0>
<GLOBAL CODE-NUM2 0>
<GLOBAL CODE-NUM3 0>
<GLOBAL CODES-DONE 0>
<GLOBAL MANY-CHANGES:FIX 0>

<ROUTINE TELL-CODE ()
    <TELL !\ N ,CODE-NUM1  N ,CODE-NUM2  N ,CODE-NUM3>>


;"This function was used less than I expected..."
<ROUTINE ASSUMING-DEVICE (NUM) ;"0 = Device, 1 = Dial, 2 = Point, 3 = Button"
    <COND (<1? .NUM>
           <COND (<NOT <AND <NOUN-USED? ,DEVICE ,W?DIAL ,W?CIRCLE ,W?KNOB>
                            <ADJ-USED? ,DEVICE <> ,W?BLACK>>>
                  <TELL "(the black dial)" CR>)>)
          (<=? 2 .NUM>
           <COND (<NOT <AND <NOUN-USED? ,DEVICE ,W?POINT ,W?PRONG ,W?STICK>
                            <ADJ-USED? ,DEVICE <> ,W?EMPTY>>>
                  <TELL "(the empty prong)" CR>)>)
          (<=? 3 .NUM>
           <COND (<NOT <AND <NOUN-USED? ,DEVICE ,W?BUTTON>
                            <ADJ-USED? ,DEVICE <> ,W?WHITE>>>
                  <TELL "(the white button)" CR>)>)
          (ELSE
           <COND (<NOT <AND <OR <NOUN-USED? ,DEVICE ,W?DEVICE ,W?MACHINE ,W?CONTROLLE>
                                <NOUN-USED? ,DEVICE ,W?BUG ,W?BUG-TEST>>
                            <OR <ADJ-USED? ,DEVICE ,W?FIXING ,W?BUG ,W?TESTING>
                                <ADJ-USED? ,DEVICE ,W?BETA ,W?PLANET ,W?PLANETARY>
                                <ADJ-USED? ,DEVICE <> ,W?BUG-TEST ,W?BUG-FIXIN>>>>
                  <ACTUALLY ,DEVICE>)>)>>

<ROUTINE MORAL-FIDDLE ()
    <COND (<FIND-NUM-TBL ,NORWAY-ROOMS ,HERE>
           <TELL
,SUDDEN "are waiting for something to happen, " <PICK-ONE ,BETA-MORAL>
". And the moral of that is... Well, don't fiddle with things and listen
to what people tell you, especially if they're old and make planets">
           <JIGS-UP ".">)>>

<ROUTINE DEVICE-F ()
    <COND (<VERB? CHANGE>
           <ASSUMING-DEVICE 1>
           <TELL ,SPEC-NUM>)
          (<VERB? AIM>
           <ASSUMING-DEVICE 1>
           <COND (<AND <IOBJ? INTNUM>
                       <G? ,P-NUMBER -1>
                       <L? ,P-NUMBER 10>>
                  <COND (<EQUAL? ,P-NUMBER ,DIAL-SETTING>
                         <TELL "But the dial is already set to " N ,P-NUMBER "!" CR>)
                        (ELSE
                         <TELL "The dial is now set to " N ,P-NUMBER "." CR>
                         <SETG DIAL-SETTING ,P-NUMBER>
                         <MORAL-FIDDLE>)>
                  <RTRUE>)
                 (ELSE
                  <TELL ,SPEC-NUM>)>
           <RTRUE>)
          (<VERB? EXAMINE READ>
           <TELL
"The bug-testing device is used to fix problems with the planets made, and although it is only a beta
model, it should work just fine. There is a white button on it, an empty prong (you guess a button
is supposed to go there), and a dial. The dial has numbers on it between zero and nine (inclusive).
You can rotate it to any of these numbers.|Right now, the dial is set to " N ,DIAL-SETTING !\. CR>)
          (<OR <VERB? SLAP PUSH>
               <AND <VERB? ATTACK>
                    <VERB-WORD? ,W?HIT>>>
           <ASSUMING-DEVICE 3>
           <TELL "You push the white button. ">
           <MORAL-FIDDLE>
           <COND (<AND <EQUAL? ,DIAL-SETTING ,CODE-NUM1>
                       <=? ,CODES-DONE 0>>
                  <SETG CODES-DONE 1>
                  <BIG-CHANGE>)
                 (<AND <EQUAL? ,DIAL-SETTING ,CODE-NUM2>
                       <=? ,CODES-DONE 1>>
                  <SETG CODES-DONE 2>
                  <BIG-CHANGE>)
                 (<AND <EQUAL? ,DIAL-SETTING ,CODE-NUM3>
                       <EQUAL? ,CODES-DONE 2>>
                  <SETG CODES-DONE 3>
                  <BIG-CHANGE>)
                 (ELSE
                  <SETG MANY-CHANGES <+ ,MANY-CHANGES 1>>
                  <COND (<G? ,MANY-CHANGES 2>
                         <TELL
"Apparently, the machine thinks that three improbably impossible things
is too much, and whisks itself away to the other end of the Universe">
                         <FACTOR "14,867">
                         <CRLF>
                         <REMOVE ,DEVICE>
                         <RTRUE>)>
                  <TELL "Nothing happens, although you feel a little "
                        <PICK-ONE <PLTABLE "cold" "warm" "tingly">> "." CR>)>)>>

<ROUTINE BIG-CHANGE ("AUX" TIM OBJ)
    ;<SET TIM <RANDOM 3>> ;"BAD - 1; SAD - 2; RAD - 3"
    <COND (<EQUAL? ,CODES-DONE 3>
           <TELL "Nothing spectacular happens, except that " D ,SLARTY " disappears
for a few seconds, and then appears on the table, looking only subtly different.
He jumps over to you. \"Now is the time,\" he breathes, \"to go the Fjords of Norway.
You see, I believe there may be a frob of the red type that landed there earlier, and
I think you can get it. You see, I am too old. You must go! It is your only way out
of here. Oh, and mine too.|
\"There are only just enough charges to reach Norway from here. Please, take my word
for this one.\" He beckons for you to enter the teleportation chamber.|
|He says, \"To make the frob reach its new form, you must seek the 'magic word' -
merely a word of philosophy - and remember it. I carved it in the ice, but it may be
bigger than you think. You might be standing on it without realising. Once you can see
the big 'T' in the rock - which is not part of the word - you must say the word. You
should know it by then, and if you do not, I cannot help you. Well, then. Off you go.\"" CR>
           <FSET ,TELEPORTER ,RADPLUGBIT>
           <RTRUE>)>
    <REPEAT ()
     <SET TIM <PICK-ONE <PLTABLE BADRADIOBIT SADRADIOBIT ;RADPLUGBIT>>>
     <COND (<FSET? ,DEVICE .TIM>
            <AGAIN>)
           (ELSE
            <FSET ,DEVICE .TIM>
            <RETURN>)>>
    <COND (<EQUAL? .TIM ,BADRADIOBIT>
           <FCLEAR <SET OBJ <PICK-ONE <PLTABLE WEIRDBOX-KEY CLAW>>> ,INVISIBLE>
           <TELL "Suddenly, "><THE-J .OBJ <>><TELL " appears right in front of you!">
           <COND (<IN? ,SLARTY ,HERE>
                  <TELL !\ D ,SLARTY " says with a smile on his face, \"And that's">
                  <FACTOR "19,900"><TELL "..\"" CR>)>)
          (<EQUAL? .TIM ,SADRADIOBIT>
           <MOVE ,PEANUT-PACKET ,HERE>
           <THE-J ,PEANUT-PACKET <> T><TELL " falls on your head with a ">
           <ITALICIZE "klump"><TELL ", and slips onto the floor. Is that it?" CR>
           <QUEUE I-REPLY 2>
           <SETG AWAITING-REPLY 13>)>>

<ROUTINE I-DEVICE ("OPT" CHEAT?)
    <TELL CR
D ,SLARTY " rushes over to you. \"I nearly forgot! Here, take this.\"
He hands you something. \"It's a " D ,DEVICE ",\" he explains. \"You
can use it to work out the problems in the Fjord, by entering a three
digit code into the dial in the centre. But remember, after each dial
change, you must push the white button, and NEVER use the device when
in the Fjords. ">
    <COND (.CHEAT?
           <TELL
"Either way, I would think that it's pretty obvious you know what
you're doing, especially since I never told you about the device">)
          (ELSE
           <TELL
"I think that's it? Or was it that you should only use
it in the Fjords and never here? I can't remember..">)>
    <TELL ,PIC>
    <THIS-IS-IT ,DEVICE>
    <MOVE ,DEVICE ,PLAYER>>

<OBJECT WEIRDBOX
    (LOC CABINET)
    (DESC "weirdbox")
    (LDESC "There is a weirdbox here.")
    (SYNONYM WEIRDBOX BOX)
    (ADJECTIVE STRANGE)
    (FLAGS TAKEBIT TRYTAKEBIT LOCKED)
    (SIZE 15)
    (ACTION WEIRDBOX-F)
    (CAPACITY 10)>

<ROUTINE WEIRDBOX-F ()
    <COND (<AND <VERB? OPEN UNLOCK>
                <DOBJ? WEIRDBOX>
                <OR <IOBJ? WEIRDBOX-KEY>
                    <AND <IN? ,PLAYER ,WEIRDBOX-KEY> ;"Directly holding it only"
                         <TELL "(using "><THE-J ,WEIRDBOX T><TELL !\) CR>>>>
           <TELL
"The weirdbox starts to " <PICK-ONE <PLTABLE "melt" "evaporate">>
"! But no. It's only shifting shape, slowly, slowly..." CR CR
"A minute later, you look back at the box, but it's not there.
In its place" ,GREENY>
           <REMOVE ,WEIRDBOX>
           <THIS-IS-IT ,GREEN-FROB>
           <FCLEAR ,GREEN-FROB ,INVISIBLE>
           <INCREMENT-SCORE 10>)
          (<AND <VERB? OPEN UNLOCK MUNG>
                <DOBJ? WEIRDBOX>>
           <TELL ,TRY-HARD CR>)
          (<VERB? EXAMINE>
           <TELL "A weirdbox. A weird... box. Weirdbox." CR>)>>

<OBJECT EGG
    (LOC CABINET)
    (DESC "platinum egg")
    (LDESC "There is an egg here. A platinum one.")
    (SYNONYM EGG OVAL HINGE)
    (ADJECTIVE PLATINUM METAL PRECIOUS BIG)
    (FLAGS TAKEBIT TRYTAKEBIT)
    (SIZE 25)
    (ACTION EGG-F)
    (CAPACITY 10)>

<ROUTINE EGG-F ()
    <COND (<AND <VERB? OPEN UNLOCK MUNG>
                <DOBJ? EGG>
                <IOBJ? CLAW>>
           <TELL
"You prise open the egg with the mechanical claw, and inside" ,GREENY CR "Wait. Where's that egg? Never mind..." CR>
           <REMOVE ,EGG>
           <THIS-IS-IT ,GREEN-FROB>
           <FCLEAR ,GREEN-FROB ,INVISIBLE>
           <INCREMENT-SCORE 10>)
          (<AND <VERB? OPEN UNLOCK MUNG>
                <DOBJ? EGG>>
           <TELL ,TRY-HARD CR>)
          (<VERB? EXAMINE>
           <TELL
"Imagine seeing a big platinum egg, and then imagine it having a hinge.
Well, you don't need to imagine; it's right in front of you." CR>)>>

<OBJECT WEIRDBOX-KEY
    (LOC PDW)
    (DESC "golden key")
    ;(LDESC "There is a golden key here.")
    (SYNONYM KEY)
    (ADJECTIVE GOLD GOLDEN)
    (FLAGS INVISIBLE TAKEBIT TRYTAKEBIT ;KEYBIT)
    (GENERIC KEY-G)
    (SIZE 5)>

<OBJECT CLAW
    (LOC PDW)
    (DESC "mechanical claw")
    ;(LDESC "There is a mechanicl claw here.")
    (SYNONYM CLAW HAND)
    (ADJECTIVE MECHANICA ROBOTIC)
    (GENERIC HANDS)
    (FLAGS INVISIBLE TAKEBIT TRYTAKEBIT)
    (SIZE 5)>

<OBJECT GREEN-FROB
    (LOC PDW)
    (DESC "green frob of randomness")
    (SYNONYM FROB FROBS GREEN RANDOMNES RANDOM)
    (ADJECTIVE GREEN RANDOM RANDOMNES)
    (LDESC "There is a green frob of randomness here.")
    (ACTION GREEN-FROB-F)
    (FLAGS INVISIBLE TAKEBIT TRYTAKEBIT)
    (GENERIC FROB-G)
    (SIZE 9)>

<ROUTINE GREEN-FROB-F ()
    <COND (<VERB? EXAMINE>
           <TELL ,IT-LOOKS-LIKE "a " D ,GREEN-FROB !\. CR>)
          (<VERB? MOVE PULL-APART OPEN>
           <TELL ,NOPE "do that to this frob." CR>)>>

<OBJECT PEANUT-PACKET
    (LOC LOCAL-GLOBALS)
    (SDESC "packet of peanuts")
    ;(LDESC "You can also see a packet of peanuts.")
    (SYNONYM PACKET PEANUTS PROTEIN PEANUT)
    (ADJECTIVE PEANUT)
    (ACTION PEANUT-PACKET-F)
    (FLAGS ;SECRETBIT TAKEBIT TRYTAKEBIT SEENBIT ;SADRADIOBIT ;"Empty")
    (SIZE 4)>

<ROUTINE PEANUT-PACKET-F ()
    <COND (<VERB? OPEN MUNG PULL-APART>
           <COND (<FSET? ,PEANUT-PACKET ,OPENBIT>
                  <ALREADY ,PEANUT-PACKET "open">)
                 (<IN? ,PEANUT-PACKET ,PLATE>
                  <WONT-HELP>)
                 (ELSE
                  <TELL
"You rip it open, and inside there is a small portion of peanuts
- crushed into a grainy powder, but they are still edible." CR>
                  <FSET ,PEANUT-PACKET ,OPENBIT>)>)
          (<VERB? CLOSE>
           <COND (<IN? ,PEANUT-PACKET ,PLATE>
                  <WONT-HELP>)
                 (<FSET? ,PEANUT-PACKET ,OPENBIT>
                  <TELL "There's no way to do that.">
                  <COND (<FSET? ,PEANUT-PACKET ,SADRADIOBIT>
                         <TELL " Plus, it's empty anyway." CR>)>)>)
          (<VERB? EXAMINE SEARCH LOOK-INSIDE>
           <COND (<IN? ,PEANUT-PACKET ,PLATE>
                  <TELL "Just some peanuts." CR>
                  <RTRUE>)>
           <TELL "It is a medium-sized packet of peanuts. ">
           <COND (<FSET? ,PEANUT-PACKET ,OPENBIT>
                  <TELL "The top has been ripped off">
                  <COND (<FSET? ,PEANUT-PACKET ,SADRADIOBIT>
                         <TELL ", and it's empty">)>)
                 (ELSE
                  <TELL "It's ">
                  <COND (<VERB? EXAMINE>
                         <TELL "one of those that you can tear apart, to find the booty hidden inside">)
                        (ELSE
                        <TELL "not open">)>)>
           <TELL ,PAUSES>)
          (<VERB? EAT DRINK LICK>
           <COND ;(<NOUN-USED? ,PEANUT-PACKET ,W?PACKET>
                  <TELL "(the peanuts)" CR>)
                 (ELSE
                  ;<COND (<NOUN-USED? ,PEANUT-PACKET ,W?PACKET>
                         <TELL "(the peanuts)" CR>)>
                  <COND (<FSET? ,PEANUT-PACKET ,OPENBIT>
                         ;[<TELL "You eat the peanuts in one big scoff. That felt good." CR>
                         <COND (<NOT ,SCOREMAD>
                                <TELL CR "...And yet, you're still hungry." CR>)>
                         <FSET ,PEANUT-PACKET ,SADRADIOBIT>]
                         <TELL "It's bad ">
                         <COND (<IN-REST? ,PLAYER>
                                <TELL "manners">)
                               (ELSE
                                <TELL "luck">)>
                         <TELL " to eat peanuts straight. (I know that fact; you don't.)" CR>)
                        (<IN? ,PEANUT-PACKET ,PLATE>
                         <TELL "Nah. Leave them." CR>)
                        (ELSE
                         <TELL "The packet isn't open." CR>)>)>)
          (<VERB? POUR>
           <COND ;(<NOT <NOUN-USED? ,PEANUT-PACKET ,W?PACKET>>
                  <TELL-ME-HOW>)
                 (<IN? ,PEANUT-PACKET ,PLATE>
                  <WONT-HELP>)
                 (<NOT <FSET? ,PEANUT-PACKET ,OPENBIT>>
                  <TELL "The packet isn't open." CR>)
                 (<FSET? ,PEANUT-PACKET ,SADRADIOBIT>
                  <TELL "The packet is empty." CR>)
                 (ELSE
                  <TELL "That would be a waste." CR>)>)>>


<OBJECT TELEPORTER
    (LOC PDW)
    (DESC "teleportation chamber")
    (LDESC "In the wall is a large teleportation chamber, big enough to enter.")
    (SYNONYM ;DEVICE CHAMBER MACHINE MECHANISM TELEPORTE)
    (ADJECTIVE TELEPORT TELEPORTE TELEPORTA TELEPORTI BIG)
    (ACTION TELEPORTER-F)
    (GENERIC DEVICE-G)
    (FLAGS ;VEHBIT CONTBIT TRANSBIT OPENBIT NDESCBIT
                     SADRADIOBIT    ;"BROKEN"
                    ;RADPLUGBIT     ;"ENTER-NOW"
                    ;BADRADIOBIT    ;"GOING-NOWHERE")>

<ROUTINE TELEPORTER-F (;RARG)
    <COND (<AND <NOUN-USED? ,TELEPORTER ,W?DEVICE ,W?MACHINE ,W?MECHANISM>
                <VISIBLE? ,DEVICE>>
           <ACTUALLY ,TELEPORTER>)>
    <COND (<VERB? LEAVE DISEMBARK CLIMB-DOWN>
           <DO-WALK ,P?OUT>)
          (<AND <VERB? PUT PUT-IN>
                <IOBJ? TELEPORTER>>
           <COND (<FSET? ,TELEPORTER ,BADRADIOBIT>
                  <RFALSE>)
                 (ELSE
                  <TELL "A brief "><ITALICIZE "zap">
                  <TELL " echoes across the room, as ">
                  <THE-J ,PRSO T><TELL " disappears." CR>
                  <COND (<FSET? ,TELEPORTER ,SADRADIOBIT>
                         <MOVE ,PRSO <PICK-ONE ,NORWAY-ROOMS>>)
                        (ELSE
                         <MOVE ,PRSO ,RECEPTION>)>)>)
          (<VERB? WALK-TO BOARD THROUGH LEAP CLIMB-ON CLIMB-UP>
           ;"<PERFORM ,V?BOARD ,TELEPORTER>)
          (<AND <EQUAL? .RARG ,M-ENTER>
                <FSET? ,TELEPORTER ,RADPLUGBIT>>"
           <TELL He+verb ,WINNER "step" " inside the chamber. ">
           <COND (<FSET? ,TELEPORTER ,BADRADIOBIT>
                  <TELL "Nothing interesting happens, so you step out again." CR>
                  <RTRUE>)
                 (<FSET? ,TELEPORTER ,RADPLUGBIT>
                  <TELL "Only a few seconds inside pass before Slarty waves at you, and nods.">)
                 (ELSE
                  <TELL "\"No!\" calls " D ,SLARTY ". \"It isn't ready!\" But it's too late.">)>
           <COND (<NOT <FSET? ,GLACIER-1 ,SADRADIOBIT>> ;<FSET? ,TELEPORTER ,SADRADIOBIT>
                  <SETG DARK-FLAG ,GLACIER-1>
                  <SETG IMMOVABLE T>)>
           <GO-TO-DARK>
           ;<FUCKING-CLEAR>
           <RTRUE>)
          (<VERB? EXAMINE>
           <COND (<IN? ,PLAYER ,TELEPORTER>
                  <TELL "A " D ,TELEPORTER " (taking up most of the room) is ">)
                 (ELSE
                  <TELL
"Taking up most of the room, you can see a " D ,TELEPORTER ", which you can tell that the teleporter is probably ">)>
           <COND (<FSET? ,TELEPORTER ,SADRADIOBIT>
                  <TELL "turned off">)
                 (ELSE
                  <TELL "working right now">)>
           <TELL !\. !\ >
           <COND (<IN? ,PLAYER ,TELEPORTER>
                  <TELL "Other than you, t">)
                 (ELSE
                  <TELL !\T>)>
           <TELL "he teleporter contains">
           <COND (ELSE ;<AND <FIRST? ,TELEPORTER>
                       <>>
                  <PRINT-CONTENTS ,TELEPORTER>)
                 ;(ELSE
                  <TELL " nothing">)>
           <TELL ,PAUSES>
           <RTRUE>)>>


"PART 6 - MORPHER SHIP"

<ROOM ENTRY-HALL
    (LOC ROOMS)
    (DESC "Entry Passageway")
    (NORTH TO JUNCTION)
    (SOUTH PER SOUTH-ENTRY-HALL)
    (THINGS (ENTRANCE ENTRY SOUTH) (HALL PASSAGE PASSAGEWAY) GLOBAL-ROOM-F)
    (ACTION ENTRY-HALL-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE ENTRY-HALL-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <TELL
"It might have a mildly odd name but hey, it's an alien ship. At least,
it probably is. There is little to see, as the entrance has been cleaned recently.
The thing that makes this area even stranger is that there seems to be quite a lot
of junk in the room leading from the ">
                  <COND (,S-ENTRY-HALL
                         <TELL "one exit of the two exits which leads to other parts">)
                        (ELSE
                         <TELL "only exit - unlike this part">)>
                  <TELL " of the ship." CR CR "To the north is a crossroads, and ">
                  <COND (,S-ENTRY-HALL
                         <TELL "the exit to the south seems to be a sort of portal">)
                        (ELSE
                         <TELL "seeing that this is the entry passageway, it
feels like there should be an exit to the hatchway, although you can't see it,
so this is less of an entrance and more of a dead end of some sort">)>
                  <TELL ".|
|In the corner of the ceiling is a television, which looks like it is switched off." CR>)
                 (ELSE
                  <TELL
"Being quite spacious and uninteresting, the only direction you can go is north">
                  <COND (,S-ENTRY-HALL
                         <TELL " (except for a strange portal to the south)">)>
                  <TELL ". On the wall is a television." CR>)>)>
    <COND (<AND <EQUAL? .RARG ,M-END>
                <FSET? ,ENTRY-HALL ,SADRADIOBIT>>
           <TELL
"Just as it occurs to you that you've been here before, you are shot by
a beam from the gun which the morpher captain right in front of you is holding.|
|The next things that you register from the paralysed position you are in are as follows:
|   - You are carried to a hidden alcove in annother part of the ship.
|   - The captain lays you down and pushes a button on the wall.
|   - He runs out of the room just before you are shot out of the airlock.
|   -">
           <GO-TO-DARK>)>>

<ROUTINE SOUTH-ENTRY-HALL ()
    <COND (,S-ENTRY-HALL
           <TELL "You step through the portal.">
           <GO-TO-DARK>)
          (ELSE
           <TELL "Although that may have been the way you entered (you honestly can't tell which
way you entered), there isn't any entrance now. Surely there's a hatch or exit from the ship?" CR>
           <RFALSE>)>>

<OBJECT DVD
    (LOC ENTRY-HALL)
    (DESC "DVD")
    (SYNONYM DVD CD)
    (LDESC "There is a DVD lying around.")
    (FLAGS TAKEBIT TRYTAKEBIT SEENBIT)>

<OBJECT S-PORTAL
    (LOC ENTRY-HALL)
    (DESC "portal")
    (SYNONYM PORTAL)
    (ACTION S-PORTAL-F)
    (FLAGS SEENBIT NDESCBIT INVISIBLE)>

<ROUTINE S-PORTAL-F ()
    <COND (<VERB? WALK-TO BOARD THROUGH LEAP>
           <SOUTH-ENTRY-HALL>
           <RTRUE>)
          (<VERB? EXAMINE>
           <TELL "The exit to the south seems to be a portal. It definitely wasn't there before." CR>)>>

<OBJECT TV
    (LOC ENTRY-HALL)
    (DESC "television")
    (SYNONYM TV TELEVISION)
    (FLAGS TAKEBIT TRYTAKEBIT SEENBIT NDESCBIT)
    (ACTION TV-F)>

<GLOBAL ANNOYED-TV <>>

<ROUTINE TV-F ()
    <COND (<AND <TOUCHING?>>
           <TELL "You can't reach it. It's fixed in place in the corner of the ceiling." CR>
           <SET ANNOYED-TV T>)
          (<VERB? EXAMINE>
           <TELL "What did you expect? It's a TV." CR>)>>

<GLOBAL S-ENTRY-HALL <>>
<GLOBAL MESSY? <>>

<ROOM JUNCTION
    (LOC ROOMS)
    (DESC "Junction")
    (FDESC "The junction you stand in is mostly empty. Corridors lead north, south, east
and west to different parts of the ship.")
    (LDESC "The junction leads off randomly in different directions. If you want to exit,
you can go in one of in the four cardinal directions.")
    (NORTH TO PRES-BRIDGE)
    (SOUTH TO ENTRY-HALL)
    (WEST TO GALLEY)
    (EAST TO DORM)
    (THINGS <> (CORRIDOR JUNCTION) GLOBAL-ROOM-F)
    (FLAGS LIGHTBIT ONBIT)>

<OBJECT BRICK
    (LOC JUNCTION)
    (SDESC "brick")
    (LDESC "There is a brick here which looks in a bad state.")
    (SYNONYM BRICK)
    (ADJECTIVE BROKEN CLAY BAD OLD)
    (FLAGS TAKEBIT)>

<OBJECT CAP-CHAIR
    (LOC JUNCTION)
    (DESC "chair")
    (LDESC "You can see a chair here.")
    (SYNONYM CHAIR)
    (FLAGS CAPTAINBIT ;SECRETBIT INVISIBLE TRYTAKEBIT)
    (ACTION CAPTAIN-OBJ-F)>

<OBJECT STUN-GUN
    (LOC JUNCTION)
    (SDESC "strange gun")
    (SYNONYM GUN STUNNER)
    (ADJECTIVE STUN STRANGE)
    (DESCFCN STUN-GUN-D)
    (SIZE 8)
    (FLAGS TAKEBIT TRYTAKEBIT WEAPONBIT)
    (ACTION STUN-GUN-F)>

<ROUTINE STUN-GUN-D ()
    <TELL "There is "><THE-J ,STUN-GUN <>><TELL " here - not unlike the Beast-killing gun, although this
one couldn't ever do so much damage." CR>>

<ROUTINE STUN-GUN-F ()
    <COND (<VERB? EXAMINE>
           <THE-J ,STUN-GUN <> T>
           <COND (<EQUAL? <GETP ,STUN-GUN ,P?SDESC> "strange gun">
                  <TELL ". On closer examination, you can tell that it can be used to stun people,
possibly because of the text on the side saying \"STUN GUN\"">
                  <PUTP ,STUN-GUN ,P?SDESC "stun gun">)>
           <TELL ". It">
           <FINE-PRODUCT>
           <CRLF>)>>

<GLOBAL STUN-CHARGE:NUMBER 25>

<ROUTINE STUN-OBJ (;["AUX" FIZZLE])
    <COND (<L? ,STUN-CHARGE 1>
           <THE-J ,STUN-GUN T T><TELL " vibrates and then falls silent. It must be out of charge.">
           <RFALSE>)>
    <COND (<OR <AND <VERB? SHOOT>
                    <NOT <FSET? ,PRSO ,INVISIBLE>>
                    <FSET? ,PRSO ,CAPTAINBIT>>>
           <TELL "As you zap "><THE-J ,PRSO T><TELL ", you see it change into the form of the captain.
He slumps to the floor, stunned." CR>
           <FSET ,MORPHER-CAPTAIN ,MUNGBIT>
           <FCLEAR ,MORPHER-CAPTAIN ,SECRETBIT>
           <FCLEAR ,MORPHER-CAPTAIN ,NDESCBIT>
           <MOVE ,MORPHER-CAPTAIN ,HERE>
           <FSET ,PRSO ,INVISIBLE>
           <FSET ,PRSO ,INVISIBLE>
           <SETG S-ENTRY-HALL T>
           <FCLEAR ,S-PORTAL ,INVISIBLE>
           <INCREMENT-SCORE 25>)
          (<OR <AND <VERB? SHOOT> <DOBJ? BRICK>>>
           <COND (<EQUAL? <GETP ,BRICK ,P?SDESC> "broken brick">
                  <TELL He+verb ,PRSO "fizzle"
" a little. Otherwise, nothing happens. It's in such a bad state that it can't get too much worse." CR>)
                 (ELSE
                  <TELL "It falls apart." CR>
                  <PUTP ,BRICK ,P?SDESC "broken brick">)>)
          (<OR <AND <VERB? SHOOT> <DOBJ? ORANGE-BUTTON>>>
           <JIGS-UP ,EXPLODE-DEATH>)
          (<OR <AND <VERB? SHOOT> <EQUAL? ,PRSO ,PLAYER>>>
           <TELL "Absolutely amazing work! You bang your head as you collapse on the floor." CR CR>
           <V-FAINT T>)
          (ELSE
           <HE-SHE-IT ,PRSO 1 <PICK-ONE <PLTABLE "fizzle" "vibrate" "shake" "shudder" "worble" "flicker" "move">>>
           <TELL " a little. Otherwise, nothing happens." CR>)>
    <SETG STUN-CHARGE <- ,STUN-CHARGE 1>>>


<ROOM GALLEY
    (LOC ROOMS)
    (DESC "Galley")
    (EAST TO JUNCTION)
    (THINGS <> GALLEY GLOBAL-ROOM-F
            (OLD BIG) (TABLE DESK) JUNK-F
            ;[(ANOTHER CLAY) BRICK JUNK-F]
            ;[(MOLDY RUBBISH) (ROPE COIL LOOP) JUNK-F]
            (MESSY UGLY GROSS USELESS RANDOM) (JUNK WASTE RUBBISH) JUNK-F)
    (ACTION GALLEY-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE GALLEY-F (RARG "AUX" (SPOON-DESC 50))
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,MESSY? ,DORM ,PRES-BRIDGE>
                  <SETG MESSY? T>
                  <TELL "It's a wonder how badly the owners of this ship clean up. ">)
                 (<EQUAL? ,MESSY? <>>
                  <SETG MESSY? ,GALLEY>)>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <TELL
"The galley is cluttered with junk, spread out along multiple different surfaces.
Assuming the people who own this place are still around, you ought to give them a
speech on cleaning up after themselves. There is nothing different between you and
the owners of this place (think of the state your bedroom is in - WAS in, before it
was destroyed by the Vogons, so it means nothing anymore).|
|The rubbish you can see include a big old table">)
                 (ELSE
                  <TELL
"The junk spread around the surfaces of this room include a big old table">)>
           <COND (<IN? ,TIN ,GALLEY>
                  <TELL ", a tin of anchovies">)>
           <TELL ", a coil of moldy rope">
           <COND (<AND <NOT <FSET? ,SPOON ,INVISIBLE>>
                       <IN? ,SPOON ,GALLEY>
                       <PROB .SPOON-DESC>>
                  <TELL ", "><THE-J ,SPOON <>>
                  <SET SPOON-DESC 0>)>
           <TELL ", another brick (like the one you found earlier in the junction to the east)">
           <COND (<AND <NOT <FSET? ,SPOON ,INVISIBLE>>
                       <IN? ,SPOON ,GALLEY>
                       <NOT <0? .SPOON-DESC>>>
                  <TELL ", "><THE-J ,SPOON <>>)>
           <TELL " and other random junk." CR>)>>

<OBJECT OTHER-BRICK
    (LOC GALLEY)
    (DESC "another brick")
    (ADJECTIVE ANOTHER CLAY OTHER)
    (SYNONYM BRICK)
    (FLAGS TRYTAKEBIT TAKEBIT NDESCBIT NARTICLEBIT)
    (ACTION JUNK-F)>

<OBJECT ROPE-COIL
    (LOC GALLEY)
    (DESC "coil of rope")
    (ADJECTIVE MOLDY RUBBISH) 
    (SYNONYM ROPE COIL LOOP)
    (FLAGS TRYTAKEBIT TAKEBIT NDESCBIT)
    (ACTION JUNK-F)>

<OBJECT TIN
    (LOC GALLEY)
    (DESC "tin of anchovies")
    (SYNONYM TIN ANCHOVY ANCHOVIES CAN)
    (FLAGS NDESCBIT TRYTAKEBIT TAKEBIT)
    (ACTION TIN-F)>

<GLOBAL TIN-CUTTING <>>

<ROUTINE TIN-F ()
    <COND (<VERB? OPEN>
           <COND (<IOBJ? SPORFE>
                  <COND (<NOT <FSET? ,TIN ,RADPLUGBIT>>
                         <SETG CLOCK-WAIT T>
                         <TELL "Nice try. Did you get that from the hints?" CR>
                         <FSET ,TIN ,RADPLUGBIT>)
                        (ELSE
                         <TELL
"Although that sporfe is violently sharp and could likely cut
through most materials, you can't get the proper technique." CR>)>)
                 (<AND <IOBJ? BLUE-FROB>
                       <NOT <EQUAL? <GETP ,BLUE-FROB ,P?SDESC> "blue frob">>>
                  <TELL "It's properly flimsy. You couldn't cut through anything with ">
                  <THE-J ,BLUE-FROB T>
                  <TELL ,PAUSES>)
                 (ELSE
                  <TELL "Not a chance in hell. They're idiot-proof." CR>)>)>>

<ROUTINE JUNK-F ()
    <COND (<TOUCHING?>
           <TELL "I don't want to touch that! Nor do I think you should." CR>)
          (<SEE-VERB?>
           <TELL "It's useless junk. Why would you need it?" CR>)>>

<OBJECT SPOON
    (LOC GALLEY)
    (SDESC "spoon")
    (SYNONYM SPOON FORK UTENSIL)
    (FLAGS NDESCBIT CAPTAINBIT INVISIBLE TRYTAKEBIT)
    (ACTION CAPTAIN-OBJ-F)>

<GLOBAL CAP-ATTACK 0>

<ROUTINE CAPTAIN-OBJ-F ("AUX" OBJ OLOC ILOC)
    <COND (,PRSI
           <SET OLOC <LOC ,PRSO>>
           <SET ILOC <LOC ,PRSI>>
           <MOVE ,PRSO ,MORPHER-CAPTAIN>
           <MOVE ,PRSI ,MORPHER-CAPTAIN>
           <SET OBJ <FIND-IN ,MORPHER-CAPTAIN ,CAPTAINBIT>>
           <MOVE ,PRSO .OLOC>
           <MOVE ,PRSI .ILOC>)
          (ELSE
           <SET OBJ ,PRSO>)>
    <COND (<TOUCHING?>
           <TELL "As you touch it, you can see "><THE-J .OBJ T><TELL " form into the morpher captain! ">
           <COND ;(<0? ,CAP-ATTACK>
                  <TELL "He dashes off into the distance, away from you.">)
                 ;(<1? ,CAP-ATTACK>
                  <TELL
"As he takes a glance at you while he scurries off into the distance, you can't help but feel as if he's trying to catch you.">)
                 (ELSE
                  <CRLF><CRLF>
                  <JIGS-UP ,CAPTAIN-DEATH>)>
           <SETG CAP-ATTACK <+ ,CAP-ATTACK 1>>
           ;<I-MORPHER-CAPTAIN <>>
           <FSET ,MORPHER-CAPTAIN ,BADRADIOBIT> ;"He must move"
           <CRLF>)>>

<ROOM DORM
    (LOC ROOMS)
    (DESC "Dormitory")
    (WEST TO JUNCTION)
    (SE TO BATHROOM-SHIP)
    (THINGS (CLUTTERED SLEEPING) (DORM DORMITORY BEDROOM QUARTERS) GLOBAL-ROOM-F
            (ROUND CIRCLE CIRCULAR) (BED BEDS BUNKBED BUNKBEDS BEDDING) JUNK-F
            ;[(BAD SORT MUTANT) (BAD SOME CAT PAINTING ;"bad painting of some sort of mutant cat") JUNK-F]
            (MESSY UGLY GROSS USELESS RANDOM CLUTTERED) (JUNK WASTE RUBBISH) JUNK-F)
    (ACTION DORM-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE DORM-F (RARG "AUX" (PILLOW-DESC 50))
     <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,MESSY? ,GALLEY ,PRES-BRIDGE>
                  <SETG MESSY? T>
                  <TELL "It's a wonder how bad the owners of this ship are at cleaning up. ">)
                 (<EQUAL? ,MESSY? <>>
                  <SETG MESSY? ,DORM>)>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <TELL
"You are in " <PICK-ONE <PLTABLE "the sleeping quarters" "a cluttered dorm">>
", which has all sorts of random objects lying around, from the usual beds you
can find in dorms (oddly enough, they are circular instead of rectangular)">)
                 (ELSE
                  <TELL
"Here, you can see a bunch of objects left in a bad state, from a circular bed">)>
           <COND (<AND <NOT <FSET? ,PILLOW ,INVISIBLE>>
                       ;<IN? ,PILLOW ,DORM>
                       <PROB .PILLOW-DESC>>
                  <TELL " and a " D ,PILLOW>
                  <SET PILLOW-DESC 0>)>
           <TELL " to a bad painting of some sort of mutant cat">
           <COND (<AND <NOT <FSET? ,PILLOW ,INVISIBLE>>
                       ;<IN? ,PILLOW ,DORM>
                       <NOT <0? .PILLOW-DESC>>>
                  <TELL " and a " D ,PILLOW>)>
           <TELL ", among other junk. You can exit to the west and south-east." CR>)>>

<OBJECT CAT-PAINTING
    (LOC DORM)
    (DESC "bad painting of some sort of mutant cat")
    (ADJECTIVE BAD SORT MUTANT)
    (SYNONYM BAD SOME CAT PAINTING)
    (FLAGS TRYTAKEBIT TAKEBIT NDESCBIT)
    (ACTION JUNK-F)>

<OBJECT PILLOW
    (LOC DORM)
    (DESC "pillow")
    (SYNONYM PILLOW CUSHION)
    (FLAGS NDESCBIT CAPTAINBIT INVISIBLE TRYTAKEBIT)
    (ACTION CAPTAIN-OBJ-F)>

<ROOM BATHROOM-SHIP
    (LOC ROOMS)
    (DESC "Bathroom")
    (ACTION BATHROOM-SHIP-F)
    (NW TO DORM)
    (OUT TO DORM)
    (THINGS SHIP (BATHROOM TOILET) GLOBAL-ROOM-F
            <> SHOWER JUNK-F
            (MESSY UGLY GROSS USELESS RANDOM CLUTTERED) (JUNK WASTE RUBBISH) JUNK-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE BATHROOM-SHIP-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <TELL
"You are in the ship bathroom, which exits only northwest, to the dormitory.
It seems that this is the only room which is not altogether strange. Why
everything seems so odd to you today is a confusing question in itself,
and so looking around, you pull yourself back to your senses. (I'm not
making any sense, and neither are you.)|
|The place is about as clean as your bathroom - not very clean, in short.
The junk in the room includes ">)
                 (ELSE
                  <TELL
"You can only go northwest. You can see ">)>
           <COND (<AND <NOT <FSET? ,STICKER ,INVISIBLE>>
                       ;<IN? ,STICKER ,BATHROOM-SHIP>>
                  <TELL "a " D ,STICKER ", ">)>
           <TELL "a shower and a discarded plug">
           <COND (<AND <NOT <FSET? ,BATHROOM-SHIP ,BADRADIOBIT>>
                       <IN? ,MORPHER-CAPTAIN ,BATHROOM-SHIP>>
                  <TELL 
", as well as a strange man with a captain-style uniform - wait, what?"
CR CR "The strange man shoves you aside, and dashes out of the room">
                  <FSET ,MORPHER-CAPTAIN ,BADRADIOBIT> ;"He must move."
                  <FSET ,BATHROOM-SHIP ,BADRADIOBIT>)>
           <TELL ,PAUSES>)>>

<OBJECT PLUG-JUNK
    (LOC BATHROOM-SHIP)
    (DESC "plug")
    (ADJECTIVE DISCARDED)
    (SYNONYM PLUG STOPPER)
    (FLAGS TRYTAKEBIT NDESCBIT)
    (ACTION JUNK-F)>

<OBJECT STICKER
    (LOC BATHROOM-SHIP)
    (DESC "smiley-face sticker")
    (SYNONYM STICKER FACE SMILEY-FA)
    (ADJECTIVE SMILE SMILEY FACE SMILEY-FA)
    (FLAGS NDESCBIT CAPTAINBIT INVISIBLE TRYTAKEBIT)
    (ACTION CAPTAIN-OBJ-F)>

<ROOM PRES-BRIDGE
    (LOC ROOMS)
    (DESC "Bridge")
    (SOUTH TO JUNCTION)
    (THINGS <> BRIDGE GLOBAL-ROOM-F
            ;"(RED BLUE WHITE) (BUTTONS BUTTON) BUTTON-MEH"
            (GREY GRAY) (LEVER SWITCH FLIP) BUTTON-MEH
            BLACK DIAL BUTTON-MEH
            (ANOTHER PART OTHER) (ANOTHER PART OTHER CONSOLE) BUTTON-MEH
            (MESSY UGLY GROSS USELESS RANDOM CLUTTERED) (JUNK WASTE RUBBISH) JUNK-F)
    (ACTION PRES-BRIDGE-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE PRES-BRIDGE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<EQUAL? ,VERBOSITY 2>
                  <TELL
"The bridge is much cleaner than any other part of the ship
(except for the entry hall which defies all explanation),
but there's still a lot of junk around. It isn't really junk
in the way of discarded stuff that builds over time, but more
the sort you'd find on consoles.|
|For example, you can see a red button, a blue button, a black
dial, a grey switch, ">)
                 (ELSE
                  <TELL
"You can see a red button, a blue button, a black dial, a grey switch, ">)>
           <COND (<AND <NOT <FSET? ,GREEN-BUTTON ,INVISIBLE>>
                       ;<IN? ,GREEN-BUTTON ,BATHROOM-SHIP>>
                  <TELL "a " D ,GREEN-BUTTON ", ">)>
           <TELL "an opaque flap ">
           <COND (<FSET? ,FLAP ,OPENBIT>
                  <TELL "(with an orange button underneath) ">)>
           <TELL "and a white button on another part of the console." CR>)>>

<OBJECT FLAP
    (LOC PRES-BRIDGE)
    (DESC "opaque flap")
    (SYNONYM FLAP TAB)
    (ADJECTIVE OPAQUE TRANSLUCE)
    (FLAGS CONTBIT OPENABLEBIT NDESCBIT VOWELBIT TRYTAKEBIT)
    (ACTION FLAP-F)>

<ROUTINE FLAP-F ()
    <COND (<VERB? EXAMINE>
           <TELL "A normal flap.">
           <COND (<FSET? ,FLAP ,OPENBIT>
                  <TELL " Underneath it is an orange button.">)>
           <CRLF>)
          (<VERB? OPEN>
           <COND (<FSET? ,FLAP ,OPENBIT>
                  <ALREADY ,FLAP "open">)
                 (ELSE
                  <TELL "You open the flap, revealing an orange button." CR>
                  <FCLEAR ,ORANGE-BUTTON ,INVISIBLE>
                  <FSET ,FLAP ,OPENBIT>)>)
          (<VERB? CLOSE>
           <COND (<FSET? ,FLAP ,OPENBIT>
                  <TELL "You close the flap." CR>
                  <FSET ,ORANGE-BUTTON ,INVISIBLE>
                  <FCLEAR ,FLAP ,OPENBIT>)
                 (ELSE
                  <ALREADY ,FLAP "closed">)>)>>

<OBJECT ORANGE-BUTTON
    (LOC PRES-BRIDGE)
    (DESC "orange button")
    (SYNONYM BUTTON)
    (ADJECTIVE ORANGE)
    (FLAGS NDESCBIT VOWELBIT INVISIBLE TRYTAKEBIT)
    (ACTION ORANGE-BUTTON-F)>

<ROUTINE ORANGE-BUTTON-F ()
    <COND (<OR <VERB? SLAP PUSH>
               <AND <VERB? ATTACK>
                    <VERB-WORD? ,W?HIT>>>
           <JIGS-UP ,EXPLODE-DEATH T>)
          (<VERB? TAKE MOVE>
           <PART-OF ,ORANGE-BUTTON <> "console">)>>

<OBJECT GREEN-BUTTON
    (LOC PRES-BRIDGE)
    (DESC "green button")
    (SYNONYM BUTTON)
    (ADJECTIVE GREEN)
    (FLAGS NDESCBIT INVISIBLE CAPTAINBIT TRYTAKEBIT)
    (ACTION CAPTAIN-OBJ-F)>

<ROUTINE BUTTON-MEH ()
    <COND (<VERB? TAKE MOVE>
           <PART-OF ,PRSO <> "console">)
          (<TOUCHING?>
           <HACK-HACK "Doing that with">)
          (ELSE
           <TELL "Nothing interesting there." CR>)>>

<OBJECT RED-BUTTON ;"For purposes of disambiguation"
    (LOC PRES-BRIDGE)
    (DESC "red button")
    (SYNONYM BUTTON)
    (ADJECTIVE RED)
    (FLAGS NDESCBIT VOWELBIT TRYTAKEBIT)
    (ACTION BUTTON-MEH)>

<OBJECT BLUE-BUTTON ;"For purposes of disambiguation"
    (LOC PRES-BRIDGE)
    (DESC "blue button")
    (SYNONYM BUTTON)
    (ADJECTIVE BLUE)
    (FLAGS NDESCBIT VOWELBIT TRYTAKEBIT)
    (ACTION BUTTON-MEH)>

<OBJECT WHITE-BUTTON ;"For purposes of disambiguation"
    (LOC PRES-BRIDGE)
    (DESC "white button")
    (SYNONYM BUTTON)
    (ADJECTIVE WHITE)
    (FLAGS NDESCBIT VOWELBIT TRYTAKEBIT)
    (ACTION BUTTON-MEH)>