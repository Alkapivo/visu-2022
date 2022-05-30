///@function renderUiManager(uiManager)
///@description Renderer.
///@param {UiManager?} uiManager
function renderUiManager(argument0) {

		var uiManager = argument0;
	
		if (instanceExists(uiManager)) {
	
			var uiPanels = getUiManagerUiPanels(uiManager);
			if (isDataStructure(uiPanels, List)) {
			
				var uiPanelsSize = getListSize(uiPanels);
				for (var index = 0; index < uiPanelsSize; index++) {
		
					var uiPanel = uiPanels[| index];
					var handler = getUiPanelRenderHandler(uiPanel);
					if (isScript(handler)) {
			
						runScript(handler, uiManager, uiPanel);	
					}
				}
			}
		}
	



}
