///@function createMouseCursorData(object, data)
///@description Constructor for MouseCursorData entity.
///@param {Optional<GenericEntity>} object
///@param {Optional<ArrayMap>} data
///@return {MouseCursorData} mouseCursorData 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.556Z}

function createMouseCursorData(object, data) {

	var mouseCursorData = createEntity(MouseCursorData);

	setMouseCursorDataObject(mouseCursorData, object);
	setMouseCursorDataData(mouseCursorData, data);

	return mouseCursorData;
	
}
