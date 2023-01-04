///@description DialoguePrototype entity

///@function createDialoguePrototype(name, dialoguesLangPack)
///@description Constructor for DialoguePrototype entity.
///@param {String} name
///@param {Map<String::Dialogue>} dialoguesLangPack
///@return {DialoguePrototype} dialoguePrototype 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.629Z}

function createDialoguePrototype(name, dialoguesLangPack) {

	var dialoguePrototype = createEntity(DialoguePrototype);

	setDialoguePrototypeName(dialoguePrototype, assertNoOptional(name));
	setDialoguePrototypeDialoguesLangPack(dialoguePrototype, assertNoOptional(dialoguesLangPack));

	return dialoguePrototype;
	
}
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
///@function destroyDialoguePrototype(dialoguePrototype)
///@description Destroy DialoguePrototype entity.
///@param {DialoguePrototype} dialoguePrototype
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function destroyDialoguePrototype(dialoguePrototype) {


	
	var name = getDialoguePrototypeName(dialoguePrototype);
	var dialoguesLangPack = getDialoguePrototypeDialoguesLangPack(dialoguePrototype);
	
	for (var key = mapFirst(dialoguesLangPack); iteratorFinish(key); key = mapNext(dialoguesLangPack, key)) {
		var entity = dialoguesLangPack[? key];
		destroyDialogue(entity);
	}
	destroyDataStructure(dialoguesLangPack, Map, "Unable to destroy Map dialoguesLangPack in DialoguePrototype");
	setDialoguePrototypeDialoguesLangPack(dialoguePrototype, null);
	

	
}
///@function getDialoguePrototypeDialoguesLangPack(dialoguePrototype)
///@description Getter.
///@param {DialoguePrototype} dialoguePrototype
///@return {Map<String::Dialogue>} dialoguesLangPack 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function getDialoguePrototypeDialoguesLangPack(dialoguePrototype) {

	return dialoguePrototype[@ 1];
	
}
///@function getDialoguePrototypeName(dialoguePrototype)
///@description Getter.
///@param {DialoguePrototype} dialoguePrototype
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function getDialoguePrototypeName(dialoguePrototype) {

	return dialoguePrototype[@ 0];
	
}
///@function setDialoguePrototypeDialoguesLangPack(dialoguePrototype, dialoguesLangPack)
///@description Setter.
///@param {DialoguePrototype} dialoguePrototype
///@param {Map<String::Dialogue>} dialoguesLangPack
///@throws {Exception}
///@generated {2021-05-01T23:49:39.630Z}

function setDialoguePrototypeDialoguesLangPack(dialoguePrototype, dialoguesLangPack) {

	dialoguePrototype[@ 1] = dialoguesLangPack;
	
}
///@function setDialoguePrototypeName(dialoguePrototype, name)
///@description Setter.
///@param {DialoguePrototype} dialoguePrototype
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:39.630Z}

function setDialoguePrototypeName(dialoguePrototype, name) {

	dialoguePrototype[@ 0] = name;
	
}
