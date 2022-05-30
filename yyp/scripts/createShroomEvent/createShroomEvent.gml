///@function createShroomEvent(fields)
///@description Constructor for ShroomEvent entity.
///@param {Map<String::any>} fields
///@return {ShroomEvent} shroomEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.787Z}

function createShroomEvent(fields) {

	var shroomEvent = createEntity(ShroomEvent);

	setShroomEventFields(shroomEvent, assertNoOptional(fields));

	return shroomEvent;
	
}
