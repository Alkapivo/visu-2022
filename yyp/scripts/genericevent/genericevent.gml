///@description GenericEvent entity

///@function createGenericEvent(type, data, dispatcher)
///@description Constructor for GenericEvent entity.
///@param {String} type
///@param {Optional<ArrayMap>} data
///@param {Optional<AssetScript>} dispatcher
///@return {GenericEvent} genericEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.082Z}

function createGenericEvent(type, data, dispatcher) {

	var genericEvent = createEntity(GenericEvent);

	setGenericEventType(genericEvent, assertNoOptional(type));
	setGenericEventData(genericEvent, data);
	setGenericEventDispatcher(genericEvent, dispatcher);

	return genericEvent;
	
}
///@function serializeGenericEvent(genericEvent)
///@description Serialize GenericEvent to JSON string.
///@param {GenericEvent} genericEvent
///@return {String} genericEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function serializeGenericEvent(genericEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGenericEventType(genericEvent));	
	if (isOptionalPresent(getGenericEventData(genericEvent))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getGenericEventData(genericEvent),
			"ArrayMap");
	}
	
	if (isOptionalPresent(getGenericEventDispatcher(genericEvent))) {
		appendFieldToJsonObject(
			jsonObject,
			"dispatcher",
			getGenericEventDispatcher(genericEvent));
	}
	

	var genericEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return genericEventJsonString;
	
}
///@function deserializeGenericEvent(jsonString)
///@description Deserialize GenericEvent from JSON String to GenericEvent entity.
///@param {String} jsonString
///@return {GenericEvent} genericEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function deserializeGenericEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");
	var dispatcher = getJsonObjectFieldValue(jsonObject, "dispatcher");

	destroyJsonObject(jsonObject);
	
	return createGenericEvent(type, data, dispatcher);
	
}
///@function destroyGenericEvent(genericEvent)
///@description Destroy GenericEvent entity.
///@param {GenericEvent} genericEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function destroyGenericEvent(genericEvent) {


	
	var type = getGenericEventType(genericEvent);
	var data = getGenericEventData(genericEvent);
	var dispatcher = getGenericEventDispatcher(genericEvent);
	
	if (isOptionalPresent(data)) {
		destroyArrayMap(data);
	}
	setGenericEventData(genericEvent, null);
	

	
}
///@function getGenericEventData(genericEvent)
///@description Getter.
///@param {GenericEvent} genericEvent
///@return {Optional<ArrayMap>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function getGenericEventData(genericEvent) {

	return genericEvent[@ 1];
	
}
///@function getGenericEventDispatcher(genericEvent)
///@description Getter.
///@param {GenericEvent} genericEvent
///@return {Optional<AssetScript>} dispatcher 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function getGenericEventDispatcher(genericEvent) {

	return genericEvent[@ 2];
	
}
///@function getGenericEventType(genericEvent)
///@description Getter.
///@param {GenericEvent} genericEvent
///@return {String} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function getGenericEventType(genericEvent) {

	return genericEvent[@ 0];
	
}
///@function setGenericEventData(genericEvent, data)
///@description Setter.
///@param {GenericEvent} genericEvent
///@param {Optional<ArrayMap>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:42.082Z}

function setGenericEventData(genericEvent, data) {

	genericEvent[@ 1] = data;
	
}
///@function setGenericEventDispatcher(genericEvent, dispatcher)
///@description Setter.
///@param {GenericEvent} genericEvent
///@param {Optional<AssetScript>} dispatcher
///@throws {Exception}
///@generated {2021-05-01T23:49:42.082Z}

function setGenericEventDispatcher(genericEvent, dispatcher) {

	genericEvent[@ 2] = dispatcher;
	
}
///@function setGenericEventType(genericEvent, type)
///@description Setter.
///@param {GenericEvent} genericEvent
///@param {String} type
///@throws {Exception}
///@generated {2021-05-01T23:49:42.082Z}

function setGenericEventType(genericEvent, type) {

	genericEvent[@ 0] = type;
	
}
