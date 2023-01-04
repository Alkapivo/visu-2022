///@description DialogueDisplayContext entity

///@function createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer)
///@description Constructor for DialogueDisplayContext entity.
///@param {Optional<String>} author
///@param {String} text
///@param {Integer} textLength
///@param {Integer} textPointer
///@param {Optional<String[]>} choices
///@param {Optional<Integer>} choicePointer
///@return {DialogueDisplayContext} dialogueDisplayContext 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.584Z}

function createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer) {

	var dialogueDisplayContext = createEntity(DialogueDisplayContext);

	setDialogueDisplayContextAuthor(dialogueDisplayContext, author);
	setDialogueDisplayContextText(dialogueDisplayContext, assertNoOptional(text));
	setDialogueDisplayContextTextLength(dialogueDisplayContext, assertNoOptional(textLength));
	setDialogueDisplayContextTextPointer(dialogueDisplayContext, assertNoOptional(textPointer));
	setDialogueDisplayContextChoices(dialogueDisplayContext, choices);
	setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer);

	return dialogueDisplayContext;
	
}
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
///@function deserializeDialogueDisplayContext(jsonString)
///@description Deserialize DialogueDisplayContext from JSON String to DialogueDisplayContext entity.
///@param {String} jsonString
///@return {DialogueDisplayContext} dialogueDisplayContext 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function deserializeDialogueDisplayContext(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var author = getJsonObjectFieldValue(jsonObject, "author");
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));
	var textLength = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textLength"));
	var textPointer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textPointer"));
	var choices = getJsonObjectFieldValue(jsonObject, "choices", Array);
	var choicePointer = getJsonObjectFieldValue(jsonObject, "choicePointer");

	destroyJsonObject(jsonObject);
	
	return createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer);
	
}
///@function destroyDialogueDisplayContext(dialogueDisplayContext)
///@description Destroy DialogueDisplayContext entity.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function destroyDialogueDisplayContext(dialogueDisplayContext) {


	
	var author = getDialogueDisplayContextAuthor(dialogueDisplayContext);
	var text = getDialogueDisplayContextText(dialogueDisplayContext);
	var textLength = getDialogueDisplayContextTextLength(dialogueDisplayContext);
	var textPointer = getDialogueDisplayContextTextPointer(dialogueDisplayContext);
	var choices = getDialogueDisplayContextChoices(dialogueDisplayContext);
	var choicePointer = getDialogueDisplayContextChoicePointer(dialogueDisplayContext);
	
	setDialogueDisplayContextChoices(dialogueDisplayContext, null);
	

	
}

///@function getDialogueDisplayContextAuthor(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {Optional<String>} author 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextAuthor(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 0];
	
}
///@function getDialogueDisplayContextChoicePointer(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {Optional<Integer>} choicePointer 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextChoicePointer(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 5];
	
}
///@function getDialogueDisplayContextChoices(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {Optional<String[]>} choices 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextChoices(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 4];
	
}
///@function getDialogueDisplayContextText(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {String} text 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextText(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 1];
	
}
///@function getDialogueDisplayContextTextLength(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {Integer} textLength 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextTextLength(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 2];
	
}
///@function getDialogueDisplayContextTextPointer(dialogueDisplayContext)
///@description Getter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@return {Integer} textPointer 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function getDialogueDisplayContextTextPointer(dialogueDisplayContext) {

	return dialogueDisplayContext[@ 3];
	
}

///@function setDialogueDisplayContextAuthor(dialogueDisplayContext, author)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {Optional<String>} author
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextAuthor(dialogueDisplayContext, author) {

	dialogueDisplayContext[@ 0] = author;
	
}
///@function setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {Optional<Integer>} choicePointer
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer) {

	dialogueDisplayContext[@ 5] = choicePointer;
	
}
///@function setDialogueDisplayContextChoices(dialogueDisplayContext, choices)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {Optional<String[]>} choices
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextChoices(dialogueDisplayContext, choices) {

	dialogueDisplayContext[@ 4] = choices;
	
}
///@function setDialogueDisplayContextText(dialogueDisplayContext, text)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {String} text
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextText(dialogueDisplayContext, text) {

	dialogueDisplayContext[@ 1] = text;
	
}
///@function setDialogueDisplayContextTextLength(dialogueDisplayContext, textLength)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {Integer} textLength
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextTextLength(dialogueDisplayContext, textLength) {

	dialogueDisplayContext[@ 2] = textLength;
	
}
///@function setDialogueDisplayContextTextPointer(dialogueDisplayContext, textPointer)
///@description Setter.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@param {Integer} textPointer
///@throws {Exception}
///@generated {2021-05-01T23:49:39.585Z}

function setDialogueDisplayContextTextPointer(dialogueDisplayContext, textPointer) {

	dialogueDisplayContext[@ 3] = textPointer;
	
}
