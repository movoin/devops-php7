#!/usr/bin/env bash
#
# Usage:
#   build.sh movoin/devops-php7
#

BASE_PATH=$(pwd)
DOCKERFILE_PATH="${BASE_PATH}"

REPO_NAME=$1

echo ""
echo "Building image: '${REPO_NAME}'"
echo ""

######

echo "> Running docker"

echo ""

docker build --no-cache --force-rm -t "${REPO_NAME}" ${DOCKERFILE_PATH}

echo ""

