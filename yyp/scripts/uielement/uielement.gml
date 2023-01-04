///@description UiElement entity

///@function createUiElement(area, actionHandler)
///@description Constructor for UiElement entity.
///@param {Rectangle} area
///@param {Map<MouseActionType::AssetScript>} actionHandler
///@return {UiElement} uiElement 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.652Z}

function createUiElement(area, actionHandler) {

	var uiElement = createEntity(UiElement);

	setUiElementArea(uiElement, assertNoOptional(area));
	setUiElementActionHandler(uiElement, assertNoOptional(actionHandler));

	return uiElement;
	
}
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
///@function destroyUiElement(uiElement)
///@description Destroy UiElement entity.
///@param {UiElement} uiElement
///@throws {Exception}
///@generated {2021-05-01T23:43:43.126Z}

function destroyUiElement(uiElement) {


	
	var area = getUiElementArea(uiElement);
	var actionHandler = getUiElementActionHandler(uiElement);
	
	destroyRectangle(area);
	setUiElementArea(uiElement, null);
	
	destroyDataStructure(actionHandler, Map, "Unable to destroy Map actionHandler in UiElement");
	setUiElementActionHandler(uiElement, null);
	

	
}
///@function getUiElementActionHandler(uiElement)
///@description Getter.
///@param {UiElement} uiElement
///@return {Map<MouseActionType::AssetScript>} actionHandler 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.126Z}

function getUiElementActionHandler(uiElement) {

	return uiElement[@ 1];
	
}
///@function getUiElementArea(uiElement)
///@description Getter.
///@param {UiElement} uiElement
///@return {Rectangle} area 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.126Z}

function getUiElementArea(uiElement) {

	return uiElement[@ 0];
	
}
///@function setUiElementActionHandler(uiElement, actionHandler)
///@description Setter.
///@param {UiElement} uiElement
///@param {Map<MouseActionType::AssetScript>} actionHandler
///@throws {Exception}
///@generated {2021-05-01T23:49:41.652Z}

function setUiElementActionHandler(uiElement, actionHandler) {

	uiElement[@ 1] = actionHandler;
	
}
///@function setUiElementArea(uiElement, area)
///@description Setter.
///@param {UiElement} uiElement
///@param {Rectangle} area
///@throws {Exception}
///@generated {2021-05-01T23:49:41.652Z}

function setUiElementArea(uiElement, area) {

	uiElement[@ 0] = area;
	
}
