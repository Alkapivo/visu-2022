///@function serializeDialoguePrototype(dialoguePrototype)
///@description Serialize DialoguePrototype to JSON string.
///@param {DialoguePrototype} dialoguePrototype
///@return {String} dialoguePrototypeJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function serializeDialoguePrototype(dialoguePrototype) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getDialoguePrototypeName(dialoguePrototype));	
	appendEntityToJsonObject(
		jsonObject,
		"dialoguesLangPack",
		getDialoguePrototypeDialoguesLangPack(dialoguePrototype),
		"Dialogue",
		Map);
	

	var dialoguePrototypeJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialoguePrototypeJsonString;
	
}
