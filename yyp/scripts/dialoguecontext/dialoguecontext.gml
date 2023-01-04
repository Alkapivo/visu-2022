///@description DialogueContext entity

///@function createDialogueContext(dialogue, currentNode)
///@description Constructor for DialogueContext entity.
///@param {Dialogue} dialogue
///@param {Optional<String>} currentNode
///@return {DialogueContext} dialogueContext 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.541Z}

function createDialogueContext(dialogue, currentNode) {

	var dialogueContext = createEntity(DialogueContext);

	setDialogueContextDialogue(dialogueContext, assertNoOptional(dialogue));
	setDialogueContextCurrentNode(dialogueContext, currentNode);

	return dialogueContext;
	
}
///@function serializeDialogueContext(dialogueContext)
///@description Serialize DialogueContext to JSON string.
///@param {DialogueContext} dialogueContext
///@return {String} dialogueContextJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function serializeDialogueContext(dialogueContext) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"dialogue",
		getDialogueContextDialogue(dialogueContext),
		"Dialogue");
	
	if (isOptionalPresent(getDialogueContextCurrentNode(dialogueContext))) {
		appendFieldToJsonObject(
			jsonObject,
			"currentNode",
			getDialogueContextCurrentNode(dialogueContext));
	}
	

	var dialogueContextJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueContextJsonString;
	
}
///@function deserializeDialogueContext(jsonString)
///@description Deserialize DialogueContext from JSON String to DialogueContext entity.
///@param {String} jsonString
///@return {DialogueContext} dialogueContext 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function deserializeDialogueContext(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var dialogue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "dialogue", Entity, "Dialogue"));
	var currentNode = getJsonObjectFieldValue(jsonObject, "currentNode");

	destroyJsonObject(jsonObject);
	
	return createDialogueContext(dialogue, currentNode);
	
}
///@function destroyDialogueContext(dialogueContext)
///@description Destroy DialogueContext entity.
///@param {DialogueContext} dialogueContext
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function destroyDialogueContext(dialogueContext) {


	
	var dialogue = getDialogueContextDialogue(dialogueContext);
	var currentNode = getDialogueContextCurrentNode(dialogueContext);
	
	destroyDialogue(dialogue);
	setDialogueContextDialogue(dialogueContext, null);
	

	
}

///@function getDialogueContextCurrentNode(dialogueContext)
///@description Getter.
///@param {DialogueContext} dialogueContext
///@return {Optional<String>} currentNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function getDialogueContextCurrentNode(dialogueContext) {

	return dialogueContext[@ 1];
	
}
///@function getDialogueContextDialogue(dialogueContext)
///@description Getter.
///@param {DialogueContext} dialogueContext
///@return {Dialogue} dialogue 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.134Z}

function getDialogueContextDialogue(dialogueContext) {

	return dialogueContext[@ 0];
	
}
///@function setDialogueContextCurrentNode(dialogueContext, currentNode)
///@description Setter.
///@param {DialogueContext} dialogueContext
///@param {Optional<String>} currentNode
///@throws {Exception}
///@generated {2021-05-01T23:49:39.544Z}

function setDialogueContextCurrentNode(dialogueContext, currentNode) {

	dialogueContext[@ 1] = currentNode;
	
}
///@function setDialogueContextDialogue(dialogueContext, dialogue)
///@description Setter.
///@param {DialogueContext} dialogueContext
///@param {Dialogue} dialogue
///@throws {Exception}
///@generated {2021-05-01T23:49:39.544Z}

function setDialogueContextDialogue(dialogueContext, dialogue) {

	dialogueContext[@ 0] = dialogue;
	
}
