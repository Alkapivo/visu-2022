///@function addUiPanelToUiManager(uiManager, uiPanel)
///@description Add UiPanel to UiManager::UiPanel?.
///@param {UiManager} uiManager
///@param {UiPanel} uiPanel
function addUiPanelToUiManager(argument0, argument1) {

		var uiManager = argument0;
		var uiPanel = argument1;
	
		var uiPanels = getUiManagerUiPanels(uiManager);
		addToList(uiPanels, uiPanel);
	



}
