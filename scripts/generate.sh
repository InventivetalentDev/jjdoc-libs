#!/bin/sh

### First "git clone https://github.com/InventivetalentDev/jjdoc-libs.git"
### cd scripts

DOCLET_VERSION="1.0.3"
LIB_NAME=$1
SOURCE_PATH=$2
PACKAGES=$3

print "Generating $LIB_NAME/$SOURCE_PATH"

# Create temp directory & cd into it
mkdir temp
cd temp

# Download the JSON doclet
wget https://github.com/InventivetalentDev/jsondoclet/releases/download/${DOCLET_VERSION}-SNAPSHOT/json-doclet-${DOCLET_VERSION}-SNAPSHOT-jar-with-dependencies.jar

# cd back out of the temp directory
cd ..

# Run Doclet
# - Takes sources from /libs/.../source/... - which should be a submodule of the library's source code
# - Outputs to /libs/.../jjdoc & /libs/.../jjdoc-....json
javadoc -docletpath ./temp/json-doclet-${DOCLET_VERSION}-SNAPSHOT-jar-with-dependencies.jar -doclet org.inventivetalent.jsondoclet.JsonDoclet -indexfile -outdir ../libs/${LIB_NAME}/jjdoc  -singlefile -outfile ../libs/${LIB_NAME}/jjdoc-${LIB_NAME}.json -sourcepath ../libs/${LIB_NAME}/source/${SOURCE_PATH} -public -subpackages $PACKAGES

## Final cleanup
rm -Rf temp

### Then cd ..
### git add jjdoc && git commit && git push
