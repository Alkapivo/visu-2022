///@function getDialogueContext()
///@description Getter.
///@return {Optional<DialogueContext>}
function getDialogueContext() {

		var dialogueManager = getDialogueManager();
	
		var currentDialogueContext = getInstanceVariable(dialogueManager, FieldDialogueManager_currentDialogueContext);
	
		return currentDialogueContext;
	



}
