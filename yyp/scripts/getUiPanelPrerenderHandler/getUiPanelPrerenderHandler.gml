///@function getUiPanelPrerenderHandler(uiPanel)
///@description Getter.
///@param {UiPanel?} uiPanel
///@return {Optional<AssetScript~UiPanelRenderHandler>} handler
function getUiPanelPrerenderHandler(argument0) {

		var uiPanel = argument0;
	
		var handler = getInstanceVariable(uiPanel, FieldUiPanel_prerenderHandler)
	
		return handler;
	



}
