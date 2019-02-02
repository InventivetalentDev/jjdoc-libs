#!/bin/sh

LIB_NAME=$1

git pull
git submodule update --recursive --remote
cd libs/${LIB_NAME}
chmod +x generate.sh
./generate.sh
## Generation
cd ..
git push