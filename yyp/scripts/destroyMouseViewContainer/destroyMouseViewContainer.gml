///@function destroyMouseViewContainer(mouseViewContainer)
///@description Destroy MouseViewContainer entity.
///@param {MouseViewContainer} mouseViewContainer
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function destroyMouseViewContainer(mouseViewContainer) {


	
	var name = getMouseViewContainerName(mouseViewContainer);
	var area = getMouseViewContainerArea(mouseViewContainer);
	var mouseActions = getMouseViewContainerMouseActions(mouseViewContainer);
	var mouseActionEventHandler = getMouseViewContainerMouseActionEventHandler(mouseViewContainer);
	var uiManager = getMouseViewContainerUiManager(mouseViewContainer);
	
	destroyRectangle(area);
	setMouseViewContainerArea(mouseViewContainer, null);
	
	setMouseViewContainerMouseActions(mouseViewContainer, null);
	

	
}
