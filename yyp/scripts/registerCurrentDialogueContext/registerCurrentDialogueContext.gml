///@function registerCurrentDialogueContext(dialogueContext)
///@description Register dialogueContext in DialogueManager::currentDialogueContext
///@param {DialogueContext} dialogueContext
function registerCurrentDialogueContext(argument0) {

		var dialogueContext = argument0;

		setInstanceVariable(getDialogueManager(), FieldDialogueManager_currentDialogueContext, dialogueContext);
	



}
