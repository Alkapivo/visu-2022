///@function createGridEvent(fields)
///@description Constructor for GridEvent entity.
///@param {Map<String::any>} fields
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function createGridEvent(fields) {

	var gridEvent = createEntity(GridEvent);

	setGridEventFields(gridEvent, assertNoOptional(fields));

	return gridEvent;
	
}
