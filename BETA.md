# Beta Teilnahme

## Voraussetzungen

- Discord Teilnahme https://discord.gg/ZufekUQe7Z
- 64bit Betriebssystem
- Beta-Version (pre-release) bei den [releases](https://github.com/applejuicenetz/core/releases) downloaden (Assets aufklappen)

## Windows

- das reguläre appleJuice Core Setup muss nicht deinstalliert werden
    - auch kein evtl. manuell installiertes Java (JRE)
- es muss keine extra Java (JRE) Installation vorhanden sein (das setup bringt eine eigene Java 21 Version mit)
- downloade die Datei `AJCore.beta.setup.exe`, installiere es und starte danach die `appleJuice Core (Beta)`
    - die reguläre appleJuice Core Installation darf/kann nicht gleichzeitig laufen

## Windows Portable

die Beta funktioniert **noch** nicht mit der Portable Version

## macOS

Verwende das jüngste App Package für den Core und deine Architektur von hier (Version von 2026)
https://applejuicenetz.github.io/downloads/applejuice-macos/

Diese macOS Apps benutzen bereits Java 21, es muss lediglich die `ajcore.jar` im Paket wie folgt ersetzt werden:

rechtsklick auf die `AJCore.app`, klicke `Paketinhalt zeigen`, navigiere zu `Contents/app` und tausche die `ajcore.jar` aus.

## Container (Docker, Podman etc)

Ändere das image von `:latest` zu `:beta` in deinem Container Setup, z.B.:

`ghcr.io/applejuicenetz/core:beta`

## Linux (Flatpak und Snap)

Aktuell nicht möglich da diese Container `readonly` sind und kein überschreiben der `ajcore.jar` erlauben.
