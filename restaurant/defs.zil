"DEFS for MILLIWAYS
Copyright (c) 1988 Infocom, Inc.  All rights reserved."

<ADD-TELL-TOKENS A * <PRINTA .X>>

;<REPLACE-DEFINITION ADJ-USED? T>
<DELAY-DEFINITION CAPITAL-NOUN?>
<REPLACE-DEFINITION DIR-VERB-PRSI?
	<ROUTINE DIR-VERB-PRSI? (NP) <>>>
<REPLACE-DEFINITION NO-M-WINNER-VERB?
	<ROUTINE NO-M-WINNER-VERB? () <>>>
<REPLACE-DEFINITION OWNERS
	<CONSTANT OWNERS 
        <TABLE (PURE LENGTH)
                PLAYER MARVIN FORD
				ZAPHOD TRILLIAN
				HEAD-COOK MORPHER-CAPTAIN
				FIRST-CLASS-IDIOT ARK-CAPTAIN
                SLARTY ;CH-DIRK>>>
;<REPLACE-DEFINITION PLURAL <CONSTANT PLURAL PLURALBIT>>
<REPLACE-DEFINITION PRINT-INTQUOTE T>
;<DELAY-DEFINITION PRSO-VERB?>
;<DELAY-DEFINITION PRSI-VERB?>
<DELAY-DEFINITION SEE-VERB?>
<REPLACE-DEFINITION SETUP-ORPHAN T>
<DELAY-DEFINITION SPEAKING-VERB?>

<COMPILATION-FLAG P-PS-COMMA T>
<COMPILATION-FLAG P-PS-APOSTR T>
<COMPILATION-FLAG P-PS-OFWORD T>
<COMPILATION-FLAG P-PS-THEWORD T>
<COMPILATION-FLAG P-PS-QUOTE T>

<INCLUDE "BASEDEFS" "SYMBOLS">
<TERMINALS (VERB 6) (NOUN 4) (ADJ 5)
	   ADV QUANT MISCWORD
	   (DIR 1) TOBE QWORD CANDO COMMA
	   (PARTICLE 3) (PREP 2) ASKWORD ;PRONOUN
	APOSTR OFWORD ARTICLE
	QUOTE>

<DIRECTIONS	NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<OBJECT INTDIR
	(LOC GLOBAL-OBJECTS)
	(DESC "direction")
	(SYNONYM NORTH NE EAST SE SOUTH SW WEST NW)>

;<GLOBAL PLAYER CH-ARTHUR>