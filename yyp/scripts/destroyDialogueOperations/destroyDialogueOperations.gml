///@function destroyDialogueOperations(dialogueOperations)
///@description Destroy DialogueOperations entity.
///@param {DialogueOperations} dialogueOperations
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function destroyDialogueOperations(dialogueOperations) {


	
	var actions = getDialogueOperationsActions(dialogueOperations);
	
	for (var index = 0; index < getArrayLength(actions); index++) {
		var entity = actions[@ index];
		destroyDialogueOperation(entity);
	}
	setDialogueOperationsActions(dialogueOperations, null);
	

	
}
