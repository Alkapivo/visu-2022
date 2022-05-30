///@function registerMouseViewContainer(mouseViewContainer)
///@description Add MouseViewContainer to MouseManager::List<String> and 
///				MouseManager::Repository<MouseViewContainer>.
///@param {MouseViewContainer} mouseViewContainer
function registerMouseViewContainer(argument0) {

		var mouseViewContainer = argument0;
	
		var mouseViewContainerName = getMouseViewContainerName(mouseViewContainer);
	
		var mouseManager = getMouseManager();
	
		/*
		var mouseActions = getMouseViewContainerMouseActions(mouseViewContainer);
		var mouseActionReactor = getInstanceVariable(mouseManager, FieldMouseManager_mouseActionReactor);
		if (isEntity(mouseActionReactor, Reactor)) {
		
			var data = getReactorData(mouseActionReactor);
			if (isDataStructure(data, Map)) {
			
				var mouseActionsLength = getArrayLength(mouseActions);
				for (var index = 0; index < mouseActionsLength; index++) {
				
					var mouseAction = mouseActions[@ index];	
					registerMouseAction(mouseAction);
				}
			}
		}
		*/
	
		var mouseViewContainers = getInstanceVariable(mouseManager, FieldMouseManager_mouseViewContainers);
		saveInRepository(mouseViewContainers, mouseViewContainerName, mouseViewContainer);
	
		var mouseViewContainersOrder = getInstanceVariable(mouseManager, FieldMouseManager_mouseViewContainersOrder);
		addToList(mouseViewContainersOrder, mouseViewContainerName);
	



}
