///@export createConsole(Layer): Console
///@export getConsole(): Console
///@export getConsoleDisplayed(): Boolean
///@export getConsoleHeight(): Integer
///@export addLogToConsoleStack(Console, String)
///@export clearConsoleStack(Console)
///@export dispatchConsoleCommand(ConsoleCommand)
///@export getConsoleTrace(Console)
///@export registerConsoleCommand(String, AssetScript)
///@export setConsoleDisplayed(Boolean)
	
///@param {Layer} [layerId]
///@return {Console} console
function createConsole() {

	var class = Console;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "Console", instanceLayer);
	
	return instance;
}

///@return {Console} console.
function getConsole() {

	return global.consoleContext;
}

///@return {Boolean} isConsoleShown
function getConsoleDisplayed() {

	return getInstanceVariable(getConsole(), "isConsoleDisplayed") == true
}

///@return {Integer} consoleHeight
function getConsoleHeight() {

	return getInstanceVariable(getConsole, "consoleHeight");
}

///@param {Console} console
///@param {String} log
function addLogToConsoleStack(console, log) {

	if (isInstanceTypeOf(console, Console)) {
		
		log = string(log);
	
		if (console.stackPointer >= console.stackSize - 1) {
			
			console.stackPointer = 0;
		} else {
			
			console.stackPointer++;	
		}
	
		console.stack[console.stackPointer] = log;
		console.hasStackChanged = true;
	}
}

///@param {Console} console
function clearConsoleStack(console) {

	console.stack = null;
	console.stack = createArray(console.stackSize, null);
	console.stackPointer = console.stackSize - 1;
	console.hasStackChanged = true;
}

///@param {ConsoleCommand} consoleCommand
function dispatchConsoleCommand(consoleCommand) {
	
	var command = getConsoleCommandName(consoleCommand);
	var parameters = getConsoleCommandParameters(consoleCommand);
	var handler = getFromMap(global.consoleCommands, command);
	
	try {
		
		if (isScript(handler)) {
			
			runScript(handler, parameters);
		} else {
			var log = "Syntax error. Unknown command \"" + command + "\"";
			addLogToConsoleStack(getConsole(), log);
		}
	
	} catch (exception) {
		
		logger("Unable to dispatch consoleCommand", LogType.WARNING);
	}
}

///@param {Console} console
///@return {String[]} trace
function getConsoleTrace(console) {

	if (console.hasStackChanged) {
		var stackPointerNext = console.stackPointer + 1;
		if ((stackPointerNext >= console.stackSize) ||
			(console.stack[console.stackPointer] == null)) {
			array_copy(console.trace, 0, console.stack, 0, console.stackSize);
		} else {
			var lengthLeft = stackPointerNext;
			var lengthRight = console.stackSize - console.stackPointer;
			array_copy(console.trace, 0, console.stack, stackPointerNext, lengthRight);
			array_copy(console.trace, lengthRight - 1, console.stack, 0, lengthLeft);
		}
	}
	
	return console.trace;
}

///@param {String} command
///@param {AssetScript} handler
function registerConsoleCommand(command, handler) {

	logger("Register command \"{0}\"", LogType.INFO, command);
	global.consoleCommands[? command] = handler;
}

///@param {Boolean} enable
function setConsoleDisplayed(enable) {

	setInstanceVariable(getConsole(), "isConsoleDisplayed", enable);
}