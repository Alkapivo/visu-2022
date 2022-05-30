///@function createUiActionEvent(data)
///@description Constructor for UiActionEvent entity.
///@param {GenericEntity} data
///@return {UiActionEvent} uiActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function createUiActionEvent(data) {

	var uiActionEvent = createEntity(UiActionEvent);

	setUiActionEventData(uiActionEvent, assertNoOptional(data));

	return uiActionEvent;
	
}
