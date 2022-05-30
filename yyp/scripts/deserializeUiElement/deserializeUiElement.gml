///@function deserializeUiElement(jsonString)
///@description Deserialize UiElement from JSON String to UiElement entity.
///@param {String} jsonString
///@return {UiElement} uiElement 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.126Z}

function deserializeUiElement(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var area = assertNoOptional(getJsonObjectFieldValue(jsonObject, "area", Entity, "Rectangle"));
	var actionHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "actionHandler", Map));

	destroyJsonObject(jsonObject);
	
	return createUiElement(area, actionHandler);
	
}
