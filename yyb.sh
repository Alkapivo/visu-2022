if (( $# == 0 )); then
    echo Available params
    echo - clean
    echo - install
fi

if [[ "$*" == *clean* ]]
then
    echo Clean target
    rm -rf ./target/*
fi

if [[ "$*" == *install* ]]
then
    mkdir -p ./target
    projectName=$(cat ./yyp-package.json | jq -r '.name')
    echo Start building ${projectName} project
    build=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .build')
    major=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .major')
    minor=$(cat ./yyp/options/windows/options_windows.yy | jq '.option_windows_version | .minor')
    version=${major}.${minor}.${build}
    echo $(rubber -Z ./yyp/${projectName}.yyp ./target/${projectName}_win_${version}.zip)
fi