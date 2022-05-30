///@function serializeDialogue(dialogue)
///@description Serialize Dialogue to JSON string.
///@param {Dialogue} dialogue
///@return {String} dialogueJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function serializeDialogue(dialogue) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getDialogueName(dialogue));	
	appendFieldToJsonObject(
		jsonObject,
		"startNode",
		getDialogueStartNode(dialogue));	
	appendEntityToJsonObject(
		jsonObject,
		"nodes",
		getDialogueNodes(dialogue),
		"DialogueNode",
		Map);
	

	var dialogueJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueJsonString;
	
}
