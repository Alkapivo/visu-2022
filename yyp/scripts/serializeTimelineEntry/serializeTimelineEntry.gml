///@function serializeTimelineEntry(timelineEntry)
///@description Serialize TimelineEntry to JSON string.
///@param {TimelineEntry} timelineEntry
///@return {String} timelineEntryJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.963Z}

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
