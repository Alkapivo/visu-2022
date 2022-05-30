///@function destroyGenericEvent(genericEvent)
///@description Destroy GenericEvent entity.
///@param {GenericEvent} genericEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function destroyGenericEvent(genericEvent) {


	
	var type = getGenericEventType(genericEvent);
	var data = getGenericEventData(genericEvent);
	var dispatcher = getGenericEventDispatcher(genericEvent);
	
	if (isOptionalPresent(data)) {
		destroyArrayMap(data);
	}
	setGenericEventData(genericEvent, null);
	

	
}
