///@function resolveDialogueOperations(dialogueOperations)
///@description Handler.
///@param {DialogueOperations} dialogueOperations
///@return {Boolean} isResolved
function resolveDialogueOperations(argument0) {

		var dialogueOperations = argument0;
	
		var result = false;
	
		var operations = getDialogueOperationsActions(dialogueOperations);
		var operationsLength = getArrayLength(operations);
		for (var index = 0; index < operationsLength; index++) {
		
			var operation = operations[@ index];
			var response = resolveDialogueOperation(operation);
		
			if (!isBoolean(response)) {
			
				throwException(
					createException(
						InvalidTypeException,
						stringParams("resolveDialogueOperation return type mismatch. { \"expectedType\": \"Boolean\", \"returnedData\": \"{0}\" }", response)
					)
				);
				clearException();
				result = false;
				break;
			}
		
			if (response == false) {
			
				result = false;
				break;	
			}
		
			result = response;
		}
	
		return result;
	



}
