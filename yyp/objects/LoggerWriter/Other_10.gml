///@description Write log to file

	// TODO - move to script
	var loggerQueue = getLoggerQueue();
	if (isHtml5()) {
		clearQueue(loggerQueue);
	} else {
		var file = file_text_open_append(global.loggerWriterFilename);
		var lenght = getQueueSize(loggerQueue);
		for (var index = 0; index < lenght; index++) {
			var log = string(popQueue(loggerQueue));
			log += "\n";
			file_text_write_string(file, log);
		}
		file_text_close(file);
	}