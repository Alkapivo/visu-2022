///@function destroyDialoguePackage(dialoguePackage)
///@description Destroy DialoguePackage entity.
///@param {DialoguePackage} dialoguePackage
///@throws {Exception}
///@generated {2021-05-01T23:43:38.307Z}

function destroyDialoguePackage(dialoguePackage) {


	
	var dialogues = getDialoguePackageDialogues(dialoguePackage);
	
	for (var index = 0; index < getArrayLength(dialogues); index++) {
		var entity = dialogues[@ index];
		destroyDialogue(entity);
	}
	setDialoguePackageDialogues(dialoguePackage, null);
	

	
}
