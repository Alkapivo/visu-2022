if (( $# == 0 )); then
    for folderName in $(ls -d */); 
    do 
        extension=${folderName%%/}
        cd ${extension}
        gulp
        cd ..
        echo 🚀 Deploying ${extension} to YYP
        cp ./${extension}/dist/${extension}-bundle.js ../yyp/extensions/${extension}/${extension}.js
    done
else
    for extensionName in "$@"
    do
        extension=${extensionName}
        cd ${extension}
        gulp
        cd ..
        echo 🚀 Deploying ${extension} to YYP
        cp ./${extension}/dist/${extension}-bundle.js ../yyp/extensions/${extension}/${extension}.js
    done
fi