"EARTH for
        the Restaurant at the End of the Universe"

"PART 5 - FJORDS OF NORWAY"

<GLOBAL FROZEN 0>
<GLOBAL GLACIER-BREAKING 0>
<GLOBAL DESTROYED-GLACIER <>>
<GLOBAL LOOK-COUNTER-B <>>

<CONSTANT NORWAY-ROOMS
    <TABLE (LENGTH PURE ;BYTE)
        GLACIER-1
        GLACIER-2
        GLACIER-3
        GLACIER-4
        PILLAR
        CHANNEL1
        CHANNEL2
        CHANNEL3
        ROCKY-CHAMBER
        SLOPE
        DARK-CHASM
        WEST-CREVASSE
        EAST-CREVASSE
        WINDING-TRAIL-1
        WINDING-TRAIL-2
        ICE-BLOCK-1
        ICE-BLOCK-2
        ICE-BLOCK-3
        STAIRCASE
        TELEPAD>>

<ROUTINE QUEUE-FREEZE ()
    <QUEUE I-FREEZE -1>>

<ROUTINE I-FREEZE ()
    <COND (<AND <FSET? ,GOWN ,WORNBIT>
                <PROB 75>>
           <SETG FROZEN <+ ,FROZEN 1>>)
          (<FSET? ,GOWN ,WORNBIT>
           <RTRUE>)
          (ELSE
           <SETG FROZEN <+ ,FROZEN 1>>)>
    
    <COND (<EQUAL? ,FROZEN 2>
           <TELL CR "Brr! It really is freezing.">
           <COND (<FSET? ,GOWN ,WORNBIT>
                  <TELL " Luckily, you have this nice gown to keep you warm.">)>)
          (<EQUAL? ,FROZEN 10>
           <TELL CR
"Ugh. This is the bad sort of weather you remember getting in England, when the
Earth was still in the nice, healthy shape that any planet should have.">)
          (<EQUAL? ,FROZEN 11>
           <TELL CR "Well, maybe England wasn't ">
           <ITALICIZE "as">
           <TELL " bad as this" ,ELLIPSIS>)
          (<EQUAL? ,FROZEN 30>
           <TELL CR "The cold is really numbing. You don't know how much longer you can handle.">)
          (<EQUAL? ,FROZEN 46>
           <TELL CR "You can't feel your legs!">)
          (<EQUAL? ,FROZEN 48>
           <TELL CR "If you don't do something, you'll die" ,ELLIPSIS>)
          (<G? ,FROZEN 50>
           <CRLF>
           <JIGS-UP "I'm sorry, but the cold was too much for you, and so you could not survive.">)
          (ELSE
           <COND (<EQUAL? <MOD ,FROZEN 4> 0>
                  <TELL CR <PICK-ONE ,AS-ICE>>)
                 (ELSE
                  <RTRUE>)>)>
    <CRLF>>


<ROUTINE I-GLACIER-CRACK ()
    <SETG GLACIER-BREAKING <+ ,GLACIER-BREAKING 1>>
    <COND (<EQUAL? ,GLACIER-BREAKING 100>
           <TELL CR "Oh no! The glacier's broken away!" CR>)
          (<EQUAL? ,GLACIER-BREAKING 101>
           <CRLF>
           <COND (<IN? ,PLAYER ,PILLAR>
                  <TELL "The pillar begins to fall down into the water. If you don't move now, you will die!" CR>)
                 (ELSE
                  <TELL "The pillar collapses into the water, off to the south." CR>
                  <DEQUEUE I-GLACIER-CRACK>)>)
          (<EQUAL? ,GLACIER-BREAKING 102>
           <CRLF>
           <COND (<IN? ,PLAYER ,PILLAR> ;"      This only gets run if you are on the pillar     "
                  <JIGS-UP              ;"      and you did not look around as your action.     "
"The pillar drops at an alrming rate (to you, at least, who is on the pillar)
and plunges into the water. Well, you didn't move, as I suggested before, and
you take enough damage from the shock of the ice water and die.">)
                 (ELSE
                  <TELL "The pillar collapses into the water, off to the south." CR>
                  <DEQUEUE I-GLACIER-CRACK>)>)
          
          (<EQUAL? ,GLACIER-BREAKING 15>
           <SETG DESTROYED-GLACIER T>
           <TELL CR "You hear a deep splash off to the ">
           <COND (<EQUAL? <LOC ,PLAYER> ,GLACIER-2 ,GLACIER-4>
                  <TELL "south">)>
           <TELL "east">
           <COND (<IN? ,PLAYER ,GLACIER-4>
                  <TELL
", as the crack in the ice gets so big that a part of the glacier splits
off from the bit you are standing on (which makes up most of the glacier)!|
|The pillar falls into the water, making the ice shake, and you tumble
backwards before hastily standing up again.">)
                 (ELSE
                  <TELL ". What is it now? Why do so many bad things happen to you all the time?">)>
           <DEQUEUE I-GLACIER-CRACK>
           <CRLF>)
          (ELSE
           <COND (<AND <EQUAL? ,GLACIER-BREAKING 5 9 12 14>
                       <IN? ,PLAYER ,GLACIER-4>>
                  <TELL CR "The crack in the ice widens." CR>)>)>>

<ROUTINE PATH-DESC (DIR)
    <TELL "A small path. " ,IT-LOOKS-LIKE "it leads to the " <DIR-TO-STRING .DIR> !\. CR>>



<ROOM GLACIER-1
    (LOC ROOMS)
    (DESC "Glacier")
    (SYNONYM FJORDS FJORD NORWAY ICELAND FINLAND SCANDINAV SWEDEN)
    (NE TO GLACIER-2)
    (NORTH PER WANT-DEATH)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    ;(DESCFCN GLACIER-DESC)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (SHARP JUTTING SPIKY) ROCK UNIMPORTANT-THING-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>


<ROOM GLACIER-2
    (LOC ROOMS)
    (DESC "Glacier")
    (SW TO GLACIER-1)
    (SE TO GLACIER-3)
    (NORTH PER WANT-DEATH)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (NE PER WANT-DEATH)
    ;(DESCFCN GLACIER-DESC)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (SHARP JUTTING SPIKY) ROCK UNIMPORTANT-THING-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROOM GLACIER-3
    (LOC ROOMS)
    (DESC "Glacier")
    (NW TO GLACIER-2)
    (NE TO GLACIER-4)
    (NORTH PER WANT-DEATH)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    ;(DESCFCN GLACIER-DESC)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (SHARP JUTTING SPIKY) ROCK UNIMPORTANT-THING-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROOM GLACIER-4
    (LOC ROOMS)
    (DESC "Glacier")
    (SW TO GLACIER-3)
    (SE PER ON-PILLAR)
    (NORTH PER WANT-DEATH)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (NE PER WANT-DEATH)
    ;(DESCFCN GLACIER-DESC)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (SHARP JUTTING SPIKY) ROCK UNIMPORTANT-THING-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F
            (BIG BROKEN CRASHED SMASHED TILTED COLLAPSED MYSTERIOU) (PILLAR STACK TOWER) TOWER-F
            BIG (CRACK SPLIT) CRACKS-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROUTINE ON-PILLAR ()
    <COND (,DESTROYED-GLACIER
           <TELL
"I think you're a bit too far away from the pillar, which has drifted
away from the glacier...||Or are you the one drifting?" CR>
           <RFALSE>)>
    <TELL "You climb atop the pillar." CR CR>
    ,PILLAR>

<ROUTINE TOWER-F ()
    <COND (<VERB? CLIMB-ON CLIMB-UP WALK-AROUND BOARD>
           <DO-WALK ,P?SE>)
          (<VERB? EXAMINE>
           <TELL "How it got there, and why it collapsed... is a mystery." CR>)
          (<VERB? TAKE>
           <IMPOSSIBLE>)
          (ELSE
           <TELL "It's a big tower!" CR>)>>

<ROUTINE CRACKS-F ()
    <COND (,DESTROYED-GLACIER
           <TELL ,NOPE "see any crack here." CR>
           <RTRUE>)>
    <COND (<VERB? CLIMB-ON CLIMB-UP WALK-AROUND>
           <TELL-ME-HOW>)
          (<VERB? EXAMINE>
           <COND (<G? ,GLACIER-BREAKING 8>
                  <TELL "It's looking pretty big." CR>)
                 (ELSE
                  <TELL "It's getting bigger." CR>)>)
          (<VERB? TAKE>
           <IMPOSSIBLE>)
          (ELSE
           <TELL "It's a crack." CR>)>>


<ROUTINE ICE-F ()
    <COND (<TOUCHING?>
           <TELL "Cold!" CR>)
          (ELSE
           <TELL "It's ice." CR>)>>

<ROUTINE CLIFF-WALLS-F ()
    <COND (<VERB? WALK-TO LEAP DISEMBARK CLIMB-DOWN>
           <TELL ,SPARK>
           <JIGS-UP ,HIT-WATER>)
          (<VERB? EXAMINE>
           <TELL "They must be at least one hundred meters. If not more!" CR>)
          (<VERB? TAKE>
           <IMPOSSIBLE>)
          (ELSE
           <UNIMPORTANT-THING-F>)>>

<ROUTINE FJORD-F ()
    <COND (<VERB? THROUGH BOARD WALK-TO LEAP>
           <TELL ,SPARK>
           <JIGS-UP ,HIT-WATER>)
          (<VERB? EXAMINE>
           <TELL "I must say, the water is a beautiful shade of blue." CR>)
          (<VERB? TAKE>
           <IMPOSSIBLE>)
          (ELSE
           <UNIMPORTANT-THING-F>)>>



<ROUTINE GLACIER-DESC (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL "You are ">
           <COND (<EQUAL? <LOC ,PLAYER> ,ICE-BLOCK-1 ,ICE-BLOCK-2 ,ICE-BLOCK-3>
                  <TELL "back on a glacier. It's cold, is what you can definitely say. You can head">)
                 (<IN? ,PLAYER ,STAIRCASE>
                  <TELL "standing in front of the top step in a staircase etched into the snow. ">
                  <SNOW-STAIRS-F>
                  <TELL CR "You can move">)
                 (<EQUAL? ,VERBOSITY 2>
                  <TELL 
<PICK-ONE <PLTABLE "slipping on the melting ice" "balancing yourself on a piece of rock jutting out"
"feeling the cold" "wearing barely nothing whilst you look for an easy way off">> " of the "
<PICK-ONE <PLTABLE "mighty" "vast" "freezing" ;"cold" "uninhabitable" "big" "grand" "endless">>
" glacier you find yourself on. The frozen cliff walls of the glacier drop a hundred or so
metres below you into the salty freshwater of the fjord on all sides, except to the">)
                 (ELSE
                  <TELL "somewhere in the middle of a"
<PICK-ONE <PLTABLE " vast" " freezing" "n uninhabitable" " very big" "n endless">>
" glacier. On all sides, frozen cliff walls drop a hundred or so metres below you
into the fjord, unless you " <PICK-ONE <PLTABLE "head" "go" "walk" "go to the">>>)>
           <TELL !\ >
           <COND (<EQUAL? ,HERE ,GLACIER-1>
                  <TELL "north-east">)
                 (<EQUAL? ,HERE ,GLACIER-2>
                  <TELL "southwest and southeast">)
                 (<EQUAL? ,HERE ,GLACIER-3>
                  <TELL "northwest and northeast">)
                 (<EQUAL? ,HERE ,GLACIER-4>
                  <TELL "southwest">
                  <COND (<NOT ,DESTROYED-GLACIER>
                         <TELL
". To add to this, an enormous stone pillar has crashed into the southwest
cliff, and it looks like a crack is forming in the ice beside it">
                         <COND (<G? ,GLACIER-BREAKING 10>
                                <TELL ". The crack is looking pretty big">)>)>)
                 (<EQUAL? ,HERE ,ICE-BLOCK-1>
                  <TELL "east, or along a path to the south">)
                 (<EQUAL? ,HERE ,ICE-BLOCK-2>
                  <TELL "south (curving to the east), and west. You can also head east.">)
                 (<EQUAL? ,HERE ,ICE-BLOCK-3>
                  <TELL "only west">)
                 (<EQUAL? ,HERE ,STAIRCASE>
                  <TELL "west (curving north), or as mentioned before, north - down the staircase">)>
           <TELL ,PAUSES>)>
    
    <COND (<AND <EQUAL? .RARG ,M-END>
                <FSET? ,GLACIER-1 ,SADRADIOBIT>>
           <TELL
"Like most events that you get involved with in your life,
it appears that you have found yourself in a situation you
cannot get out of. In this case, you find yourself on the
edge of the glacier - an unstable spot. At the point when you "
<PICK-ONE <PLTABLE "reached down to scratch your leg"
                   "turned on the spot to try and keep warm"
                   "slipped on the ice"
                   "tripped on a rock sticking out of the ground">>
", a small series of vibrations was sent through the snow
and ice, very quickly starting an avalanch - which you are
in the middle of.">
           <GO-TO-DARK>)>>




<ROOM PILLAR
    (LOC ROOMS)
    (DESC "Icy Pillar")
    (NW SORRY "Well... There's no way to the northwest anymore.")
    (DOWN PER INTO-THE-WATER)
    (NORTH PER INTO-THE-WATER)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    (NE PER WANT-DEATH)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG BROKEN CRASHED SMASHED TILTED) (PILLAR STACK TOWER GLACIER) GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA) FJORD-F
            ;[(;NORTHERN ;NORTH-LEA WATER CHANNEL ;IN) (ROCK CHANNEL WATER) FJORD-CHANNEL-F])
    (GLOBAL FJORD-CHANNEL STAR THIRD-PLANET)
    (ACTION PILLAR-D)>

<ROUTINE PILLAR-D (RARG)
    ;<COND (<AND <EQUAL? .RARG ,M-BEG>
                <NOT <PRSO-VERB?>>>
           <TELL "The pillar tips forward, about to be destroyed at any moment." CR CR>
           <RFALSE>)>
    <COND (<EQUAL? .RARG ,M-LOOK>
               <TELL "You can go north into the water channel in the rock">
               <COND (<AND <L? ,GLACIER-BREAKING 15>>
                      <SETG GLACIER-BREAKING 99>
                      <TELL " and to the northwest... Something's wrong">
                      <SETG DESTROYED-GLACIER T>)
                     (<G? ,GLACIER-BREAKING 100>
                      <JIGS-UP
". There was a way to the northwest, but, well... The pillar has collapsed,
so the northwest trail is over a hundred metres up on the glacier. Oh. And
I forgot to mention - when you hit the water, you did die of shock." T>)>
               <TELL ,PAUSES>)>>

<ROUTINE INTO-THE-WATER ()
    <TELL "You plunge into the water, expecting the shock of jumping into an ice pool, but it's... warm?" CR CR>
    ,CHANNEL1>

<OBJECT	FJORD-CHANNEL
	(LOC LOCAL-GLOBALS)
	(DESC "channel")
	(SYNONYM ROCK CHANNEL WATER)
	(ADJECTIVE WATER CHANNEL)
	(FLAGS NARTICLEBIT TRANSBIT NDESCBIT OPENBIT CONTBIT)
	(ACTION FJORD-CHANNEL-F)>

<ROUTINE FJORD-CHANNEL-F ()
    <COND (<VERB? EXAMINE SEARCH>
           <COND (<IN? ,PLAYER ,PILLAR>
                  <TELL "A north-leading water channel." CR>)
                 (ELSE
                  <V-LOOK>)>
           <RTRUE>)
          (<VERB? TAKE>
           <IMPOSSIBLE>)
          (<VERB? WALK-TO BOARD THROUGH LEAP>
           <DO-WALK ,P?NORTH>)
          (<AND <VERB? THROW-AT THROW-THROUGH PUT-IN>
				<IOBJ? FJORD-CHANNEL>
				<NOT <DOBJ? FJORD-CHANNEL>>
				<IDROP>>
		   <TELL "You toss "><THE-J ,PRSO T><TELL " down into the channel." CR>
		   <COND (<IN? ,PLAYER ,PILLAR>
                  <MOVE ,PRSO ,CHANNEL1>)
                 (ELSE
                  <MOVE ,PRSO ,HERE>)>)
          (ELSE
           <TELL "It's a channel!" CR>)>>

<ROOM CHANNEL1
    (LOC ROOMS)
    (DESC "Water Channel")
    (SOUTH SORRY "The pillar has collapsed.")
    (EAST TO CHANNEL2)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (WARM FJORD WATER ;IN) (CHANNEL WATER) GLOBAL-ROOM-F
            ROCK (ROCK WALL WALLS) WALLS-F)
    (GLOBAL FJORD-CHANNEL STAR THIRD-PLANET)
    (ACTION CHANNEL-D)>

<ROOM CHANNEL2
    (LOC ROOMS)
    (DESC "Water Channel")
    (EAST TO CHANNEL1)
    (SE TO CHANNEL3)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT SEENBIT)
    (THINGS (WARM FJORD WATER ;IN) (CHANNEL WATER) GLOBAL-ROOM-F
            ROCK (ROCK WALL WALLS) WALLS-F)
    (GLOBAL FJORD-CHANNEL STAR THIRD-PLANET)
    (ACTION CHANNEL-D)>

<ROOM CHANNEL3
    (LOC ROOMS)
    (DESC "Water Channel")
    (NW TO CHANNEL2)
    (UP PER CLIMB-ROCK)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT SEENBIT)
    (THINGS (WARM FJORD WATER ;IN) (CHANNEL WATER) GLOBAL-ROOM-F
            SMALL HOLE UNIMPORTANT-THING-F
            (SMALL BIG STRANGE ;PASSAGE ;IN) (PASSAGE ROCK) PASSAGE-IN-ROCK-F
            ROCK (ROCK WALL WALLS) WALLS-F)
    (GLOBAL FJORD-CHANNEL STAR THIRD-PLANET)
    (ACTION CHANNEL-D)>

