///@function getUiManagerUiPanels(uiManager)
///@description Getter.
///@param {UiManager?} uiManager
///@return {List<UiPanel>} uiPanels
function getUiManagerUiPanels(argument0) {

		var uiManager = argument0;
	
		var uiPanels = getInstanceVariable(uiManager, FieldUiManager_uiPanels);
	
		return uiPanels;
	



}
