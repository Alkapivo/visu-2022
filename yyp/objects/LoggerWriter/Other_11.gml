///@description Remove old logs
	
	// TODO - move to script
	if (isHtml5()) {
		// TODO not implemented
	} else {
		var logFiles = createList();
		var logFilename = file_find_first(string(path) + "*.log", 0);
		if (logFilename != "") {
			addToList(logFiles, logFilename);
			logFilename = file_find_next();
			while (logFilename != "") {
				addToList(logFiles, string(logFilename));
				logFilename = file_find_next();		
			}
		}
		file_find_close();
	
		sortList(logFiles, false);
		var logFilesSize = getListSize(logFiles);
		if (logFilesSize > maxLogFiles) {
			logger("Removing old logs. Size {0}", LogType.INFO, logFilesSize - maxLogFiles);
			for (var index = maxLogFiles; index < logFilesSize; index++) {
				var file = logFiles[| index]
				logger("Removing log \"{0}\"", LogType.INFO, file);
				if (file_exists(string(path) + string(file))) {
					file_delete(string(path) + string(file));
				}
			}
		}
		destroyDataStructure(logFiles, List, "Unable to destroy logFiles");
	}