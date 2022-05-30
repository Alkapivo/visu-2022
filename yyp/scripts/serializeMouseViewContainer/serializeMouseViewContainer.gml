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
