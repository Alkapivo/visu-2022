///@description ChronosEvent entity

///@function createChronosEvent(instanceId, duration, handlerName, data)
///@description Constructor for ChronosEvent entity.
///@param {Instance} instanceId
///@param {Number} duration
///@param {Optional<String>} handlerName
///@param {Optional<ArrayMap>} data
///@return {ChronosEvent} chronosEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:40.798Z}

function createChronosEvent(instanceId, duration, handlerName, data) {

	var chronosEvent = createEntity(ChronosEvent);

	setChronosEventInstanceId(chronosEvent, assertNoOptional(instanceId));
	setChronosEventDuration(chronosEvent, assertNoOptional(duration));
	setChronosEventHandlerName(chronosEvent, handlerName);
	setChronosEventData(chronosEvent, data);

	return chronosEvent;
	
}
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
///@function deserializeChronosEvent(jsonString)
///@description Deserialize ChronosEvent from JSON String to ChronosEvent entity.
///@param {String} jsonString
///@return {ChronosEvent} chronosEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function deserializeChronosEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var instanceId = assertNoOptional(getJsonObjectFieldValue(jsonObject, "instanceId"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var handlerName = getJsonObjectFieldValue(jsonObject, "handlerName");
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

	destroyJsonObject(jsonObject);
	
	return createChronosEvent(instanceId, duration, handlerName, data);
	
}
///@function destroyChronosEvent(chronosEvent)
///@description Destroy ChronosEvent entity.
///@param {ChronosEvent} chronosEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function destroyChronosEvent(chronosEvent) {


	
	var instanceId = getChronosEventInstanceId(chronosEvent);
	var duration = getChronosEventDuration(chronosEvent);
	var handlerName = getChronosEventHandlerName(chronosEvent);
	var data = getChronosEventData(chronosEvent);
	
	if (isOptionalPresent(data)) {
		destroyArrayMap(data);
	}
	setChronosEventData(chronosEvent, null);
	

	
}
///@function getChronosEventData(chronosEvent)
///@description Getter.
///@param {ChronosEvent} chronosEvent
///@return {Optional<ArrayMap>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function getChronosEventData(chronosEvent) {

	return chronosEvent[@ 3];
	
}
///@function getChronosEventDuration(chronosEvent)
///@description Getter.
///@param {ChronosEvent} chronosEvent
///@return {Number} duration 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function getChronosEventDuration(chronosEvent) {

	return chronosEvent[@ 1];
	
}
///@function getChronosEventHandlerName(chronosEvent)
///@description Getter.
///@param {ChronosEvent} chronosEvent
///@return {Optional<String>} handlerName 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function getChronosEventHandlerName(chronosEvent) {

	return chronosEvent[@ 2];
	
}
///@function getChronosEventInstanceId(chronosEvent)
///@description Getter.
///@param {ChronosEvent} chronosEvent
///@return {Instance} instanceId 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function getChronosEventInstanceId(chronosEvent) {

	return chronosEvent[@ 0];
	
}
///@function setChronosEventData(chronosEvent, data)
///@description Setter.
///@param {ChronosEvent} chronosEvent
///@param {Optional<ArrayMap>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:40.799Z}

function setChronosEventData(chronosEvent, data) {

	chronosEvent[@ 3] = data;
	
}
///@function setChronosEventDuration(chronosEvent, duration)
///@description Setter.
///@param {ChronosEvent} chronosEvent
///@param {Number} duration
///@throws {Exception}
///@generated {2021-05-01T23:49:40.799Z}

function setChronosEventDuration(chronosEvent, duration) {

	chronosEvent[@ 1] = duration;
	
}
///@function setChronosEventHandlerName(chronosEvent, handlerName)
///@description Setter.
///@param {ChronosEvent} chronosEvent
///@param {Optional<String>} handlerName
///@throws {Exception}
///@generated {2021-05-01T23:49:40.799Z}

function setChronosEventHandlerName(chronosEvent, handlerName) {

	chronosEvent[@ 2] = handlerName;
	
}
///@function setChronosEventInstanceId(chronosEvent, instanceId)
///@description Setter.
///@param {ChronosEvent} chronosEvent
///@param {Instance} instanceId
///@throws {Exception}
///@generated {2021-05-01T23:49:40.798Z}

function setChronosEventInstanceId(chronosEvent, instanceId) {

	chronosEvent[@ 0] = instanceId;
	
}
