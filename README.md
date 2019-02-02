# jjdoc-libs
Javadoc for various libraries in JSON format

This is mainly used by the [PluginBlueprint](https://pluginblueprint.net) Editor.  


## Adding libraries
**If you're not comfortable adding a library yourself, feel free to [open an issue](https://github.com/InventivetalentDev/jjdoc-libs/issues/new?labels=library-request) to simply request it to be added :)**  
  
0. Clone this repo `git clone https://github.com/InventivetalentDev/jjdoc-libs.git`
1. Create a subdirectory in the `/libs` folder with the library's name
2. Add a submodule at `/libs/%library-name%/source` of the library's source code  
```git submodule add https://github.com/someone/something.git libs/%library-name%/source```
3. Create a `generate.sh` file at `/libs/%library-name%/generate.sh`, with the appropriate `LIB_NAME`, `SOURCE_PATH` and `PACKAGES` variables  
```sh
#!/bin/sh

### Change this stuff
LIB_NAME="library-name" ## Name of the library, should be the same as the directory name
SOURCE_PATH="src/main/java" ## Directory of the actual source files
PACKAGES="org.inventivetalent.something" ## Sub-packages to be included

## Don't edit below ##
# cd out to root dir
cd ../..

# cd into scripts
cd scripts/

# run generate with args
chmod +x generate.sh
./generate.sh ${LIB_NAME} ${SOURCE_PATH} ${PACKAGES}

# cd back into lib dir
cd ..
cd libs/${LIB_NAME}

# commit
git add .
git commit -m "Update $LIB_NAME"
```  
4. If you're adding the library to be used with PluginBlueprint, create a `binary.txt` file in the library's directory with a direct link to a binary download of the library
5. [Create a Pull-Request](https://github.com/InventivetalentDev/jjdoc-libs/compare?labels=library-request) with the submodule & generate script and wait for it to be accepted :)
