///@function deserializeTimelineEvent(jsonString)
///@description Deserialize TimelineEvent from JSON String to TimelineEvent entity.
///@param {String} jsonString
///@return {TimelineEvent} timelineEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.853Z}

function deserializeTimelineEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createTimelineEvent(type, data);
	
}
