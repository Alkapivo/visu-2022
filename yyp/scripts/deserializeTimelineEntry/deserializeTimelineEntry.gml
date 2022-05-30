///@function deserializeTimelineEntry(jsonString)
///@description Deserialize TimelineEntry from JSON String to TimelineEntry entity.
///@param {String} jsonString
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.842Z}

function deserializeTimelineEntry(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var events = assertNoOptional(getJsonObjectFieldValue(jsonObject, "events", Array, "TimelineEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimelineEntry(time, events);
	
}
