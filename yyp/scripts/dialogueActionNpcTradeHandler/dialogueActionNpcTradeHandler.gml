///@function dialogueActionNpcTradeHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionNpcTradeHandler(argument0) {

		var data = argument0;
	
		var tradePanel = spawnUiPanel(getDialogueManager(), TradePanel);
		addUiPanelToUiManager(getDialogueManager(), tradePanel);
		IsTradePanel = true;
	
		return true;
	



}
