///@function destroyTimelineEntry(timelineEntry)
///@description Destroy TimelineEntry entity.
///@param {TimelineEntry} timelineEntry
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function destroyTimelineEntry(timelineEntry) {


	
	var time = getTimelineEntryTime(timelineEntry);
	var events = getTimelineEntryEvents(timelineEntry);
	
	for (var index = 0; index < getArrayLength(events); index++) {
		var entity = events[@ index];
		destroyTimelineEvent(entity);
	}
	setTimelineEntryEvents(timelineEntry, null);
	

	
}
