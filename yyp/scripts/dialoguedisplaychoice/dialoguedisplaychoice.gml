///@description DialogueDisplayChoice entity

///@function createDialogueDisplayChoice(pointer, text)
///@description Constructor for DialogueDisplayChoice entity.
///@param {Integer} pointer
///@param {String} text
///@return {DialogueDisplayChoice} dialogueDisplayChoice 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.528Z}

function createDialogueDisplayChoice(pointer, text) {

	var dialogueDisplayChoice = createEntity(DialogueDisplayChoice);

	setDialogueDisplayChoicePointer(dialogueDisplayChoice, assertNoOptional(pointer));
	setDialogueDisplayChoiceText(dialogueDisplayChoice, assertNoOptional(text));

	return dialogueDisplayChoice;
	
}
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
///@function deserializeDialogueDisplayChoice(jsonString)
///@description Deserialize DialogueDisplayChoice from JSON String to DialogueDisplayChoice entity.
///@param {String} jsonString
///@return {DialogueDisplayChoice} dialogueDisplayChoice 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function deserializeDialogueDisplayChoice(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var pointer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "pointer"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));

	destroyJsonObject(jsonObject);
	
	return createDialogueDisplayChoice(pointer, text);
	
}
///@function destroyDialogueDisplayChoice(dialogueDisplayChoice)
///@description Destroy DialogueDisplayChoice entity.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function destroyDialogueDisplayChoice(dialogueDisplayChoice) {


	
	var pointer = getDialogueDisplayChoicePointer(dialogueDisplayChoice);
	var text = getDialogueDisplayChoiceText(dialogueDisplayChoice);
	

	
}
///@function getDialogueDisplayChoicePointer(dialogueDisplayChoice)
///@description Getter.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@return {Integer} pointer 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function getDialogueDisplayChoicePointer(dialogueDisplayChoice) {

	return dialogueDisplayChoice[@ 0];
	
}
///@function getDialogueDisplayChoiceText(dialogueDisplayChoice)
///@description Getter.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@return {String} text 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.083Z}

function getDialogueDisplayChoiceText(dialogueDisplayChoice) {

	return dialogueDisplayChoice[@ 1];
	
}
///@function setDialogueDisplayChoicePointer(dialogueDisplayChoice, pointer)
///@description Setter.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@param {Integer} pointer
///@throws {Exception}
///@generated {2021-05-01T23:49:39.528Z}

function setDialogueDisplayChoicePointer(dialogueDisplayChoice, pointer) {

	dialogueDisplayChoice[@ 0] = pointer;
	
}
///@function setDialogueDisplayChoiceText(dialogueDisplayChoice, text)
///@description Setter.
///@param {DialogueDisplayChoice} dialogueDisplayChoice
///@param {String} text
///@throws {Exception}
///@generated {2021-05-01T23:49:39.528Z}

function setDialogueDisplayChoiceText(dialogueDisplayChoice, text) {

	dialogueDisplayChoice[@ 1] = text;
	
}
