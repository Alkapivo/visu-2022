///@function serializeDialogueContext(dialogueContext)
///@description Serialize DialogueContext to JSON string.
///@param {DialogueContext} dialogueContext
///@return {String} dialogueContextJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function serializeDialogueContext(dialogueContext) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"dialogue",
		getDialogueContextDialogue(dialogueContext),
		"Dialogue");
	
	if (isOptionalPresent(getDialogueContextCurrentNode(dialogueContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"currentNode",
			getDialogueContextCurrentNode(dialogueContext));
	}
	

	var dialogueContextJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueContextJsonString;
	
}
