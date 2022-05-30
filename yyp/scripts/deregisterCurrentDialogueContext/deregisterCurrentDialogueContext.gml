///@function deregisterCurrentDialogueContext()
///@description Deregister dialogueContext from DialogueManager::currentDialogueContext.
function deregisterCurrentDialogueContext(argument0) {

		var dialogueContext = argument0;

		setInstanceVariable(getDialogueManager(), FieldDialogueManager_currentDialogueContext, createEmptyOptional());
		setInstanceVariable(getDialogueManager(), FieldDialogueManager_currentDialogueDisplayContext, createEmptyOptional());
	



}
