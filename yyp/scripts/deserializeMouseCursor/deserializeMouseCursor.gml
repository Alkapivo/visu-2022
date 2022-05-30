///@function deserializeMouseCursor(jsonString)
///@description Deserialize MouseCursor from JSON String to MouseCursor entity.
///@param {String} jsonString
///@return {MouseCursor} mouseCursor 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function deserializeMouseCursor(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var viewPosition = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewPosition", Entity, "Position"));
	var guiPosition = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiPosition", Entity, "Position"));
	var texture = getJsonObjectFieldValue(jsonObject, "texture");
	var type = getJsonObjectFieldValue(jsonObject, "type");
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "MouseCursorData");

	destroyJsonObject(jsonObject);
	
	return createMouseCursor(viewPosition, guiPosition, texture, type, data);
	
}
