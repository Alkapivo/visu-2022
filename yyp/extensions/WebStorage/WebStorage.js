(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.JSUtil = f()}})(function(){var define,module,exports;return (function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
(function (global){
// GameMaker exports
global.webStorageFileExistsOnLocalStorage = fileExistsOnLocalStorage;
global.webStorageFileExistsOnServer = fileExistsOnServer;
global.webStorageLoadFromLocalStorage = loadFromLocalStorage;
global.webStorageLoadFromServer = loadFromServer;
global.webStorageSave = saveInLocalStorage;


/**
 * @GMFunctionName webStorageFileExistsOnLocalStorage
 * @param {String} filepath 
 * @return {String} booleanString - "true" or "false"
 */
function fileExistsOnLocalStorage(filepath) {
    console.debug(getFormattedLog("[WebStorage]", "fileExistsOnLocalStorage:", filepath));
    try {
        const item = localStorage.getItem(filepath);
        return item ? "true" : "false";
    } catch (exception) {
        console.error(exception)
        return "false";
    }
}

/**
 * @GMFunctionName webStorageFileExistsOnServer
 * @param {String} filepath
 * @return {String} booleanString - "true" or "false"
 */
function fileExistsOnServer(filepath) {
    console.debug(getFormattedLog("[WebStorage]", "fileExistsOnServer:", filepath));
    try {
        const xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", filepath, false);
        xmlhttp.send();
        return xmlhttp.status == 200 ? "true" : "false";
    } catch (exception) {
        console.error(exception);
        return "false";
    }
}

/**
 * @GMFunctionName webStorageLoadFromLocalStorage
 * @param {String} filepath 
 * @returns {String} response - Stringified JSON: { status: Integer, ?message: String, ?data: String }
 */
function loadFromLocalStorage(filepath) {
    console.debug(getFormattedLog("[WebStorage]", "loadFromLocalStorage:", filepath));
    try {
        const data = localStorage.getItem(filepath)
        if (!data) {
            throw new Error(`File "${filepath}" couldn't be loaded from localStorage`);
        } else {
            return JSON.stringify({ status: 200, data: data })
        }
    } catch (exception) {
        return JSON.stringify({ status: 403, message: exception.message });
    }
}

/**
 * @GMFunctionName webStorageLoadFromServer
 * @param {String} filepath 
 * @returns {String} response - Stringified JSON: { status: Integer, ?message: String, ?data: String }
 */
function loadFromServer(filepath) {
    console.debug(getFormattedLog("[WebStorage]", "loadFromServer:", filepath));
    try {
        const xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", filepath, false);
        xmlhttp.send();
        if (xmlhttp.status != 200) {
            throw new Error(`File "${filepath}" couldn't be loaded from server`);
        } else {
            return JSON.stringify({ status: xmlhttp.status, data: xmlhttp.responseText });
        }
    } catch (exception) {
        console.error(exception);
        return JSON.stringify({ status: xmlhttp.status, message: exception.message });
    }
}

/**
 * @GMFunctionName webStorageSave
 * @param {String} filepath 
 * @param {String} data 
 * @return {String} response - Stringified JSON: { status: Integer, ?message: String }
 */
function saveInLocalStorage(filepath, data) {
    console.debug(getFormattedLog("[WebStorage]", "saveInLocalStorage:", filepath, "file length:", data.length));
    try {
        localStorage.setItem(filepath, data);
        return JSON.stringify({ status: 200 });
    } catch (exception) {
        console.error(exception);
        return JSON.stringify({ status: 403, message: exception.message });
    }
}

function getFormattedLog(...log) {
    const tempDate = new Date().toISOString().split("T")
    const date = `${tempDate[0]} ${tempDate[1].split(".")[0]}`
    
    return date + " " + "INFO    " + log.join(" ");
}
}).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
},{}]},{},[1])(1)
});
function webStorageFileExistsOnLocalStorage(filepath) {
   return global.webStorageFileExistsOnLocalStorage(filepath);
}
function webStorageFileExistsOnServer(filepath) {
   return global.webStorageFileExistsOnServer(filepath);
}
function webStorageLoadFromLocalStorage(filepath) {
   return global.webStorageLoadFromLocalStorage(filepath);
}
function webStorageLoadFromServer(filepath) {
   return global.webStorageLoadFromServer(filepath);
}
function webStorageSave(filepath, data) {
   return global.webStorageSave(filepath, data);
}
