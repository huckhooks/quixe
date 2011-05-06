Version 1/110316 of German First Person Messages by Team GerX begins here.

"Diese Erweiterung gibt alle Meldungen aus GerX in der ersten Person (der Ich-Form) aus."

Part - Standardmeldungen in der ersten Person augeben (for the use with German by Team GerX)

Chapter - I7-Code

Section - Neue I7-Rules

To set the/-- first person low strings: (- SetFirstPersonLowStrings(); -).
	
When play begins (this is the set first person low strings rule): set the first person low strings.


Section - Ersetzte I7-Rules

The first person block vaguely communicating rule is listed instead of the block vaguely communicating rule in the check vaguely communicating rulebook.

Check vaguely communicating (this is the first person block vaguely communicating rule):
	say "Bitte gib auch an, was ich sagen oder fragen soll."
	
The first person block thinking about it rule is listed instead of the block thinking about it rule in the check thinking about it rulebook.

Check thinking about it (this is the first person block thinking about it rule):
	say "Mir fällt jetzt nichts dazu ein.".


The First Person German-you-can-also-see rule is listed instead of the German-you-can-also-see rule in the for printing the locale description rulebook.

For printing the locale description (this is the First Person German-you-can-also-see rule):
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		[say "[notable-object entry] - [locale description priority entry].";]
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity:
				if the domain is a room:
					if the domain is the location, say "Ich sehe hier ";
					otherwise say "In [dem domain] sehe ich ";
				otherwise if the domain is a supporter:
					say "Auf [dem domain] sehe ich ";
				otherwise if the domain is an animal:
					say "Auf [dem domain] sehe ich ";
				otherwise:
					say "In [dem domain] sehe ich ";
				say "[if the locale paragraph count is greater than 0]au[ß]erdem [end if]";
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing:
					list the contents of the common holder with accusative, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
				otherwise:
					say "[a list of marked for listing things with accusative including contents]";
				say ".[paragraph break]";
				write the sublists; [ Non-nested lists ]
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.
	
	
Section - Änderungen an GDM (for use with German Default Messages by Team GerX)

To decide which text is first person (quoted word - a snippet) posture:
	if the quoted word matches "stell" or the quoted word matches "steh", decide on "stelle mich";
	if the quoted word matches "sitz" or the quoted word matches "setz", decide on "setze mich";
	if the quoted word matches "lieg" or the quoted word matches "leg", decide on "lege mich";
	otherwise decide on "steige".
	
	
Section - Final Question

The first person print the final question rule is listed instead of
the print the final question rule in before handling the final question.

This is the first person print the final question rule:
	let named options count be 0;
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	if the capitalised Du option is active or the capitalized Du option is active:
		say "Möchtest Du ";
	otherwise:
		say "Möchtest du ";
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry:
					say final question wording entry;
					decrease named options count by 1;
					if the named options count is 0:
						say "?[line break]";
					otherwise if the named options count is 1:
						[if the serial comma option is active, say ",";]
						say " oder ";
					otherwise:
						say ", ".


Chapter - I6-Code - unindexed
	
Section - I6 Low Strings

Include (-
[ SetFirstPersonLowStrings;
	string 20 "ich";
    string 21 "mir";
    string 22 "mich";
    string 23 "mein";
    string 24 "meine";
    string 25 "meines";
    string 26 "meiner";
    string 27 "meinem";
    string 28 "meinen";
];
-)

Section - Geänderte Standardmeldungen

