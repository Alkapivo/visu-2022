///@function serializeGenericEvent(genericEvent)
///@description Serialize GenericEvent to JSON string.
///@param {GenericEvent} genericEvent
///@return {String} genericEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function serializeGenericEvent(genericEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGenericEventType(genericEvent));	
	if (isOptionalPresent(getGenericEventData(genericEvent))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getGenericEventData(genericEvent),
			"ArrayMap");
	}
	
	if (isOptionalPresent(getGenericEventDispatcher(genericEvent))) {
		appendFieldToJsonObject(
			jsonObject,
			"dispatcher",
			getGenericEventDispatcher(genericEvent));
	}
	

	var genericEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return genericEventJsonString;
	
}
