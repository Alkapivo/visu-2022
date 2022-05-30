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
