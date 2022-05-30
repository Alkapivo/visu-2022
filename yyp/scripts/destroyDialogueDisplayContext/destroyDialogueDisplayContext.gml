///@function destroyDialogueDisplayContext(dialogueDisplayContext)
///@description Destroy DialogueDisplayContext entity.
///@param {DialogueDisplayContext} dialogueDisplayContext
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function destroyDialogueDisplayContext(dialogueDisplayContext) {


	
	var author = getDialogueDisplayContextAuthor(dialogueDisplayContext);
	var text = getDialogueDisplayContextText(dialogueDisplayContext);
	var textLength = getDialogueDisplayContextTextLength(dialogueDisplayContext);
	var textPointer = getDialogueDisplayContextTextPointer(dialogueDisplayContext);
	var choices = getDialogueDisplayContextChoices(dialogueDisplayContext);
	var choicePointer = getDialogueDisplayContextChoicePointer(dialogueDisplayContext);
	
	setDialogueDisplayContextChoices(dialogueDisplayContext, null);
	

	
}
