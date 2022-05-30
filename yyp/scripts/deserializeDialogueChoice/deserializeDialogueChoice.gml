///@function deserializeDialogueChoice(jsonString)
///@description Deserialize DialogueChoice from JSON String to DialogueChoice entity.
///@param {String} jsonString
///@return {DialogueChoice} dialogueChoice 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function deserializeDialogueChoice(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var nextNode = assertNoOptional(getJsonObjectFieldValue(jsonObject, "nextNode"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));
	var conditionData = getJsonObjectFieldValue(jsonObject, "conditionData");

	destroyJsonObject(jsonObject);
	
	return createDialogueChoice(nextNode, text, conditionData);
	
}
