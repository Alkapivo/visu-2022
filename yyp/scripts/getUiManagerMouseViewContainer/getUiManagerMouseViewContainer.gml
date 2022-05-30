///@function getUiManagerMouseViewContainer(uiManager)
///@description Getter.
///@param {UiManager?} uiManager
///@return {MouseViewContainer} mouseViewContainer
function getUiManagerMouseViewContainer(argument0) {

		var uiManager = argument0;
	
		var mouseViewContainer = getInstanceVariable(uiManager, FieldUiManager_mouseViewContainer);
	
		return mouseViewContainer;
	



}
