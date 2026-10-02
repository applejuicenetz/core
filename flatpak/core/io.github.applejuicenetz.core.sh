#!/bin/sh

if [ -e /tmp/ajcore.lock ] && kill -0 "$(cat /tmp/ajcore.lock)" 2>/dev/null; then
  exit 0
fi

JAVA_ARGS="-Djava.net.preferIPv4Stack=true -Dsun.java2d.xrender=false --enable-native-access=ALL-UNNAMED -XX:MaxRAMPercentage=50"

cd /app/share/io.github.applejuicenetz.core/ || exit 1

exec java $JAVA_ARGS -jar /app/share/io.github.applejuicenetz.core/ajcore.jar "$@"
