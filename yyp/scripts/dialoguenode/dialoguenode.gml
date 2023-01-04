///@description DialogueNode entity

///@function createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title)
///@description Constructor for DialogueNode entity.
///@param {Optional<String>} author
///@param {Optional<String>} nextNode
///@param {Optional<String>} text
///@param {Optional<String>} action
///@param {Optional<DialogueChoice[]>} choices
///@param {Optional<Map<String::String>>} branches
///@param {Optional<Integer>} possibilities
///@param {Optional<Number>} chance_1
///@param {Optional<Number>} chance_2
///@param {Optional<DialogueNodeType>} title
///@return {DialogueNode} dialogueNode 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title) {

	var dialogueNode = createEntity(DialogueNode);

	setDialogueNodeAuthor(dialogueNode, author);
	setDialogueNodeNextNode(dialogueNode, nextNode);
	setDialogueNodeText(dialogueNode, text);
	setDialogueNodeAction(dialogueNode, action);
	setDialogueNodeChoices(dialogueNode, choices);
	setDialogueNodeBranches(dialogueNode, branches);
	setDialogueNodePossibilities(dialogueNode, possibilities);
	setDialogueNodeChance_1(dialogueNode, chance_1);
	setDialogueNodeChance_2(dialogueNode, chance_2);
	setDialogueNodeTitle(dialogueNode, title);

	return dialogueNode;
	
}
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
///@function deserializeDialogueNode(jsonString)
///@description Deserialize DialogueNode from JSON String to DialogueNode entity.
///@param {String} jsonString
///@return {DialogueNode} dialogueNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function deserializeDialogueNode(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var author = getJsonObjectFieldValue(jsonObject, "author");
	var nextNode = getJsonObjectFieldValue(jsonObject, "nextNode");
	var text = getJsonObjectFieldValue(jsonObject, "text");
	var action = getJsonObjectFieldValue(jsonObject, "action");
	var choices = getJsonObjectFieldValue(jsonObject, "choices", Array, "DialogueChoice");
	var branches = getJsonObjectFieldValue(jsonObject, "branches", Map);
	var possibilities = getJsonObjectFieldValue(jsonObject, "possibilities");
	var chance_1 = getJsonObjectFieldValue(jsonObject, "chance_1");
	var chance_2 = getJsonObjectFieldValue(jsonObject, "chance_2");
	var title = getJsonObjectFieldValue(jsonObject, "title");

	destroyJsonObject(jsonObject);
	
	return createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title);
	
}
///@function destroyDialogueNode(dialogueNode)
///@description Destroy DialogueNode entity.
///@param {DialogueNode} dialogueNode
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function destroyDialogueNode(dialogueNode) {


	
	var author = getDialogueNodeAuthor(dialogueNode);
	var nextNode = getDialogueNodeNextNode(dialogueNode);
	var text = getDialogueNodeText(dialogueNode);
	var action = getDialogueNodeAction(dialogueNode);
	var choices = getDialogueNodeChoices(dialogueNode);
	var branches = getDialogueNodeBranches(dialogueNode);
	var possibilities = getDialogueNodePossibilities(dialogueNode);
	var chance_1 = getDialogueNodeChance_1(dialogueNode);
	var chance_2 = getDialogueNodeChance_2(dialogueNode);
	var title = getDialogueNodeTitle(dialogueNode);
	
	if (isOptionalPresent(choices)) {
		for (var index = 0; index < getArrayLength(choices); index++) {
			var entity = choices[@ index];
			destroyDialogueChoice(entity);
		}
	}
	setDialogueNodeChoices(dialogueNode, null);
	
	if (isOptionalPresent(branches)) {
		destroyDataStructure(branches, Map, "Unable to destroy Map branches in DialogueNode");
	}
	setDialogueNodeBranches(dialogueNode, null);
	

	
}
///@function getDialogueNodeAction(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<String>} action 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeAction(dialogueNode) {

	return dialogueNode[@ 3];
	
}
///@function getDialogueNodeAuthor(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<String>} author 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeAuthor(dialogueNode) {

	return dialogueNode[@ 0];
	
}
///@function getDialogueNodeBranches(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<Map<String::String>>} branches 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeBranches(dialogueNode) {

	return dialogueNode[@ 5];
	
}
///@function getDialogueNodeChance_1(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<Number>} chance_1 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeChance_1(dialogueNode) {

	return dialogueNode[@ 7];
	
}
///@function getDialogueNodeChance_2(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<Number>} chance_2 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeChance_2(dialogueNode) {

	return dialogueNode[@ 8];
	
}
///@function getDialogueNodeChoices(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<DialogueChoice[]>} choices 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeChoices(dialogueNode) {

	return dialogueNode[@ 4];
	
}
///@function getDialogueNodeNextNode(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<String>} nextNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeNextNode(dialogueNode) {

	return dialogueNode[@ 1];
	
}
///@function getDialogueNodePossibilities(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<Integer>} possibilities 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodePossibilities(dialogueNode) {

	return dialogueNode[@ 6];
	
}

///@function getDialogueNodeText(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<String>} text 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeText(dialogueNode) {

	return dialogueNode[@ 2];
	
}
///@function getDialogueNodeTitle(dialogueNode)
///@description Getter.
///@param {DialogueNode} dialogueNode
///@return {Optional<DialogueNodeType>} title 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function getDialogueNodeTitle(dialogueNode) {

	return dialogueNode[@ 9];
	
}
///@function setDialogueNodeAction(dialogueNode, action)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<String>} action
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeAction(dialogueNode, action) {

	dialogueNode[@ 3] = action;
	
}
///@function setDialogueNodeAuthor(dialogueNode, author)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<String>} author
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeAuthor(dialogueNode, author) {

	dialogueNode[@ 0] = author;
	
}
///@function setDialogueNodeBranches(dialogueNode, branches)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<Map<String::String>>} branches
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeBranches(dialogueNode, branches) {

	dialogueNode[@ 5] = branches;
	
}
///@function setDialogueNodeChance_1(dialogueNode, chance_1)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<Number>} chance_1
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeChance_1(dialogueNode, chance_1) {

	dialogueNode[@ 7] = chance_1;
	
}
///@function setDialogueNodeChance_2(dialogueNode, chance_2)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<Number>} chance_2
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeChance_2(dialogueNode, chance_2) {

	dialogueNode[@ 8] = chance_2;
	
}
///@function setDialogueNodeChoices(dialogueNode, choices)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<DialogueChoice[]>} choices
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeChoices(dialogueNode, choices) {

	dialogueNode[@ 4] = choices;
	
}
///@function setDialogueNodeNextNode(dialogueNode, nextNode)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<String>} nextNode
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeNextNode(dialogueNode, nextNode) {

	dialogueNode[@ 1] = nextNode;
	
}
///@function setDialogueNodePossibilities(dialogueNode, possibilities)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<Integer>} possibilities
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodePossibilities(dialogueNode, possibilities) {

	dialogueNode[@ 6] = possibilities;
	
}

///@function setDialogueNodeText(dialogueNode, text)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<String>} text
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeText(dialogueNode, text) {

	dialogueNode[@ 2] = text;
	
}
///@function setDialogueNodeTitle(dialogueNode, title)
///@description Setter.
///@param {DialogueNode} dialogueNode
///@param {Optional<DialogueNodeType>} title
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function setDialogueNodeTitle(dialogueNode, title) {

	dialogueNode[@ 9] = title;
	
}
