///@description updateEnd()

	if (!isHtml5()) {

		var loggerQueue = getLoggerQueue();
		if (isDataStructure(loggerQueue, Queue)) {
			if (getQueueSize(loggerQueue) > 0) {
			
				writeLogsToLogFile(this);
			}
		}
	}