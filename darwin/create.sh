#!/usr/bin/env bash

set -euo pipefail

CORE_VERSION="0.31.149.113"
CORE_VERSION_SEMVER="031.149.113"
AJNETMASK_VERSION="1.0.0"
APP_NAME="AJCore"

cd "$(dirname "$0")"

mkdir -p build

fetch_jdk() {
  local url

  case $1 in
    x86_64)
      url="https://api.adoptium.net/v3/binary/latest/21/ga/mac/x64/jdk/hotspot/normal/eclipse?project=jdk"
    ;;
    arm64)
      url="https://api.adoptium.net/v3/binary/latest/21/ga/mac/aarch64/jdk/hotspot/normal/eclipse?project=jdk"
    ;;
    *)
      echo "Unsupported architecture: $1" >&2
      return 1
    ;;
  esac

  mkdir -p "$2"

  if [ ! -f "$2/jdk.tar.gz" ]; then
    curl -fsSL "$url" -o "$2/jdk.tar.gz"
  fi

  tar -xzf "$2/jdk.tar.gz" -C "$2"
  JH="$(/usr/bin/find "$2" -maxdepth 1 -type d -name 'jdk-*' | head -n1)"
  echo "$JH/Contents/Home"
}

fetch_jnilib() {
  local arch="$1"
  local out_dir="$2"
  mkdir -p "$out_dir"
  echo "Fetching libajnetmask for $arch into $out_dir"
  curl --fail --silent --location "https://github.com/applejuicenetz/ajnetmask/releases/download/${AJNETMASK_VERSION}/libajnetmask-${arch}.jnilib" --output "${out_dir}/libajnetmask.jnilib"
}

build_arch() {
  local arch="$1"
  local build_root="build/${arch}"
  local stage_dir="${build_root}/stage"
  local input_dir="${stage_dir}/input"
  local app_dir="${stage_dir}/app"
  local dmg_out="${APP_NAME}_${arch}.dmg"
  rm -f "$dmg_out"
  rm -rf "$build_root"
  mkdir -p "$input_dir" "$app_dir"

  # Download main jar
  curl --fail --silent --location "https://github.com/applejuicenetz/core/releases/download/${CORE_VERSION}/ajcore.jar" -o "${input_dir}/ajcore.jar"

  JH="$(fetch_jdk $arch "build/$arch/jdk")"

  echo "Using JDK at $JH"

  # Fetch arch-specific JNI lib
  fetch_jnilib "$arch" "$app_dir"

  cp -f "splash.png" "${stage_dir}/app/splash.png"
  cp -f "Info.plist" "${stage_dir}/Info.plist"

  "${JH}/bin/jpackage" \
    --type dmg \
    --add-modules "java.base,java.desktop,java.instrument" \
    --jlink-options "--strip-native-commands --strip-debug --no-man-pages --no-header-files --compress=zip-9" \
    --name "$APP_NAME" \
    --app-version "$CORE_VERSION_SEMVER" \
    --icon "application.icns" \
    --input "$input_dir" \
    --main-jar ajcore.jar \
    --main-class "de.applejuicenet.client.core.Core" \
    --resource-dir "$stage_dir" \
    --app-content "${stage_dir}/app" \
    --java-options "-splash:\$APPDIR/splash.png" \
    --arguments "--withgui"

  mv "${APP_NAME}-$CORE_VERSION_SEMVER.dmg" "$dmg_out"
}

build_arch "arm64"

build_arch "x86_64"
