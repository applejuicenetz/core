#!/usr/bin/env bash

set -e

CORE_VERSION="0.31.149.112"

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

  hdiutil create -fs HFS+ -volname "AJCore ${ARCH}" -srcfolder "${BUILD_FOLDER}" -ov -format UDZO "${DMG_FILE_NAME}"
}

createRelease "arm64"

createRelease "x86_64"
