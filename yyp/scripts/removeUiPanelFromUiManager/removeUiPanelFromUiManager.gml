///@function removeUiPanelFromUiManager(uiManager, uiPanel)
///@description Remove UiPanel from UiManager::UiPanel?.
///@param {UiManager} uiManager
///@param {UiPanel} uiPanel
function removeUiPanelFromUiManager(argument0, argument1) {

		var uiManager = argument0;
		var uiPanel = argument1;
	
		var uiPanels = getUiManagerUiPanels(uiManager);
		removeFromList(uiPanels, uiPanel);
	
		destroy(uiPanel);
	



}
