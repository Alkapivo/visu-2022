///@function serializeAudioEvent(audioEvent)
///@description Serialize AudioEvent to JSON string.
///@param {AudioEvent} audioEvent
///@return {String} audioEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function serializeAudioEvent(audioEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"assetName",
		getAudioEventAssetName(audioEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"trackPosition",
		getAudioEventTrackPosition(audioEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"priority",
		getAudioEventPriority(audioEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"loop",
		getAudioEventLoop(audioEvent));	

	var audioEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return audioEventJsonString;
	
}
