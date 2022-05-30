///@function createMouseViewContainer(name, area, mouseActions, mouseActionEventHandler, uiManager)
///@description Constructor for MouseViewContainer entity.
///@param {String} name
///@param {Rectangle} area
///@param {String[]} mouseActions
///@param {AssetScript} mouseActionEventHandler
///@param {Optional<UiManager>} uiManager
///@return {MouseViewContainer} mouseViewContainer 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function createMouseViewContainer(name, area, mouseActions, mouseActionEventHandler, uiManager) {

	var mouseViewContainer = createEntity(MouseViewContainer);

	setMouseViewContainerName(mouseViewContainer, assertNoOptional(name));
	setMouseViewContainerArea(mouseViewContainer, assertNoOptional(area));
	setMouseViewContainerMouseActions(mouseViewContainer, assertNoOptional(mouseActions));
	setMouseViewContainerMouseActionEventHandler(mouseViewContainer, assertNoOptional(mouseActionEventHandler));
	setMouseViewContainerUiManager(mouseViewContainer, uiManager);

	return mouseViewContainer;
	
}
