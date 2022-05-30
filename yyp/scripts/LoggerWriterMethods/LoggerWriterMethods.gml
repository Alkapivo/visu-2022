///@export addLogToLoggerWriter(String)
///@export createLogFile(String)
///@export deleteOldLogs(LoggerWriter)
///@export writeLogsToLogFile(LoggerWriter)
///@export createLoggerWriter(Layer)
///@export getLoggerWriter(): ?LoggerWriter

///@param {String} log
function addLogToLoggerWriter(log) {

	pushQueue(getLoggerQueue(), log);
}

///@description Create new log file, returns reference to File.
///@param {String} path
function createLogFile(path) {
	
	var filename = string(current_year) +
		+ string(string_replace(string_format(current_month, 2, 0), " ", "0")) +
		+ string(string_replace(string_format(current_day, 2, 0), " ", "0")) +
		+ string(string_replace(string_format(current_hour, 2, 0), " ", "0")) +
		+ string(string_replace(string_format(current_minute, 2, 0), " ", "0")) +
		+ string(string_replace(string_format(current_second, 2, 0), " ", "0")) + "_game.log";
	global.loggerWriterFilename = string(path) + string(filename);
	
	if (isHtml5()) {
		
		///@todo
	} else {
		
		var writerFile = file_text_open_write(global.loggerWriterFilename);
		file_text_close(writerFile);
	}
}

///@description Wrapper for invoiking LoggerWriter event
///@param {LoggerWriter} loggerWriter
function deleteOldLogs(loggerWriter) {

	with (loggerWriter) {
		
		event_user(1);
	}
}

///@description Write logs from LoggerWriter stack to LoggerWriter log file
///@param {LoggerWriter} loggerWriter
function writeLogsToLogFile(loggerWriter) {
	
	with (loggerWriter) {
		
		event_user(0);
	}
}

///@param {Layer} [layerId]
///@return {LoggerWriter} loggerWriter
function createLoggerWriter() {

	var class = LoggerWriter;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "LoggerWriter", instanceLayer);
	
	return instance;
}

///@description Getter for LoggerWriter. Returns null if loggerWriter wasn't created.
///@return {LoggerWriter} loggerWriter.
function getLoggerWriter() {

	return global.loggerWriterContext;
}