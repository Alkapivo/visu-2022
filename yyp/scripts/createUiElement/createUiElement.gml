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
