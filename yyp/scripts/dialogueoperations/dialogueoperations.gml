///@description DialogueOperations entity

///@function createDialogueOperations(actions)
///@description Constructor for DialogueOperations entity.
///@param {DialogueOperation[]} actions
///@return {DialogueOperations} dialogueOperations 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function createDialogueOperations(actions) {

	var dialogueOperations = createEntity(DialogueOperations);

	setDialogueOperationsActions(dialogueOperations, assertNoOptional(actions));

	return dialogueOperations;
	
}
///@function serializeDialogueOperations(dialogueOperations)
///@description Serialize DialogueOperations to JSON string.
///@param {DialogueOperations} dialogueOperations
///@return {String} dialogueOperationsJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function serializeDialogueOperations(dialogueOperations) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"actions",
		getDialogueOperationsActions(dialogueOperations),
		"DialogueOperation",
		Array);
	

	var dialogueOperationsJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueOperationsJsonString;
	
}
///@function deserializeDialogueOperations(jsonString)
///@description Deserialize DialogueOperations from JSON String to DialogueOperations entity.
///@param {String} jsonString
///@return {DialogueOperations} dialogueOperations 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function deserializeDialogueOperations(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var actions = assertNoOptional(getJsonObjectFieldValue(jsonObject, "actions", Array, "DialogueOperation"));

	destroyJsonObject(jsonObject);
	
	return createDialogueOperations(actions);
	
}
///@function destroyDialogueOperations(dialogueOperations)
///@description Destroy DialogueOperations entity.
///@param {DialogueOperations} dialogueOperations
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function destroyDialogueOperations(dialogueOperations) {


	
	var actions = getDialogueOperationsActions(dialogueOperations);
	
	for (var index = 0; index < getArrayLength(actions); index++) {
		var entity = actions[@ index];
		destroyDialogueOperation(entity);
	}
	setDialogueOperationsActions(dialogueOperations, null);
	

	
}
///@function getDialogueOperationsActions(dialogueOperations)
///@description Getter.
///@param {DialogueOperations} dialogueOperations
///@return {DialogueOperation[]} actions 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function getDialogueOperationsActions(dialogueOperations) {

	return dialogueOperations[@ 0];
	
}
///@function setDialogueOperationsActions(dialogueOperations, actions)
///@description Setter.
///@param {DialogueOperations} dialogueOperations
///@param {DialogueOperation[]} actions
///@throws {Exception}
///@generated {2021-05-01T23:49:39.580Z}

function setDialogueOperationsActions(dialogueOperations, actions) {

	dialogueOperations[@ 0] = actions;
	
}
