///@description DialoguePackage entity

///@function createDialoguePackage(dialogues)
///@description Constructor for DialoguePackage entity.
///@param {Dialogue[]} dialogues
///@return {DialoguePackage} dialoguePackage 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function createDialoguePackage(dialogues) {

	var dialoguePackage = createEntity(DialoguePackage);

	setDialoguePackageDialogues(dialoguePackage, assertNoOptional(dialogues));

	return dialoguePackage;
	
}
///@function serializeDialoguePackage(dialoguePackage)
///@description Serialize DialoguePackage to JSON string.
///@param {DialoguePackage} dialoguePackage
///@return {String} dialoguePackageJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function serializeDialoguePackage(dialoguePackage) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"dialogues",
		getDialoguePackageDialogues(dialoguePackage),
		"Dialogue",
		Array);
	

	var dialoguePackageJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialoguePackageJsonString;
	
}
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
///@function destroyDialoguePackage(dialoguePackage)
///@description Destroy DialoguePackage entity.
///@param {DialoguePackage} dialoguePackage
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function destroyDialoguePackage(dialoguePackage) {


	
	var dialogues = getDialoguePackageDialogues(dialoguePackage);
	
	for (var index = 0; index < getArrayLength(dialogues); index++) {
		var entity = dialogues[@ index];
		destroyDialogue(entity);
	}
	setDialoguePackageDialogues(dialoguePackage, null);
	

	
}
///@function getDialoguePackageDialogues(dialoguePackage)
///@description Getter.
///@param {DialoguePackage} dialoguePackage
///@return {Dialogue[]} dialogues 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.308Z}

function getDialoguePackageDialogues(dialoguePackage) {

	return dialoguePackage[@ 0];
	
}
///@function setDialoguePackageDialogues(dialoguePackage, dialogues)
///@description Setter.
///@param {DialoguePackage} dialoguePackage
///@param {Dialogue[]} dialogues
///@throws {Exception}
///@generated {2021-05-01T23:49:39.624Z}

function setDialoguePackageDialogues(dialoguePackage, dialogues) {

	dialoguePackage[@ 0] = dialogues;
	
}