Include (-
[ LanguageLM n x1 x2;
  say__p = 1;
  Answer, Ask:
            "Keine Antwort.";
! Ask:      see Answer
  Attack:   "Gewalt ist keine Lösung.";
  Burn:     "Das ist gefährlich und wenig sinnvoll.";
  Buy:      "Hier gibt es nichts zu kaufen.";
  Climb:    "Damit werde ich nichts erreichen.";
  Close: switch (n) {
    1:  "Ich kann ", (den) x1, " nicht schlie@30en.";
    2:  print_ret (GDer) x1, " ", (ist) x1, " bereits geschlossen.";
    3:  "Ich schlie@30e ", (den) x1, ".";
    4:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, ".^";
    5:  print (GDer) x1, " schlie@30", (___t) x1, " sich.^";
    }
  Consult:  switch (n) {
        1:  "In ", (dem) x1, " finde ich nichts Interessantes darüber.";
        2:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " sich ", (den) x1, " an.^";
    }
  Cut:      "Es bringt nichts, ", (den) x1, " zu zerschneiden.";
  Disrobe: switch (n) {
        1:  "Ich trage ", (den) x1, " gar nicht.";
        2:  "Ich ziehe ", (den) x1, " aus.";
        3:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, " aus.^";
    }
  Dress: switch (n) {
        1:  "Ich lasse ", (den) x1, " besser wie ", (er) x1, " ", (ist) x1, ".";
        2:  "Das ist nicht nötig.";
        3:  print_ret (GDer) actor, " möcht", (___e) actor,
                " gerne bleiben wie ", (er) actor, " ", (ist) actor, ".";
        4:  print_ret (GDer) actor, "möcht", (___e) actor, " ",
                (den) x1, " nicht anziehen.";
    }
  Drink:    "Das kann man nicht trinken.";
  Drop: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " bereits hier.";
        2:  "Ich habe ", (den) x1, " gar nicht.";
        3:  print "(Dazu ziehe ich ", (den) x1, " erst aus.)^";
            say__p = 0; return;
        4:  "In Ordnung.";
        5:  "Es ist kein Platz mehr auf ", (dem) x1, ".";
        6:  "Es ist kein Platz mehr in ", (dem) x1, ".";
        7:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1, " hin.^";
    }
  Eat: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " nicht e@31bar.";
        2:  "Ich esse ", (den) x1, ". Nicht schlecht.";
        3:  print (GDer) actor, " "; plur("essen", "i@31t", actor);
            print " ", (den) x1, ".^";
    }
  Enter: switch (n) {
        1:  print "Aber ich bin doch schon ";
            if (x1 has supporter) print "auf "; else print "in ";
            print_ret (dem) x1, ".";
        2:  print "Ich kann ";
            switch (verb_word) {
              'stell', 'steh':  print_ret (ParsedAuf) x1, " ", (dem) x1, " nicht stehen.";
              'sitz', 'setz':   print_ret (ParsedAuf) x1, " ", (dem) x1, " nicht sitzen.";
              'lieg', 'leg':    print_ret (ParsedAuf) x1, " ", (dem) x1,  " nicht liegen.";
              default:          print_ret (den) x1, " nicht betreten.";
            }
        3:  "Ich kann nicht in ", (den) x1, " wenn ", (er) x1,
            " geschlossen ", (ist) x1, ".";
        4:  "Ich kann nur frei stehende Dinge betreten.";
        5:  switch (verb_word) {
              'stell', 'steh':  print "Ich stelle mich ";
              'sitz', 'setz':   print "Ich setze mich ";
              'lieg', 'leg':    print "Ich lege mich ";
              default:          print "Ich steige ";
            }
            print_ret (auf) x1, " ", (den) x1, ".";
        6:  print "(Dazu steige ich erst ", (von) x1, " ", (dem) x1, ".)^";
            say__p = 0; return;
        7:  if (x1 has supporter || x1 has container)
                print "(Ich steige zuerst ", (auf) x1, " ", (den) x1, ".)";
            "(Ich betrete zuerst ", (den) x1, ".)";
        8:  print (GDer) actor, " "; plur("betreten", "betritt", actor);
            print " ", (den) x1, ".^";
        9:  print (GDer) actor, " steig", (___t) actor, " ", (auf) x1, " ", (den) x1, ".^";

    }
  Examine: switch (n) {
        1:  "Es ist dunkel hier.";
        2:  "Ich sehe nichts Besonderes an ", (dem) x1, ".";
        3:  print (GDer) x1, " ", (ist) x1, " im Moment ";
            if (x1 has on) "an."; else "aus.";
        4:  print (GDer) actor, " betrachte", (___t) actor, " ", (den) x1, " genau.^";
        5:  "Ich sehe nichts Unerwartetes in dieser Richtung.";
    }
  Exit: switch (n) {
        1:  "Aber ich bin im Moment nirgendwo drin.";
        2:  "Ich kann ", (den) x1, " nicht verlassen, wenn ",
            (er) x1, " geschlossen ", (ist) x1, ".";
        3:  print "Ich ";
            switch (verb_word) {
	            'verlass': "verlasse ", (den) x1, ".";
	            'kletter':       print "klettere ";
	            'tritt', 'tret': print "trete ";
	            default:         print "steige ";
            }
            print_ret (von) x1, " ", (dem) x1, ".";
        4:  "Aber ich bin gar nicht ", (auf) x1, " ", (dem) x1, ".";
        5:  print (GDer) actor, " steig", (___t) actor, " von ", (dem) x1, ".^";
        6:  print (GDer) actor, " steig", (___t) actor, " aus ", (dem) x1, ".^";


    }
  GetOff:   "Aber ich bin gar nicht ", (auf) x1, " ", (dem) x1, ".";
  Give: switch (n) {
        1:  "Ich habe ", (den) x1, " gar nicht.";
        2:  "Jetzt soll ich es mir aber mal richtig geben, was?";
        3:  print (GDer) x1; plur(" scheinen", " scheint", x1);
            " nicht besonders interessiert zu sein.";
        4:  print (GDer) x1, " ";
                print (ist) x1, " nicht";
                " in der Lage etwas anzunehmen.";
        5:  "Ich gebe ", (dem) second, " ", (den) x1, ".";
        6: print (GDer) actor, " "; plur("geben", "gibt", actor);
           print " @21 ", (den) x1, ".^";
        7: print (GDer) actor, " "; plur("geben", "gibt", actor);
           print " ", (dem) second, " ", (den) x1, ".^";


    }
  Go: switch (n) {
        1:  "Das geht nicht, solange ich noch ", (auf) x1, " ",
            (dem) x1, " bin.";
        !2:  print_ret (string) CANTGO__TX;   ! "You can't go that way."
        2: "Ich kann nicht in diese Richtung gehen.";
        !3:  "Ich kann nicht auf ", (den) x1, " klettern.";
        !4:  "Ich kann ", (den) x1, " nicht hinabsteigen.";
        !5:  "Das geht nicht, ", (der) x1, " ", (ist) x1, " im Weg.";
        ! *** 3-5 seit 6E59 gestrichen. ***
        ! *** wir benutzen diese jetzt wieder für die Aktion location-leaving.
        3: "Es gibt hier keine offensichtlichen Ausgänge.";
        4: print "(nach ", (WithoutArt) x1, ")^"; say__p = 0; return;
        5: "Es gibt mehrere Ausgänge. Bitte sage genau, wohin ich gehen soll.";
                6:  print "Das geht nicht, ", (der) x1, " führ", (___t) x1, " nirgendwohin.";

	    7:  "Du mu@31 sagen, in welche Richtung ich gehen soll.";
	    8:  print (GDer) actor, " geh", (___t) actor, " hinauf";
	    9:  print (GDer) actor, " geh", (___t) actor, " hinunter";
	    10: print (GDer) actor, " geh", (___t) actor, " nach ", (WithoutArt) x1;
	    11: print (GDer) actor, " komm", (___t) actor, " von oben herunter";
	    12: print (GDer) actor, " komm", (___t) actor, " von unten herauf";
	    13: print (GDer) actor, " komm", (___t) actor, " von ", (WithoutArt) x1;
	    14: print (GDer) actor, " komm", (___t) actor, " herein";
	    15: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von oben";
	    16: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von unten";
	    17: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von ", (WithoutArt) second;
	    18: print (GDer) actor, " geh", (___t) actor, " durch ", (den) x1;
	    19: print (GDer) actor, " komm", (___t) actor, " von ", (dem) x1;

	    20: print "auf ", (dem) x1;
	    21: print "in ", (dem) x1;
	    22: print ", ", (den) x1, " vor sich her schiebend, und mich dazu";
	    23: print ", ", (den) x1, " vor sich her schiebend";
	    24: print ", ", (den) x1, " aus dem Weg schiebend";
	    25: print ", ", (den) x1, " hineinschiebend";
	    26: print ", mich mitziehend";
	    27: print "(Dazu steige ich erst ", (von) x1, " ", (dem) x1, ".)^";
	        say__p = 0; return;
		28: print "(Ich öffne zuerst ", (den) x1, ".)^"; say__p = 0; return;
    }
  Insert: switch (n) {
        1:  "Ich mu@31 ", (den) x1, " in der Hand halten, um ", (ihn) x1,
            " in etwas anderes legen zu können.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " weder ein Behälter noch eine Ablage.";
        3:  print_ret (GDer) x1, " ", (ist) x1, " geschlossen.";
        4:  "Dazu mu@31 ich ", (den) x1, " erst ausziehen.";
        5:  "Ich kann nichts in sich selbst legen.";
        6:  print "(Ich ziehe ", (den) x1, " erst aus.)^";
            say__p = 0; return;
        7:  "Es ist kein Platz mehr in ", (dem) x1, ".";
        8:  "In Ordnung.";
        9:  print "Ich ";
            switch (verb_word) {
	            'setz':  print "setze";
	            'stell': print "stelle";
	            default: print "lege";
            }
            " ", (den) x1, " ", (auf) second, " ", (den) second, ".";
        10:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1,
                 " ", (auf) second, " ", (den) second, ".^";
    }
  Inv: switch (n) {
        1:  "Ich habe nichts bei mir.";
        2:  print "Ich habe "; short_name_case = Akk;
        3:  print "Folgendes bei mir:^";
        4:  print " bei mir.";
        5:  print (GDer) x1, " durchsuch", (___t) x1, " ";
            if (x1 has pluralname || x1 has female) print "ihre";
            else print "seine"; print " Habe.^";
    }
  Jump:     "Ich springe etwas motivationslos auf der Stelle.";
  Kiss:     "Ich sollte mich besser auf auf das Spiel konzentrieren.";
  Listen:   "Ich höre nichts Unerwartetes.";
  ListMiscellany: switch (n) {
        1:  print " (", (string) LIT__TX, ")";
        2:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " geschlossen ", (ist) x1, ")";
        3:  print " (geschlossen und ", (string) LIT__TX, ")";
        4:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " leer ", (ist) x1, ")";
        5:  print " (leer und ", (string) LIT__TX, ")";
        6:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " geschlossen und leer ", (ist) x1, ")";
        7:  print " (geschlossen, leer und ", (string) LIT__TX, ")";
        8:  print " (", (string) LIT__TX, " und angezogen";
        9:  print " (", (string) LIT__TX;
        10: print " (angezogen";
        11: print " (", (string) LanguageArticles-->(Gender(x1)), " ";
        12: print "offen ", (ist)x1;
        13: print "offen, aber leer ", (ist) x1;
        14: print "geschlossen ", (ist) x1;
        15: print "abgeschlossen ", (ist) x1;
        16: print " und leer ", (ist) x1;
        17: print " (", (string) LanguageArticles-->(Gender(x1)),
                  " leer ", (ist) x1, ")";
        18: print " (", (er) x1; plur(" enthalten ", " enthält ", x1);
        19: print " (darauf ";
        20: print ", darauf ";
        21: print " (darin ";
        22: print ", darin ";
    }
  LMode1:   " ist nun im knappen Modus, in dem Raumbeschreibungen nur beim
              ersten Betreten eines Raums angezeigt werden.";
  LMode2:   " ist nun im ausführlichen Modus, der immer die langen
              Raumbeschreibungen zeigt, auch wenn dieser schon einmal
              besucht wurde.";
  LMode3:   " ist nun im superknappen Modus, der immer nur die kurze
              Raumbeschreibung anzeigt, auch wenn dieser zum ersten Mal
              betreten wird.";
  Lock: switch (n) {
        1:  "Ich kann ", (den) x1, " nicht abschlie@30en.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " schon abgeschlossen.";
        3:  "Ich mu@31 ", (den) x1, " dazu erst zumachen.";
        4:  print (GDer) x1; plur(" passen", " pa@31t", x1); " nicht.";
        5:  "Ich schlie@30e ", (den) x1, " ab.";
        6:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, " ab.^";
    }
  Look: switch (n) {
        1:  print " (auf ", (dem) x1, ")";
        2:  print " (in ", (dem) x1, ")";
        3:  print " (als ", (object) x1, ")";
        4:  print "Auf ", (dem) x1, " ";
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
                          + ISARE_BIT, Nom, 1);
            print "."; if (WriteSublists()==0) "";
        5, 6:
            if (x1 ~= location)
                print (GAuf) x1, " ", (dem) x1, " sehe ich ";
            else print "Ich sehe hier ";
            if (n == 5) print "au@30erdem ";
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
              + WORKFLAG_BIT, Akk, 1);
            print "."; if (WriteSublists()==0) "";

        #ifdef NO_NESTED_LISTS;
        -2: ! -1 wird von Ron Newcombs Default Messages verwendet
            print (GAuf) x1, " ", (dem) x1, " "; ! *** In I7 wird ISARE_BIT ohne " " interpretiert.
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
              + ISARE_BIT, Nom, 1);
              ! Tiefe eins, um die Zeilenumbrüche zu steuern
            print "."; if (WriteSublists()==0) "";
        #endif;

        7:  "Dort sehe ich nichts Au@30ergewöhnliches.";
        8:  print " (", (auf) x1, " ", (dem) x1, ")";
        9:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " sich um.^";
    }
  LookUnder: switch (n) {
        1:  "Aber es ist dunkel.";
        2:  "Ich finde nichts Interessantes.";
        3:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " ", (den) x1, ".^";
    }
  Mild:     "So, so.";
  Miscellany: switch (n) {
        1:  "(Es werden nur die ersten sechzehn Objekte berücksichtigt.)^";
        2:  "Hier gibt es nichts zu tun!";
        3:  print " Ich bin gestorben ";
        4:  print " Ich habe gewonnen ";
        5:  print "^Möchtest du einen NEUSTART, einen vorher gespeicherten
                Spielstand LADEN";
            #Ifdef DEATH_MENTION_UNDO;
            print ", den letzten Zug mit UNDO rückgängig machen";
            #Endif;
            if (TASKS_PROVIDED == 0) print ", @24 Punkte KOMPLETT auflisten";
            if (deadflag == 2 && AMUSING_PROVIDED == 0)
                print ", im NACHWORT über lustige Dinge im Spiel erfahren";
            " oder das Spiel beENDEn?";
        6:  "[Dein Interpreter kann leider keine Spielzüge rückgängig machen.]";
            #Ifdef TARGET_ZCODE;
        7:  "Der Spielzug konnte nicht rückgängig gemacht werden.
             [Nicht alle Interpreter verfügen über diese Funktionalität.]";
            #Ifnot; ! TARGET_GLULX
        7:  "[Ich kann keine weiteren Spielzüge rückgängig machen.]";
            #Endif; ! TARGET_
        8:  "Bitte antworte mit einer der oben genannten Möglichkeiten.";
        9:  "Es ist nun stockfinster hier!";
        10: "Wie bitte?";
        11: "[Erst machen, dann rückgängig machen.]";
        12: "[Es kann leider immer nur ein Zug in Folge rückgängig gemacht werden.]";
        13: "[Der letzte Zug wurde rückgängig gemacht.]";
        14: "Da gibt es leider nichts zu korrigieren.";
        15: "Ich denke mir nichts weiter.";
        16: "Mit ~hoppla~ kann immer nur ein Wort korrigiert werden.";
        17: "Es ist stockfinster, ich sehe nichts.";
        18: print_yourself();
        19: "Gutaussehend wie immer.";
        20: "Wenn ein Befehl wie ~Häschen, hüpf~ wiederholt werden soll, sag
            ~nochmal~, nicht ~Häschen, nochmal~.";
        21: "Das kann man nicht wiederholen.";
        22: "Man kann den Satz nicht mit einem Komma beginnen.";
        23: "Es soll wahrscheinlich jemandem eine Anweisung erteilt werden,
            aber es ist nicht klar wem.";
        24: "Mit ", (dem) x1, " kann man nicht reden.";
        25: "Um mit jemandem zu reden, benutze bitte ~Jemand, hallo~.";
        26: print "(Dazu hebe ich ", (den) x1, " erst auf.)^"; say__p = 0; return;
        27: if (ExplicitError()) return;
            "Diesen Satz habe ich nicht verstanden.";
        28: #IfDef EXPLICIT_ERROR_MESSAGES; if (ExplicitError()) rtrue;
                "Diesen Satz habe ich nicht verstanden.";
            #IfNot;
            print "Ich habe nur Folgendes verstanden: ";
            #Endif;
        29: "Diese Zahl habe ich nicht verstanden.";
        30: if (ExplicitError()) return;
            "So etwas kann ich hier nicht sehen.";
        31: "Es scheint nicht alles gesagt worden zu sein!";
        32: "Aber das habe ich nicht bei mir!";
        33: "Hier kann nur ein Objekt angegeben werden.";
        34: "Man kann in jedem Satz nur einmal Listen von Objekten angeben.";
        35: "Es ist nicht klar, worauf sich ~", (address) pronoun_word,
            "~ bezieht.";
        36: "Es wurde etwas ausgeschlossen, das gar nicht zur Ausgangsmenge gehört!";
        37: "Das kann man nur mit Lebewesen sinnvoll machen.";
        38: if (ExplicitError()) return;
            "Ich habe dieses Verb nicht verstanden.";
        39: "Damit brauche ich mich in diesem Spiel nicht beschäftigen.";
        40: "Ich sehe ~", (address) pronoun_word, "~ (", (den) pronoun_obj,
            ") hier im Moment nicht.";
        41: "Das Satzende wurde leider nicht verstanden.";
        42: if (x1 == 0) print "Nichts "; else print "Nur ", (number) x1;
            ! *** bei 1 "es" mit ausgeben, sonst würde es "Nur ein davon".
            if (x1 == 1) print "es";
            print " davon ";
            if (x1 <= 1) print "steht"; else print "stehen";
            " zur Verfügung.";
        43: "Es gibt hier nichts zu tun!";
        44: if (action==##Drop) "Ich habe aber nichts.";
            if (second) print "Dort"; else print "Hier"; !" ist aber nichts!";
            " ist aber nichts, womit ich das tun kann.";
        45: print "Wen meinst du, ";
        46: print "Was meinst du, ";
        47: "Hier kann nur ein Objekt angegeben werden. Welches?";
        48: PrintWemCommand();
        !49: PrintWomitCommand();
        ! *** der Kontext wird nicht ganz korrekt erkannt, deshalb die neue Variante:
        49: if (action_to_be==##Ask or ##Tell or ##Answer) PrintWemCommand(); else PrintWomitCommand();
        50: print "Du hast gerade ";
            if (x1 > 0) {
                print x1, " Punkt";
                if (x1 ~= 1) print "e";
                print " bekommen";
            } else {
                print -x1, " Punkt";
                if (x1 ~= -1) print "e";
                print " verloren";
            }
        51: "(Da etwas Dramatisches passiert ist, wurde die Liste @26
            Anweisungen nicht komplett ausgeführt.)";
        52: "^Bitte eine Nummer von 1 bis ", x1, " angeben, mit 0 die Anzeige
            auffrischen oder die EINGABETASTE drücken.";
        53: "^[Bitte die LEERTASTE drücken.]";
        54: "[Kommentar notiert.]";
        55: "[Kommentar NICHT notiert.]";
        56: print ".^";
        57: print "?^";
        58: print (GDer) actor, " "; plur("können", "kann", actor);
            print " das nicht tun.^";
        59: "Es mu@31 ein Hauptwort angegeben werden.";
        60: "Es kann kein Hauptwort angegeben werden.";
        61: "Es mu@31 der Namen eines Objekts angegeben werden.";
        62: "Hier kann kein Name eines Objekts angegeben werden.";
        63: "Es mu@31 noch ein zweites Objekt angegeben werden.";
        64: "Hier kann kein zweites Objekt angegeben werden.";
        65: "Es mu@31 ein zweites Hauptwort angegeben werden.";
        66: "Es kann hier kein zweites Hauptwort angegeben werden.";
        67: "Vielleicht sollte ich es mit etwas versuchen, das mehr Substanz hat.";
        68: print "(", (GDer) actor, " "; plur("nehmen", "nimmt", actor);
            print " zuerst ", (den) x1, ".)^";
        69: "(Dazu hebe ich ", (den) x1, " erst auf.)";
        70: "Die Verwendung von UNDO ist in diesem Spiel nicht erlaubt.";
        71: print (string) DARKNESS__TX;
        72: print_ret (GDer) x1, " ", (hat) x1, " Besseres zu tun.";
        73: "Dieses Hauptwort macht in diesem Zusammenhang keinen Sinn.";
        74: print "[", (GDer) x1, " kann keine ans Spiel gerichteten Anweisungen
            ausführen.]^";
        75: print " Ende ";
        76: print " oder ";
        97: print "soll ich";
        98: print "Das Wort ~", (PrintOriginal) wn,
                "~ wurde in diesem Zusammenhang nicht verstanden."; rtrue;
        99: print "Das Spiel kennt das Wort ~", (PrintOriginal) wn, "~ nicht."; rtrue;
    }
  No, Yes:  "Das war eine rhetorische Frage.";
  NotifyOff:
            "Meldungen bei Änderung des Punktestands aus.";
  NotifyOn: "Meldungen bei Änderung des Punktestands ein.";
  Open: switch (n) {
        1:  "Ich kann ", (den) x1, " nicht öffnen.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " offenbar abgeschlossen.";
        3:  print_ret (GDer) x1, " ", (ist) x1, " bereits offen.";
        4:  print "Ich öffne ", (den) x1, " und finde ";
            if (WriteListFromCase(child(x1), ENGLISH_BIT
                + TERSE_BIT + CONCEAL_BIT, Akk) ~= 0) " darin.";
            "nichts.";
        5:  "Ich öffne ", (den) x1, ".";
        6:  print (GDer) actor, " öffne", (___t) actor, " ", (den) x1, ".^";
        7:  print (GDer) x1, " öffne", (___t) x1, " sich.^";
    }
  Pronouns: switch (n) {
        1:  print "Die Pronomen beziehen sich im Moment auf Folgendes:^";
        2:  print ": ";
        3:  print ": nicht gesetzt";
        4:  "Dieses Spiel kennt keine Pronomen. (Schade!)";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " fest.";
        2:  "Ich bin nicht dazu in der Lage.";
        3:  "Nichts passiert.";
        4:  "Das wäre sehr unhöflich.";
        5:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, ".^";
        6:  print (GDer) actor, " schieb", (___t) actor, " ", (den) x1, ".^";
        7:  print (GDer) actor, " dreh", (___t) " ", (den) x1, ".^";
    }
