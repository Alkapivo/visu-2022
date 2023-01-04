///@description DialogueEvent entity

///@function createDialogueEvent(type, data)
///@description Constructor for DialogueEvent entity.
///@param {String} type
///@param {ArrayMap} data
///@return {DialogueEvent} dialogueEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.659Z}

function createDialogueEvent(type, data) {

	var dialogueEvent = createEntity(DialogueEvent);

	setDialogueEventType(dialogueEvent, assertNoOptional(type));
	setDialogueEventData(dialogueEvent, assertNoOptional(data));

	return dialogueEvent;
	
}
///@function serializeDialogueEvent(dialogueEvent)
///@description Serialize DialogueEvent to JSON string.
///@param {DialogueEvent} dialogueEvent
///@return {String} dialogueEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function serializeDialogueEvent(dialogueEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getDialogueEventType(dialogueEvent));	
	appendEntityToJsonObject(
		jsonObject,
		"data",
		getDialogueEventData(dialogueEvent),
		"ArrayMap");
	

	var dialogueEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueEventJsonString;
	
}
///@function deserializeDialogueEvent(jsonString)
///@description Deserialize DialogueEvent from JSON String to DialogueEvent entity.
///@param {String} jsonString
///@return {DialogueEvent} dialogueEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function deserializeDialogueEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap"));

	destroyJsonObject(jsonObject);
	
	return createDialogueEvent(type, data);
	
}
///@function destroyDialogueEvent(dialogueEvent)
///@description Destroy DialogueEvent entity.
///@param {DialogueEvent} dialogueEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function destroyDialogueEvent(dialogueEvent) {


	
	var type = getDialogueEventType(dialogueEvent);
	var data = getDialogueEventData(dialogueEvent);
	
	destroyArrayMap(data);
	setDialogueEventData(dialogueEvent, null);
	

	
}
///@function getDialogueEventData(dialogueEvent)
///@description Getter.
///@param {DialogueEvent} dialogueEvent
///@return {ArrayMap} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function getDialogueEventData(dialogueEvent) {

	return dialogueEvent[@ 1];
	
}
///@function getDialogueEventType(dialogueEvent)
///@description Getter.
///@param {DialogueEvent} dialogueEvent
///@return {String} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function getDialogueEventType(dialogueEvent) {

	return dialogueEvent[@ 0];
	
}
///@function setDialogueEventData(dialogueEvent, data)
///@description Setter.
///@param {DialogueEvent} dialogueEvent
///@param {ArrayMap} data
///@throws {Exception}
///@generated {2021-05-01T23:49:39.659Z}

function setDialogueEventData(dialogueEvent, data) {

	dialogueEvent[@ 1] = data;
	
}
///@function setDialogueEventType(dialogueEvent, type)
///@description Setter.
///@param {DialogueEvent} dialogueEvent
///@param {String} type
///@throws {Exception}
///@generated {2021-05-01T23:49:39.659Z}

function setDialogueEventType(dialogueEvent, type) {

	dialogueEvent[@ 0] = type;
	
}
