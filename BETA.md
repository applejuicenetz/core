# Beta Teilnahme

Änderungen sind im [CHANGELOG.md](CHANGELOG.md) zu finden.

## Voraussetzungen

- Discord Teilnahme https://discord.gg/ZufekUQe7Z
- 64bit Betriebssystem
- Beta-Version (pre-release) bei den [releases](https://github.com/applejuicenetz/core/releases) downloaden (Assets aufklappen)

## Windows

- es muss keine extra Java (JRE) Installation vorhanden sein (das setup bringt eine eigene Java Version mit)
- downloade die Datei `AJCore-windows-*.exe`, installiere es und starte danach die `appleJuice Core`
- die reguläre appleJuice Core Installation darf/kann nicht gleichzeitig laufen und/oder installiert sein

## Windows Portable

selber die `ajcore-*.jar` austauschen

## macOS

- es muss keine extra Java (JRE) Installation vorhanden sein (die App hat eine eigene Java Version eingebettet)
- downloade die Datei `AJCore-macos-*.dmg`, installiere es und starte danach die `AJCore`

## Container (Docker, Podman etc)

Ändere das image von `:latest` zu `:beta` in deinem Container Setup, z.B.:

`ghcr.io/applejuicenetz/core:beta`

## Linux (Flatpak)

Die Beta-Version kann über Flatpak genutzt werden. Installation und Einrichtung sind in der
[Flatpak-Anleitung](https://applejuicenetz.github.io/flatpak/) beschrieben.