<GLOBAL HELD-ROCK? <>>
<GLOBAL TOWEL-HOLDING <>>


<OBJECT STALACTITE
    (LOC CHANNEL3)
    (DESC "rock")
    (ADJECTIVE POINTY ;IN)
    (SYNONYM PIECE ROCK STALACTIT CHUNK ;WALL)
    (FLAGS NDESCBIT SURFACEBIT)
    (ACTION STALACTITE-F)>

<ROUTINE STALACTITE-F ()
    <COND (<VERB? EXAMINE>
           <TELL "A large stalactite, but coming out of the wall. It looks big enough
that you could grab it, or hook something on it." CR>)
          (<AND <VERB? BOARD CLIMB-ON TAKE WALK-AROUND CLIMB-UP>
                <DOBJ? STALACTITE>
                <OR <EQUAL? ,PRSI <> ,HANDS ,ROOMS>>>
           <COND (<OR ,HELD-ROCK?
                      ,TOWEL-HOLDING>
                  <TELL ,YOU-ARE CR>)
                 (ELSE
                  <TELL "You jump out of the water with all of your newfound strength and reach the rock." CR>
                  <SETG HELD-ROCK? T>)>)
          (<AND <EQUAL? ,TOWEL ,PRSO ,PRSI>
                <VERB? BOARD PUT PUT-IN CLIMB-ON SPUT-ON>
               ;<AND <EQUAL? ,TOWEL ,PRSO ,PRSI>
                    <VERB? SPUT-ON>>>
           <COND (<IN? ,TOWEL ,PLAYER>
                  <TELL "You have to be holding the towel." CR>
                  <FUCKING-CLEAR>
                  <RTRUE>)
                 (<OR ;,HELD-ROCK?
                      ,TOWEL-HOLDING>
                  <TELL ,YOU-ARE CR>
                  <RTRUE>)
                 (ELSE
                  <COND (,HELD-ROCK?
                         <FIRST-YOU "letting go of" ,STALACTITE>
                         <SETG HELD-ROCK? <>>)>
                  <TELL
"You jump as high as you can and hook the towel on the rock.
You are now dangling from the towel." CR>
                  <SETG TOWEL-HOLDING T>
                  <RTRUE>)>)
          (<VERB? DISEMBARK CLIMB-DOWN DROP>
           <PERFORM ,V?STAND>
           <RTRUE>)
          (<AND <TOUCHING?>
                <NOT <VERB? PUT PUT-IN CLIMB-ON BOARD>>>
           <TELL "You'll have to jump." CR>
           <RTRUE>)>>

<ROUTINE PASSAGE-IN-ROCK-F ()
    <COND (<VERB? WALK-TO BOARD THROUGH LEAP>
           <DO-WALK ,P?UP>)
          (<VERB? EXAMINE>
           <TELL "Who knows when or by who or why it was made?" CR>)>>

<ROUTINE CLIMB-ROCK ()
    <COND (,HELD-ROCK?
           <TELL "You try to hoist yourself up, but your hands are too wet, and you slip off the rock." CR>
           <SETG HELD-ROCK? <>>
           <RFALSE>)
          (,TOWEL-HOLDING
           <TELL "Using your towel as a lever, you hoist yourself up, onto the rock, and into the passage." CR CR>
           <SETG TOWEL-HOLDING <>>
           ,ROCKY-CHAMBER)
          (ELSE
           <TELL "You can't reach it from here!" CR>
           <RFALSE>)>>


<ROUTINE CHANNEL-D (RARG)
    <COND (<EQUAL? .RARG ,M-BEG>
           <DEQUEUE I-FREEZE>
           <QUEUE QUEUE-FREEZE 2>
           <COND (<L? ,FROZEN 30>
                  <SETG FROZEN <+ ,FROZEN 1>>)>
           <COND (<AND <VERB? LEAP>
                       <EQUAL? ,PRSO <>>
                       <IN? ,PLAYER ,CHANNEL3>>
                  <COND (<OR ,HELD-ROCK?
                             ,TOWEL-HOLDING>
                         <TELL "You can't jump while you're holding onto a piece of rock!" CR>)
                        (ELSE
                         <TELL "You jump out of the water with all of your newfound strength and reach the rock." CR>
                         <SETG HELD-ROCK? T>)>
                  <RTRUE>)
                 (<VERB? LEAP>
                  <TELL "You're in the water. How can you do that?" CR>
                  <RTRUE>)
                 (<AND <VERB? STAND>
                       <OR ,TOWEL-HOLDING
                           ,HELD-ROCK?>>
                  <TELL "You let go of the rock." CR>
                  <SETG TOWEL-HOLDING <>>
                  <SETG HELD-ROCK? <>>
                  <RTRUE>)
                 (<AND <OR <NOT <EQUAL? ,P-WALK-DIR ,P?UP ,UP>>
                           <NOT <EQUAL? ,PRSO ,P?UP ,UP>>>
                       <VERB? WALK>
                       <OR ,TOWEL-HOLDING
                           ,HELD-ROCK?>>
                  <FIRST-YOU "letting go of" ,STALACTITE>
                  <SETG TOWEL-HOLDING <>>
                  <SETG HELD-ROCK? <>>)>
           <RFALSE>)>
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL "Instead of being icy cold">
           <COND (<NOT <FSET? ,HERE ,SEENBIT>>
                  <TELL ", like you expected">
                  <FSET ,HERE ,SEENBIT>)>
           <TELL ", the water is warm and satsfying. ",IT-LOOKS-LIKE "the ">
           <COND (<IN? ,PLAYER ,CHANNEL1>
                  <TELL "only way to go appears to be east.">)
                 (<IN? ,PLAYER ,CHANNEL2>
                  <TELL "two exits lead southeast and east.">)
                 (<IN? ,PLAYER ,CHANNEL3>
                  <TELL "channel continues through a tiny hole
in the ground, which you won't be able to get through, but you
might be able to swim to the northwest. ">
                  <COND (<OR ,TOWEL-HOLDING
                             ,HELD-ROCK?>
                         <TELL
"Now that you are a bit higher up, you might be able to
reach the passage in the rock above you.">)
                        (ELSE
                         <TELL
"Above you is a large piece of rock sticking out of
the wall - you might be able to reach it. Above that
is a passage in the rock - who knows when or by who
it was made.">)>)>
           <CRLF>)>>


<ROOM ROCKY-CHAMBER
    (LOC ROOMS)
    (DESC "Cozy Chamber")
    (LDESC
"This chamber is small but sparse, and you feel at home here.
What you mean by home, you don't know. If you're not feeling
at all comfortable here, you can either go north, or follow
the northeast path or the southeast path.")
    (DOWN SORRY "Back down into the water? No thanks.")
    (NE TO WEST-CREVASSE)
    (SE PER TO-DARK-CHASM)
    (NORTH PER SLIPPY)
    (THINGS (COMFY COZY COMFORTAB) (CHAMBER DOME) GLOBAL-ROOM-F
            ;[(NORTHEAST SMALL) PASSAGE PATH1-F
            (SOUTHEAST SMALL) PASSAGE PATH2-F])
    (GLOBAL PATH1 PATH2 STAR THIRD-PLANET)
    (FLAGS LIGHTBIT ONBIT SEENBIT)>

<OBJECT PATH1
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE NE SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH1-F)>

<ROUTINE PATH1-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?NE>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?NE>)>>

<OBJECT PATH2
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE SE SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH2-F)>

<ROUTINE PATH2-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?SE>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?SE>)>>

