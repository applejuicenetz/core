# Beta Teilnahme

## Voraussetzungen

- 64bit Betriebssystem
- Beta-Version (SNAPSHOT) bei den [releases](https://github.com/applejuicenetz/core/releases) downloaden (Assets aufklappen)

### Windows

- das reguläre appleJuice Core Setup muss nicht deinstalliert werden
- downloade die Datei `AJCore.beta.setup.exe`, installiere es und starte danach die `appleJuice Core (Beta)`
    - die reguläre appleJuice Core Installation darf nicht gleichzeitig laufen

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
