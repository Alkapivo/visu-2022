///@function destroyGridEvent(gridEvent)
///@description Destroy GridEvent entity.
///@param {GridEvent} gridEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.575Z}

function destroyGridEvent(gridEvent) {


	
	var fields = getGridEventFields(gridEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in GridEvent");
	setGridEventFields(gridEvent, null);
	

	
}
