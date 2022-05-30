///@function fetchDialogueEventDispatcher(dialogueEvent)
///@param {DialogueEvent} dialogueEvent
///@return {Optional<AssetScript~DialogueEventDispatcher>} dispatcher
function fetchDialogueEventDispatcher(argument0) {

		var dialogueEvent = argument0;
	
		var type = getDialogueEventType(dialogueEvent);
		var dispatcher = getFromMap(DialogueEventDispatchers, type);

		return dispatcher;
	



}
