///@function resolveDialogueOperation(dialogueOperation)
///@description Handler.
///@param {DialogueOperation} dialogueOperation
///@return {Boolean} isResolved
function resolveDialogueOperation(argument0) {

		var dialogueOperation = argument0;
	
		var action = getDialogueOperationAction(dialogueOperation);
		var data = getDialogueOperationData(dialogueOperation);
	
		var dispatcher = DialogueActionImplementationDictionary[? action];
	
		if (!isScript(dispatcher)) {
			throwException(
				createException(
					NotImplementedException,
					stringParams("Found not implemented DialogueOperation action. { \"action\": \"{0}\" }", action)
				)
			);
			return false;
		}
	
		var result = runScript(dispatcher, data);
	
		return result;
	



}
