#!/bin/sh

LIB_NAME="PacketListenerAPI"
SOURCE_PATH="API/src"

# cd out to root dir
cd ../..

# cd into scripts
cd scripts/

# run generate with args
chmod +x generate.sh
./generate.sh LIB_NAME SOURCE_PATH

# cd back into lib dir
cd ..
cd libs/$LIB_NAME

# commit
git add .
git commit -m "Update $LIB_NAME"