! Push: see Pull
  PushDir: switch (n) {
        1:  print_ret (GDen) x1, " kann ich nicht von einem Ort zum
            anderen schieben.";
        2:  "Das ist keine Richtung.";
        3:  "Nein, in diese Richtung geht das nicht.";
    }
  PutOn: switch (n) {
        1:  "Ich mu@31 ", (den) x1, " in der Hand halten, um ", (ihn) x1,
            " auf etwas anderem ablegen zu können.";
        2:  "Ich kann nichts auf sich selbst ablegen.";
        3:  "Dinge auf ", (den) x1, " zu tun bringt vermutlich nichts.";
        4:  "Mir fehlt die nötige Geschicklichkeit.";
        5:  print "(Ich ziehe ", (den) x1, " erst aus)^"; say__p = 0; return;
        6:  "Es ist kein Platz mehr auf ", (dem) x1, ".";
        7:  "In Ordnung.";
        8:  print "Ich ";
            switch (verb_word) {
	            'setz':  print "setze";
	            'stell': print "stelle";
	            default: print "lege";
            }
            print_ret " ", (den) x1, " auf ", (den) second, ".";
        9:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1,
                " auf ", (den) second, ".^";
    }
  Quit: switch (n) {
        1:  print "Bitte antworte mit Ja oder Nein. ";
        2:  print "Möchtest du das Spiel wirklich beenden? ";
    }
  Remove: switch (n) {
        1:  print_ret (GDer) second, " ", (ist) second, " leider geschlossen.";
        2:  "Aber ", (der) x1, " ", (ist) x1, " gar nicht ", (auf) second, " ",
            (dem) second, ".";
        3:  "In Ordnung.";
    }
  Restart: switch (n) {
        1:  print "Möchtest du wirklich neu starten? ";
        2:  "Fehlgeschlagen.";
    }
  Restore: switch (n) {
        1:  "Laden des Spielstands fehlgeschlagen.";
        2:  "In Ordnung.";
    }
  Rub:      "Ich erreiche dadurch nichts.";
  Save: switch (n) {
        1:  "Der Spielstand konnte nicht abgespeichert werden.";
        2:  "In Ordnung.";
    }
  Score: switch (n) {
        1:  if (deadflag) print "In diesem Spiel "; else print "Bislang ";
            print "habe ich ", score, " von ", MAX_SCORE, " möglichen Punkten in ",
            turns; if (turns ~= 1) print " Zügen"; else print " Zug";
            print " erreicht";
        2:  "In diesem Spiel gibt es keine Punkte.";
        3:  print ", mit dem Rang ";
    }
  ScriptOff: switch (n) {
        1:  "Es wird gar kein Protokoll mitgeschrieben.";
        2:  "^Ende des Protokolls.";
        3:  "Der Versuch, das Protokoll zu schlie@30en, scheiterte.";
    }
  ScriptOn: switch (n) {
        1:  "Es wird bereits ein Protokoll mitgeschrieben.";
        2:  "Es wird nun ein Protokoll angelegt von";
        3:  "Der Versuch, ein Protokoll anzulegen, scheiterte.";
    }
  Search: switch (n) {
        1:  "Aber es ist dunkel.";
        2:  "Auf ", (dem) x1, " ist nichts.";
        3:  print "Auf ", (dem) x1, " sehe ich ";
            WriteListFromCase(child(x1),
                ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT, Akk);
            ".";
        4:  "Ich finde nichts Interessantes.";
        5:  "Ich kann nicht hineinschauen, ", (der) x1, " ", (ist) x1,
            " geschlossen.";
        6:  print_ret (GDer) x1, " ", (ist) x1, " leer.";
        7:  print "In ", (dem) x1, " sehe ich ";
            WriteListFromCase(child(x1), ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT, Akk);
            ".";
        8:  print (GDer) actor, " durchsuch", (___t) actor, " ", (den) x1, ".^";
    }
  SetTo:    "Ich kann ", (den) x1, " nicht auf irgendetwas einstellen.";
  Show: switch (n) {
        1:  "Aber ich habe ", (den) x1, " gar nicht.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " nicht beeindruckt.";
    }
  Sing:     "Ich singe. Nicht sehr schön.";
  Sleep:    "Ich fühle mich nicht müde.";
  Smell:    "Ich rieche nichts Unerwartetes.";
  Sorry:    "Schwamm drüber.";
  Squeeze: switch (n) {
        1:  "Ich la@31 @24 Hände lieber bei mir.";
        2:  "Das bringt nichts.";
        3:  print (GDer) actor, " quetsch", (___t) actor, " ", (den) x1, ".^";
    }
  Strong:   "Das stand so aber nicht in der Musterlösung.";
  Swing:    "Dort gibt es nichts zu schaukeln.";
  SwitchOff: switch (n) {
        1:  "Ich kann ", (den) x1, " nicht ausschalten.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits aus.";
        3:  "Ich schalte ", (den) x1, " aus.";
        4:  print (GDer) actor, " schaltet ", (den) x1, " aus.^";
    }
  SwitchOn: switch (n) {
        1:  "Ich kann ", (den) x1, " nicht einschalten.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits an.";
        3:  "Ich schalte ", (den) x1, " an.";
        4:  print (GDer) actor, " schalte", (___t) actor, " ", (den) x1, " aus.^";
    }
  Take: switch (n) {
        1:  "In Ordnung.";
        2:  "So selbstversessen bin ich nicht.";
        3:  "Das würde ", (dem) x1, " bestimmt nicht gefallen.";
        4:  print "Dazu mü@31te ich zunächst ";
            if (x1 has supporter) print "von "; else print "aus ";
            print (dem) x1; if (x1 has supporter) " herunter."; " heraus.";
        5:  "Ich habe ", (den) x1, " bereits.";
        6:  print_ret (GDer) noun, " gehör", (___t) noun, " offenbar zu ",
                (dem) x1, ".";
        7:  print (GDer) noun, " ", (ist) noun, " offenbar ein Teil ";
            if (x1 has proper) print "von ", (dem) x1;
            else print (des) x1; ".";
        8:  print_ret (GDen) x1, " gibt es hier nicht.";
        9:  print_ret (GDer) x1, " ", (ist) x1, " nicht offen.";
        10: print_ret (GDen) x1, " kann ich nicht mitnehmen.";
        11: print_ret (GDer) x1, " ", (ist) x1, " fest.";
        12: "Ich trage bereits zu viele Dinge.";
        13: print "(Ich verstaue ", (den) x1, " in ", (dem) x2,
            " um Platz zu schaffen.)^"; say__p = 0; return;
        14: "Ich kann nicht in ", (den) x1, " hineingreifen.";
        15: "Ich kann ", (den) x1, " nicht tragen.";
        16: print (GDer) actor, " "; plur("nehmen", "nimmt", actor);
            print " ", (den) x1, ".^";
    }
  Taste:    "Ich schmecke nichts Unerwartetes.";
  Tell: switch (n) {
        1:  "Ich unterhalte mich ein wenig und erzähle mir alte Geschichten.";
        2:  "Keine Antwort.";
    }
  Think:    "Gute Idee!";
  ThrowAt: switch (n) {
        1:  "Witzlos.";
        2:  "Im kritischen Augenblick fehlen mir die Nerven dazu.";
    }
  Tie:  "Dadurch würde ich nichts erreichen.";
  Touch: switch (n) {
        1:  "Ich la@31e @24 Hände besser bei mir!";
        2:  "Ich fühle nichts Unerwartetes.";
        3:  "Wenn es ein mu@30.";
        4:  print (GDer) actor, " berühr", (___t) actor, " sich selbst.^";
        5:  print (GDer) actor, " berühr", (___t) actor, " mich.^";
        6:  print (GDer) actor, " berühr", (___t) actor, " ", (den) x1, ".^";
    }
