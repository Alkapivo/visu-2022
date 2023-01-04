///@description DialogueOperation entity

///@function createDialogueOperation(action, data)
///@description Constructor for DialogueOperation entity.
///@param {DialogueAction} action
///@param {Map<String::Object>} data
///@return {DialogueOperation} dialogueOperation 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.563Z}

function createDialogueOperation(action, data) {

	var dialogueOperation = createEntity(DialogueOperation);

	setDialogueOperationAction(dialogueOperation, assertNoOptional(action));
	setDialogueOperationData(dialogueOperation, assertNoOptional(data));

	return dialogueOperation;
	
}
///@function serializeDialogueOperation(dialogueOperation)
///@description Serialize DialogueOperation to JSON string.
///@param {DialogueOperation} dialogueOperation
///@return {String} dialogueOperationJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function serializeDialogueOperation(dialogueOperation) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"action",
		getDialogueOperationAction(dialogueOperation));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getDialogueOperationData(dialogueOperation),
		Map);
	

	var dialogueOperationJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueOperationJsonString;
	
}
///@function deserializeDialogueOperation(jsonString)
///@description Deserialize DialogueOperation from JSON String to DialogueOperation entity.
///@param {String} jsonString
///@return {DialogueOperation} dialogueOperation 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function deserializeDialogueOperation(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var action = assertNoOptional(getJsonObjectFieldValue(jsonObject, "action"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createDialogueOperation(action, data);
	
}
///@function destroyDialogueOperation(dialogueOperation)
///@description Destroy DialogueOperation entity.
///@param {DialogueOperation} dialogueOperation
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function destroyDialogueOperation(dialogueOperation) {


	
	var action = getDialogueOperationAction(dialogueOperation);
	var data = getDialogueOperationData(dialogueOperation);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in DialogueOperation");
	setDialogueOperationData(dialogueOperation, null);
	

	
}
///@function getDialogueOperationAction(dialogueOperation)
///@description Getter.
///@param {DialogueOperation} dialogueOperation
///@return {DialogueAction} action 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.177Z}

function getDialogueOperationAction(dialogueOperation) {

	return dialogueOperation[@ 0];
	
}
///@function getDialogueOperationData(dialogueOperation)
///@description Getter.
///@param {DialogueOperation} dialogueOperation
///@return {Map<String::Object>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.177Z}

function getDialogueOperationData(dialogueOperation) {

	return dialogueOperation[@ 1];
	
}

///@function setDialogueOperationAction(dialogueOperation, action)
///@description Setter.
///@param {DialogueOperation} dialogueOperation
///@param {DialogueAction} action
///@throws {Exception}
///@generated {2021-05-01T23:49:39.563Z}

function setDialogueOperationAction(dialogueOperation, action) {

	dialogueOperation[@ 0] = action;
	
}
///@function setDialogueOperationData(dialogueOperation, data)
///@description Setter.
///@param {DialogueOperation} dialogueOperation
///@param {Map<String::Object>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:39.563Z}

function setDialogueOperationData(dialogueOperation, data) {

	dialogueOperation[@ 1] = data;
	
}
