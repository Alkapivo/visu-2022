///@function createDialoguePackage(dialogues)
///@description Constructor for DialoguePackage entity.
///@param {Dialogue[]} dialogues
///@return {DialoguePackage} dialoguePackage 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function createDialoguePackage(dialogues) {

	var dialoguePackage = createEntity(DialoguePackage);

	setDialoguePackageDialogues(dialoguePackage, assertNoOptional(dialogues));

	return dialoguePackage;
	
}
