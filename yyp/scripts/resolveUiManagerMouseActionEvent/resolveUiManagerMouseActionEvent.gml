///@function resolveUiManagerMouseActionEvent(uiManager, mouseActionEvent)
///@description Resolver of AssetScript~MouseActionEventHandler. @todo improve function signature description
///@param {UiManager?} uiManager
///@param {MouseActionEvent} mouseActionEvent
///@return {Boolean} result
function resolveUiManagerMouseActionEvent(argument0) {

		var mouseActionEvent = argument0;
	
		var uiManager = getMouseViewContainerUiManager(mouseViewContainer);
	
		var result = false;
	
		if (isInstanceChildOf(uiManager, UiManager)) {
	
			var uiPanels = getUiManagerUiPanels(uiManager);
			var uiPanelsSize = getListSize(uiPanels);
			for (var index = 0; index < uiPanelsSize; index++) {
		
				var uiPanel = uiPanels[| index];
				var isUiPanelActive = getUiPanelIsActive(uiPanel);
				if (isUiPanelActive) {
				
					var handler = getUiPanelMouseActionEventHandler(uiPanel);
					var response = runScript(handler, uiPanel, mouseActionEvent);
					if (response) {
					
						result = true;
						break;
					}
				}
			}
		} 
	
		return result;
	



}
