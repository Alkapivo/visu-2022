///@function createDialogue(name, startNode, nodes)
///@description Constructor for Dialogue entity.
///@param {String} name
///@param {String} startNode
///@param {Map<String::DialogueNode>} nodes
///@return {Dialogue} dialogue 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.433Z}

function createDialogue(name, startNode, nodes) {

	var dialogue = createEntity(Dialogue);

	setDialogueName(dialogue, assertNoOptional(name));
	setDialogueStartNode(dialogue, assertNoOptional(startNode));
	setDialogueNodes(dialogue, assertNoOptional(nodes));

	return dialogue;
	
}
///@function deserializeDialogue(jsonString)
///@description Deserialize Dialogue from JSON String to Dialogue entity.
///@param {String} jsonString
///@return {Dialogue} dialogue 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function deserializeDialogue(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var startNode = assertNoOptional(getJsonObjectFieldValue(jsonObject, "startNode"));
	var nodes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "nodes", Map, "DialogueNode"));

	destroyJsonObject(jsonObject);
	
	return createDialogue(name, startNode, nodes);
	
}
///@function destroyDialogue(dialogue)
///@description Destroy Dialogue entity.
///@param {Dialogue} dialogue
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function destroyDialogue(dialogue) {


	
	var name = getDialogueName(dialogue);
	var startNode = getDialogueStartNode(dialogue);
	var nodes = getDialogueNodes(dialogue);
	
	for (var key = mapFirst(nodes); iteratorFinish(key); key = mapNext(nodes, key)) {
		var entity = nodes[? key];
		destroyDialogueNode(entity);
	}
	destroyDataStructure(nodes, Map, "Unable to destroy Map nodes in Dialogue");
	setDialogueNodes(dialogue, null);
	

	
}
///@function getDialogueName(dialogue)
///@description Getter.
///@param {Dialogue} dialogue
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function getDialogueName(dialogue) {

	return dialogue[@ 0];
	
}
///@function getDialogueNodes(dialogue)
///@description Getter.
///@param {Dialogue} dialogue
///@return {Map<String::DialogueNode>} nodes 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function getDialogueNodes(dialogue) {

	return dialogue[@ 2];
	
}

///@function getDialogueStartNode(dialogue)
///@description Getter.
///@param {Dialogue} dialogue
///@return {String} startNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function getDialogueStartNode(dialogue) {

	return dialogue[@ 1];
	
}
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
///@function setDialogueName(dialogue, name)
///@description Setter.
///@param {Dialogue} dialogue
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:39.433Z}

function setDialogueName(dialogue, name) {

	dialogue[@ 0] = name;
	
}
///@function setDialogueNodes(dialogue, nodes)
///@description Setter.
///@param {Dialogue} dialogue
///@param {Map<String::DialogueNode>} nodes
///@throws {Exception}
///@generated {2021-05-01T23:49:39.433Z}

function setDialogueNodes(dialogue, nodes) {

	dialogue[@ 2] = nodes;
	
}
///@function setDialogueStartNode(dialogue, startNode)
///@description Setter.
///@param {Dialogue} dialogue
///@param {String} startNode
///@throws {Exception}
///@generated {2021-05-01T23:49:39.433Z}

function setDialogueStartNode(dialogue, startNode) {

	dialogue[@ 1] = startNode;
	
}