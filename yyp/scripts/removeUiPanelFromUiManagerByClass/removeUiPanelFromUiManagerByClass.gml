///@function removeUiPanelFromUiManagerByClass(uiManager, uiPanelClass, allInstances)
///@description Remove UiPanel from UiManager.
///@param {UiManager} uiManager
///@param {Class<UiPanel>} uiPanelClass
///@param {Boolean} [allInstances=true]
function removeUiPanelFromUiManagerByClass() {

		///checkArgumentCount(2, argument_count, removeUiPanelFromUiManagerByClass)

		var uiManager = argument[0];
		var uiPanelClass = argument[1];
		var allInstances = argument_count > 2 ? argument[2] : true;
	
		var uiPanels = getUiManagerUiPanels(uiManager);
		var result = false;
		if (isDataStructure(uiPanels, List)) {
		
			var uiPanelsSize = getListSize(uiPanels);
			for (var index = 0; index < uiPanelsSize; index++) {
					
				var uiPanel = uiPanels[| index];
				if (getInstanceClass(uiPanel) == uiPanelClass) {
				
					removeUiPanelFromUiManager(uiManager, uiPanel);
					result = true;
					if (!allInstances) {
				
						break;
					}
				}
			}
		}
	
		return result;
	



}