<ROUTINE TO-DARK-CHASM ()
    <TELL
"You follow the path for a minute or so. At one point, the neat-ish path
turns into a more-than-reasonably gravelly slope (in which you are parallel
to the bottom). Suddenly, you slip and, after what seems like five minutes
of bumping, rolling, and clawing for a handhold which is not there, you find
yourself next to the other end of the path, at the bottom of the chasm." CR CR>
    ,DARK-CHASM>

<ROUTINE SLIPPY ()
    <COND (<AND <FSET? ,RED-FROB ,INVISIBLE>
                <IN? ,PLAYER ,SLOPE>>
           <TELL
"As you are climbing up very slowly, your foot slips on a piece of ice.
You tumble all the way back down to where you began the climb." CR CR
"When you stand up, you notice a red frob, frosty and wet, on the floor
beside you. Maybe that was what you slipped on?" CR>
           <FCLEAR ,RED-FROB ,INVISIBLE>
           <THIS-IS-IT ,RED-FROB>
           <RFALSE>)>
    <TELL "It's very slippery and you fall a couple times, but you make it. This had better be worth it." CR CR>
    <COND (<IN? ,PLAYER ,ROCKY-CHAMBER>
           ,SLOPE)
          (ELSE
           ,ROCKY-CHAMBER)>>

