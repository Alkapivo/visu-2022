///@function deserializeAudioEvent(jsonString)
///@description Deserialize AudioEvent from JSON String to AudioEvent entity.
///@param {String} jsonString
///@return {AudioEvent} audioEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function deserializeAudioEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var assetName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "assetName"));
	var trackPosition = assertNoOptional(getJsonObjectFieldValue(jsonObject, "trackPosition"));
	var priority = assertNoOptional(getJsonObjectFieldValue(jsonObject, "priority"));
	var loop = assertNoOptional(getJsonObjectFieldValue(jsonObject, "loop"));

	destroyJsonObject(jsonObject);
	
	return createAudioEvent(assetName, trackPosition, priority, loop);
	
}
