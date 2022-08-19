///@function deserializeTimelineEntry(jsonString)
///@description Deserialize TimelineEntry from JSON String to TimelineEntry entity.
///@param {String} jsonString
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function deserializeTimelineEntry(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var events = assertNoOptional(getJsonObjectFieldValue(jsonObject, "events", Array, "TimelineEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimelineEntry(time, events);
	
}
