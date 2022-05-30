///@function setDialogueDisplayContext(dialogueDisplayContext)
///@description Setter.
///@param {Optional<DialogueDisplayContext>} dialogueDisplayContext
function setDialogueDisplayContext(argument0) {

		var dialogueDisplayContext = argument0;

		var dialogueManager = getDialogueManager();
	
		setInstanceVariable(dialogueManager, FieldDialogueManager_currentDialogueDisplayContext, dialogueDisplayContext);




}
