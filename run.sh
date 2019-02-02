#!/bin/sh

LIB_NAME=$1

git pull --recurse-submodules
git submodule update --recursive --remote
cd libs/${LIB_NAME}
chmod +x generate.sh
./generate.sh
## Generation
cd ..
git push