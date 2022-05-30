///@function destroyDialogueOperation(dialogueOperation)
///@description Destroy DialogueOperation entity.
///@param {DialogueOperation} dialogueOperation
///@throws {Exception}
///@generated {2021-05-01T23:43:38.176Z}

function destroyDialogueOperation(dialogueOperation) {


	
	var action = getDialogueOperationAction(dialogueOperation);
	var data = getDialogueOperationData(dialogueOperation);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in DialogueOperation");
	setDialogueOperationData(dialogueOperation, null);
	

	
}
