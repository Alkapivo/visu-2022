///@function serializeChronosEvent(chronosEvent)
///@description Serialize ChronosEvent to JSON string.
///@param {ChronosEvent} chronosEvent
///@return {String} chronosEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function serializeChronosEvent(chronosEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"instanceId",
		getChronosEventInstanceId(chronosEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getChronosEventDuration(chronosEvent));	
	if (isOptionalPresent(getChronosEventHandlerName(chronosEvent))) {
		appendFieldToJsonObject(
			jsonObject,
			"handlerName",
			getChronosEventHandlerName(chronosEvent));
	}
	
	if (isOptionalPresent(getChronosEventData(chronosEvent))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getChronosEventData(chronosEvent),
			"ArrayMap");
	}
	

	var chronosEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return chronosEventJsonString;
	
}
