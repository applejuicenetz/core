# core

Meta-Repository für die appleJuice Core Releases. Die Datei `README.md` im Repository-Root ist deutschsprachige Nutzer-Dokumentation; Build-, Release- und Veröffentlichungsdetails gehören hierher.

## Build- und Release-Pipeline

`core-src` baut, testet, obfuskiert und signiert die JAR. Beim manuellen Start mit `publish_maven: true` veröffentlicht es eine unveränderliche Version wie `de.applejuicenet:ajcore:0.35.185.42` in der Maven Registry dieses Repositories.

`.github/workflows/release.yml` startet bei `registry_package: published`, gefiltert auf das Maven-Paket `de.applejuicenet.ajcore`. Wie im Repository `server` werden unvollständige Veröffentlichungen ignoriert, bis alle sechs Maven-Dateien vorhanden sind. Alternativ lässt sich der Workflow manuell mit einer bereits veröffentlichten Version starten. Er lädt die JAR einmal herunter, prüft SHA-1-Prüfsumme und Main-Klasse und teilt dasselbe Artefakt mit allen Paket-Jobs. Java-Quellcode wird hier weder ausgecheckt noch kompiliert.

Die Paket-Jobs erzeugen macOS-DMGs, Windows-EXEs und Linux-Flatpak-Bundles, jeweils für amd64 und aarch64. Paketierungsressourcen und Windows-Installer-Prüfungen liegen in `assets/`, `flatpak/` und `scripts/`. Paket-Builds erstellen nie einen Release; es gibt kein gemeinsames Sammel-Artefakt, `publish-release` lädt die Einzel-Artefakte (`native-*`, `flatpak-*`, `ajcore-published-<version>`).

Manuelle Läufe verwenden standardmäßig `dry_run: true`: Alle Pakete werden gebaut und als Actions-Artefakte hochgeladen, `publish-release` wird übersprungen. Paket-Events aus der Maven-Veröffentlichung erstellen ebenfalls nie einen Release. Zum Veröffentlichen den manuellen Lauf mit `dry_run: false` starten.

Nur `publish-release` erstellt den Tag `<version>` und den GitHub-Release, und das nur beim manuellen Start mit `dry_run: false`. `prerelease` ist standardmäßig `true`; mit `false` entsteht ein stabiler Release, der zum neuesten Release wird. Der Job veröffentlicht alle sechs Pakete und die originale Maven-JAR. Das Quell-Repository benötigt das Secret `PACKAGE_RW_TOKEN` in seiner Umgebung `mvn-publish`.

Native Installer-Versionen lassen das führende `0.` der vierteiligen Maven-Version weg: `0.35.185.42` wird zu `35.185.42`. Dadurch bleibt die Build-Nummer für Upgrades erhalten, und das dreiteilige Versionsformat von Windows- und macOS-Installern wird erfüllt. Native Major- und Minor-Komponente dürfen 255 nicht überschreiten, die Build-Komponente darf 65535 nicht überschreiten, und die native Major-Komponente muss größer als null sein. Flatpak-Metadaten, Maven-Koordinaten und Release-Tags behalten alle vier Komponenten.

## Docker-Tags und Veröffentlichung

- `latest`: letzter stabiler Core-Release, nicht der neueste Beta-Build.
- `<version>`: explizite stabile Core-Version, zum Beispiel `0.35.185.93`.
- `beta`: zuletzt veröffentlichter Beta-Container.
- `beta-<version>`: explizite Beta-Version.

Docker Hub (`applejuicenetz/core`) und GHCR (`ghcr.io/applejuicenetz/core`) erhalten diese Tags für `linux/amd64` und `linux/arm64`. QNAP Container Station kann diese Images ohne Flatpak verwenden.

Nach erfolgreichem `publish-release` ruft `release.yml` den wiederverwendbaren Workflow `container.yml` mit der veröffentlichten Maven-Version und dem Flag `prerelease` auf. Pre-Releases aktualisieren nur Beta-Tags, stabile Releases nur stabile Tags. Dry-Runs und reine Maven-Veröffentlichungen veröffentlichen nie Container.

Es gibt keinen Zeitplan (Cron). Container entstehen nur durch `release.yml` oder manuell. Die passende JAR muss in der Maven Registry vorhanden sein. Das Dockerfile kopiert die heruntergeladene JAR; Java-Quellcode wird hier nicht kompiliert. Für Basis-Image-Updates `container.yml` manuell starten.

Für manuelle Builds in `container.yml` die Eingaben `version` und `prerelease` setzen. Eine leere Version ermittelt den letzten stabilen GitHub-Release. Manuelle Läufe verwenden standardmäßig `push: false`; zum Veröffentlichen muss Push auf `main` ausdrücklich aktiviert werden. `container_beta.yml` ist ein Wrapper, der denselben Build mit `prerelease: true` aufruft.

Nach dem Pull eines neuen Images bestehende Container neu erstellen und dabei Konfiguration und Daten-Volumes beibehalten. Ein Neustart allein ersetzt das Image nicht.
