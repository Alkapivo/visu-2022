///@function deserializeDialogueOperation(jsonString)
///@description Deserialize DialogueOperation from JSON String to DialogueOperation entity.
///@param {String} jsonString
///@return {DialogueOperation} dialogueOperation 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function deserializeDialogueOperation(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var action = assertNoOptional(getJsonObjectFieldValue(jsonObject, "action"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createDialogueOperation(action, data);
	
}
