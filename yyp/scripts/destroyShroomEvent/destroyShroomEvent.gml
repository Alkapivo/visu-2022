///@function destroyShroomEvent(shroomEvent)
///@description Destroy ShroomEvent entity.
///@param {ShroomEvent} shroomEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.913Z}

function destroyShroomEvent(shroomEvent) {


	
	var fields = getShroomEventFields(shroomEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in ShroomEvent");
	setShroomEventFields(shroomEvent, null);
	

	
}
