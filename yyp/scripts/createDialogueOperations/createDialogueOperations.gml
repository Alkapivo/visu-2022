///@function createDialogueOperations(actions)
///@description Constructor for DialogueOperations entity.
///@param {DialogueOperation[]} actions
///@return {DialogueOperations} dialogueOperations 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.211Z}

function createDialogueOperations(actions) {

	var dialogueOperations = createEntity(DialogueOperations);

	setDialogueOperationsActions(dialogueOperations, assertNoOptional(actions));

	return dialogueOperations;
	
}
