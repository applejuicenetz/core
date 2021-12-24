# appleJuice Client für macOS

Die native App kann aktuell leider nur unter macOS gebaut werden.

Platypus installieren https://sveinbjorn.org/platypus und über die Einstellungen das CLI Tool installieren

## neue `AjCore.app` bauen

```bash
/usr/local/bin/platypus \
            --app-icon './icon.icns' \
            --name 'AJCore' \
            --interface-type 'Text Window' \
            --interpreter '/bin/sh' \
            --author 'appleJuiceNET' \
            --app-version '0.31.149.112' \
            --bundle-identifier 'de.applejuicenet.core' \
            --bundled-file '/Volumes/Entwicklung/appleJuiceNET/_stuff/ajnetmask/libajnetmask.jnilib' \
            --bundled-file '/Volumes/Entwicklung/appleJuiceNET/_stuff/ajcore/ajcore-0.31.149.112.jar' \
            --text-foreground-color '#ffffff' \
            --text-background-color '#000000' \
            './starter'
```

### macOS RAM anpassen

Im `Terminal` einmalig folgendes eingeben:

```bash
defaults write de.applejuicenet.core ram 2048
```

Die 2048 durch den gewünschten Wert ersetzen.
