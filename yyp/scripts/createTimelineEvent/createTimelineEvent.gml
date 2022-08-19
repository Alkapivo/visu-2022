///@function createTimelineEvent(type, data)
///@description Constructor for TimelineEvent entity.
///@param {String} type
///@param {Map<String::any>} data
///@return {TimelineEvent} timelineEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function createTimelineEvent(type, data) {

	var timelineEvent = createEntity(TimelineEvent);

	setTimelineEventType(timelineEvent, assertNoOptional(type));
	setTimelineEventData(timelineEvent, assertNoOptional(data));

	return timelineEvent;
	
}
