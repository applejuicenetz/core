# Snap Package Development Anleitung mit Snapcraft und Multipass

## Multipass installieren und eine VM für Snapcraft erstellen

### macOS Installation

```shell
brew install --cask multipass
```

## Multipass starten und eine appleJuice DEV-VM für Snapcraft erstellen

```shell
multipass launch --name applejuice-dev --cpus 2 --memory 4G --disk 20G
```

## Mounten des appleJuiceNETZ Projekt Verzeichnisses in die VM

```shell
multipass mount ../ applejuice-dev:/home/ubuntu/applejuice
```

## Verbinden mit der VM

```shell
multipass shell applejuice-dev
```

## In der VM: Snapcraft installieren

```shell
sudo snap install snapcraft --classic
```

## In der VM: Zum gewünschten Projekt Verzeichnis wechseln

```shell
# cd ./applejuice/gui-java/
# cd ./applejuice/collector/
cd ./applejuice/core/
```

## snap bauen (nicht im ./snap/ Ordner aufrufen, sondern darüber)

```shell
snapcraft
```
