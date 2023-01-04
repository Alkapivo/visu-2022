///@description DialogueChoice entity

///@function createDialogueChoice(nextNode, text, conditionData)
///@description Constructor for DialogueChoice entity.
///@param {String} nextNode
///@param {String} text
///@param {Optional<String>} conditionData
///@return {DialogueChoice} dialogueChoice 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.510Z}

function createDialogueChoice(nextNode, text, conditionData) {

	var dialogueChoice = createEntity(DialogueChoice);

	setDialogueChoiceNextNode(dialogueChoice, assertNoOptional(nextNode));
	setDialogueChoiceText(dialogueChoice, assertNoOptional(text));
	setDialogueChoiceConditionData(dialogueChoice, conditionData);

	return dialogueChoice;
	
}
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
///@function deserializeDialogueChoice(jsonString)
///@description Deserialize DialogueChoice from JSON String to DialogueChoice entity.
///@param {String} jsonString
///@return {DialogueChoice} dialogueChoice 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function deserializeDialogueChoice(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var nextNode = assertNoOptional(getJsonObjectFieldValue(jsonObject, "nextNode"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));
	var conditionData = getJsonObjectFieldValue(jsonObject, "conditionData");

	destroyJsonObject(jsonObject);
	
	return createDialogueChoice(nextNode, text, conditionData);
	
}
///@function destroyDialogueChoice(dialogueChoice)
///@description Destroy DialogueChoice entity.
///@param {DialogueChoice} dialogueChoice
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function destroyDialogueChoice(dialogueChoice) {


	
	var nextNode = getDialogueChoiceNextNode(dialogueChoice);
	var text = getDialogueChoiceText(dialogueChoice);
	var conditionData = getDialogueChoiceConditionData(dialogueChoice);
	

	
}
///@function getDialogueChoiceConditionData(dialogueChoice)
///@description Getter.
///@param {DialogueChoice} dialogueChoice
///@return {Optional<String>} conditionData 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function getDialogueChoiceConditionData(dialogueChoice) {

	return dialogueChoice[@ 2];
	
}
///@function getDialogueChoiceNextNode(dialogueChoice)
///@description Getter.
///@param {DialogueChoice} dialogueChoice
///@return {String} nextNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function getDialogueChoiceNextNode(dialogueChoice) {

	return dialogueChoice[@ 0];
	
}
///@function getDialogueChoiceText(dialogueChoice)
///@description Getter.
///@param {DialogueChoice} dialogueChoice
///@return {String} text 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.028Z}

function getDialogueChoiceText(dialogueChoice) {

	return dialogueChoice[@ 1];
	
}
///@function setDialogueChoiceConditionData(dialogueChoice, conditionData)
///@description Setter.
///@param {DialogueChoice} dialogueChoice
///@param {Optional<String>} conditionData
///@throws {Exception}
///@generated {2021-05-01T23:49:39.511Z}

function setDialogueChoiceConditionData(dialogueChoice, conditionData) {

	dialogueChoice[@ 2] = conditionData;
	
}
///@function setDialogueChoiceNextNode(dialogueChoice, nextNode)
///@description Setter.
///@param {DialogueChoice} dialogueChoice
///@param {String} nextNode
///@throws {Exception}
///@generated {2021-05-01T23:49:39.511Z}

function setDialogueChoiceNextNode(dialogueChoice, nextNode) {

	dialogueChoice[@ 0] = nextNode;
	
}
///@function setDialogueChoiceText(dialogueChoice, text)
///@description Setter.
///@param {DialogueChoice} dialogueChoice
///@param {String} text
///@throws {Exception}
///@generated {2021-05-01T23:49:39.511Z}

function setDialogueChoiceText(dialogueChoice, text) {

	dialogueChoice[@ 1] = text;
	
}
