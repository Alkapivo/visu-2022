///@function deserializeDialogueDisplayChoice(jsonString)
///@description Deserialize DialogueDisplayChoice from JSON String to DialogueDisplayChoice entity.
///@param {String} jsonString
///@return {DialogueDisplayChoice} dialogueDisplayChoice 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function deserializeDialogueDisplayChoice(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var pointer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "pointer"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));

	destroyJsonObject(jsonObject);
	
	return createDialogueDisplayChoice(pointer, text);
	
}
