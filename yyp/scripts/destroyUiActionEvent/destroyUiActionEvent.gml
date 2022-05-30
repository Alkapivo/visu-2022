///@function destroyUiActionEvent(uiActionEvent)
///@description Destroy UiActionEvent entity.
///@param {UiActionEvent} uiActionEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function destroyUiActionEvent(uiActionEvent) {


	
	var data = getUiActionEventData(uiActionEvent);
	
	destroyGenericEntity(data);
	setUiActionEventData(uiActionEvent, null);
	

	
}
