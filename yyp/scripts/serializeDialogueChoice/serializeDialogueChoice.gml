///@function serializeDialogueChoice(dialogueChoice)
///@description Serialize DialogueChoice to JSON string.
///@param {DialogueChoice} dialogueChoice
///@return {String} dialogueChoiceJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function serializeDialogueChoice(dialogueChoice) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"nextNode",
		getDialogueChoiceNextNode(dialogueChoice));	
	appendFieldToJsonObject(
		jsonObject,
		"text",
		getDialogueChoiceText(dialogueChoice));	
	if (isOptionalPresent(getDialogueChoiceConditionData(dialogueChoice))) {
		appendFieldToJsonObject(
			jsonObject,
			"conditionData",
			getDialogueChoiceConditionData(dialogueChoice));
	}
	

	var dialogueChoiceJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueChoiceJsonString;
	
}
