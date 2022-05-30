///@function destroyMouseCursorData(mouseCursorData)
///@description Destroy MouseCursorData entity.
///@param {MouseCursorData} mouseCursorData
///@throws {Exception}
///@generated {2021-05-01T23:43:42.875Z}

function destroyMouseCursorData(mouseCursorData) {


	
	var object = getMouseCursorDataObject(mouseCursorData);
	var data = getMouseCursorDataData(mouseCursorData);
	
	if (isOptionalPresent(object)) {
		destroyGenericEntity(object);
	}
	setMouseCursorDataObject(mouseCursorData, null);
	
	if (isOptionalPresent(data)) {
		destroyArrayMap(data);
	}
	setMouseCursorDataData(mouseCursorData, null);
	

	
}
