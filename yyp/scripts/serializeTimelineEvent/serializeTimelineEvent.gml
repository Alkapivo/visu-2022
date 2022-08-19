///@function serializeTimelineEvent(timelineEvent)
///@description Serialize TimelineEvent to JSON string.
///@param {TimelineEvent} timelineEvent
///@return {String} timelineEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

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
