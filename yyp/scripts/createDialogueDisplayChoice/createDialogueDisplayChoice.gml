///@function createDialogueDisplayChoice(pointer, text)
///@description Constructor for DialogueDisplayChoice entity.
///@param {Integer} pointer
///@param {String} text
///@return {DialogueDisplayChoice} dialogueDisplayChoice 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.528Z}

function createDialogueDisplayChoice(pointer, text) {

	var dialogueDisplayChoice = createEntity(DialogueDisplayChoice);

	setDialogueDisplayChoicePointer(dialogueDisplayChoice, assertNoOptional(pointer));
	setDialogueDisplayChoiceText(dialogueDisplayChoice, assertNoOptional(text));

	return dialogueDisplayChoice;
	
}
