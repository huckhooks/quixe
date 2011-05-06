Custom_Quixe_Miniext_De by Huck Hooks begins here.



Part - Mini-exts


Chapter - Quixe switch

The hack_hooked is a truth state variable.
The hack_hooked is true.

Section - Ide only - not for release

when play begins: now the hack_hooked is false.


Chapter - Commenting

After reading a command (this is the ignore comments rule):
if the player's command matches the regular expression "^#",
reject the player's command;


Chapter - Hyperlinks

When play begins, if hack_hooked is true, now the left hand status line is "[location]Besitz{}[if the navigation is by thumb] zu Kompass{}[else] zu Daumen{}[end if]".

An object can be autolinked or selflinked. An object is usually autolinked.

Before
printing the name of a thing which is autolinked when hack_hooked is
true, say "[character number 1 in the printed name]+scroll{".
After printing the name of a thing which is autolinked  when hack_hooked is true, say "}".

Before printing the name of a direction  when hack_hooked is true, say "[character number 1 in the printed name]+scroll{".
After printing the name of a direction  when hack_hooked is true, say "}".

Before
printing the name of a room which is autolinked  when hack_hooked is
true, say "[character number 1 in the printed name]+scroll{".
After printing the name of a room which is autolinked  when hack_hooked is true, say "}".


Chapter - Scrolling

Scrolling is an action applying to one visible thing.

Understand "scroll [any room]" as scrolling.
Understand "scroll [any thing]" as scrolling.
Understand "scroll [any direction]" as going.

Understand "scroll to [any room]" as scrolling.
Understand "scroll to [any thing]" as scrolling.
Understand "scroll to [any direction]" as going.

Carry out scrolling:
	let the destination be the noun;
	if the noun is a thing:
		let the destination be the location of the noun;
	otherwise if the location is the destination:
		say "[italic type]->Guck[roman type].";
		try looking;
	let the way be the best route from the location to the destination, using doors;
	while the way is not nothing:
		let steps be the number of moves from location to destination, using doors;
		say "[italic type]->[way]. Scrolle von [location], [steps] Seiten übrig.[roman type]";
		try going the way;
		let the way be the best route from the location to the destination, using doors;
	if the location is the destination:
		if the noun is a thing:
			say "[italic type]->Untersuche [the noun][roman type].";
			try examining the noun;
			if the noun is a person:
				say "Vorschläge: noch keine.";
			otherwise:
				if the noun is carried:
					say "In deinem Besitz.[line break]";
					say "Vorschläge: leg [the noun].";
				otherwise:
					say "Vorschläge: nimm [the noun].";
	otherwise:
		say "Es gibt keinen einfachen Weg nach [the noun]."


Chapter - Exitlister

A room can be obscure or  obvious.

After looking:
	say "[bold type]Nebenan:[roman type] ";
	repeat with direction running through directions:
		let over-there be the room direction from the location;
		if over-there is a room:
			if over-there is obvious or over-there is visited:
				say "im [bold type][Direction][roman type] [bold type][the over-there][roman type], ";
			otherwise:
				say "[bold type][Direction][roman type] irgendwohin, ";


Chapter - Editing

Editing is an action applying to one visible object.
Understand "edit [any thing]" as Editing.
Understand "edit [any room]" as Editing.

Carry out Editing:
	say "/edit [Der noun]."


Chapter - Grammatik, Umlaute

An object can be gerx or inform7.
An object can be selbstformatierend or autoformatierend.
An object can be selbstumlautend or autoumlautend.
An object can be selbstattributiert or autoattributiert.

Rule for printing the name of an object:
	let d be an indexed text;
	let d be "[printed name]";
	if gerx:
		if autoformatierend:
			if autoumlautend:
				replace the regular expression "ae" in d with "ä";
				replace the regular expression "oe" in d with "ö";
				replace the regular expression "ue" in d with "ü";
				replace the regular expression "Ae" in d with "Ä";
				replace the regular expression "Oe" in d with "Ö";
				replace the regular expression "Ue" in d with "Ü";
			if autoattributiert:
				replace the regular expression "e " in d with "[^] ";
	say "[d]";


Chapter - Bequeme Richtungen

The navigation is an object. The navigation can be by thumb or by compass.

Global directions is an action applying to nothing.
Understand "Kompass" and "Kom" as global directions.
Carry out global directions:
	Now the navigation is by compass;
	Now the printed name of north is "Norden[-s]";
	Now The printed name of northeast is "Nordosten[-s]";
	Now The printed name of northwest is "Nordwesten[-s]";
	Now The printed name of south is "Süden[-s]";
	Now The printed name of southeast is "Südosten[-s]";
	Now The printed name of southwest is "Südwesten[-s]";
	Now The printed name of east is "Osten[-s]";
	Now The printed name of west is "Westen[-s]";
	try looking;
	say "Du denkst in Himmelsrichtungen. [North] usw.";

local directions is an action applying to nothing.
Understand "Daum" and "Dau" as local directions.
Carry out local directions:
	Now the navigation is by thumb;
	Now the printed name of north is "[']Oben[']";
	Now The printed name of northeast is "[']Oben rechts[']";
	Now The printed name of northwest is "[']Oben links[']";
	Now The printed name of south is "[']Unten[']";
	Now The printed name of southeast is "[']Unten rechts[']";
	Now The printed name of southwest is "[']Unten links[']";
	Now The printed name of east is "[']Rechts[']";
	Now The printed name of west is "[']Links[']";
	try looking;
	say "Du denkst in Richtungen, mit dem Daumen nach Norden. [North] usw.";

understand "'Oben'" as north.
understand "'Unten'" as north.
understand "'Links'" as west.
understand "'Rechts'" as east.
understand "'Oben rechts'" as northeast.
understand "'Unten rechts'" as southeast.
understand "'Oben links'" as northwest.
understand "'Unten links'" as southwest.


Custom_Quixe_Miniext_De ends here.

---- DOCUMENTATION ----

Release along with an interpreter and the source text.

Include German by Team GerX.

The Raeumlichkeit is a room, female, gerx.

The kleine Foeoe is here, gerx. "[The item described] ist [a item described]."

The rote Feuerwehrmann is here, male, gerx, selbstumlautend. "[The item described] ist [a item described]."

The roetliche Feuerwehrmann is here, male, gerx, selbstumlautend. The printed name is "rötliche Feuerwehrmann". "[The item described] ist [a item described]."

The Wurst mit Brot is here, female, gerx, selbstattributiert."[The item described] ist [a item described]."

The Wuerstchen im Broetchen is here, gerx, selbstattributiert. "[The item described] ist [a item described]."

The leckere Broetchen mit Kaese is here, gerx, selbstattributiert. the printed name is "lecker[^] Broetchen mit Kaese". "[The item described] ist [a item described]."

The blau Beerenmarmelade auf Broetchen is here, female, gerx, selbstformatierend. the printed name is "blau[^] Beerenmarmelade auf Brötchen". "[The item described] ist [a item described]."

The Scrollbaer is east of the Raeumlichkeit, male, gerx.

The Baez is here, gerx.


