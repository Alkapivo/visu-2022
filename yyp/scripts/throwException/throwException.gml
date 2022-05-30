///@function throwException(exception, exceptionHandlerParameters)
///@description Set throwedException and execute handler script.
///@param {Exception} exception
///@param {Object[]} [exceptionHandlerParameters]
function throwException() {

		///checkArgumentCount(1, argument_count, throwException);

		var exception = argument[0];
		var exceptionHandlerParameters = argument_count > 1 ? argument[1] : [];

		var exceptionName = getExceptionName(exception);
		var exceptionMessage = getExceptionMessage(exception);
		var exceptionHandler = getExceptionHandler(exception);
	
		clearException();
		global.throwedException = exception;
	
	#region Print message
		var loggerWriter = getLoggerWriter();
		var console = getConsole();
		var message = exceptionMessage == "" ?
			stringParams("{0}", exceptionName) :
			stringParams("{0}: {1}", exceptionName, exceptionMessage);
		show_debug_message(message);
		if (isOptionalPresent(console)) {
		
			addLogToConsoleStack(console, message);	
		}
		if (isOptionalPresent(loggerWriter)) {
		
			addLogToLoggerWriter(message);	
		}
	
	#region Inline printstacktrace (to get longer callstack)
		var stackTrace = debug_get_callstack();
		var skip = 1;
		for (var index = skip; index < getArrayLength(stackTrace); index++) {
		
			var stack = string(stackTrace[index]);
			if (stack != "0") {
			
				stack = "\tat " + stack;
				show_debug_message(stack);	
				if (isOptionalPresent(console)) {
				
					addLogToConsoleStack(console, stack);	
				}
				if (isOptionalPresent(loggerWriter)) {
				
					addLogToLoggerWriter(stack);	
				}
			}
		}
	#endregion
	
		if (isOptionalPresent(loggerWriter)) {
		
			writeLogsToLogFile(loggerWriter);
		}
	#endregion
	
	#region Exception handler
		if (isOptionalPresent(exceptionHandler)) {
		
			runScript(exceptionHandler, exceptionHandlerParameters);	
		}
	#endregion
	
		return null;
	



}
