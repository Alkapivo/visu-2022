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
