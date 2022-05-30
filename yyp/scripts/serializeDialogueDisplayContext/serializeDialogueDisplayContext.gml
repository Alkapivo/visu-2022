///@function serializeDialogueDisplayContext(dialogueDisplayContext)
///@description Serialize DialogueDisplayContext to JSON string.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {String} dialogueDisplayContextJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function serializeDialogueDisplayContext(dialogueDisplayContext) {

	var jsonObject = createJsonObject();

	if (isOptionalPresent(getDialogueDisplayContextAuthor(dialogueDisplayContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"author",
			getDialogueDisplayContextAuthor(dialogueDisplayContext));
	}
	
	appendFieldToJsonObject(
		jsonObject,
		"text",
		getDialogueDisplayContextText(dialogueDisplayContext));	
	appendFieldToJsonObject(
		jsonObject,
		"textLength",
		getDialogueDisplayContextTextLength(dialogueDisplayContext));	
	appendFieldToJsonObject(
		jsonObject,
		"textPointer",
		getDialogueDisplayContextTextPointer(dialogueDisplayContext));	
	if (isOptionalPresent(getDialogueDisplayContextChoices(dialogueDisplayContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"choices",
			getDialogueDisplayContextChoices(dialogueDisplayContext),
			Array);
	}
	
	if (isOptionalPresent(getDialogueDisplayContextChoicePointer(dialogueDisplayContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"choicePointer",
			getDialogueDisplayContextChoicePointer(dialogueDisplayContext));
	}
	

	var dialogueDisplayContextJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueDisplayContextJsonString;
	
}
