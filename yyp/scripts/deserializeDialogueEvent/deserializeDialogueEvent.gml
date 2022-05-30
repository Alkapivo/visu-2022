///@function deserializeDialogueEvent(jsonString)
///@description Deserialize DialogueEvent from JSON String to DialogueEvent entity.
///@param {String} jsonString
///@return {DialogueEvent} dialogueEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function deserializeDialogueEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap"));

	destroyJsonObject(jsonObject);
	
	return createDialogueEvent(type, data);
	
}
