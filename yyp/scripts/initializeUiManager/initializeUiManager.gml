///@function initializeUiManager(uiManager, data)
///@description Initialize UiManager.
///@param {UiManager?} uiManager
///@param {ArrayMap<String::any>} data
function initializeUiManager(argument0, argument1) {

		var uiManager = argument0;
		var data = argument1;
	
		var mouseViewContainer = getValueFromArrayMap(data, FieldUiManager_mouseViewContainer)
		if (isEntity(mouseViewContainer, MouseViewContainer)) {
		
			setInstanceVariable(uiManager, FieldUiManager_mouseViewContainer, mouseViewContainer);
			registerMouseViewContainer(mouseViewContainer);
		}
	
		var mouseViewContainerStepHandler = getValueFromArrayMap(data, FieldUiManager_mouseViewContainerStepHandler)
		if (isScript(mouseViewContainerStepHandler)) {
		
			setInstanceVariable(uiManager, FieldUiManager_mouseViewContainerStepHandler, mouseViewContainerStepHandler);
		}
	



}
