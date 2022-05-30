///@function serializeDialogueOperations(dialogueOperations)
///@description Serialize DialogueOperations to JSON string.
///@param {DialogueOperations} dialogueOperations
///@return {String} dialogueOperationsJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function serializeDialogueOperations(dialogueOperations) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"actions",
		getDialogueOperationsActions(dialogueOperations),
		"DialogueOperation",
		Array);
	

	var dialogueOperationsJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueOperationsJsonString;
	
}
