#!/bin/sh

LIB_NAME="VaultAPI"
SOURCE_PATH="src/main/java"
PACKAGES="net.milkbowl.vault"
EXCLUDE=":"

# cd out to root dir
cd ../..

# cd into scripts
cd scripts/

# run generate with args
chmod +x generate.sh
./generate.sh ${LIB_NAME} ${SOURCE_PATH} ${PACKAGES} ${EXCLUDE}

# cd back into lib dir
cd ..
cd libs/${LIB_NAME}

# commit
git add .
git commit -m "[skip ci] Update $LIB_NAME"
