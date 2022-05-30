///@function getUiPanelUiActionEventHandler(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Optional<AssetScript~UiPanelUiActionEventHandler>} handler
function getUiPanelUiActionEventHandler(argument0) {

		var uiPanel = argument0;
	
		var handler = getInstanceVariable(uiPanel, FieldUiPanel_uiActionEventHandler)
	
		return handler;
	



}
