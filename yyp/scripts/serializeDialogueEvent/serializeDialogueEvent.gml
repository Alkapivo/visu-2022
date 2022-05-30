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
