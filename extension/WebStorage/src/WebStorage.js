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