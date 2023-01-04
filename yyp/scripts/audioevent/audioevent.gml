///@description AudioEvent entity

///@function createAudioEvent(assetName, trackPosition, priority, loop)
///@description Constructor for AudioEvent entity.
///@param {String} assetName
///@param {Number} trackPosition
///@param {Integer} priority
///@param {Boolean} loop
///@return {AudioEvent} audioEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function createAudioEvent(assetName, trackPosition, priority, loop) {

	var audioEvent = createEntity(AudioEvent);

	setAudioEventAssetName(audioEvent, assertNoOptional(assetName));
	setAudioEventTrackPosition(audioEvent, assertNoOptional(trackPosition));
	setAudioEventPriority(audioEvent, assertNoOptional(priority));
	setAudioEventLoop(audioEvent, assertNoOptional(loop));

	return audioEvent;
	
}
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
///@function destroyAudioEvent(audioEvent)
///@description Destroy AudioEvent entity.
///@param {AudioEvent} audioEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function destroyAudioEvent(audioEvent) {


	
	var assetName = getAudioEventAssetName(audioEvent);
	var trackPosition = getAudioEventTrackPosition(audioEvent);
	var priority = getAudioEventPriority(audioEvent);
	var loop = getAudioEventLoop(audioEvent);
	

	
}
///@function getAudioEventAssetName(audioEvent)
///@description Getter.
///@param {AudioEvent} audioEvent
///@return {String} assetName 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function getAudioEventAssetName(audioEvent) {

	return audioEvent[@ 0];
	
}
///@function getAudioEventLoop(audioEvent)
///@description Getter.
///@param {AudioEvent} audioEvent
///@return {Boolean} loop 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function getAudioEventLoop(audioEvent) {

	return audioEvent[@ 3];
	
}
///@function getAudioEventPriority(audioEvent)
///@description Getter.
///@param {AudioEvent} audioEvent
///@return {Integer} priority 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function getAudioEventPriority(audioEvent) {

	return audioEvent[@ 2];
	
}
///@function getAudioEventTrackPosition(audioEvent)
///@description Getter.
///@param {AudioEvent} audioEvent
///@return {Number} trackPosition 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.073Z}

function getAudioEventTrackPosition(audioEvent) {

	return audioEvent[@ 1];
	
}
///@function setAudioEventAssetName(audioEvent, assetName)
///@description Setter.
///@param {AudioEvent} audioEvent
///@param {String} assetName
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function setAudioEventAssetName(audioEvent, assetName) {

	audioEvent[@ 0] = assetName;
	
}
///@function setAudioEventLoop(audioEvent, loop)
///@description Setter.
///@param {AudioEvent} audioEvent
///@param {Boolean} loop
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function setAudioEventLoop(audioEvent, loop) {

	audioEvent[@ 3] = loop;
	
}
///@function setAudioEventPriority(audioEvent, priority)
///@description Setter.
///@param {AudioEvent} audioEvent
///@param {Integer} priority
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function setAudioEventPriority(audioEvent, priority) {

	audioEvent[@ 2] = priority;
	
}
///@function setAudioEventTrackPosition(audioEvent, trackPosition)
///@description Setter.
///@param {AudioEvent} audioEvent
///@param {Number} trackPosition
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function setAudioEventTrackPosition(audioEvent, trackPosition) {

	audioEvent[@ 1] = trackPosition;
	
}
