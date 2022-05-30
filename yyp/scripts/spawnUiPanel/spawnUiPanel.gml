///@function spawnUiPanel(uiManager, uiPanelClass, data)
///@description Constructor.
///@param {Class<T?UiManager>} uiManager
///@param {Class<T?UiPanel>} uiPanelClass
///@param {Optional<ArrayMap<String::any>>} [data=null]
///@return {T?UiPanel} uiPanel
function spawnUiPanel() {

		///checkArgumentCount(2, argument_count, spawnUiPanel);

		var uiManager = argument[0];
		var uiPanelClass = argument[1];
		var data = argument_count > 2 ? argument[2] : createEmptyOptional();
	
		var uiPanel = construct(uiPanelClass, getRenderLayer());
		setInstanceVariable(uiPanel, FieldUiPanel_uiManager, uiManager);
		//runScript(getInstanceVariable(uiPanel, "constructorHandler"), uiPanel, data); ///@todo move to construct()
	
		return uiPanel;
	



}
