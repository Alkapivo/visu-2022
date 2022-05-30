///@function createGenericEvent(type, data, dispatcher)
///@description Constructor for GenericEvent entity.
///@param {String} type
///@param {Optional<ArrayMap>} data
///@param {Optional<AssetScript>} dispatcher
///@return {GenericEvent} genericEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.082Z}

function createGenericEvent(type, data, dispatcher) {

	var genericEvent = createEntity(GenericEvent);

	setGenericEventType(genericEvent, assertNoOptional(type));
	setGenericEventData(genericEvent, data);
	setGenericEventDispatcher(genericEvent, dispatcher);

	return genericEvent;
	
}
