///@function destroyTimelineEvent(timelineEvent)
///@description Destroy TimelineEvent entity.
///@param {TimelineEvent} timelineEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.853Z}

function destroyTimelineEvent(timelineEvent) {


	
	var type = getTimelineEventType(timelineEvent);
	var data = getTimelineEventData(timelineEvent);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in TimelineEvent");
	setTimelineEventData(timelineEvent, null);
	

	
}
