///@function getUiPanelStepHandler(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Optional<AssetScript~UiPanelStepHandler>} handler
function getUiPanelStepHandler(argument0) {

		var uiPanel = argument0;
	
		var handler = getInstanceVariable(uiPanel, FieldUiPanel_stepHandler)
	
		return handler;
	



}
