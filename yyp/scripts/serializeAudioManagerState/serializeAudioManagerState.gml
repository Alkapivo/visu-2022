///@function serializeAudioManagerState(audioManagerState)
///@description Serialize AudioManagerState to JSON string.
///@param {AudioManagerState} audioManagerState
///@return {String} audioManagerStateJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.009Z}

function serializeAudioManagerState(audioManagerState) {

	var jsonObject = createJsonObject();

	if (isOptionalPresent(getAudioManagerStateName(audioManagerState))) {
		appendFieldToJsonObject(
			jsonObject,
			"name",
			getAudioManagerStateName(audioManagerState));
	}
	

	var audioManagerStateJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return audioManagerStateJsonString;
	
}