! Turn: see Pull.
  Undress: switch (n) {
        1:  "Ich lasse ", (den) x1, " besser wie ", (er) x1, " ", (ist) x1, ".";
        2:  "Besser nicht.";
        3:  print (GDer) actor, " möchte";
            if (actor has pluralname) print "n";
            print " gerne bleiben wie ", (er) actor, " ist.^";
        4:  print (GDer) actor, " möcht", (___e) actor, " ",
                (den) x1, " nicht ausziehen.^";
    }
  Unlock:  switch (n) {
        1:  "Ich kann ", (den) x1, " nicht aufschlie@30en.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits aufgeschlossen.";
        3:  print_ret (GDer) x1, " pa@31", (___t) x1, " nicht.";
        4:  "Ich schlie@30e ", (den) x1, " auf.";
        5:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, " auf.^";
    }
  Verify: switch (n) {
        1:  "Die Spieldatei ist intakt.";
        2:  "Die Spieldatei ist korrupt.";
    }
  Wait: switch (n) {
    1:  "Die Zeit verstreicht.";
    2:  print (GDer) actor, " warte", (___t) actor, ".^";
    }
  Wake:     "Die bittere Wahrheit ist: Dies ist kein Traum.";
  WakeOther:"Das ist unnötig.";
  Wave: switch (n) {
    1:  "Ich habe ", (den) x1, " gar nicht.";
    2:  "Es sieht blöd aus, wie ich mit ", (dem) x1, " wedele.";
    3:  print (GDer) actor, " wink", (___t) actor, " mit ", (dem) x1, ".^";
    }
  WaveHands: "Ich winke und fühle mich dabei etwas komisch.";
  Wear: switch (n) {
    1:  "Ich kann ", (den) x1, " nicht anziehen!";
    2:  "Ich habe ", (den) x1, " gar nicht!";
    3:  "Ich trage ", (den) x1, " bereits!";
    4:  "Ich ziehe ", (den) x1, " an.";
    5:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, " an.^";
    }
