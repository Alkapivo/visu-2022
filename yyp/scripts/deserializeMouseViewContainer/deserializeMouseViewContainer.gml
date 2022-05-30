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
