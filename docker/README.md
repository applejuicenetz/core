# appleJuice Core Docker Container

![](https://github.com/applejuicenetz/core/workflows/docker/badge.svg)

Das initial Passwort lautet: `applejuice`

### Environment Variables

| Variable    | Value (default) | Description |
|-------------|-----------------|-------------|
| `PUID`      | `1000`          | UserID      |
| `PGID`      | `1000`          | GroupID     |
| `CORE_PORT` | `9850`          | P2P Port    |
| `XML_PORT`  | `9851`          | XML Port    |
| `TZ`        | `Europe/Berlin` | TimeZone    |

## Exposed Ports

- Die Ports welche veröffentlicht werden basieren auf `CORE_PORT` und `XML_PORT`, Standardmäßig:

- `9850` - P2P Port
- `9851` - XML Port

## Volumes

Das Volume mit den Konfigurationsdateien befinden sich unter `/config/appleJuice/` und beinhaltet die XML files

## loslegen

erstelle und starte eine Docker Container mit dem Namen `ajcore` mit dem nachfolgenden Bash Befehl:

```bash
docker run -d -it \
        -p 9850-9851:9850-9851 \
        -v ~/appleJuice/:/config/appleJuice/ \
        --memory="2GB" \
        --name ajcore \
        ghcr.io/applejuicenetz/core:latest
```

Beim ersten start wird die [settings.xml](rootfs/app/settings.xml) das `appleJuice` Verzeichnis kopiert, sofern diese noch nicht existiert.

## java memory limit

Der Java Prozess im Container bekommt `98%` des Speichers, welcher der Container selber bekommen hat (neues Feature seit Java8).
Daher ist es sinnvoll, dem Container einen festen Ram Wert zuzuteilen:

```bash
docker update --memory "4GB" ajcore
```

## shared volumes

Um weitere Ordner oder Laufwerk zu sharen, kann man diese beliebig in den Docker Container wie folgt `mounten`, und dann via appleJuice GUI als Freigabe hinzufügen.

z.B.: `-v /mnt/data/movies/:/mnt/data/movies/`

## passwort ändern

- `attach` auf den laufenden `ajcore` Container durchführen: `docker attach ajcore`
- danach `chpw` eingeben, enter drücken, das neue Passwort eingeben, und wieder enter drücken
- `detach` vom `ajcore` Container mittels `Strg`+`p` gefolgt von `Strg`+`q`
