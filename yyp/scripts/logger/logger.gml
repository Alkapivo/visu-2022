///@function logger(message, logType, ...parameters)
///@description Logger
///@param {String} message
///@param {LogType} logType
///@param {[...Object]} [parameters]
function logger() {

	///checkArgumentCount(2, argument_count, logger);

	var message = argument_count > 0 ? argument[0] : "";
	var logType = argument_count > 1 ? argument[1] : null;

	var prefix = null;
	switch(logType) {
		case LogType.INFO:
			prefix = "INFO    ";
			break;
		case LogType.WARNING:
			prefix = "WARNING ";
			break;
		case LogType.ERROR:
			prefix = "ERROR   ";
			break;
		case LogType.DEBUG:
			prefix = "DEBUG   ";
			break;
		case LogType.NETWORK_MESSAGE:
			prefix = "NET_MSG "
			break;
		default:
			prefix = "DEFAULT ";
			break
	}
	
	/*
	if (getCurrentConfig() == Config_PROD) {
		
		if ((logType == LogType.INFO) ||
			(logType == LogType.DEBUG) ||
			(logType == LogType.NETWORK_MESSAGE)) {
		
			return null;
		}
	}
	*/
	
	
	var caller = "";
	try {
			
		caller = getInstanceClassName(this);	
	} catch (exception) {
			
		caller = "Anonymous";
	}
		
	var date = string(current_year) + "-"
			+ string(string_replace(string_format(current_month, 2, 0), " ", "0")) + "-"
			+ string(string_replace(string_format(current_day, 2, 0), " ", "0")) + " "
			+ string(string_replace(string_format(current_hour, 2, 0), " ", "0")) + ":"
			+ string(string_replace(string_format(current_minute, 2, 0), " ", "0")) + ":"
			+ string(string_replace(string_format(current_second, 2, 0), " ", "0"));
	
	if (argument_count > 2) {
		for (var index = 2; index < argument_count; index++) {
			var subString = "{" + string(index - 2) + "}";
			var newString = string(argument[index]); 
			message = string_replace_all(message, subString, newString);
		}
	}
	
	var log = 
		string(date) + " " + 
		string(prefix) + "[" + 
		string(caller) + "] " + 
		string(message);
	
	if (logType != LogType.DEBUG) {
		
		pushQueue(getLoggerQueue(), log);
	}
	
	var console = getConsole();
	if (isOptionalPresent(console)) {
		addLogToConsoleStack(console, log);
	}
	
	print(log);
}
