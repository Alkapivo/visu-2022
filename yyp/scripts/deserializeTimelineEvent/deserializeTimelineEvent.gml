///@function deserializeTimelineEvent(jsonString)
///@description Deserialize TimelineEvent from JSON String to TimelineEvent entity.
///@param {String} jsonString
///@return {TimelineEvent} timelineEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function deserializeTimelineEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createTimelineEvent(type, data);
	
}
