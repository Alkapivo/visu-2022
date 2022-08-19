///@function destroyTimelineEvent(timelineEvent)
///@description Destroy TimelineEvent entity.
///@param {TimelineEvent} timelineEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function destroyTimelineEvent(timelineEvent) {


	
	var type = getTimelineEventType(timelineEvent);
	var data = getTimelineEventData(timelineEvent);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in TimelineEvent");
	setTimelineEventData(timelineEvent, null);
	

	
}
