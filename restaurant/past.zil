"PAST for
        the Restaurant at the End of the Universe"

"PART 7 - GOLGFRINCHAM ARK B"

<ROOM ARK
    (LOC ROOMS)
    (DESC "Golgafrincham Ark B, on the bridge")
    (THINGS (LITTERED SCATTERED STRANGE MULTIPLE MANY)
                            (KNOBS SWITCH KNOB SWITCHES CONTROLS DATA CONTROL SCREENS) UNIMPORTANT-THING-F
            (GOLGAFRIN ARK) (ARK B SHIP SPACESHIP STARSHIP) GLOBAL-ROOM-F)
    (OUT SORRY "Although you're on the bridge, you don't seem to be able to leave.")
    (ACTION ARK-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE ARK-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL "It looks just how you imagined the inside of a spaceship would look like.
Controls litter the outer rim, with knobs and buttons all over, and confusing data on multiple screens." CR>)>
    <COND (<AND <EQUAL? .RARG ,M-END>
                <FSET? ,ARK ,SADRADIOBIT>>
           <TELL CR "Just as you regain enough balance to stand up, the ship shudders violently
and throws you across the room towards the pink bath. The last thing you see is a rubber ducky
sailing through the air above you.">
           <GO-TO-DARK>
           <RTRUE>)>>

<OBJECT PINK-BATH
    (LOC ARK)
    (DESC "bath")
    (SYNONYM BATH TUB BATHTUB)
    (ADJECTIVE PINK LARGE BIG ROUND)
    (FDESC "A large, pink bath which contains frothy water sits in the centre of the room.
|Inside the bath sits a man with a captain's hat on.")
    (LDESC "There is a big pink bath in the middle of the room, containing the captain of the ship.")
    (FLAGS CONTBIT OPENBIT ;NDESCBIT TRANSBIT ;SEARCHBIT)
    (CAPACITY 500)
    (GENERIC PINK-BATH-G)
    (ACTION PINK-BATH-F)>

<ROUTINE PINK-BATH-F ()
    <COND (<AND <VERB? THROW-AT THROW-THROUGH PUT-IN>
				<IOBJ? PINK-BATH>>
           <PERFORM ,V?PUT-IN ,PRSO ,PINK-WATER>
           <RTRUE>)
          (<VERB? EXAMINE LOOK-INSIDE>
           <TELL
"The pink frothy water inside the bath swirls and steams. Swishing around inside,
looking intently at you, is the captain, who plays with the rubber ducky in his hand." CR>)
          (<VERB? CLIMB-ON BOARD>
           <PERFORM ,V?BOARD ,PINK-WATER>
           <RTRUE>)
          (<VERB? OPEN CLOSE>
           <TELL "You must tell me how to do that to a bath!" CR>)>>

<OBJECT PINK-WATER
    (LOC PINK-BATH)
    (DESC "pink foamy water")
    (SYNONYM WATER STEAM)
    (ADJECTIVE PINK FOAMY FROTHY SWEET STEAMY)
    (FLAGS NDESCBIT OPENBIT)
    (GENERIC PINK-BATH-G)
    (ACTION PINK-WATER-F)>

<ROUTINE PINK-WATER-F ()
    <COND (<AND <VERB? THROW-AT THROW-THROUGH PUT-IN>
				<IOBJ? PINK-WATER PINK-BATH>>
           <LOSE-IN-WATER>)
          (<VERB? TAKE>
           <TELL "It slips through your hands." CR>)
          (<VERB? CLIMB-ON BOARD>
           <TELL "\"Hey! No getting in the bath, buddy!\"" CR>)>>

<OBJECT DUCKY
    (LOC PINK-BATH)
    (OWNER ARK-CAPTAIN)
    (DESC "rubber ducky")
    (SYNONYM DUCK DUCKY TOY)
    (ADJECTIVE RUBBER TOY)
    (FLAGS NDESCBIT TAKEBIT)
    (ACTION DUCKY-F)>

<ROUTINE DUCKY-F ()
    <COND (<VERB? TAKE PLAY RUB>
           <TELL "\"That's mine!\" the captain shouts. He refuses to let it go." CR>)>>

<OBJECT MEAT-DISH
    (LOC ARK-CAPTAIN)
    (SDESC "dish of meat")
    (OWNER ARK-CAPTAIN)
    (SYNONYM MEAT DISH PLATE MEAL ;DINNER STEAK FLESH FOOD LIZARD GECKO SALAMANDER DRAGON)
    (ADJECTIVE MEAT SNOW CHILLY VEGAN COLD KOMODO)
    (FLAGS TAKEBIT TRYTAKEBIT EATBIT ;SADRADIOBIT ;"Don't want to pick up" ;BADRADIOBIT ;"Cooked" ;RADPLUGBIT ;"Said it's raw")
    (GENERIC DINNER-G)
    (ACTION MEAT-DISH-F)>

<ROUTINE MEAT-DISH-F ()
    <COND (<AND <VERB? TAKE>
                <EQUAL? <GETP ,MEAT-DISH ,P?OWNER> ,ARK-CAPTAIN>>
           <TELL
"\"Oh ... I don't really want it. I'm supposed to have it but I'm
really not hungry. Here, you can have it.\" He drops it on the floor." CR>
           <PUTP ,MEAT-DISH ,P?OWNER ,PLAYER>
           <MOVE ,MEAT-DISH ,ARK>)
          (<VERB? EXAMINE>
           <COND (<IN? ,MEAT-DISH ,PLATE>
                  <TELL "A piece of meat">
                  <COND (<IN? ,BLASTER ,LOCAL-GLOBALS>
                         <TELL " (infused with a bit of " ,GALACT !\)>)>
                  <TELL ", on a " D ,PLATE ,PAUSES>
                  <RTRUE>)>
           <TELL "The plate holds a piece of ">
           <COND (<EQUAL? <GETP ,MEAT-DISH ,P?SDESC> "dish of meat">
                  <TELL "meat. You don't know which type, but hey, so many things around here are unknown.
Not even the Guide knows about most, so why would you?">)
                 (ELSE
                  <TELL "vegan snow lizard meat. ">
                  <NOTES 4>)>
           <CRLF>)
          (<VERB? EAT>
           <COND (<IN? ,MEAT-DISH ,PLATE>
                  <COND (<FSET? ,MEAT-DISH ,BADRADIOBIT>
                         <V-FOO>)
                        (ELSE
                         <TELL "First you need to cook it.">
                         <COND (<FSET? ,MEAT-DISH ,RADPLUGBIT>
                                <TELL
"Just because it's on a proper plate doesn't change the fact that it's still raw.">)>
                         <CRLF>)>
                  <RTRUE>)
                 (ELSE
                  <TELL "It's raw!" CR>
                  <FSET ,MEAT-DISH ,RADPLUGBIT>
                  <RTRUE>)>)>>

<ROUTINE LOSE-IN-WATER ()
    <THE-J ,PRSO T T>
    <TELL "makes a " <PICK-ONE <LTABLE "plopp" "flopp" "splash" "footl">> "ing sound as it falls into the pink water">
    <COND (<EQUAL? ,PRSO ,GUIDE ,RADIO>
           <TELL ". Unfortunately, "><THE-J ,PRSO T>
           <JIGS-UP " is electric therefore it breaks, electrocuting the captain.
A man with the number 2 printed on his jacket comes rushing in shouting \"What were
those screams?\", before noticing the dead man in the bathtub. Correctly assuming that
you were responsible for his 'murder', Number Two brings out his gun and ends your life.
What a way to go.">)
          (ELSE
           <TELL " and sinks under the waves. \"Oh, well,\" says the
captain, who fishes it out for you and tosses it on the floor." CR>
           <MOVE ,PRSO ,ARK>)>>

<GLOBAL CRASH-LEVEL 0>

<ROUTINE I-CRASH ()
    <COND (<EQUAL? ,CRASH-LEVEL 7 9 13>
           <TELL CR "Alarms sing tuneless warnings, and red lights strobe on the control panels." CR>
           <MOVE ,RED-LIGHT ,ARK>
           <MOVE ,ALARM ,ARK>)
          (<EQUAL? ,CRASH-LEVEL 14>
           <TELL CR
"Suddenly, you find yourself sailing through the air as the ship lands headfirst into its destinated
planet. You crash through the window and fall into a dark and ancient swamp into which the ship sinks.">
           <INCREMENT-SCORE 25 T>
           <GO-TO-DARK>)>
    <SETG CRASH-LEVEL <+ ,CRASH-LEVEL 1>>>


<OBJECT RED-LIGHT
    (LOC LOCAL-GLOBALS)
    (DESC "red lights")
    (SYNONYM LIGHTS LIGHT STROBE)
    (ADJECTIVE RED FLASHING STROBING)
    (FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
    (GENERIC LIGHT-G)>

<OBJECT ALARM
    (LOC LOCAL-GLOBALS)
    (DESC "alarms")
    (SYNONYM ALARM ALARMS WARNINGS)
    (ADJECTIVE TUNELESS LOUD WARNING UNPLEASANT)
    (FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
    (ACTION ALARM-F)>

<ROUTINE ALARM-F ()
    <COND (<SEE-VERB?>
           <TELL "You can't see an alarm. ">)>
    <COND (<VERB? LISTEN>
           <TELL "It isn't pleasant.">)
          (ELSE
           <TELL "You have to listen to it, dummy!">)>
    <CRLF>>




"PART 9 - THE BIG BANG BURGER BAR"

;<OBJECT BBBB
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE BIG BANG BURGER)
    (SYNONYM BAR BIG BANG)
    (ACTION BBBB-F)>

<ROOM BAR
    (LOC ROOMS)
    (DESC "The Big Bang Burger Bar")
    (NORTH PER TO-DRESSING-BAR)
    (THINGS (TIGHTLY PACKED TIGHT CROWDED BUSY) (PEOPLE ALIENS CROWD MOB) CROWD-F)
    (GLOBAL DOOR-BAR)
    (FLAGS LIGHTBIT ONBIT)
    (ACTION BAR-F)>

<OBJECT BURGERS
    (LOC BAR)
    (DESC "burgers")
    (ADJECTIVE STRANGE TASTY GOOD)
    (SYNONYM BURGER BURGERS FOOD)
    (FLAGS TAKEBIT EATBIT TRYTAKEBIT NDESCBIT PLURALBIT)
    (ACTION BURGERS-F)>

<ROUTINE BURGERS-F ()
    <COND (<VERB? SMELL>
           <TELL "Smells good." CR>)
          (<VERB? EXAMINE>
           <TELL "Looks good." CR>)
          (<VERB? EAT FIND TAKE>
           <TELL "There are none left." CR>)>>

<OBJECT DOOR-BAR
    (LOC LOCAL-GLOBALS)
    (SDESC "obscured door")
    (ADJECTIVE NORTH NORTHERN OBSCURED)
    (SYNONYM DOOR)
    (FLAGS DOORBIT VOWELBIT)
    (ACTION DOOR-BAR-F)>

<ROUTINE DOOR-BAR-F ()
    <COND (<VERB? OPEN THROUGH>
           <COND (<IN? ,PLAYER ,BAR>
                  <DO-WALK ,P?NORTH>)
                 (ELSE
                  <DO-WALK ,P?SOUTH>)>)
          (<AND <VERB? EXAMINE>
                <IN? ,PLAYER ,BAR>>
           <TELL "Hidden behind a mob of people." CR>)>>

<ROUTINE BAR-F (RARG)
    <COND (<AND <EQUAL? .RARG ,M-ENTER>
                <NOT <EQUAL? <GETP ,DOOR-BAR ,P?SDESC> "obscured door">>>
           <REPLACE-ADJ? ,DOOR-BAR ,W?SOUTH ,W?NORTH>
           <REPLACE-ADJ? ,DOOR-BAR ,W?SOUTHERN ,W?NORTHERN>
           <PUTP ,DOOR-BAR ,P?SDESC "north door">)>
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL
"The bar is extremely busy, crowded and bustling with people on every stool
and every surface - covering even "><THE-J ,DOOR-BAR <>><TELL " marked with
warning signs - and everyone is eating either burgers or things that look
unlike any sort of burger you've ever seen." CR>)
          (<AND <EQUAL? .RARG ,M-END>
                <FSET? ,BAR ,SADRADIOBIT>>
           <TELL
"You are stuck in the middle of a brawl. Someone throws a punch, and misses
(obviously). You feel the impact as the pain spreads across your jaw." ;,CHEERS>
           <GO-TO-DARK>
           <RTRUE>)>
    <RFALSE>>

<ROUTINE TO-DRESSING-BAR ()
    <TELL "Nobody notices you, even if you're not supposed to walk through. You find yourself in..." CR CR>
    ,DRESSING-ROOM-BBBB>

<ROOM DRESSING-ROOM-BBBB
    (LOC ROOMS)
    (DESC "Max Quordlepleen's Dressing Room")
    (SOUTH TO BAR)
    (FLAGS LIGHTBIT ONBIT)
    (GLOBAL DOOR-BAR TABLE-RANDOM)
    (THINGS (DRESSING MAX\'S MAX QUORDLEPL BACKSTAGE) (ROOM BACKSTAGE) GLOBAL-ROOM-F
            <> (MIRROR MIRRORS) MIRROR-F
            (PILED SCATTERED) (LOTS JUNK RUBBISH) JUNK-F)
    (ACTION DRESSING-ROOM-F)>

<ROUTINE DRESSING-ROOM-F (RARG)
    <COND (<EQUAL? .RARG ,M-ENTER>
           <REPLACE-ADJ? ,DOOR-BAR ,W?NORTH ,W?SOUTH>
           <REPLACE-ADJ? ,DOOR-BAR ,W?NORTHERN ,W?SOUTHERN>
           <REPLACE-ADJ? ,DOOR-BAR ,W?OBSCURED ,W?XZZZP>
           <FCLEAR ,DOOR-BAR ,VOWELBIT>
           <PUTP ,DOOR-BAR ,P?SDESC "south door">)>
    ;<COND (<AND <EQUAL? .RARG ,M-BEG>
                <VERB? EXAMINE>
                <EQUAL? ,PRSO ,PLAYER>>
           <MIRROR-F>)
          (<AND <EQUAL? .RARG ,M-BEG>
                <OR <AND <DOBJ? YOUR-NAME>
                         <VERB? WRITE>>
                    ;<AND <>>>
                <IN? ,PLAYER ,DRESSING-ROOM-BBBB>>
           <TELL "(in the register)" CR>
           <COND (,MAX-FAIL
                  <TELL "You've already done that." CR>)
                 (ELSE
                  <TELL "You write your name in the book." CR>
                  <SETG MAX-FAIL T>)>
           <RTRUE>)
          (<AND <EQUAL? .RARG ,M-BEG>
                <OR <AND <DOBJ? BEAST-NAME>
                         <VERB? WRITE>>
                    ;<AND <>>>
                <IN? ,PLAYER ,DRESSING-ROOM-BBBB>>
           <TELL "(in the register)" CR>
           <PERFORM ,V?WRITE ,BEAST-NAME ,REGISTER>
           <RTRUE>)>
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL
"You have found yourself in the middle of a
supposedly no-entry room. Among the mirrors">
           <COND (<IN? ,REGISTER ,HERE>
                  <COND (<IN? ,PENCIL ,HERE>
                         <TELL !\,>)
                        (ELSE
                         <TELL " and">)>
                  <TELL " a register">
                  <COND (<IN? ,PENCIL ,HERE>
                         <TELL " and a pencil">)>)>
           <TELL ", you notice a table - pushed clear of all junk." CR>
           <RTRUE>)>
    <RFALSE>>

<ROUTINE MIRROR-F ()
    <COND (<VERB? MUNG ATTACK>
           <TELL "You would have bad luck for longer than you probably will live for." CR>)
          (<VERB? EXAMINE LOOK-INSIDE>
           <TELL
"You see yourself in the mirror, and quickly step away
before you can do any more damage to your mental health." CR>
           <FUCKING-CLEAR>)>>

<OBJECT REGISTER
    (OWNER MAXXY)
    (LOC DRESSING-ROOM-BBBB)
    (DESC "dressing room access register")
    ;(LDESC "There is Max Quordlepleen's dressing room access register here.")
    (SYNONYM REGISTER ACCESS)
    (ADJECTIVE MAX QUORDLEPL MAX\'S DRESSING ROOM ACCESS ELECTRONI)
    (FLAGS ;TAKEBIT READBIT ;CONTBIT ;SURFACEBIT NDESCBIT  ;SADRADIOBIT ;"LOOK-FOR-BEAST-NAME"  ;RADPLUGBIT ;"BEAST-NAME-SEEN")
    (CAPACITY 0)
    (ACTION REGISTER-F)>

<ROUTINE REGISTER-F ()
    <COND (<VERB? TAKE>
           <TELL "It's fixed in place." CR>)
          ;(<AND <VERB? PUT PUT-IN WRITE>
                ;<DOBJ? NAME>
                ;<IOBJ? REGISTER>>
           ;<TELL "Just say whatever you want to the register. It's electronic." CR> ;")
          (<VERB? SAY>"
           <COND (<DOBJ? NAME>
                  <TELL ,SAY-IT-AGAIN "whose name?" CR>)
                 (<DOBJ? BEAST-NAME>
                  <TELL
"Giving the " ,BEAST " access to Max Quordlepleen's dressing
rooms? I'm sorry, but you can't. It's already on there, ">
                  <COND (<FSET? ,REGISTER ,RADPLUGBIT>
                         <TELL "as you already know">)
                        (<FSET? ,REGISTER ,SADRADIOBIT>
                         <TELL "as I've already told you">)
                        (ELSE
                         <TELL "if you just look closer to the bottom">
                         <FSET ,REGISTER ,SADRADIOBIT>)>
                  <TELL ,PAUSES>)
                 (<DOBJ? YOUR-NAME>
                  <COND (,MAX-FAIL
                         <TELL "You've already done that." CR>)
                        (ELSE
                         <TELL "\"We have a very similar name. I will add that one.\" There you go." CR>)>)
                 (<DOBJ? AUTO-SIGN>
                  <TELL "Just say the actual name!" CR>
                  <RTRUE>)
                 (ELSE
                  <RFALSE>)>)
          (<VERB? EXAMINE READ>
           <COND (<VERB? EXAMINE>
                  <TELL
"It's an electronic register, used to tell which people are allowed in "
D ,DRESSING-ROOM-BBBB "s. On it are a bunch of names, which you read through">)
                 (ELSE
                  <TELL "You read through a few names">)>
           <TELL " at random: " <PICK-ONE ,REGISTER-TITLES> !\, !\ >
           <COND (<FSET? ,REGISTER ,SADRADIOBIT>
                  <TELL
"the " ,BEAST "..." CR CR "Looks like I was right. " ,YOU-SEE "its
name near-ish the end. Poor ol' Max was probably scared for his
life when he wrote that name in the register">
                  <FSET ,REGISTER ,RADPLUGBIT>
                  <FCLEAR ,REGISTER ,SADRADIOBIT>)
                 (ELSE
                  <TELL <PICK-ONE <PLTABLE "Joey \"Jess\" Cramsey" "Max Fog" "Manon" "Onno Brouwer" "Jinx" "Brian Rushton">> !\. !\.>)>
           <TELL !\.>
           <COND (,MAX-FAIL
                  <TELL " Oh, and obviously your name.">)>
           <COND (,MAX-ALLOWED
                  <TELL " You can also see the name which is produced by the " D ,AUTO-SIGN " as well.">)>
           <CRLF>)>>

<OBJECT PENCIL
    (DESC "pencil")
    (LOC DRESSING-ROOM-BBBB)
    (SYNONYM PEN PENCIL)
    (ADJECTIVE ELECTRONI BROKEN)
    (FLAGS TAKEBIT NDESCBIT)
    (GENERIC PEN-G)
    (SIZE 3)
    ;(ACTION PENCIL-F)>

;<ROUTINE PENCIL-F ()>

<GLOBAL BIG-BANG 3>

<ROUTINE I-BIG-BANG ()
    <CRLF>
    <COND (,BIG-BANG
           <TELL "You hear cheering. Minus">
           <WORD-FROM-NUMBERS ,BIG-BANG> ;<TELL N ,BIG-BANG>
           <TELL " minute">
           <COND (<NOT <1? ,BIG-BANG>>
                  <TELL !\s>)>
           <TELL " until the Big Bang!" CR>
           <SETG BIG-BANG <- ,BIG-BANG 1>>
           <QUEUE I-BIG-BANG 2>)
          (ELSE
           <TELL ,CHEERS>
           <INCREMENT-SCORE 25 T>
           <GO-TO-DARK>)>>