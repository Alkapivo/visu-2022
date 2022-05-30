///@function destroyDialogueEvent(dialogueEvent)
///@description Destroy DialogueEvent entity.
///@param {DialogueEvent} dialogueEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:38.353Z}

function destroyDialogueEvent(dialogueEvent) {


	
	var type = getDialogueEventType(dialogueEvent);
	var data = getDialogueEventData(dialogueEvent);
	
	destroyArrayMap(data);
	setDialogueEventData(dialogueEvent, null);
	

	
}
