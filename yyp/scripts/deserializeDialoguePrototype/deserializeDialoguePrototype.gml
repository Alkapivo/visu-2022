///@function deserializeDialoguePrototype(jsonString)
///@description Deserialize DialoguePrototype from JSON String to DialoguePrototype entity.
///@param {String} jsonString
///@return {DialoguePrototype} dialoguePrototype 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function deserializeDialoguePrototype(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var dialoguesLangPack = assertNoOptional(getJsonObjectFieldValue(jsonObject, "dialoguesLangPack", Map, "Dialogue"));

	destroyJsonObject(jsonObject);
	
	return createDialoguePrototype(name, dialoguesLangPack);
	
}
