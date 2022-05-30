///@param {T~UiManager} uiManager
///@param {Class<U~UiPanel>} uiPanelClass
///@return {Optional<U~UiPanel> uiPanel
function findUiManagerUiPanel(uiManager, uiPanelClass) {

	var uiPanels = getUiManagerUiPanels(uiManager);
	if (isDataStructure(uiPanels, List)) {
	
		for (var index = getListSize(uiPanels) - 1; index >= 0; index--) {
	
			var uiPanel = uiPanels[| index];
			if (isInstanceTypeOf(uiPanel, uiPanelClass)) {
		
				return uiPanel;
			}
		}
	}
	
	return createEmptyOptional();
}
