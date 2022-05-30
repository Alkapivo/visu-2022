///@function deserializeDialogueContext(jsonString)
///@description Deserialize DialogueContext from JSON String to DialogueContext entity.
///@param {String} jsonString
///@return {DialogueContext} dialogueContext 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function deserializeDialogueContext(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var dialogue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "dialogue", Entity, "Dialogue"));
	var currentNode = getJsonObjectFieldValue(jsonObject, "currentNode");

	destroyJsonObject(jsonObject);
	
	return createDialogueContext(dialogue, currentNode);
	
}
