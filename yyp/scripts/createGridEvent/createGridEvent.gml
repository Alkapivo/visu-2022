///@function createGridEvent(fields)
///@description Constructor for GridEvent entity.
///@param {Map<String::any>} fields
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.575Z}

function createGridEvent(fields) {

	var gridEvent = createEntity(GridEvent);

	setGridEventFields(gridEvent, assertNoOptional(fields));

	return gridEvent;
	
}
