///@function getUiPanelMouseActionEventHandler(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Optional<AssetScript~UiPanelMouseActionEventHandler>} handler
function getUiPanelMouseActionEventHandler(argument0) {

		var uiPanel = argument0;
	
		var handler = getInstanceVariable(uiPanel, FieldUiPanel_mouseActionEventHandler)
	
		return handler;
	



}
