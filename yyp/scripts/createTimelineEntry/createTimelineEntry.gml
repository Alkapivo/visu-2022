///@function createTimelineEntry(time, events)
///@description Constructor for TimelineEntry entity.
///@param {Number} time
///@param {TimelineEvent[]} events
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.963Z}

function createTimelineEntry(time, events) {

	var timelineEntry = createEntity(TimelineEntry);

	setTimelineEntryTime(timelineEntry, assertNoOptional(time));
	setTimelineEntryEvents(timelineEntry, assertNoOptional(events));

	return timelineEntry;
	
}
