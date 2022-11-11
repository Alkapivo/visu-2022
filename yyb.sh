#!/bin/bash
GAME_DIST_HOME=~/projects/devhorizon/visu-project/visu/dist/web/resources/visu/aiobahn/resonance
GAME_WEB_HOME=~/projects/devhorizon/visu-project/visu-web/resources/visu/aiobahn/resonance
GAME_NAME=$(cat ./yyp-package.json | jq -r '.name')

if (( $# == 0 )); then
    echo Available params:
    echo -e "    clear"
    echo -e "    build"
    echo -e "    deploy"
fi

if [[ "$*" == *clear* ]]; then
    echo -e "🚨\tClear windows package"
    GAME_NAME=$(cat ./yyp-package.json | jq -r '.name')
    rm -rf ./dist/windows/${GAME_NAME}_win_*.zip
fi

if [[ "$*" == *build* ]]; then
    mkdir -p ./dist/android
    mkdir -p ./dist/macos
    mkdir -p ./dist/ubuntu
    mkdir -p ./dist/web
    mkdir -p ./dist/windows
    GAME_NAME=$(cat ./yyp-package.json | jq -r '.name')
    echo Start building ${GAME_NAME} project
    build=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .build')
    major=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .major')
    minor=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .minor')
    version=${major}.${minor}.${build}
    echo $(rubber -Z ./yyp/${GAME_NAME}.yyp ./dist/windows/${GAME_NAME}_win_${version}.zip)
fi

if [[ "$*" == *deploy* ]]; then
    if [ -f "$GAME_DIST_HOME/$GAME_NAME.js" ]; then

        echo -e "✅    Web package \`$GAME_NAME\` found at \`$GAME_DIST_HOME\`"

        echo -e "🚨    Clear web package"
        rm -rf $GAME_WEB_HOME

        echo -e "🚀    Deploy"
        cp -r $GAME_DIST_HOME $GAME_WEB_HOME  
    else
        echo -e "🔥\tWeb package \`$GAME_NAME\` wasn't found at \`$GAME_DIST_HOME\`"
    fi
fi
