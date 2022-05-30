///@function createDialogueEvent(type, data)
///@description Constructor for DialogueEvent entity.
///@param {String} type
///@param {ArrayMap} data
///@return {DialogueEvent} dialogueEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.659Z}

function createDialogueEvent(type, data) {

	var dialogueEvent = createEntity(DialogueEvent);

	setDialogueEventType(dialogueEvent, assertNoOptional(type));
	setDialogueEventData(dialogueEvent, assertNoOptional(data));

	return dialogueEvent;
	
}
