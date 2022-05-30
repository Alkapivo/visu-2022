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
