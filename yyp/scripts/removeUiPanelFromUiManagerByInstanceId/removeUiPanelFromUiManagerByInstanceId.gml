///@function removeUiPanelFromUiManagerByInstanceId(uiManager, instanceId)
///@description Remove UiPanel from UiManager.
///@param {UiManager} uiManager
///@param {UiPanel} uiPanel
function removeUiPanelFromUiManagerByInstanceId(argument0, argument1) {

		var uiManager = argument0;
		var instanceId = argument1;
	
		var uiPanels = getUiManagerUiPanels(uiManager);
		if (isDataStructure(uiPanels, List)) {
		
			var uiPanelsSize = getListSize(uiPanels);
			for (var index = 0; index < uiPanelsSize; index++) {
					
				var uiPanel = uiPanels[| index];
			
				if (uiPanel == instanceId) {
				
					removeUiPanelFromUiManager(uiManager, uiPanel);
					break;
				}
			}
		}
	



}