! Yes:  see No.
];
-) instead of "Long Texts" in "Language.i6t".



Chapter - Neue Meldungen für die eingebauten Erweiterungen


Section - First Person German Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

The first person German can't mount when mounted on an animal rule is listed instead of
the German can't mount when mounted on an animal rule in the check mounting rules.

Check an actor mounting (this is the first person German can't mount when mounted on an animal rule):
	if the actor is carried by a rideable animal (called the steed):
		if the actor is the player, say "Ich reite schon auf [dem steed].";
		stop the action.

The first person German can't mount when mounted on a vehicle rule is listed instead of
the German can't mount when mounted on a vehicle rule in the check mounting rules.

Check an actor mounting (this is the first person German can't mount when mounted on a vehicle rule):
	if the actor is on a rideable vehicle (called the conveyance):
		if the actor is the player, say "Ich fahre schon mit [dem conveyance].";
		stop the action.

The first person German standard report mounting rule is listed instead of
the German standard report mounting rule in the report mounting rules.

Report an actor mounting (this is the first person German standard report mounting rule):
	if the actor is the player:
		say "Ich besteige [den noun].";
		describe locale for the noun;
	otherwise:
		say "[Der actor] besteig[t] [den noun]." instead.

The first person German standard report dismounting rule is listed instead of
the German standard report dismounting rule in the report dismounting rules.

Report an actor dismounting (this is the first person German standard report dismounting rule):
	if the actor is the player:
		say "Ich steige von [dem noun] herunter.[line break][run paragraph on]";
		produce a room description with going spacing conventions;
	otherwise:
		say "[Der actor] steig[t] von [dem noun]."
		
The first person German can't dismount when not mounted rule is listed instead of
the German can't dismount when not mounted rule in the check dismounting rules.

Check an actor dismounting (this is the first person German can't dismount when not mounted rule):
	if the actor is not carried by a rideable animal and the actor is not on a rideable vehicle:
		if the actor is a player, say "Ich bin dazu nicht in der Lage.";
		stop the action.
		

Section - First Person Locksmith (for use with Locksmith by Emily Short)

The German opening doors before entering rule is not listed in any rulebook.

Before going through a closed door (called the blocking door) (this is the first person German opening doors before entering rule):
	if sequential action option is active:
		try opening the blocking door;
	otherwise:
		say "(Ich öffne zuerst [den blocking door].)[command clarification break]";
		silently try opening the blocking door;
	if the blocking door is closed, stop the action.


The German closing doors before locking rule is not listed in any rulebook.

Before locking an open thing (called the door ajar) with something (this is the first person German closing doors before locking rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(Ich schlie[ß]e zuerst [den door ajar].)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.


The German closing doors before locking keylessly rule is not listed in any rulebook.

Before locking keylessly an open thing (called the door ajar) (this is the first person German closing doors before locking keylessly rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(Ich schlie[ß]e zuerst [den door ajar].)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.


The German unlocking before opening rule is not listed in any rulebook.

Before opening a locked thing (called the sealed chest) (this is the first person German unlocking before opening rule):
	if sequential action option is active:
		try unlocking keylessly the sealed chest;
	otherwise:
		say "(Ich schlie[ß]e [den sealed chest] zuerst auf.)[command clarification break]";
		silently try unlocking keylessly the sealed chest;
	if the sealed chest is locked, stop the action.
	

The first person German standard printing key lack rule is listed instead of
the German standard printing key lack rule in the for refusing keys rules.

Rule for refusing keys of something (called locked-thing) (this is the first person German standard printing key lack rule):
	say "Ich habe keinen Schlüssel, der zu [dem locked-thing] passt."
	

The German noun autotaking rule is not listed in any rulebook.

This is the first person German noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the noun;
		otherwise:
			try the person asked trying taking the noun;
	otherwise:
		if the player is the person asked:
			[say "(first taking [the noun])";]
			[vgl. Library-Message ##Miscellany, 26]
			say "(Dazu hebe ich [den noun] erst auf.)";
			silently try taking the noun;
		otherwise:
			try the person asked trying taking the noun.

The German second noun autotaking rule is not listed in any rulebook.

This is the first person German second noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun;
	otherwise:
		if the player is the person asked:
			[say "(first taking [the second noun])";]
			[vgl. Library-Message ##Miscellany, 26]
			say "(Dazu hebe ich [den second noun] erst auf.)";
			silently try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun.


The German must have accessible the noun rule is not listed in any rulebook.

This is the first person German must have accessible the noun rule:
	if the noun is not key-accessible:
		if the noun is on a keychain (called the containing keychain), now the noun is the containing keychain;
		follow the German noun autotaking rule;
	if the noun is not key-accessible:
		if the player is the person asked,
			say "Ohne [den noun] kann ich nichts machen.";
		stop the action;
	make no decision.

The German must have accessible the second noun rule is not listed in any rulebook.

This is the first person German must have accessible the second noun rule:
	if the second noun is not key-accessible:
		if the second noun is on a keychain (called the containing keychain),
			now the second noun is the containing keychain;
		follow the German second noun autotaking rule;
	if the second noun is not key-accessible:
		if the player is the person asked,
			say "Ohne [den second noun] kann ich nichts machen.";
		stop the action;
	make no decision.

German First Person Messages ends here.

---- DOCUMENTATION ----

Die Erweiterung muss *nach* German von Team GerX eingebunden werden. Sie ist kompatibel mit der Érweiterung German Default Messages von Team GerX, mit der die Standardmeldungen nachträglich in einer Tabelle geändert werden können.