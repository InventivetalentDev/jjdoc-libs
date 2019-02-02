#!/bin/sh

git pull --recurse-submodules
git submodule update --init --recursive --remote
cd libs

for d in */ ; do
    echo "cd $d"
    cd $d;
    chmod +x generate.sh
    ./generate.sh
    ## Generation
    cd ..
done

git push