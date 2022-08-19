///@function createShroomEvent(fields)
///@description Constructor for ShroomEvent entity.
///@param {Map<String::any>} fields
///@return {ShroomEvent} shroomEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.912Z}

function createShroomEvent(fields) {

	var shroomEvent = createEntity(ShroomEvent);

	setShroomEventFields(shroomEvent, assertNoOptional(fields));

	return shroomEvent;
	
}
