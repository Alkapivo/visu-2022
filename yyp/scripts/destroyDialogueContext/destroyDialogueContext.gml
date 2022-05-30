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
