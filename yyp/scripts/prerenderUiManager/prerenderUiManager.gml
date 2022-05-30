///@function prerenderUiManager(uiManager)
///@description Renderer.
///@param {UiManager?} uiManager
function prerenderUiManager(argument0) {

		var uiManager = argument0;
	
		if (instanceExists(uiManager)) {
	
			var uiPanels = getUiManagerUiPanels(uiManager);
			var uiPanelsSize = getListSize(uiPanels);
			for (var index = 0; index < uiPanelsSize; index++) {
		
				var uiPanel = uiPanels[| index];
				var handler = getUiPanelPrerenderHandler(uiPanel);
				if (isScript(handler)) {
			
				#macro NULL_SURFACE_TARGET -1
					if (surface_get_target() == NULL_SURFACE_TARGET) {
					
						runScript(handler, uiManager, uiPanel);		
					}
				}
			}
		}
	



}
