///@function createTimelineEntry(time, events)
///@description Constructor for TimelineEntry entity.
///@param {Number} time
///@param {TimelineEvent[]} events
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.842Z}

function createTimelineEntry(time, events) {

	var timelineEntry = createEntity(TimelineEntry);

	setTimelineEntryTime(timelineEntry, assertNoOptional(time));
	setTimelineEntryEvents(timelineEntry, assertNoOptional(events));

	return timelineEntry;
	
}
