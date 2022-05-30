///@function getDialogueDisplayContext()
///@description Getter.
///@return {Optional<DialogueDisplayContext>} dialogueDisplayContext
function getDialogueDisplayContext() {

		var dialogueManager = getDialogueManager();
	
		var dialogueDisplayContext = getInstanceVariable(dialogueManager, FieldDialogueManager_currentDialogueDisplayContext);
	
		return dialogueDisplayContext;


}
