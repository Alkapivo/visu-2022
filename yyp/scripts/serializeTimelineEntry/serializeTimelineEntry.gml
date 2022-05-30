///@function serializeTimelineEntry(timelineEntry)
///@description Serialize TimelineEntry to JSON string.
///@param {TimelineEntry} timelineEntry
///@return {String} timelineEntryJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.842Z}

function serializeTimelineEntry(timelineEntry) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getTimelineEntryTime(timelineEntry));	
	appendEntityToJsonObject(
		jsonObject,
		"events",
		getTimelineEntryEvents(timelineEntry),
		"TimelineEvent",
		Array);
	

	var timelineEntryJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineEntryJsonString;
	
}
