///@description MouseViewContainer entity

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
///@function serializeMouseViewContainer(mouseViewContainer)
///@description Serialize MouseViewContainer to JSON string.
///@param {MouseViewContainer} mouseViewContainer
///@return {String} mouseViewContainerJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.072Z}

function serializeMouseViewContainer(mouseViewContainer) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getMouseViewContainerName(mouseViewContainer));	
	appendEntityToJsonObject(
		jsonObject,
		"area",
		getMouseViewContainerArea(mouseViewContainer),
		"Rectangle");
	
	appendFieldToJsonObject(
		jsonObject,
		"mouseActions",
		getMouseViewContainerMouseActions(mouseViewContainer),
		Array);
	
	appendFieldToJsonObject(
		jsonObject,
		"mouseActionEventHandler",
		getMouseViewContainerMouseActionEventHandler(mouseViewContainer));	
	if (isOptionalPresent(getMouseViewContainerUiManager(mouseViewContainer))) {
		appendFieldToJsonObject(
			jsonObject,
			"uiManager",
			getMouseViewContainerUiManager(mouseViewContainer));
	}
	

	var mouseViewContainerJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseViewContainerJsonString;
	
}
///@function deserializeMouseViewContainer(jsonString)
///@description Deserialize MouseViewContainer from JSON String to MouseViewContainer entity.
///@param {String} jsonString
///@return {MouseViewContainer} mouseViewContainer 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function deserializeMouseViewContainer(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var area = assertNoOptional(getJsonObjectFieldValue(jsonObject, "area", Entity, "Rectangle"));
	var mouseActions = assertNoOptional(getJsonObjectFieldValue(jsonObject, "mouseActions", Array));
	var mouseActionEventHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "mouseActionEventHandler"));
	var uiManager = getJsonObjectFieldValue(jsonObject, "uiManager");

	destroyJsonObject(jsonObject);
	
	return createMouseViewContainer(name, area, mouseActions, mouseActionEventHandler, uiManager);
	
}
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
///@function getMouseViewContainerArea(mouseViewContainer)
///@description Getter.
///@param {MouseViewContainer} mouseViewContainer
///@return {Rectangle} area 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function getMouseViewContainerArea(mouseViewContainer) {

	return mouseViewContainer[@ 1];
	
}
///@function getMouseViewContainerMouseActionEventHandler(mouseViewContainer)
///@description Getter.
///@param {MouseViewContainer} mouseViewContainer
///@return {AssetScript} mouseActionEventHandler 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function getMouseViewContainerMouseActionEventHandler(mouseViewContainer) {

	return mouseViewContainer[@ 3];
	
}
///@function getMouseViewContainerMouseActions(mouseViewContainer)
///@description Getter.
///@param {MouseViewContainer} mouseViewContainer
///@return {String[]} mouseActions 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function getMouseViewContainerMouseActions(mouseViewContainer) {

	return mouseViewContainer[@ 2];
	
}
///@function getMouseViewContainerName(mouseViewContainer)
///@description Getter.
///@param {MouseViewContainer} mouseViewContainer
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function getMouseViewContainerName(mouseViewContainer) {

	return mouseViewContainer[@ 0];
	
}
///@function getMouseViewContainerUiManager(mouseViewContainer)
///@description Getter.
///@param {MouseViewContainer} mouseViewContainer
///@return {Optional<UiManager>} uiManager 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.073Z}

function getMouseViewContainerUiManager(mouseViewContainer) {

	return mouseViewContainer[@ 4];
	
}
///@function setMouseViewContainerArea(mouseViewContainer, area)
///@description Setter.
///@param {MouseViewContainer} mouseViewContainer
///@param {Rectangle} area
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function setMouseViewContainerArea(mouseViewContainer, area) {

	mouseViewContainer[@ 1] = area;
	
}
///@function setMouseViewContainerMouseActionEventHandler(mouseViewContainer, mouseActionEventHandler)
///@description Setter.
///@param {MouseViewContainer} mouseViewContainer
///@param {AssetScript} mouseActionEventHandler
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function setMouseViewContainerMouseActionEventHandler(mouseViewContainer, mouseActionEventHandler) {

	mouseViewContainer[@ 3] = mouseActionEventHandler;
	
}
///@function setMouseViewContainerMouseActions(mouseViewContainer, mouseActions)
///@description Setter.
///@param {MouseViewContainer} mouseViewContainer
///@param {String[]} mouseActions
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function setMouseViewContainerMouseActions(mouseViewContainer, mouseActions) {

	mouseViewContainer[@ 2] = mouseActions;
	
}
///@function setMouseViewContainerName(mouseViewContainer, name)
///@description Setter.
///@param {MouseViewContainer} mouseViewContainer
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function setMouseViewContainerName(mouseViewContainer, name) {

	mouseViewContainer[@ 0] = name;
	
}
///@function setMouseViewContainerUiManager(mouseViewContainer, uiManager)
///@description Setter.
///@param {MouseViewContainer} mouseViewContainer
///@param {Optional<UiManager>} uiManager
///@throws {Exception}
///@generated {2021-05-01T23:49:41.632Z}

function setMouseViewContainerUiManager(mouseViewContainer, uiManager) {

	mouseViewContainer[@ 4] = uiManager;
	
}
