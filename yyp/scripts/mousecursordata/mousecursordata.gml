///@description MouseCursorData entity

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
///@function serializeMouseCursorData(mouseCursorData)
///@description Serialize MouseCursorData to JSON string.
///@param {MouseCursorData} mouseCursorData
///@return {String} mouseCursorDataJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.874Z}

function serializeMouseCursorData(mouseCursorData) {

	var jsonObject = createJsonObject();

	if (isOptionalPresent(getMouseCursorDataObject(mouseCursorData))) {
		appendEntityToJsonObject(
			jsonObject,
			"object",
			getMouseCursorDataObject(mouseCursorData),
			"GenericEntity");
	}
	
	if (isOptionalPresent(getMouseCursorDataData(mouseCursorData))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getMouseCursorDataData(mouseCursorData),
			"ArrayMap");
	}
	

	var mouseCursorDataJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseCursorDataJsonString;
	
}
///@function deserializeMouseCursorData(jsonString)
///@description Deserialize MouseCursorData from JSON String to MouseCursorData entity.
///@param {String} jsonString
///@return {MouseCursorData} mouseCursorData 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.875Z}

function deserializeMouseCursorData(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var object = getJsonObjectFieldValue(jsonObject, "object", Entity, "GenericEntity");
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

	destroyJsonObject(jsonObject);
	
	return createMouseCursorData(object, data);
	
}
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

///@function getMouseCursorDataData(mouseCursorData)
///@description Getter.
///@param {MouseCursorData} mouseCursorData
///@return {Optional<ArrayMap>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.875Z}

function getMouseCursorDataData(mouseCursorData) {

	return mouseCursorData[@ 1];
	
}
///@function getMouseCursorDataObject(mouseCursorData)
///@description Getter.
///@param {MouseCursorData} mouseCursorData
///@return {Optional<GenericEntity>} object 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.875Z}

function getMouseCursorDataObject(mouseCursorData) {

	return mouseCursorData[@ 0];
	
}

///@function setMouseCursorDataData(mouseCursorData, data)
///@description Setter.
///@param {MouseCursorData} mouseCursorData
///@param {Optional<ArrayMap>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:41.557Z}

function setMouseCursorDataData(mouseCursorData, data) {

	mouseCursorData[@ 1] = data;
	
}
///@function setMouseCursorDataObject(mouseCursorData, object)
///@description Setter.
///@param {MouseCursorData} mouseCursorData
///@param {Optional<GenericEntity>} object
///@throws {Exception}
///@generated {2021-05-01T23:49:41.557Z}

function setMouseCursorDataObject(mouseCursorData, object) {

	mouseCursorData[@ 0] = object;
	
}
