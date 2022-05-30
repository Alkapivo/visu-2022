///@function defaultDialgoueEventExceptionHandler(dialogueEvent)
///@description Exception wrapper.
///@param {DialogueEvent} dialogueEvent
function defaultDialgoueEventExceptionHandler(argument0) {
	
		var dialogueEvent = argument0;
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		throwException(
			createException(
				DialogueManagerException,
				stringParams("Unable to dispatch dialogueEvent. { \"type\": \"{0}\", \"data\": \"{1}\" }", type, data)
			)
		);
	
		var endEvent = createDialogueEvent(DialogueEventType_END, createArrayMap());
		sendDialogueEvent(endEvent);
	



}
