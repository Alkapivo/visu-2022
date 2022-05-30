///@function serializeUiElement(uiElement)
///@description Serialize UiElement to JSON string.
///@param {UiElement} uiElement
///@return {String} uiElementJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.126Z}

function serializeUiElement(uiElement) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"area",
		getUiElementArea(uiElement),
		"Rectangle");
	
	appendFieldToJsonObject(
		jsonObject,
		"actionHandler",
		getUiElementActionHandler(uiElement),
		Map);
	

	var uiElementJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return uiElementJsonString;
	
}