<ROOM SLOPE
    (LOC ROOMS)
    (DESC "Slippery Slope")
    (FDESC
"You are at the bottom of a slope. You can see a view out to the north. But
in all honesty, the view isn't at all worth what the journey down the slope
made it out to be. In your head, you imagined a beautiful sight, with maybe
a sunset shining down on you, red and orange light making you look like the
hero character from some movie you might have watched when you were little.|
Well, damn your imagination, because this sight couldn't be more unwelcoming.
|Rocks, sharp and horrible, point at you, as if condemning you to join them
in a life of misery and many other emotions you know Marvin would have. But
now you're having those emotions too. Above you, a dark grey sky looms over
the fjords you stand in, warning the two inhabitants of the land of the
destruction and obliteration to come (in about two million years, you suppose).
On the bright side, this means you should have enough time to find the
philosophical word that you were tasked with finding and get out of here.|
|To the south, you can see a large but comfortable-looking chamber, up the
slope. Right now, you'd rather be there than here.")
    (LDESC
"The slope leads down to the north (where you can see some unwelcoming rocks
and no sight or pretty view to behold), or up in the other direction to a
cozy-looking chamber, which looks much nicer than your current area.")
    (DOWN PER OOPS-SLIP)
    (OUT PER OOPS-SLIP)
    (NORTH PER OOPS-SLIP)
    (SOUTH PER SLIPPY)
    (UP PER SLIPPY)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT SEENBIT)
    (GLOBAL STAR THIRD-PLANET)
    (THINGS (SLIPPY SLIPPERY SLIDY) (SLOPE SLIDE) GLOBAL-ROOM-F
            (BEAUTIFUL BAD HORRIBLE NICE PRETTY UNWELCOMING RED ORANGE GREY GRAY NO NOT)
                            (SIGHT VIEW ROCKS ROCK SUNSET SKY CLOUDS NOT-VIEW) NOT-SIGHT-F)>

<ROUTINE OOPS-SLIP ()
    <TELL ,SPARK>
    <JIGS-UP "the rocks at a speed which can (and does) break all of your bones.">>

<OBJECT RED-FROB
    (LOC SLOPE)
    (SDESC "red frob")
    (SYNONYM FROB ;FROBS PHILOSOPH RED RHOMBICOS SHAPE ;RED)
    (ADJECTIVE RED)
    (ACTION RED-FROB-F)
    (FLAGS INVISIBLE TAKEBIT TRYTAKEBIT)
    (GENERIC FROB-G)
    (SIZE 9)>

<ROUTINE RED-FROB-F ()
    <COND (<VERB? EXAMINE>
           <TELL ,IT-LOOKS-LIKE><THE-J ,RED-FROB <>><TELL ,PAUSES>)
          (<VERB? MOVE PULL-APART OPEN>
           <TELL ,NOPE "do that to this frob." CR>)>>


<GLOBAL SIGHT-VIEWED 0>

<ROUTINE NOT-SIGHT-F ()
    <COND (<VERB? ENJOY EXAMINE>
           <COND (<0? ,SIGHT-VIEWED>
                  <TELL
"It isn't beautiful sight. It's not a nice sight. In fact, it probably
couldn't be classfied as a sight anyway. It's so nasty and horrible to
look at that there's no point in looking at it. Why are you even looking
at it?" CR>)
                 (<1? ,SIGHT-VIEWED>
                  <TELL
"You really shouldn't look at it. It could do damage to your mental
wellbeing. In fact, sights such as these are so well-known to make
people feel miserable that robots are often sent out to find and
obliterate such views. Generally, these robots end up breaking down
anyway quite quickly." CR>)
                 (ELSE
                  <TELL "Are you trying to make yourself feel miserable?" CR>
                  <SETG AWAITING-REPLY 11>
                  <QUEUE I-REPLY 2>)>)
          (<VERB? THROUGH BOARD WALK-TO LEAP>
           <DO-WALK ,P?DOWN>)>>

<ROOM DARK-CHASM
    (LOC ROOMS)
    (DESC "At the Bottom of a Dark Chasm")
    (UP TO ROCKY-CHAMBER)
    (THINGS (AT VERY DARK BOTTOM) (AT BOTTOM CHASM DARKNESS) GLOBAL-ROOM-F
            ;[(VERY FAINT SMALL) PASSAGE PATH3-F])
    (FLAGS LIGHTBIT ONBIT SEENBIT)
    (GLOBAL PATH3 STAR THIRD-PLANET)
    (ACTION DARK-CHASM-F)>

<ROUTINE DARK-CHASM-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL
"It's really dark. Not so dark that you can't use any of your senses,
but dark enough that you can barely see. All that you can make out is ">
           <COND (<IN? ,PLANK ,HERE>
                  <FSET ,PLANK ,NDESCBIT>
                  <TELL "a splintered piece of wood, and ">)>
           <TELL "a path leading upwards." CR>)>>

<OBJECT PATH3
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE UP SMALL FAINT VERY)
    (SYNONYM PASSAGE)
    (ACTION PATH3-F)>

