///@function deserializeDialoguePackage(jsonString)
///@description Deserialize DialoguePackage from JSON String to DialoguePackage entity.
///@param {String} jsonString
///@return {DialoguePackage} dialoguePackage 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function deserializeDialoguePackage(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var dialogues = assertNoOptional(getJsonObjectFieldValue(jsonObject, "dialogues", Array, "Dialogue"));

	destroyJsonObject(jsonObject);
	
	return createDialoguePackage(dialogues);
	
}
