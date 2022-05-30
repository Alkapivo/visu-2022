///@function destroyShroomEvent(shroomEvent)
///@description Destroy ShroomEvent entity.
///@param {ShroomEvent} shroomEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.787Z}

function destroyShroomEvent(shroomEvent) {


	
	var fields = getShroomEventFields(shroomEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in ShroomEvent");
	setShroomEventFields(shroomEvent, null);
	

	
}
