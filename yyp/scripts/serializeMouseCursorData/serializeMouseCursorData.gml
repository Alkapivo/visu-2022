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
