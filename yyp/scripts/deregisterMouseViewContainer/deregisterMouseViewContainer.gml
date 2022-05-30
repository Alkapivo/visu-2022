///@function deregisterMouseViewContainer(name)
///@description Remove MouseViewContainer from MouseManager::mouseViewContainersOrder and 
///				MouseManager::Repository<MouseViewContainer>.
///@param {String} name
function deregisterMouseViewContainer(argument0) {

		var name = argument0;
	
		var mouseManager = getMouseManager();
		
		var mouseViewContainers = getInstanceVariable(mouseManager, FieldMouseManager_mouseViewContainers);
	
		/*
	#region Fetch requiredMouseActionNames[]
		var containers = getRepositoryData(mouseViewContainers);
		var requiredMouseActionNames = [];
		for (var containerName = mapFirst(containers);
			 iteratorFinish(containerName);
			 containerName = mapNext(containers, containerName)) {
		
			var container = containers[? containerName];
			var containerName = getMouseViewContainerName(container);
			if (containerName == name) {
			
				continue;	
			}
		
			var mouseActions = getMouseViewContainerMouseActions(container);
			var mouseActionsLength = getArrayLength(mouseActions);
			for (var index = 0; index < mouseActionsLength; index++) {
			
				var mouseAction = mouseActions[@ index];
				var mouseActionName = getMouseActionType(mouseAction);
				pushArray(requiredMouseActionNames, mouseActionName);	
			}
		}
	#endregion
	
		var mouseViewContainer = findInRepositoryById(mouseViewContainers, name);
		var mouseActions = getMouseViewContainerMouseActions(mouseViewContainer);
		var mouseActionsLength = getArrayLength(mouseActions);
		for (var index = 0; index < mouseActionsLength; index++) {
			
			var mouseAction = mouseActions[@ index];
			var mouseActionName = getMouseActionType(mouseAction);
			if (!arrayContain(requiredMouseActionNames, mouseActionName)) {
			
				deregisterMouseAction(mouseActionName);
			}
		}
		*/

		removeFromRepositoryById(mouseViewContainers, name);
	
		var mouseViewContainersOrder = getInstanceVariable(mouseManager, FieldMouseManager_mouseViewContainersOrder);
		removeFromList(mouseViewContainersOrder, name);
	



}
