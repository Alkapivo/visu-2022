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
