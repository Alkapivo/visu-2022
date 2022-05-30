///@function serializeDialogueOperation(dialogueOperation)
///@description Serialize DialogueOperation to JSON string.
///@param {DialogueOperation} dialogueOperation
///@return {String} dialogueOperationJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function serializeDialogueOperation(dialogueOperation) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"action",
		getDialogueOperationAction(dialogueOperation));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getDialogueOperationData(dialogueOperation),
		Map);
	

	var dialogueOperationJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueOperationJsonString;
	
}
