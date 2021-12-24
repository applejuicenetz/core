# Changelog

### 0.31.149.112
- default server auf die .CC Domain umgestellt
- aktuelle Server werden ebenfalls auf die .CC Domain abgerufen 

### 0.31.149.111
- prüfung der eingesetzten JRE Version deaktiviert, so kann der Core auch mit Java Version > 1.8 gestartet werden
 
### 0.31.149.110
- Pflege einer Whitelist für Clienten.
- Gültigkeitsprüfung für Java-Version ab JRE 1.7.x.
 
### 0.31.148.103
- ??? 
 
### 0.30.147.1227
- MaxDownload von 0 Blockt nicht mehr.
- processLink prüft besser auf Ungültigkeit und gibt incorrect Link als Fehlermeldung zurück.
 
### 0.30.146.1203
- LogDateien werden nicht mehr erstellt. Der Fehler wurde gefunden und beseitigt.
- Problem beim Laden von nichtgrünen Teilen behoben (Bug #245, #408)
- Statt des vollen Stacktraces wird nur ein Fehler ausgegeben. (Bug #341)
- Nachladen von Servern über die Serverliste von applejuicenet.de maximal aller 2 minuten.
- Beim Starten eines Downloades werden vorhande Quellen aus aktuellen Suchen mit übernommen (Bug#466)
- es wird nun auf bis zu 5 Servern gleichzeitig gesucht und die Server teilen weitere Server zur weiteren Suche mit.
- Gefundene Quellen über die Textsuche werden bei aktiven Downloads hinzugefügt
- Wenn 100 reelle oder 200 versprochene (vom Server) Ergebnisse vorhanden sind, werden keine neuen Server abgesucht, sondern nur noch die aktuellen fertig abgesucht.
- Ausgabe von Gesamtnachfragen sowie letzte Nachfrage (Zeitpunkt) jeder freigegebenen Datei
- Die Zeichen `..` und `:` dürfen beim Setzen des Targetdirs nicht vorkommen. (Bug #486)
- Informationen zur Lösung von Bug #470 eingebaut.

### 0.30.145.610
- OutOfMemoryBug behoben (Bug #388)
- Anzeige, wieviel der Gegenüber geladen hat. (Bug #124)
- Anzeige seit wann man mit einem Server verbunden ist. (Bug #346)
- Prozessorlastigkeit für Upload und Download um ca. 30 % gesenkt
- `ajfsp://` Links mit Quellenangabe in Form von Domains nun möglich
- Sonderzeichen in Welcomemessage werden korrekt codiert. (Bug #398)
- Bug im HTTP-Server beim Abfragen von mehreren Anfragen pro Verbindung behoben.

Es werden evtl. logdateien im AJCore-Home-Verzeichnis erstellt (`C:\Dokumente und Einstellungen\username\appleJuice` bzw `~/appleJuice`) Das ist das Verzeichnis wo die settings.xml liegt. 

Bitte diese Logdateien mir zusenden, falls Sie da sind. Heißen log123981238.txt. Die Nummer kann sich ändern.

### 0.30.144.522
- IP wird schneller an GUI gesendet (Bug #302) 
- Textsuche verbessert 
- Exception behoben (Bug #290, #236, #232) 
- Beim Exit-Klick aufs Trayicon wird nun nochmals nachgefragt (Bug #280) 
- maximale Anzahl an Leuten in der Uploadliste wird den GUIs angeboten
- 100% CPU-Bug beim Verbinden von Sockets behoben (Bug #340)
- Wenn beim Schreiben von Download Fehler auftreten, wird der Download nun angehalten (Bug #335)
- Partsuche verbessert (Bug #106)
- neue Optionen für Core: `--configinjardir` bzw. `-c`: Speicherort für Settings etc. liegt nicht im Homedir sondern im Verzeichnis wo die Jar liegt.
- Fehler beim Laden von Partfiles behoben, wenn diese Defekt sind.
- Core versucht sich selbst Server nach zu laden über die Webseite, wenn er keinen findet wo er drauf kann. (Bug #133)
- Bug beim Löschen von Quellen wenn Datei fertig oder abgebrochen ist behoben. (Bug #316)
- Maximale Anzahl an Leuten in der Uploadliste wird angezeigt.
- Welcomemessage wird mit angezeigt. (Bug #35)
- Uploadsystem verbessert. Wenn man auf eine Quelle warten muß, wird derweil nun eine andere vorgezogen und zu der geuploaded.

### 0.30.143.313
- graphische Fehlermeldung wenn Start vom Core schief geht und man mit `--withgui` oder unter Windows ohne Parameter startet

### 0.29.142.229
- Nach Portwechsel keine 30 Minuten Warten mehr bis neuem Serverlogin

### 0.29.141.220
- Icon fehlte, somit ging unter Windows der GUI-Modus nicht.

### 0.29.140.219
- 100 % CPU Bug gefixt (Danke an UP^), war ein fehler in der Uploadlimitierung (Bug #216)
- Exception versucht zu beheben. Bitte um Rückmeldung:
java.lang.NullPointerException
at sun.nio.ch.ServerSocketAdaptor.accept (Unknow Source)
at N.C.allocate.Direct(TRUX)
at N.C.run(TRUX)

Code verändert nach Angaben von JRE Bug 4801882

### 0.29.139.215
- Fixed: Probleme mit nicht konfigurierten ISDN-Treibern behoben
- Improved: Core shared sich selbst
- Improved. Verteilung Quellen unter Clients verbessert

### 0.29.138.213
- Fixed: Vorbelegung von Einstellungen stimmen nicht zu 100% wenn keine settings.xml vorhanden ist
- Fixed: 2 Exception behoben (Bug #205)
- Improved. Verteilung Quellen unter Clients verbessert

### 0.29.137.209
- Fixed: noch Fehler bei 136 <-> 136 Kommunikation

### 0.29.136.209
- Fixed: Handling von indirekten Verbindungen verbessert
- Removed: unnötige Option allowBrowse
- Fixed: verbesserte Auswahl der Parts
- Improved: Subhashs werden nun komprimiert übermittelt
- Improved: Partlisten werden ebenfalls komprmiert übermittelt
- Fixed: Problem mit Diskettenlaufwerk bei my Shares unter Windows (Bug #186, #26)
- Fixed: Problem beim Abbrechen einer Datei bei nicht genügend Plattenplatz (Bug #61)

### 0.29.135.208
- Fixed: evtl. zu frühes Löschen von angeforderten indirekten Verbindungen
- Fixed: Nachrichten an Server wurden teilweise falsch geschickt
- Fixed: Suchanfragen werden nun korrekt beantwortet
- Fixed: Problem mit Subhash beim ersten Laden sowie verbesserte Kontrolle zur Vermeidung von "Missing Subhashs" (Bug #163)
- Fixed: 3 Exceptions (Bug #149, #178, #118)
- Fixed: Datei wird erst versucht zu verschieben, dann versucht zu kopieren und wenn das schief läuft wird versucht dann die kaputte Datei ausm Incoming zu löschen (Bug #183)
- Fixed: Uploadproblem vor allem unter Windows 9x, aber auch anderen Betriebssystem behoben (Bug #31)
- Fixed: Uploadverteilung verbessert (Bug #5)
- Added: "sharecheck" via Core nun möglich (siehe "help") (Bug #78)
- Added: neuer Parameter MaxSourcesPerFile
- Fixed: Part speichern und checken ist nun ein synchronisierter Prozess. Dadurch kann nicht eine andere Quelle die Datei fertigstellen, wenn nicht alle Quellen ihre Parts , die sie geadded haben auch gecheckt haben

### 0.29.134.202
- Bug im Upload behoben

### 0.29.133.201
- Core schließt in GUIModus nun richtig. (Bug #144)
- Wenn genug aktive Quellen vorhanden sind, wird an den serverbelastenden indirekten Verbindungen gespart
- Bug: Wenn man eigenes Limit hatte wurden diese Quellen aller 10 Sekunden als modifiziert marktiert und zur GUI geschickt, obwohl sich am Status evtl. gar nichts geändert hatte.
- Ausgabe der Daten an GUI beschleunigt
- Daten werden optional auch gepackt übermittelt

### 0.29.132.126
- Bug bei Textausgabe behoben (hat im GUI-Modus gehangen)
- Indirekte Verbindungsanfrage verbessert
- doppelte Quellenanfrage beim Server unterbunden
- alte Suchergebnisse / indirekte Anfragen an neuen Server unterbunden

### 0.29.131.122
- Schreiben auf die Festplatte sicherer gemacht. (Daten werden er ist .new geschrieben, dann alte Datei gelöscht und neue umbenannt), bei Parts, Settings, Serverliste, Shareidx, Shareinfo. (Bug #120, Bug #75)
- 2 Exceptions behoben (Bug #34, Bug #89, Bug #25)
- Fehler mit Sonderzeichen & im Incomingdir. (Bug #39)
- Deadlock behoben (Bug #96)
- java.lang.Error behoben (Bug #28)
- Suche nun nicht mehr casesensitive. mehrere Wörter durch Leerzeichen getrennt ergeben eine AND-Suche
- unter Mac wird 1.4.1 nun nicht mehr geblockt (Bug #114)
- Es werden nun immer mind. 10 Server gehalten. (Bug #55)
- Nickname darf definitiv nicht leer sein und am Anfang gibt es eine Zufallsgenerierung des Nicks. (Bug #57)
- "Fehler beim Fertigstellen" kann nun auch bei "fertige downloads entfernen" entfernt werden. (Bug #84)
- Abbrechen verbessert.
- Creditschutz überarbeitet (Bug #122)
- Fehler Indirekte Verbindungen gefixt
- Beim added gibt es nun eine neue Statusmeldung; nicht mehr "nicht genügend Festplattenplatz"
- NullPointerExceptions: neue Logzeile: "socket closed: true / false". Bitte Melden.

### 0.29.130.1231
- Blackdown 1.4.1 + Sun 1.5.0 wird erlaubt

### 0.29.129.1230
- Einstellungsüberprüfung verbessert.
- wenn Nickname mit "nonick" los geht wird der Serverlogin verweigert
- Liegt Temp-Dir unterhalb vom Incoming-Dir oder umgekehrt oder sind beide das gleiche wird der Serverlogin verweigert
- Creditschutz verbessert
- Incomingverzeichnis und Tempverzeichnis wird versucht zu erstellenn wenn es nicht vorhanden ist
- Prüfen das mind. JRE 1.4.2 vorhanden ist. Sonst startet der Core nicht
- Fehler bei der Linkverarbeitung werden ausgegeben
- Suchen wenn man nicht Verbunden ist wird nun geblockt
- Dateinamen werden gefiltert. Zulässige Zeichen sind: `A-z 0-9 . - _`
nicht zulässige Zeichen werden entfernt
- GUI kann nun Core beenden, Downloads umbenennen sowie Zielverzeichnisse ändern
- Wenn kein TCP Port gewählt ist, ist der Zufallsport nun mind. 1024 groß. (nicht root leute können unter Linux keine Ports öffnen, die kleiner 1024 sind) (Bug #6, Danke an Maj0r)
- Probleme beim Suchen gefixt (Bug #12)
- Subhashs herunterladen verbessert

### 0.29.128.1227
- Hashing-Thread hat nun minimale Priorität
- Deadlock behoben (Danke an garnichda)
- eigenes Konsolefenster; abschaltbar mit --nogui bzw. erzwingen mit --withgui als Parameter beim Start (unter Windows standardmäßig aktiv, andere BS inaktiv)
- unter Windows neben Konsolefenster auch Trayicon
- Socketverarbeitung optimiert
- Bei Queuefull wird nun Version des Clients sowie Nick und Dateiname mit angezeigt
- Indirecte Verbindungen, die vom Server abgewiesen werden, werden nun angezeigt und erst nach einer Minute gelöscht
- neue PDF für Dokumentation Core <--> GUI

### 0.29.127.1223
- 2 Deadlocks behoben
- 1 Exception behoben beim Suchen (Danke an Desmo)
- 1 Exception behoben (Danke an Netgrabber)
- Wenn man mehr als 500 Quellen hat (bei einer Datei) wird beim Server nicht mehr nach 30 minuten nochmals neu nachgefragt

### 0.29.126.1220
- Indirekte Verbindungen gefixt. (Upload + Download)
- Search als Filter hinzugefügt. Suchergebnisse und Suchen selbst sind dadurch nicht mehr der Kategorie Informationen zugeordnet
- Fehler beim Limitieren der Downloads behoben  (Danke an Fumpi + Akku)
- Socketoperationen (register) nun neben close und select auch mit synchronisiert

### 0.29.125.1217
- Verbesserung der Erkennung für ungültige Quellen (z.b. sich selbst)
- 1 Deadlock behoben (Danke an Tuxhomer)
- mehr logausgaben für den OutOfMemory-Bug
- Bug beim Abbrechen der Suche behoben
- neue PDF für Dokumentation Core <--> GUI

### 0.29.124.1215
- Deadlock behoben (Danke an fumpi)
- Exception behoben (Danke an whitewindow)

### 0.29.123.1214
- mehr logausgaben für den OutOfMemory-Bug
- Too Many Open Files behoben. (ist nicht auf Linux bezogen, war auch unter Windows möglich)
- Suche stabiler gemacht (bitte beachten: Suche geht nur Java <--> Java)
- Suchen können nun abgebrochen werden

### 0.29.122.1211
- mehr logausgaben für den OutOfMemory-Bug

### 0.29.121.1205
- vorrübergehende Ausgabe des verbrauchten RAMs und Anzahl Downloadverbindungen. (aller 10 Sekunden)
- blaue Teile werden wieder angezeigt in der GUI
- Exception behoben (Danke an Meiner, Fumpi & Co.)

### 0.29.120.1203
- Optimierung des Speicherverhaltens
- Limitierung der Downloadverbindungen. Empfehlung: Maxdownload wahrheitsgemäß angeben

### 0.29.119.1115
- Exception behoben beim Schließen von Sockets (Danke an Paderborner)
- Wenn Fehler beim Fertigstellen der Datei auftritt wird die fehlerhafte File ausm Incoming gelöscht (Danke an Fumpi)
- Dieser Fehler beim Fertigstellen wird auch zur GUI übermittelt. Die fertige Datei muß dann per Hand aus dem Tempverzeichnis (richtiger Dateiname shcon vorhanden) kopiert oder verschoben werden.
- Files die gerade fertig gestellt werden, werden nicht mehr gehasht (Danke an Fumpi)
- Pausieren wenn letztes Stück defekt aufgehoben (Danke an MeineR)
- Speicherverwaltung optimiert (evtl. war das der 0ul0dl; WORKTHREAD DIED = java.lang.outofmemory)

### 0.29.118.1108
- Problem beim Verbinden als Firewalled user behoben.
- Eingebaut bestimmte Exceptions anzuzeigen wegen 0ul0dl. Beim beenden kommt deswegen InterruptedException (beim Shutdown uninteressant)

### 0.29.117.1104
- Fehler beim "alte Verbindungen wegräumen" behoben
- RAM anzeigen verbessert
- ArrayIndexOutOfBoundsException behoben (Danke an Paderborner und Akku)
