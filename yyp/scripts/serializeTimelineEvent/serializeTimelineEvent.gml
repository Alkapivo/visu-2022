///@function serializeTimelineEvent(timelineEvent)
///@description Serialize TimelineEvent to JSON string.
///@param {TimelineEvent} timelineEvent
///@return {String} timelineEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.853Z}

function serializeTimelineEvent(timelineEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getTimelineEventType(timelineEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getTimelineEventData(timelineEvent),
		Map);
	

	var timelineEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineEventJsonString;
	
}
