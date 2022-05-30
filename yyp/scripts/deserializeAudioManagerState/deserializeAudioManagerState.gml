///@function deserializeAudioManagerState(jsonString)
///@description Deserialize AudioManagerState from JSON String to AudioManagerState entity.
///@param {String} jsonString
///@return {AudioManagerState} audioManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.009Z}

function deserializeAudioManagerState(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = getJsonObjectFieldValue(jsonObject, "name");

	destroyJsonObject(jsonObject);
	
	return createAudioManagerState(name);
	
}
