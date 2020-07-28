# appleJuice Client Setup für Windows

# Wrapper
Die appleJuice Client JAR `ajcore.jar` wird über einen sogenannten Wrapper gestartet, was vieles vereinfacht:

- es müssen keine Verknüpfungen angelegt oder angepasst werden :sunglasses:
- es wird **immer** das **richtige** Java Runtime Environment (JRE) ausgewählt (32/64bit) :exclamation:
- man kann und sollte das installierten JRE in seinem Windows aktuell halten :dizzy:
- die Zuweisung des RAMs mittels `-Xmx` wird einfach über die korrespondierende `.l4j.ini` Datei angepasst :heart_eyes:
- es gibt einen **Splash Screen** für den Core :rocket: 
- 32bit und 64bit werden **parallel** installiert :v:
- startet man die 32/64bit Version ohne installiertes Java 32/64bit, wird man auf das Fehlen hingewiesen (inkl Download Link) :wink:
- es gibt einen Wrapper für den `-c` bzw `--configinjardir` Modus (für den Betrieb auf anderen Laufwerk) :floppy_disk:
- es gibt einen Wrapper für den `--nogui` Modus (zum validieren bei etwaigen Fehlern) :bug:

Die einzelnen Wrapper wurden mit dem Tool [Launch4j](http://launch4j.sourceforge.net) erstellt (siehe `.xml` Dateien).

# Setup

Das Setup wurde mit [InstallForge](https://installforge.net) erstellt.
Die hier im Ordner liegende `.ifp` Datei kann einfach mit `Installforge` geöffnet werden.

Das setup löscht eine etwaig vorhandene `ajnetmask.dll` im `?:\Windows\system32\` Ordner, da diese dort nicht (_mehr_) benötigt wird. :put_litter_in_its_place: 

# Changelog

### 1.4
- Die Datei `?:\Windows\system32\ajnetmask.dll` wird nun auch wirklich gelöscht :wink:
- Englisch als Setup Sprache entfernt

### 1.3
- `noprofile` Starter hinzugefügt (`-c` bzw `--configinjardir`)

### 1.2
- deutsche Fehlermeldungen
- JAVA Download Link auf https://www.java.com/de/download/manual.jsp geändert 

### 1.1
- `nogui` Starter hinzugefügt
 
### 1.0
- first Release