<ROUTINE PATH3-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?UP>)
          (<VERB? EXAMINE>
           <TELL "A very faint path. It goes upwards." CR>)>>

<GLOBAL PLANK-ON-CHASM <>>

<OBJECT PLANK
    (LOC DARK-CHASM)
    (DESC "plank of wood")
    (SYNONYM PLANK TIMBER WOOD LONG)
    (ADJECTIVE WOODEN MOLDY OLD HUMAN-MAD MAN-MADE CREATED MADE LONG)
    (DESCFCN PLANK-D)
    (ACTION PLANK-F)
    (FLAGS TAKEBIT TRYTAKEBIT NDESCBIT)
    (SIZE 30)>

<ROUTINE PLANK-F ()
    <COND (<VERB? EXAMINE>
           <TELL
"Like most pieces of wood that have been left out for a long time,
the timber is moldy and soft. To add to this, it has definitely
been made by an intelligent lifeform of some kind, and not from a
random tree that split in half. You wouldn't trust your weight on
it. But it is very long." CR>)
          (<VERB? TAKE>
           <COND (<ITAKE>
                  <TELL "Oof. It sure is heavy!" CR>
                  <FCLEAR ,PLANK ,NDESCBIT>
                  <SETG PLANK-ON-CHASM <>>)>
           <RTRUE>)>>

<ROUTINE PLANK-D ()
    <COND (,PLANK-ON-CHASM
           <TELL "There is a plank lying across the chasm." CR>)
          (ELSE
           <TELL "There is a long plank of wood here." CR>)>>



<OBJECT CHASM
    (LOC LOCAL-GLOBALS)
    (DESC "chasm")
    (SYNONYM CREVASSE CHASM BRINK)
    (ADJECTIVE WEST WESTERN)
    (FLAGS CONTBIT)
    (ACTION CHASM-F)>

<ROUTINE CHASM-F ()
    <COND (<VERB? LEAP>
           <TELL "You fall into the crater with enough speed to kill the " ,BEAST>
           <JIGS-UP ".||What a wasted opportunity.">)
          (<VERB? PUT>
           <COND (<DOBJ? PLANK>
                  <COND (,PLANK-ON-CHASM
                         <TELL "It already is!" CR>
                         <RTRUE>)>
                  <COND (<HELD? ,PLANK>
                         <FIRST-YOU "dropping" ,PLANK>
                         <COND (<NOT <IDROP>>
                                <RFALSE>)>)>
                  <TELL "You put the plank across the chasm." CR>
                  <SETG PLANK-ON-CHASM T>)
                 (ELSE
                  <PERFORM ,V?PUT-IN ,PRSO ,PRSI>
                  <RTRUE>)>)
          (<VERB? THROW-AT THROW-THROUGH PUT-IN>
           <TELL He+verb ,PRSO "tumble" " to the bottom of the chasm." CR>
           <MOVE ,PRSO ,DARK-CHASM>)>>


<ROOM WEST-CREVASSE
    (LOC ROOMS)
    (DESC "Western Crevasse")
    (LDESC
"There is a path which leads back to the Cavern, down the slope.
To the east is the other side of the chasm, but there's a large
gap. Not as large as you thought it would be, but large enough
that you can't jump across it.")
    (DOWN TO ROCKY-CHAMBER)
    (EAST PER CROSS-CHASM)
    (THINGS SMALL PASSAGE PATH4-F)
    (FLAGS LIGHTBIT ONBIT SEENBIT)
    (GLOBAL CHASM PATH4 STAR THIRD-PLANET)
    ;(ACTION WEST-CREVASSE-F)>

<OBJECT PATH4
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE DOWN SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH4-F)>

<ROUTINE PATH4-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?DOWN>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?DOWN>)>>

<ROUTINE CROSS-CHASM ()
    <COND (,PLANK-ON-CHASM
           <TELL "You walk across the board. As soon as you reach the other side, the plank falls into the chasm." CR CR>
           <REMOVE ,PLANK>
           ,EAST-CREVASSE)
          (ELSE
           <TELL "You can't. Not yet." CR>
           <RFALSE>)>>

<ROOM EAST-CREVASSE
    (LOC ROOMS)
    (DESC "Eastern Crevasse")
    (LDESC "You are on the east side of the crevasse. You can only go south.")
    (SOUTH TO WINDING-TRAIL-1)
    (WEST SORRY "There's no way back.")
    (THINGS (EAST EASTERN) (CREVASSE CHASM BRINK) CHASM-F
            ;[(SOUTH SOUTHERN SMALL) PASSAGE PATH5-F])
    (FLAGS LIGHTBIT ONBIT SEENBIT)
    (GLOBAL CHASM PATH5 STAR THIRD-PLANET)
    ;(ACTION EAST-CREVASSE-F)>

<OBJECT PATH5
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE SOUTH SOUTHERN SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH5-F)>

<ROUTINE PATH5-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?SOUTH>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?SOUTH>)>>


<OBJECT PATH6
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE NORTH NORTHERN SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH6-F)>

<ROUTINE PATH6-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?NORTH>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?NORTH>)>>

<ROOM WINDING-TRAIL-1
    (LOC ROOMS)
    (DESC "Winding Trail")
    (LDESC "The trail leads north; and continues southeast, turning northeast after some time.")
    (NORTH TO EAST-CREVASSE)
    (SE TO WINDING-TRAIL-2)
    (THINGS (WINDING WINDY) PASSAGE GLOBAL-ROOM-F
            ;[(NORTH NORTHERN SMALL) PASSAGE PATH6-F
            (SOUTHEAST SMALL) PASSAGE PATH2-F])
    (GLOBAL PATH2 PATH6 STAR THIRD-PLANET)
    (FLAGS LIGHTBIT ONBIT)>

