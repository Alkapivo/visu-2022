///@function destroyChronosEvent(chronosEvent)
///@description Destroy ChronosEvent entity.
///@param {ChronosEvent} chronosEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function destroyChronosEvent(chronosEvent) {


	
	var instanceId = getChronosEventInstanceId(chronosEvent);
	var duration = getChronosEventDuration(chronosEvent);
	var handlerName = getChronosEventHandlerName(chronosEvent);
	var data = getChronosEventData(chronosEvent);
	
	if (isOptionalPresent(data)) {
		destroyArrayMap(data);
	}
	setChronosEventData(chronosEvent, null);
	

	
}
