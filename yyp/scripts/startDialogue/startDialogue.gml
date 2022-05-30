///@function startDialogue(dialogueId)
///@description Create DialogueEvent.START and push it.
///@param {String} dialogueId
function startDialogue(argument0) {

		var dialogueId = argument0;
	
		var dialogueEvent = createDialogueEvent("START", dialogueId);
		sendDialogueEvent(dialogueEvent);


}
