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
