///@function serializeAudioContext(audioContext)
///@description Serialize AudioContext to JSON string.
///@param {AudioContext} audioContext
///@return {String} audioContextJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.116Z}

function serializeAudioContext(audioContext) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getAudioContextName(audioContext));	
	if (isOptionalPresent(getAudioContextAsset(audioContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"asset",
			getAudioContextAsset(audioContext));
	}
	
	if (isOptionalPresent(getAudioContextSound(audioContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"sound",
			getAudioContextSound(audioContext));
	}
	
	appendFieldToJsonObject(
		jsonObject,
		"status",
		getAudioContextStatus(audioContext));	

	var audioContextJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return audioContextJsonString;
	
}
