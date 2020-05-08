#!/bin/bash

set -e

VERSION=${1:-"0.30.146.1203"}
NAME="core"
IMAGE="applejuicenet/${NAME}:${VERSION}"

docker buildx create --platform linux/amd64 --name ${NAME}
docker buildx use ${NAME}

docker buildx build \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  --build-arg VCS_REF=$(git rev-parse --short HEAD) \
  --build-arg VERSION=${VERSION} \
  --platform linux/amd64 \
  --push \
  --file java5.Dockerfile ./ \
  -t ${IMAGE}

docker buildx rm ${NAME}
