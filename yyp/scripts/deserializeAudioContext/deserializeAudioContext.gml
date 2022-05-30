///@function deserializeAudioContext(jsonString)
///@description Deserialize AudioContext from JSON String to AudioContext entity.
///@param {String} jsonString
///@return {AudioContext} audioContext 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.116Z}

function deserializeAudioContext(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var asset = getJsonObjectFieldValue(jsonObject, "asset");
	var sound = getJsonObjectFieldValue(jsonObject, "sound");
	var status = assertNoOptional(getJsonObjectFieldValue(jsonObject, "status"));

	destroyJsonObject(jsonObject);
	
	return createAudioContext(name, asset, sound, status);
	
}
