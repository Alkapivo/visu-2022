///@function sendDialogueEvent(event)
///@description Add DialogueEvent to DialogueManager::dialogueEventPipeline.
///@param {DialogueEvent} event
function sendDialogueEvent(argument0) {

		var event = argument0;
	
		if (isEntity(event, DialogueEvent)) {
			var dialogueEventPipeline = getInstanceVariable(getDialogueManager(), FieldDialogueManager_dialogueEventPipeline);
			addElementToPipeline(dialogueEventPipeline, event)	
		}
	



}
