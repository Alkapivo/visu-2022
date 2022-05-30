///@function createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer)
///@description Constructor for DialogueDisplayContext entity.
///@param {Optional<String>} author
///@param {String} text
///@param {Integer} textLength
///@param {Integer} textPointer
///@param {Optional<String[]>} choices
///@param {Optional<Integer>} choicePointer
///@return {DialogueDisplayContext} dialogueDisplayContext 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.584Z}

function createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer) {

	var dialogueDisplayContext = createEntity(DialogueDisplayContext);

	setDialogueDisplayContextAuthor(dialogueDisplayContext, author);
	setDialogueDisplayContextText(dialogueDisplayContext, assertNoOptional(text));
	setDialogueDisplayContextTextLength(dialogueDisplayContext, assertNoOptional(textLength));
	setDialogueDisplayContextTextPointer(dialogueDisplayContext, assertNoOptional(textPointer));
	setDialogueDisplayContextChoices(dialogueDisplayContext, choices);
	setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer);

	return dialogueDisplayContext;
	
}
