///@function deserializeMouseActionEvent(jsonString)
///@description Deserialize MouseActionEvent from JSON String to MouseActionEvent entity.
///@param {String} jsonString
///@return {MouseActionEvent} mouseActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function deserializeMouseActionEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state"));
	var viewX = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewX"));
	var viewY = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewY"));
	var guiX = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiX"));
	var guiY = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiY"));

	destroyJsonObject(jsonObject);
	
	return createMouseActionEvent(type, state, viewX, viewY, guiX, guiY);
	
}