<ROOM WINDING-TRAIL-2
    (LOC ROOMS)
    (DESC "Winding Trail")
    (LDESC
"This trail is a continuation of the last one, and continues southwest,
turning northwest after some time; as well as a northern path.")
    (NORTH TO ICE-BLOCK-1)
    (SW TO WINDING-TRAIL-1)
    (THINGS (WINDING WINDY) PASSAGE GLOBAL-ROOM-F
            ;[(NORTH NORTHERN) PASSAGE PATH6-F
            SOUTHWEST PASSAGE PATH7-F])
    (GLOBAL PATH6 PATH7 STAR THIRD-PLANET)
    (FLAGS LIGHTBIT ONBIT)>

<OBJECT PATH7
    (LOC LOCAL-GLOBALS)
    (ADJECTIVE SW SMALL)
    (SYNONYM PASSAGE)
    (ACTION PATH7-F)>

<ROUTINE PATH7-F ()
    <COND (<VERB? FOLLOW WALK-AROUND>
           <DO-WALK ,P?SW>)
          (<VERB? EXAMINE>
           <PATH-DESC ,P?SW>)>>

<ROOM ICE-BLOCK-1
    (LOC ROOMS)
    (DESC "Glacier")
    (EAST TO ICE-BLOCK-2)
    (SOUTH TO WINDING-TRAIL-2)
    (NORTH PER WANT-DEATH)
    (WEST PER WANT-DEATH)
    (NE PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F
            ;[(SOUTH SOUTHERN SMALL) PASSAGE PATH5-F])
    (GLOBAL PATH5 STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROOM ICE-BLOCK-2
    (LOC ROOMS)
    (DESC "Glacier")
    (EAST TO ICE-BLOCK-3)
    (WEST TO ICE-BLOCK-1)
    (SOUTH TO STAIRCASE)
    (NORTH PER WANT-DEATH)
    (NE PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROOM ICE-BLOCK-3
    (LOC ROOMS)
    (DESC "Glacier")
    (WEST TO ICE-BLOCK-2)
    (NORTH PER WANT-DEATH)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (NE PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROOM STAIRCASE
    (LOC ROOMS)
    (DESC "By the Staircase")
    (WEST TO ICE-BLOCK-2)
    (NORTH PER HEAD-DOWN-STAIRS)
    (DOWN PER HEAD-DOWN-STAIRS)
    (SOUTH PER WANT-DEATH)
    (EAST PER WANT-DEATH)
    (NE PER WANT-DEATH)
    (NW PER WANT-DEATH)
    (SW PER WANT-DEATH)
    (SE PER WANT-DEATH)
    (FLAGS LIGHTBIT ONBIT OUTSIDEBIT)
    (THINGS (BIG UNINHABIT FREEZING COLD) GLACIER GLOBAL-ROOM-F
            (MELTING SLIPPERY COLD FREEZING) (ICE SNOW COLD FROST) ICE-F
            (BIG CLIFF ICY) (WALLS CLIFF WALL LEDGE EDGE) CLIFF-WALLS-F
            (SALTY FRESH FRESHWATE ;FRESH-WAT SALTWATER ;SALT-WATE BEAUTIFUL BLUE) (FJORD LAKE SEA WATER) FJORD-F)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION GLACIER-DESC)>

<ROUTINE HEAD-DOWN-STAIRS ()
    <TELL
"You run down the stairs, feeling the patterns on the steps as
you walk down. Once off the stairs, you head west, until you reach a" ,ELLIPSIS CR CR>
    <FSET ,TELEPAD ,SEENBIT>
    ,TELEPAD>

<OBJECT SNOW-STAIRS
	(LOC STAIRCASE)
	(DESC "snow stairs")
	(SYNONYM STAIR STAIRS STAIRWAY STAIRCASE STEP STEPS PATTERN PATTERNS)
    (ADJECTIVE SNOW SNOWY ORNATE COMPLEX BEAUTIFUL COOL PATTERNED ICE)
	(FLAGS NARTICLEBIT NDESCBIT)
	(ACTION SNOW-STAIRS-F)>

<ROUTINE SNOW-STAIRS-F ()
    <COND (<VERB? EXAMINE LOOK>
           <TELL
"The stairs appear quite simply-made at first, but as you start to look for a little longer,
you notice beautiful patterns. The stairs head down to the north." CR>)
          (<VERB? CLIMB-UP>
		   <CANNOT-GO>)
	      (<VERB? CLIMB-DOWN FOLLOW WALK-AROUND>
		   <DO-WALK ,P?DOWN>)>>


<ROOM TELEPAD
    (LOC ROOMS)
    (DESC "Telepad")
    (EAST TO STAIRCASE)
    (THINGS <> (GLACIER TELEPAD) GLOBAL-ROOM-F
            (BIG LETTER) (LETTER T \"T\" \'T\') BIG-LETTER-T)
    (GLOBAL STAR THIRD-PLANET)
    (ACTION TELEPAD-F)>

<ROUTINE TELEPAD-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <TELL
"Now, this is not what you expected a Fjord to have. Obviously made by " D ,SLARTY
", as well. But essentially, this place hosts a big letter \"T\" right in the middle
of the rock plain, like he said, where he is supposed to pick you up." CR>
           <COND (<NOT ,LOOK-COUNTER-B>
                  <TELL CR "... Oh, no, that's right - ">
                  <ITALICIZE "you're">
                  <TELL " supposed to say some magic word to get out." CR>)>)>>

<ROUTINE BIG-LETTER-T ()
    <COND (<VERB? EXAMINE CLIMB-ON WALK-AROUND LEAP>
           <TELL "It's big! Like - really, really big." CR>)>>




"PART 8 - DIRK GENTLY'S HOLISTIC DETECTIVE AGENCY"

<GLOBAL LOOK-COUNTER-C <>>

<ROUTINE I-END-OF-WORLD ()
    <TELL
"A bright light streaks out the window! The Vogons have arrived.
That's what they're called, right?||As the death rays strike all
around the building and ">
    <COND (<IN? ,PLAYER ,OFFICE>
           <TELL "ruin your papers">)
          (ELSE
           <TELL "crumble the walls">)>
    <TELL ", you think to yourself:|">
    <ITALICIZE "Oh, well. I was so close, wasn't I?|">
    <TELL "|... And the ceiling crashes down, killing you quickly and almost instantly, before the Dark returns permanently.">
    <SIXCR>
    <BOLDEN "
    ****  You were the wrong person at the wrong time  ****">
    <JIGS-UP "" T>>

<ROUTINE I-PHONE-RINGS ()
    <CRLF>
    <COND (<IN? ,PLAYER ,OFFICE>
           <TELL !\T>)
          (<IN? ,PLAYER ,UPPER-LANDING>
           <TELL "To the east, t">)
          (ELSE
           <TELL "Up in the office, t">)>
    <TELL
        <PICK-ONE
            <PLTABLE
                "he phone is ringing"
                "he phone begins to ring"
                "he phone is ringing, but you can't be bothered to get it">> ,PAUSES>
    <FSET ,PHONE ,RADPLUGBIT> ;"Ringing"
    <THIS-IS-IT ,PHONE>
    <QUEUE I-END-PHONE <RANDOM 3>>>

<ROUTINE I-END-PHONE ()
    <TELL CR "Like it has been suddenly unplugged, the phone stops ringing." CR>
    <FCLEAR ,PHONE ,RADPLUGBIT>
    <THIS-IS-IT ,PHONE>
    <QUEUE I-PHONE-RINGS <+ <RANDOM 3> 4>>>

<ROOM OFFICE
    (LOC ROOMS)
    (DESC "Office")
    (SYNONYM OFFICE)
    (WEST TO UPPER-LANDING)
    (OUT TO UPPER-LANDING)
    (THINGS (CLUTTERED SMALL) (OFFICE WORKROOM DUMP) GLOBAL-ROOM-F
            (CRAMMED CLUTTERED) (MESS JUNK STUFF) JUNK-F
            (BUSY SMALL OLD BACK) (STREET BACKSTREET ALLEY) ALLEY-F
            <> (SOFA COUCH) NOT-HERE-COUCH-F)
    (GLOBAL TABLE-RANDOM WINDOW STAR THIRD-PLANET)
    (FLAGS LIGHTBIT ONBIT)
    (ACTION OFFICE-F)>

<ROUTINE NOT-HERE-COUCH-F ()
    <TELL "Not here, mind you. On the stairs." CR>>

<OBJECT PAPERS
    (LOC OFFICE)
    (DESC "papers")
    (LDESC "A tidal wave of papers scatters the table.")
    (SYNONYM TIDAL WAVE PAPER PAPERS)
    (ADJECTIVE TIDAL WAVE)
    (FLAGS PLURALBIT TRYTAKEBIT NDESCBIT)
    (ACTION PAPERS-F)>

<ROUTINE ALLEY-F ()
    <COND (<VERB? BOARD WALK-TO>
           <TELL "The window's jammed." CR>)
          (<VERB? EXAMINE>
           <TELL "The alley is old and probably unreachable, like many things in this place." CR>)
          (ELSE
           <TELL "It isn't the most interesting thing, leave it alone." CR>)>>

<ROUTINE OFFICE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
           <COND (<NOT ,LOOK-COUNTER-C>
                  <TELL
"This is your cluttered office, which is crammed with everything that
you could ever think of putting in a room - especially all those papers
on the desk. To the west is the exit to the stairs.||New mission, now:
escape the building (which you haven't left since they badly installed
the sofa over a week ago) before the Vogons arrive, which could be any
minute now, or in a year - but just to be safe, get out now." CR>
                  <SETG LOOK-COUNTER-C T>)
                 (ELSE
                  <TELL
"This is your office, the windows letting in barely enough light
to see and the papers on the desk piled over everything. You can
head out to the west, where a sofa blocks the stairs, but there
is otherwise no way to leave this dump." CR>)>)
          (<AND <EQUAL? .RARG ,M-END>
                <FSET? ,OFFICE ,SADRADIOBIT>>
           <TELL
"You take a long look around you, scanning the area - your final memento of this planet. ">
           <COND (<NOT <IN? ,UNBOTTLER ,LOCAL-GLOBALS>>
                  <TELL
"After grabbing a bottle opener from on the desk where it was left, you walk to the">)
                 (ELSE
                  <TELL "You head">)>
           <TELL
" out to the upper landing, and slowly clamber over the couch,
feeling its softness on the way over, and roll to the floor of
the lower landing. Finally, you open the door, and stride out
into the light. Outside, the dark shadow of a Vogon Bureaucruiser
spreads across the ground.">
           <GO-TO-DARK>)>>

<ROUTINE PAPERS-F ()
    <COND (<AND <VERB? TAKE SEARCH MOVE PUSH BRUSH LOOK-THROUGH EXAMINE>
                <IN? ,UNBOTTLER ,LOCAL-GLOBALS>>
           <TELL
"You shuffle through the papers, trying to look for anything which
could possibly be important when you escape Earth. You find a">
           <MOVE ,UNBOTTLER ,HERE>
           <COND (<ITAKE T ,UNBOTTLER>
                  <TELL "nd grab a">)>
           <TELL !\ D ,UNBOTTLER ,PAUSES>
           <RTRUE>)>
    <TELL "Leave the papers alone. They won't be needed anymore, now that Earth is going to be destroyed." CR>
    <RTRUE>>

<OBJECT PHONE
	(LOC OFFICE)
	(DESC "telephone")
    (LDESC "A telephone stands a survivor of the tidal wave of papers.")
	(SYNONYM PHONE TELEPHONE RECEIVER)
	(FLAGS ;NDESCBIT TAKEBIT TRYTAKEBIT)
    (GENERIC PHONE-G)
	(ACTION PHONE-F)>

<ROUTINE PHONE-F ()
	 <COND (<VERB? TAKE>
		    <COND (<FSET? ,PHONE ,RADPLUGBIT>
		           <TELL "You pick it up.">
                   <DEQUEUE I-END-PHONE>
                   <I-END-PHONE>
                   ;<TELL ,WAITING>)
		          (T
		           <TELL "Nothing happens. " ,WAITING>)>)
	       (<VERB? REPLY>
            <COND (<FSET? ,PHONE ,RADPLUGBIT>
                   <PERFORM ,V?TAKE ,PHONE>
                   <RTRUE>)
                  (ELSE
                   <TELL "It isn't ringing." CR>)>)
           (<VERB? WALK-TO FIND>
            <COND (<IN? ,PLAYER ,UPPER-LANDING>
                   <DO-WALK ,P?EAST>
                   <RTRUE>)
                  (<IN? ,PLAYER ,BOTTOM-OF-STAIRS>
                   <DO-WALK ,P?UP>
                   <RTRUE>)
                  (ELSE
                   <RFALSE>)>)>>

<OBJECT UNBOTTLER
    (LOC LOCAL-GLOBALS ;PARCEL)
    (DESC "bottle opener")
    (SYNONYM OPENER)
    (ADJECTIVE BOTTLE)
    ;(LDESC "There is a bottle opener here.")
    (FLAGS TAKEBIT)>

<OBJECT CHATTERBOX
    (LOC OFFICE)
    (DESC "chatterbox")
    (SYNONYM CHATTERBO BOX TELLER MESSAGE MESSAGES)
    (ADJECTIVE CHATTER FORTUNE FADED)
    (FDESC "On the floor is a chatterbox - also known as a fortune teller.")
    (LDESC "You can see a chatterbox here - AKA the fortune teller.")
    (FLAGS TAKEBIT OPENABLEBIT)
    (ACTION CHATTERBOX-F)>

<ROUTINE CHATTERBOX-F ()
    <COND (<VERB? EXAMINE>
           <COND (<NOUN-USED? ,CHATTERBOX ,W?MESSAGE ,W?MESSAGES>
                  <TELL "They've all faded." CR>
                  <RTRUE>)>
           <TELL "On it, you can see eight numbers - 1, 2, 3, 4, 5, 7, 42 and 12345.">
           <COND (<FSET? ,CHATTERBOX ,OPENBIT>
                  <TELL " Underneath that is a set of messages, but they have all faded.">)>
           <CRLF>)
          (<VERB? PLAY>
           <TELL "You get the number "
                 N <SETG P-NUMBER <PICK-ONE <LTABLE 1  2  3  4  5  7  42  12345>>> !\. !\ >
           <PERFORM ,V?EXAMINE ,INTNUM>)>>


<ROOM UPPER-LANDING
    (LOC ROOMS)
    (DESC "Top of Stairs")
    (LDESC
"You are at the top of the stairs. Below you, a
daunting sofa is wedged painfully in the staircase.")
    (DOWN PER DOWN-STAIRS)
    (EAST TO OFFICE)
    (IN TO OFFICE)
    (GLOBAL STAIRS ;SOFA STAR THIRD-PLANET)
    (FLAGS LIGHTBIT ONBIT)
    (THINGS (UPPER TOP) (TOP STAIRS LANDING) GLOBAL-ROOM-F)
    ;(ACTION UPPER-LANDING-F)>

<ROUTINE DOWN-STAIRS ()
    <COND (<0? ,SOFA-HURDLE>
           <TELL
"The sofa looks pretty daunting. Even so, you give it a try
- but fear takes over just as you are about to jump, and you
suddenly stop - causing you to lose your balance and collapse
onto the sofa. Hastily, you get back up, so as not to make a
fool of yourself to any random onlookers." CR>)
          (<1? ,SOFA-HURDLE>
           <TELL
"Give it another try? Why not. You take one step backwards,
hop down the stairs as fast as you can and slip on a stair,
crashing into a heap whose movement is only halted by the
sofa you soon find yourself looking up at. You brush the dust
off and crawl back to the top of the stairs, defeated." CR>)
          (<=? 2 ,SOFA-HURDLE>
           <TELL
"You run down the stairs and leap as hard as you can over the sofa -
well, not over, exactly, but at the sofa. Either way, you failed." CR>)
          (<=? 3 ,SOFA-HURDLE>
           <TELL
"It really doesn't help that although you did go to the running
club at the University, that was at least ten months ago, and
you have put on more than a little bit of weight over the past
week while waiting for the sofa to be picked up - which it hasn't
been - and you imagine yourself having succeeded at jumping over
the and have now found yourself at the bottom of the stairs.|
|...Then you return to reality, and you have made no progress." CR>)
          (ELSE
           <TELL
"You realise that the Vogons are about to destroy almost everything
you've ever known, and so in a desperate attempt to survive, push off
of the stairs at the last moment, clearing the entire sofa." CR CR>
           <ITALICIZE "BAM!!||">
           <TELL " You crash painfully to the floor of the" ,ELLIPSIS CR CR>
           <RETURN ,BOTTOM-OF-STAIRS>
           <V-FOO>)>
    <SETG SOFA-HURDLE <+ ,SOFA-HURDLE 1>>
    <RFALSE>>

<GLOBAL SOFA-HURDLE 0>

<OBJECT SOFA
    (LOC UPPER-LANDING)
    (DESC "sofa")
    (SYNONYM SOFA COUCH CHAIR)
    (ADJECTIVE STUCK WEDGED ANNOYING DAUNTING JAMMED COMFY)
    (FLAGS NDESCBIT)
    (ACTION SOFA-F)>

<ROUTINE SOFA-F ()
    <COND (<VERB? LEAP BOARD THROUGH>
           <PERFORM ,V?FOLLOW ,STAIRS>
           <RTRUE>)
          (<VERB? MOVE FIX PUSH>
           <TELL
"Don't you think that's already been tried multiple times?" CR>)
          (<VERB? SIT LIE FAINT BOARD RUB KISS>
           <COND (<IN? ,PLAYER ,UPPER-LANDING>
                  <TELL
"No way. This sofa has been your enemy for weeks now.
It's sotpped you from going down to buy groceries or
do anything else that you would normally do - like -
well, nothing much, really." CR>)
                 (ELSE
                  <TELL
"You'd have to go back up the steps to do that." CR>)>)>>

<ROOM BOTTOM-OF-STAIRS
    (LOC ROOMS)
    (DESC "Bottom of Stairs")
    (UP PER SOFA-THERE)
    (NORTH SORRY "The door isn't open." ;"PER GO-TO-DARK" ;"TO FOO-ROOM IF DIRK-DOOR IS OPEN")
    (LDESC
"This is the bottom of the stairs. A sofa is wedged
in the staircase above you and the top of the stairs,
and a door leads north onto the street.")
    (GLOBAL STAIRS ;SOFA STAR THIRD-PLANET)
    (THINGS (LOWER BOTTOM) (BOTTOM STAIRS LANDING) GLOBAL-ROOM-F
            ;[DOOR (DOORMAT MAT) UNIMPORTANT-THING-F]
            <> (STREET HIGHWAY ROAD) DIRK-STREET-F)
    (FLAGS LIGHTBIT ONBIT)>

<ROUTINE DIRK-STREET-F ()
    <COND (<VERB? WALK-AROUND WALK-TO CLIMB-DOWN>
           <DO-WALK ,P?NORTH>
           <RTRUE>)
          (ELSE
           <TELL "You can't see the street here. It's to the north." CR>
           <RTRUE>)>>

<ROUTINE SOFA-THERE ()
    <TELL "Are you ">
    <ITALICIZE "kidding">
    <TELL
" me?! You came all this way down the stairs, and
now you're telling me you want to go back up??" CR>
    <RFALSE>>

;[<OBJECT PARCEL
	(LOC BOTTOM-OF-STAIRS)
	(SDESC "parcel")
	(DESCFCN PARCEL-D)
    (SYNONYM PARCEL ENVELOPE BULGE BLOB MAIL ;PACKAGE)
    (ADJECTIVE ;WITH STRANGE THIN)
    (CAPACITY 5)
    (SIZE 2)
    (FLAGS TAKEBIT)
    (ACTION PARCEL-F)>

<ROUTINE PARCEL-D ()
    <COND (<NOT <FSET? ,PARCEL ,TOUCHBIT>>
           <TELL "On the doormat is a envelope with an odd-looking bulge." CR>)
          (<FSET? ,PARCEL ,CONTBIT>
           <TELL "You can also see an open parcel here." CR>)
          (ELSE
           <TELL "There is "><THE-J ,PARCEL <>><TELL " here." CR>)>>

<ROUTINE PARCEL-F ()
    <COND (<VERB? EXAMINE>
           <COND (<NOT <FSET? ,PARCEL ,RADPLUGBIT>>
                  <TELL "You can feel a strange bulge, from something inside the package." CR>)
                 (<FSET? ,PARCEL ,CONTBIT>
                  <TELL "The top has been ripped off. ">
                  <COND (<FIRST? ,PARCEL>
                         <TELL "Inside is "><THE-J <FIRST? ,PARCEL> T>)
                        (ELSE
                         <TELL "There is nothing inside">)>
                  <TELL ,PAUSES>)
                 (<L? <GETP ,PARCEL ,P?SIZE> 5>
                  <TELL "It's pretty ruined." CR>)
                 (ELSE
                  <TELL "It's just a pile of shreds now." CR>)>)
          (<AND <VERB? PUT-IN>
                <FSET? ,PARCEL ,CONTBIT>
                <IOBJ? PARCEL>>
           <COND (<G? <WEIGHT ,PRSO> 5>
                  <TELL He+verb ,PRSO "does" "n't fit." CR>
                  <RTRUE>)
                 (<FIRST? ,PARCEL>
                  <TELL "Only one item fits in the parcel at a time." CR>
                  <RTRUE>)
                 (ELSE
                  <RFALSE>)>)
          (<VERB? RUB>
           <COND (<OR <NOT <FSET? ,PARCEL ,RADPLUGBIT>>
                      <FSET? ,PARCEL ,CONTBIT>>
                  <PERFORM ,V?EXAMINE ,PARCEL>
                  <RTRUE>)
                 (ELSE
                  <TELL "Not much to feel, is there anymore!" CR>)>)
          (<VERB? LOOK-INSIDE SEARCH>
           <COND (<AND <FSET? ,PARCEL ,CONTBIT>>
                  <PERFORM ,V?EXAMINE ,PRSO>)
                 (<NOT <FSET? ,PARCEL ,RADPLUGBIT>>
                  <TELL "It's closed." CR>)
                 (ELSE
                  <TELL "How can you look inside a pile of shreds?" CR>)>)
          (<VERB? OPEN MUNG PULL-APART>
           <COND (<FSET? ,PARCEL ,RADPLUGBIT>
                  <COND (<VERB? OPEN>
                         <TELL "It's already open!">
                         <COND (<NOT <FSET? ,PARCEL ,CONTBIT>>
                                <TELL " In fact, it's a little more than open" ,ELLIPSIS>)>
                         <CRLF>
                         <RTRUE>)
                        (<G? <GETP ,PARCEL ,P?SIZE> 5>
                         <TELL "You can't rip it any more than that!" CR>
                         <RTRUE>)>
                  <TELL "You rip it a little more. ">
                  <COND (<FIRST? ,PARCEL>
                         <THE-J <FIRST? ,PARCEL> T T><TELL " falls out.">
                         <MOVE <FIRST? ,PARCEL> ,HERE>)>
                  <PUTP ,PARCEL ,P?SIZE <+ <GETP ,PARCEL ,P?SIZE> 1>>
                  <PERFORM ,V?EXAMINE ,PARCEL>
                  <COND (<L? <GETP ,PARCEL ,P?SIZE> 5>
                         <PUTP ,PARCEL ,P?SDESC "ruined parcel">)
                        (ELSE
                         <PUTP ,PARCEL ,P?SDESC "pile of shreds">)>
                  <FCLEAR ,PARCEL ,CONTBIT>
                  <RTRUE>)
                 (ELSE
                  <TELL
"You tear off the top of the parcel, and a " D ,UNBOTTLER
" drops to the floor. You've been waiting for weeks to get
hold of this, and now it has finally arrived. Or... maybe
it arrived a week ago and you didn't know about it. Who knows?" CR>
                  <MOVE ,UNBOTTLER ,HERE>
                  <PUTP ,PARCEL ,P?SDESC "open parcel">
                  <FSET ,PARCEL ,CONTBIT>)>)>>]

<OBJECT DIRK-DOOR
    (LOC BOTTOM-OF-STAIRS)
    (DESC "door")
    (SYNONYM DOOR)
    (FLAGS DOORBIT NDESCBIT)
    (ACTION DIRK-DOOR-F)>

<ROUTINE DIRK-DOOR-F ()
    <COND (<VERB? OPEN>
           <INCREMENT-SCORE 25 T>
           <GO-TO-DARK>
           <RTRUE>)
          (<VERB? THROUGH BOARD WALK-TO LEAP>
           <TELL "(opening the door first)" CR>
           <PERFORM ,V?OPEN ,DIRK-DOOR>
           <RTRUE>)>>