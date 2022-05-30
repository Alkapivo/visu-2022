///@function dispatchDialogueEventEnd(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventEnd(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		IsTradePanel = false;
		removeUiPanelFromUiManagerByClass(getHudUiManager(), TradePanel);
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		setInstanceVariable(getDialogueManager(), "barVerticalPositionTarget", 0.0);
		setInstanceVariable(getDialogueManager(), "endEventDialogueContext", dialogueContext);
	



}
