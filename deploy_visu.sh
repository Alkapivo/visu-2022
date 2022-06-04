GAME_DIST_HOME=~/projects/devhorizon/visu/dist/web/visu
GAME_WEB_HOME=~/projects/devhorizon/Alkapivo\.github\.io/visu
GAME_PACKAGE="visu"

if [ -f "$GAME_DIST_HOME/$GAME_PACKAGE.js" ]; then

    echo -e "✅ Web package \`$GAME_PACKAGE\` found at \`$GAME_DIST_HOME\`"

    #clear
    echo -e "🗑️  Clear web package"
    rm -rf $GAME_WEB_HOME

    #deploy
    echo -e "🚀 Deploy"
    cp -r $GAME_DIST_HOME $GAME_WEB_HOME  
else
    echo -e "🔥\tWeb package \`$GAME_PACKAGE\` wasn't found at \`$GAME_DIST_HOME\`"
fi

