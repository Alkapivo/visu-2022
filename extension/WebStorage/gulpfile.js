const fs = require("fs");
const { series } = require("gulp");
const execSync = require('child_process').execSync;

function browserify(callback) {
    if (!fs.existsSync("./dist")){
        fs.mkdirSync("./dist");
    }
    execSync('browserify ./src/WebStorage.js -s JSUtil > ./dist/WebStorage-bundle.js');
    callback();
}

function appendGMBinding(callback) {
    const gmBinding = JSON.parse(fs.readFileSync("./GMBinding.json").toString());
    gmBinding.forEach(fun => {
        console.log(`↪️ Export function ${fun.functionName}`);
        fs.appendFileSync("./dist/WebStorage-bundle.js", createBindingString(fun));
    });
    callback();
}

function createBindingString(fun) {
    return `function ${fun.functionName}(${fun.functionArguments.join(", ")}) {\n` +
        `   return global.${fun.functionName}(${fun.functionArguments.join(", ")});\n` +
        `}\n`;
}

exports.default = series(browserify, appendGMBinding);