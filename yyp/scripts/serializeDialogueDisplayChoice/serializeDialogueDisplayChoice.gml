///@function serializeDialogueDisplayChoice(dialogueDisplayChoice)
///@description Serialize DialogueDisplayChoice to JSON string.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@return {String} dialogueDisplayChoiceJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function serializeDialogueDisplayChoice(dialogueDisplayChoice) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"pointer",
		getDialogueDisplayChoicePointer(dialogueDisplayChoice));	
	appendFieldToJsonObject(
		jsonObject,
		"text",
		getDialogueDisplayChoiceText(dialogueDisplayChoice));	

	var dialogueDisplayChoiceJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueDisplayChoiceJsonString;
	
}
