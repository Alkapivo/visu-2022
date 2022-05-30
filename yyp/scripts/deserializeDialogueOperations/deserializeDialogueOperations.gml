///@function deserializeDialogueOperations(jsonString)
///@description Deserialize DialogueOperations from JSON String to DialogueOperations entity.
///@param {String} jsonString
///@return {DialogueOperations} dialogueOperations 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function deserializeDialogueOperations(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var actions = assertNoOptional(getJsonObjectFieldValue(jsonObject, "actions", Array, "DialogueOperation"));

	destroyJsonObject(jsonObject);
	
	return createDialogueOperations(actions);
	
}
