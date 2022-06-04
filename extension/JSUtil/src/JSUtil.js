const MobileDetect = require('mobile-detect');
const html2canvas = require('html2canvas');

// GameMaker exports
global.jsUtilFBPixelEvent  = gameEventProxy;
global.jsUtilGetCanvasSize = getCanvasSize;
global.jsUtilGetCanvasOffsetX = getCanvasOffsetX;
global.jsUtilGetCanvasOffsetY = getCanvasOffsetY;
global.jsUtilIsFullscreen = isFullscreen;
global.jsUtilIsMobile = isMobile;
global.jsUtilSetCanvasVisibility = setCanvasVisibility
global.jsUtilBootComplete = bootComplete
/**
 * @GMFunctionName jsUtilFBPixelEvent 
 */
function gameEventProxy(gameType, eventName, params) {
    console.debug(getFormattedLog("[JSUtil]", "gameEventProxy", { gameType: gameType, eventName: eventName, params: params }));
    if (!!window["gameEvent"]) {
        gameEvent(gameType, eventName, params);
    } else {
        console.log("gameEvent is not defined");
    }
}

/**
 * @GMFunctionName jsUtilGetCanvasSize 
 * @return {String} response - Stringified JSON: { ?width: Integer, ?height: Integer }
 */
function getCanvasSize() {
    console.debug(getFormattedLog("[JSUtil]", "getCanvasSize"));
    const gmCanvas = document.getElementById("game-canvas-container");
    if (!gmCanvas) {
        console.error(getFormattedLog("[JSUtil] game-canvas-container wasn't found"));
        return "{}";
    } else {
        return JSON.stringify({ width: gmCanvas.offsetWidth, height: gmCanvas.offsetHeight });
    }

}

/**
 * @GMFunctionName jsUtilGetCanvasOffsetX
 * @return {Integer} offsetX
 */
function getCanvasOffsetX() {
    return Math.round(document.getElementById("canvas").getBoundingClientRect().x + window.scrollX);
}

/**
 * @GMFunctionName jsUtilGetCanvasOffsetY
 * @return {Integer} offsetY()
 */
function getCanvasOffsetY() {
    return Math.round(document.getElementById("canvas").getBoundingClientRect().y + window.scrollY);
}

/**
 * @GMFunctionName jsUtilIsFullscreen
 * @return {String} booleanString
 */
function isFullscreen() {
    console.debug(getFormattedLog("[JSUtil]", "isFullscreen"));
    return (!(
            !document.isFullScreen && 
            !document.fullscreenElement && 
            !document.webkitFullscreenElement && 
            !document.mozFullScreenElement && 
            !document.msFullscreenElement)) ? "true" : "false";
}

/**
 * @GMFunctionName jsUtilIsMobile
 */
function isMobile() {
    console.debug(getFormattedLog("[JSUtil]", "isMobile"));
    const mobileDetect = new MobileDetect(window.navigator.userAgent);
    const result = mobileDetect.mobile();
    return result ? result : "undefined";
}

/**
 * @GMFunctionName jsUtilSetCanvasVisibility
 * @param {String} visiblity - booleanString
 */
function setCanvasVisibility(visiblity) {
    console.debug(getFormattedLog("[JSUtil]", "setCanvasVisibility:", visiblity));
    const gmCanvas = document.getElementById("game-canvas-container");
    if (!gmCanvas) {
        console.error(getFormattedLog("[JSUtil] game-canvas-container wasn't found"));
    } else {
        gmCanvas.style.visiblity = visiblity == "true" ? "visible" : "hidden";
    }
}

/**
 * @GMFunctionName jsUtilBootComplete
 * @param {String} visiblity - booleanString
 */
function bootComplete() {
    console.debug(getFormattedLog("[JSUtil]", "bootComplete"));

    const INVISIBLE_CSS_CLASS = "invisible";
    const LOADING_CSS_CLASS = "pending";
    
    try {
        document.getElementById("play-button").classList.remove(LOADING_CSS_CLASS);
        document.getElementById("play-button").disabled = false;
        document.getElementById("section-game-container").classList.remove(INVISIBLE_CSS_CLASS);
        document.getElementById("section-info-container").classList.add(INVISIBLE_CSS_CLASS);
    } catch (exception) {
        console.error(exception);
    }
    

    return "boot complete";
}

function getFormattedLog(...log) {
    const tempDate = new Date().toISOString().split("T")
    const date = `${tempDate[0]} ${tempDate[1].split(".")[0]}`
    
    return date + " " + "INFO    " + log.join(" ");
}