///@description AudioManagerState entity

///@function createAudioManagerState(name)
///@description Constructor for AudioManagerState entity.
///@param {Optional<String>} name
///@return {AudioManagerState} audioManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.009Z}

function createAudioManagerState(name) {

	var audioManagerState = createEntity(AudioManagerState);

	setAudioManagerStateName(audioManagerState, name);

	return audioManagerState;
	
}
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
///@function destroyAudioManagerState(audioManagerState)
///@description Destroy AudioManagerState entity.
///@param {AudioManagerState} audioManagerState
///@throws {Exception}
///@generated {2021-05-01T23:43:36.020Z}

function destroyAudioManagerState(audioManagerState) {


	
	var name = getAudioManagerStateName(audioManagerState);
	

	
}
///@function getAudioManagerStateName(audioManagerState)
///@description Getter.
///@param {AudioManagerState} audioManagerState
///@return {Optional<String>} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.020Z}

function getAudioManagerStateName(audioManagerState) {

	return audioManagerState[@ 0];
	
}
///@function setAudioManagerStateName(audioManagerState, name)
///@description Setter.
///@param {AudioManagerState} audioManagerState
///@param {Optional<String>} name
///@throws {Exception}
///@generated {2021-05-01T23:49:38.707Z}

function setAudioManagerStateName(audioManagerState, name) {

	audioManagerState[@ 0] = name;
	
}
