///@function getUiPanelRenderHandler(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Optional<AssetScript~UiPanelRenderHandler>} handler
function getUiPanelRenderHandler(argument0) {

		var uiPanel = argument0;
	
		var handler = getInstanceVariable(uiPanel, FieldUiPanel_renderHandler)
	
		return handler;
	



}
