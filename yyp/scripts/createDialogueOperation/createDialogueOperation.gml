///@function createDialogueOperation(action, data)
///@description Constructor for DialogueOperation entity.
///@param {DialogueAction} action
///@param {Map<String::Object>} data
///@return {DialogueOperation} dialogueOperation 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.563Z}

function createDialogueOperation(action, data) {

	var dialogueOperation = createEntity(DialogueOperation);

	setDialogueOperationAction(dialogueOperation, assertNoOptional(action));
	setDialogueOperationData(dialogueOperation, assertNoOptional(data));

	return dialogueOperation;
	
}
