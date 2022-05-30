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
