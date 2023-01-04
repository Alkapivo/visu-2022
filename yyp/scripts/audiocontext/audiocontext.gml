///@function createAudioContext(name, asset, sound, status)
///@description Constructor for AudioContext entity.
///@param {String} name
///@param {Optional<AssetSound>} asset
///@param {Optional<Sound>} sound
///@param {AudioContextStatus} status
///@return {AudioContext} audioContext 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function createAudioContext(name, asset, sound, status) {

	var audioContext = createEntity(AudioContext);

	setAudioContextName(audioContext, assertNoOptional(name));
	setAudioContextAsset(audioContext, asset);
	setAudioContextSound(audioContext, sound);
	setAudioContextStatus(audioContext, assertNoOptional(status));

	return audioContext;
	
}

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

///@function destroyAudioContext(audioContext)
///@description Destroy AudioContext entity.
///@param {AudioContext} audioContext
///@throws {Exception}
///@generated {2021-05-01T23:43:44.116Z}

function destroyAudioContext(audioContext) {


	
	var name = getAudioContextName(audioContext);
	var asset = getAudioContextAsset(audioContext);
	var sound = getAudioContextSound(audioContext);
	var status = getAudioContextStatus(audioContext);
	

	
}

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

///@function getAudioContextAsset(audioContext)
///@description Getter.
///@param {AudioContext} audioContext
///@return {Optional<AssetSound>} asset 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.117Z}

function getAudioContextAsset(audioContext) {

	return audioContext[@ 1];
	
}

///@function getAudioContextName(audioContext)
///@description Getter.
///@param {AudioContext} audioContext
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.117Z}

function getAudioContextName(audioContext) {

	return audioContext[@ 0];
	
}

///@function getAudioContextSound(audioContext)
///@description Getter.
///@param {AudioContext} audioContext
///@return {Optional<Sound>} sound 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.117Z}

function getAudioContextSound(audioContext) {

	return audioContext[@ 2];
	
}

///@function getAudioContextStatus(audioContext)
///@description Getter.
///@param {AudioContext} audioContext
///@return {AudioContextStatus} status 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.117Z}

function getAudioContextStatus(audioContext) {

	return audioContext[@ 3];
	
}

///@function setAudioContextAsset(audioContext, asset)
///@description Setter.
///@param {AudioContext} audioContext
///@param {Optional<AssetSound>} asset
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function setAudioContextAsset(audioContext, asset) {

	audioContext[@ 1] = asset;
	
}

///@function setAudioContextName(audioContext, name)
///@description Setter.
///@param {AudioContext} audioContext
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function setAudioContextName(audioContext, name) {

	audioContext[@ 0] = name;
	
}

///@function setAudioContextSound(audioContext, sound)
///@description Setter.
///@param {AudioContext} audioContext
///@param {Optional<Sound>} sound
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function setAudioContextSound(audioContext, sound) {

	audioContext[@ 2] = sound;
	
}

///@function setAudioContextStatus(audioContext, status)
///@description Setter.
///@param {AudioContext} audioContext
///@param {AudioContextStatus} status
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function setAudioContextStatus(audioContext, status) {

	audioContext[@ 3] = status;
	
}
