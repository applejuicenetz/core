#!/usr/bin/env bash

set -e

CORE_VERSION="0.31.149.111"

cd $(dirname $0)

rm -rf AJCore.app

mkdir -p AJCore.app/Contents/Java
mkdir -p AJCore.app/Contents/MacOS
mkdir -p AJCore.app/Contents/Resources

cp osx/Info.plist AJCore.app/Contents/
cp osx/application.icns AJCore.app/Contents/Resources
cp osx/splash.png AJCore.app/Contents/Resources
cp osx/universalJavaApplicationStub AJCore.app/Contents/MacOS

curl --fail --silent --location https://github.com/applejuicenet/core/releases/download/${CORE_VERSION}/ajcore.jar -o AJCore.app/Contents/Java/ajcore.jar
curl --fail --silent --location https://github.com/applejuicenet/ajnetmask/releases/download/1.0.0/libajnetmask.jnilib -o AJCore.app/Contents/Java/libajnetmask.jnilib

