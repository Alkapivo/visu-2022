///@function printStackTrace([skip])
///@description Print debug_get_callstack to console output
///@param {Integer} [skip] how many stack skips (ex. don't log exception throwing code)
function printStackTrace() {

		var stackTrace = debug_get_callstack();
		var skip = argument_count > 0 ? argument[0] : 1;
		for (var index = skip; index < getArrayLength(stackTrace); index++) {
			var message = string(stackTrace[index]);
			if (message != "0") {
				message = "\tat " + message;
				addLogToLoggerWriter(message);
				addLogToConsoleStack(getConsole(), message);
				show_debug_message(message);	
			}
		}


}
