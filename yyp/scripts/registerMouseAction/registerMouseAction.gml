///@function registerMouseAction(mouseAction)
///@description Add MouseInputState to MouseManager::Reactor<MouseAction>.
///@param {MouseAction} mouseAction
function registerMouseAction(argument0) {

		var mouseAction = argument0;
	
		var mouseManager = getMouseManager();
		var mouseActionReactor = getInstanceVariable(mouseManager, FieldMouseManager_mouseActionReactor);
	
		var key = getMouseActionType(mouseAction)
		addElementToReactor(mouseActionReactor, mouseAction, key);	
	



}
