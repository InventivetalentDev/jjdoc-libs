#!/bin/sh

LIB_NAME=$1

git pull
cd libs/${LIB_NAME}
chmod +x generate.sh
./generate.sh
## Generation
cd ..
git push