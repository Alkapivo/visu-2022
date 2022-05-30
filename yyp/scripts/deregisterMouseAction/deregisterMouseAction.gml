///@function deregisterMouseAction(name)
///@description Remove MouseAction from MouseManager::Reactor<MouseAction>.
///@param {String} name
function deregisterMouseAction(argument0) {

		var name = argument0;
	
		var mouseManager = getMouseManager();
		var mouseActionReactor = getInstanceVariable(mouseManager, FieldMouseManager_mouseActionReactor);
		if (isEntity(mouseActionReactor, Reactor)) {
	
			var data = getReactorData(mouseActionReactor);
			if (isDataStructure(data, Map)) {
			
				removeFromMap(data, name);	
			}
		}
	



}
