# appleJuice Core Docker Container

![](https://github.com/applejuicenetz/core/workflows/docker/badge.svg)
![](https://img.shields.io/docker/pulls/applejuicenetz/core)
![](https://img.shields.io/docker/image-size/applejuicenetz/core)

Das initial Passwort lautet: `applejuice`

### Environment Variables

| Variable    | Value (default) | Description |
|-------------|-----------------|-------------|
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
(Volumes Pfade sowie UID/GID sind zwingend anzupassen)

```bash
docker run -d -it \
        -p 9850:9850 \
        -p 9851:9851 \
        --volume ~/appleJuice/:/config/appleJuice/ \
        --volume /Volumes/Volume1/Video/:/mnt/Video/ \
        --user 1000:1000 \
        --memory="2GB" \
        --name ajcore \
        ghcr.io/applejuicenetz/core:latest
```

oder als `compose.yml`:

```yaml
service:
  ajcore:
    image: ghcr.io/applejuicenetz/core:latest # oder :beta
    container_name: ajcore
    pull_policy: always
    restart: unless-stopped
    user: 1000:1000 # UID:GID
    tty: true
    stdin_open: true
    network_mode: bridge # oder host, wenn keine credits gutgeschrieben werden
    deploy:
      resources:
        limits:
          cpu: "0.5" # 50% von 1 CPU-Kern
          memory: "2GB"
    ports:
      - "9850:9850/tcp" # tcp port, muss mit CORE_PORT übereinstimmen
      - "9851:9851/tcp" # xml api port, muss mit XML_PORT übereinstimmen
    volumes:
      - /apps/appleJuice/:/config/appleJuice/
      - /Volumes/Volume1/Video/:/mnt/Video/
    environment:
      - JAVA_TOOL_OPTIONS: "-Duser.language=de -Duser.country=DE" # Zeitstempel im 24h Format
      - TZ: "Europe/Berlin"
      - CORE_PORT: 9850
      - XML_PORT: 9851
```

Beim ersten start wird die [settings.xml](rootfs/app/settings.xml) das `appleJuice` Verzeichnis kopiert, sofern diese noch nicht existiert.

## shared volumes

Um weitere Ordner oder Laufwerk zu sharen, kann man diese beliebig in den Docker Container wie folgt `mounten`, und dann via appleJuice GUI als Freigabe hinzufügen.

z.B.: `-v /mnt/data/movies/:/mnt/data/movies/`

## passwort ändern

- `attach` auf den laufenden `ajcore` Container durchführen: `docker attach ajcore`
- danach `chpw` eingeben, enter drücken, das neue Passwort eingeben, und wieder enter drücken
- `detach` vom `ajcore` Container mittels `Strg`+`p` gefolgt von `Strg`+`q`
