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
