# Beta Teilnahme

## Voraussetzungen

- 64bit Betriebssystem
- Beta-Version (SNAPSHOT) von hier downloaden: https://downloads.applejuicenet.cc

### Windows

- deinstalliere etwaig installierte Java Versionen (älter als 21)
- das reguläre appleJuice Core Setup muss nicht deinstalliert werden
- downloade Java 21 von [hier](https://api.adoptium.net/v3/installer/latest/21/ga/windows/x64/jre/hotspot/normal/eclipse?project=jdk) und installiere es
    - im Setup einfach "weiter, weiter, fertig" klicken, es muss nichts angepasst werden
- starte die appleJuice Client Beta `ajcore-0.XX.XX.XX-SNAPSHOT.jar` mit einem einfachen Doppelklick
    - die reguläre appleJuice Core Installation darf nicht gleichzeitig laufen
    - der Ort, von wo die `ajcore-*.jar` gestartet wird, ist egal
    - die Beta `ajcore-*.jar` darf nicht in das alte appleJuice Verzeichnis kopiert werden
    - die Beta `ajcore-*.jar` kann **noch** nicht mit der `ajcore.exe` gestartet werden (dafür aber per Doppelklick auf die `.jar` Datei)

### Windows Portable

die Beta funktioniert **noch** nicht mit der Portable Version

### macOS

Verwende das jüngste App Package für den Core und deine Architektur von hier (Version von 2026)
https://applejuicenetz.github.io/downloads/applejuice-macos/

Diese macOS Apps benutzen bereits Java 21, es muss lediglich die `ajcore.jar` im Paket wie folgt ersetzt werden:

rechtsklick auf die `AJCore.app`, klicke `Paketinhalt zeigen`, navigiere zu `Contents/app` und tausche die `ajcore.jar` aus.

### Container (Docker, Podman etc)

Das jüngste Container-Image von 2026 benutzt bereits Java 21.

Die Beta `ajcore-0.XX.XX.XX-SNAPSHOT.jar` muss als Volume nach `/ajcore.jar` eingebunden (überschrieben) werden, z.B.:

`--volume ~/ajcore-0.XX.XX.XX-SNAPSHOT.jar:/ajcore.jar:ro`

### Linux (Flatpak und Snap)

Aktuell nicht möglich da diese Container `readonly` sind und kein überschreiben der `ajcore.jar` erlauben.
