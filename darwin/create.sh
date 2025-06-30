#!/usr/bin/env bash

# brew install create-dmg

set -e

CORE_VERSION="0.31.149.113"

cd $(dirname "$0")

mkdir -p build

function createRelease() {

  rm -rf build/*

  ARCH="$1"
  BUILD_FOLDER="build/${ARCH}"
  DMG_FILE_NAME="AJCore_${ARCH}.dmg"

  mkdir "${BUILD_FOLDER}"

  mkdir -p "${BUILD_FOLDER}/AJCore.app/Contents/Java"
  mkdir -p "${BUILD_FOLDER}/AJCore.app/Contents/MacOS"
  mkdir -p "${BUILD_FOLDER}/AJCore.app/Contents/Resources"

  cp osx/Info.plist "${BUILD_FOLDER}/AJCore.app/Contents/"
  cp osx/application.icns "${BUILD_FOLDER}/AJCore.app/Contents/Resources"
  cp osx/splash.png "${BUILD_FOLDER}/AJCore.app/Contents/Resources"
  cp osx/universalJavaApplicationStub "${BUILD_FOLDER}/AJCore.app/Contents/MacOS"

  curl --fail --silent --location "https://github.com/applejuicenetz/core/releases/download/${CORE_VERSION}/ajcore.jar" -o "${BUILD_FOLDER}/AJCore.app/Contents/Java/ajcore.jar"
  curl --fail --silent --location "https://github.com/applejuicenetz/ajnetmask/releases/download/1.0.0/libajnetmask-${ARCH}.jnilib" -o "${BUILD_FOLDER}/AJCore.app/Contents/Java/libajnetmask.jnilib"

  rm -f ${DMG_FILE_NAME}

  create-dmg \
    --volname "AJCore ${ARCH}" \
    --volicon "osx/application.icns" \
    --background "osx/.background/background.png" \
    --window-pos 200 120 \
    --window-size 540 350 \
    --icon-size 100 \
    --icon "AJCore.app" 100 190 \
    --hide-extension "AJCore.app" \
    --app-drop-link 400 185 \
    "${DMG_FILE_NAME}" \
    "${BUILD_FOLDER}"
}

createRelease "arm64"

createRelease "x86_64"
