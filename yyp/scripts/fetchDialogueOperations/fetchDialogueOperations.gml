///@function fetchDialogueOperations(dialogueNode)
///@description Deserialize action from DialogueNode.
///@param {DialogueNode} dialogueNode
///@return {Optional<DialogueOperations>} dialogueOperations
function fetchDialogueOperations(argument0) {

		var dialogueNode = argument0;
	
		var jsonActionArray = getDialogueNodeAction(dialogueNode);
	
		if (!isString(jsonActionArray)) {
			return createEmptyOptional();	
		}
	
		var serializedDialogueOperations = stringParams("{ \"actions\": {0} }", jsonActionArray);
	
		var dialogueOperations = deserializeDialogueOperations(serializedDialogueOperations);
	
		return isEntity(dialogueOperations, DialogueOperations) ? dialogueOperations : createEmptyOptional();
	

	



}
