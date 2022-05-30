///@function fetchDialogueChoiceOperations(dialogueChoice)
///@description Deserialize action from DialogueChoice.
///@param {DialogueChoice} dialogueChoice
///@return {Optional<DialogueOperations>} dialogueOperations
function fetchDialogueChoiceOperations(argument0) {

		var dialogueChoice = argument0;
	
		var jsonActionArray = getDialogueChoiceConditionData(dialogueChoice);
	
		if (!isString(jsonActionArray)) {
			return createEmptyOptional();	
		}
	
		var serializedDialogueOperations = stringParams("{ \"actions\": {0} }", jsonActionArray);
	
		var dialogueOperations = deserializeDialogueOperations(serializedDialogueOperations);
	
		return isEntity(dialogueOperations, DialogueOperations) ? dialogueOperations : createEmptyOptional();
	



}
