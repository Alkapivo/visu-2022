///@function runtimeExceptionHandler()
///@description ExceptionHandler.
function runtimeExceptionHandler() {
	
		room_goto(SceneRuntimeException);
	
		var console = getConsole();
		if (instanceExists(console)) {
			var trace = getConsoleTrace(console);
			if (isArray(trace)) {
				global.consoleTrace = cloneArray(trace);	
			}
		}
	
	



}
