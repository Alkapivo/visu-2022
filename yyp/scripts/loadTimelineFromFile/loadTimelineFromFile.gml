///@function loadTimelineFromFile(path)
///@description Load json file and parse to TJsonArray.
///@param {String} path
///@return {Map<Number::GameEvent[]>} timeline
function loadTimelineFromFile(argument0) {

		var path = argument0;

		var jsonTimeline = readStringFromFile(working_directory, path);
		
		var tjsonTimeline = tj_decode(jsonTimeline);
	
		if (!isTJsonArray(tjsonTimeline)) {
			throwException(createException(ParseException, 
				stringParams("Invalid input, raw {0}", jsonTimeline),
				runtimeExceptionHandler));
		}

		var timelineEntriesSize = getArrayLength(tjsonTimeline);
		var timelineEntries = [];
		for (var index = 0; index < timelineEntriesSize; index++) {
			var tjsonTimelineEntry = tjsonTimeline[index];
			var jsonTimelineEntry = tj_encode(tjsonTimelineEntry);
			var timelineEntry = deserializeTimelineEntry(jsonTimelineEntry);
		
			var time = getTimelineEntryTime(timelineEntry);
			var entries = getArrayLength(getTimelineEntryEvents(timelineEntry))
			//logger("TimelineEntry: time {0}, entries {1}", LogType.DEBUG, time, entries);
			pushArray(timelineEntries, timelineEntry);	
		}
	
		var timeline = compileTimeline(timelineEntries);
	
		return timeline;
	



}
