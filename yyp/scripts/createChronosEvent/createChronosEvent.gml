///@function createChronosEvent(instanceId, duration, handlerName, data)
///@description Constructor for ChronosEvent entity.
///@param {Instance} instanceId
///@param {Number} duration
///@param {Optional<String>} handlerName
///@param {Optional<ArrayMap>} data
///@return {ChronosEvent} chronosEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:40.798Z}

function createChronosEvent(instanceId, duration, handlerName, data) {

	var chronosEvent = createEntity(ChronosEvent);

	setChronosEventInstanceId(chronosEvent, assertNoOptional(instanceId));
	setChronosEventDuration(chronosEvent, assertNoOptional(duration));
	setChronosEventHandlerName(chronosEvent, handlerName);
	setChronosEventData(chronosEvent, data);

	return chronosEvent;
	
}
