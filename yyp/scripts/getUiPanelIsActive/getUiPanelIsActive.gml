///@function getUiPanelIsActive(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Boolean} isActive
function getUiPanelIsActive(argument0) {

		var uiPanel = argument0;
	
		var isActive = getInstanceVariable(uiPanel, FieldUiPanel_isActive);
	
		return isBoolean(isActive) ? isActive : false;
	
	


}
