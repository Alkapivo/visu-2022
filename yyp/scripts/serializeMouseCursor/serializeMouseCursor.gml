///@function serializeMouseCursor(mouseCursor)
///@description Serialize MouseCursor to JSON string.
///@param {MouseCursor} mouseCursor
///@return {String} mouseCursorJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function serializeMouseCursor(mouseCursor) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"viewPosition",
		getMouseCursorViewPosition(mouseCursor),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"guiPosition",
		getMouseCursorGuiPosition(mouseCursor),
		"Position");
	
	if (isOptionalPresent(getMouseCursorTexture(mouseCursor))) {
		appendFieldToJsonObject(
			jsonObject,
			"texture",
			getMouseCursorTexture(mouseCursor));
	}
	
	if (isOptionalPresent(getMouseCursorType(mouseCursor))) {
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getMouseCursorType(mouseCursor));
	}
	
	if (isOptionalPresent(getMouseCursorData(mouseCursor))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getMouseCursorData(mouseCursor),
			"MouseCursorData");
	}
	

	var mouseCursorJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseCursorJsonString;
	
}
