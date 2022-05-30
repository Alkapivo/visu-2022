///@function destroyTimelineEntry(timelineEntry)
///@description Destroy TimelineEntry entity.
///@param {TimelineEntry} timelineEntry
///@throws {Exception}
///@generated {2021-08-25T13:56:53.842Z}

function destroyTimelineEntry(timelineEntry) {


	
	var time = getTimelineEntryTime(timelineEntry);
	var events = getTimelineEntryEvents(timelineEntry);
	
	for (var index = 0; index < getArrayLength(events); index++) {
		var entity = events[@ index];
		destroyTimelineEvent(entity);
	}
	setTimelineEntryEvents(timelineEntry, null);
	

	
}
