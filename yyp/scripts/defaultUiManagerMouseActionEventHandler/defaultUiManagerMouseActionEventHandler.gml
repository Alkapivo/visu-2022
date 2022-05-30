///@function defaultUiManagerMouseActionEventHandler(mouseViewContainer, mouseActionEvent)
///@description Resolver.
///@param {MouseViewContainer} mouseViewContainer
///@param {MouseActionEvent} mouseActionEvent
///@return {Boolean} result;
function defaultUiManagerMouseActionEventHandler(argument0, argument1) {

		var mouseViewContainer = argument0;
		var mouseActionEvent = argument1;
	
		var result = false;
	
		var uiManager = getMouseViewContainerUiManager(mouseViewContainer);
	
		var uiPanels = getUiManagerUiPanels(uiManager);
		if (isDataStructure(uiPanels, List)) {
		
			var uiPanelsSize = getListSize(uiPanels);
			for (var index = uiPanelsSize - 1; index >= 0; index--) {
					
				var uiPanel = uiPanels[| index];
				var handler = getUiPanelMouseActionEventHandler(uiPanel);
				var handlerResult = runScript(handler, uiPanel, mouseActionEvent);
				if (handlerResult) {
				
					result = true;
					break;
				}
			}
		}
	
		return result;
	



}
