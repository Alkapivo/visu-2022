///@function serializeDialogueNode(dialogueNode)
///@description Serialize DialogueNode to JSON string.
///@param {DialogueNode} dialogueNode
///@return {String} dialogueNodeJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function serializeDialogueNode(dialogueNode) {

	var jsonObject = createJsonObject();

	if (isOptionalPresent(getDialogueNodeAuthor(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"author",
			getDialogueNodeAuthor(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeNextNode(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"nextNode",
			getDialogueNodeNextNode(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeText(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"text",
			getDialogueNodeText(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeAction(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"action",
			getDialogueNodeAction(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeChoices(dialogueNode))) {
		appendEntityToJsonObject(
			jsonObject,
			"choices",
			getDialogueNodeChoices(dialogueNode),
			"DialogueChoice",
			Array);
	}
	
	if (isOptionalPresent(getDialogueNodeBranches(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"branches",
			getDialogueNodeBranches(dialogueNode),
			Map);
	}
	
	if (isOptionalPresent(getDialogueNodePossibilities(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"possibilities",
			getDialogueNodePossibilities(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeChance_1(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"chance_1",
			getDialogueNodeChance_1(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeChance_2(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"chance_2",
			getDialogueNodeChance_2(dialogueNode));
	}
	
	if (isOptionalPresent(getDialogueNodeTitle(dialogueNode))) {
		appendFieldToJsonObject(
			jsonObject,
			"title",
			getDialogueNodeTitle(dialogueNode));
	}
	

	var dialogueNodeJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return dialogueNodeJsonString;
	
}
