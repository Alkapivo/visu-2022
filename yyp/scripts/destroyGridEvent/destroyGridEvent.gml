///@function destroyGridEvent(gridEvent)
///@description Destroy GridEvent entity.
///@param {GridEvent} gridEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function destroyGridEvent(gridEvent) {


	
	var fields = getGridEventFields(gridEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in GridEvent");
	setGridEventFields(gridEvent, null);
	

	
}
