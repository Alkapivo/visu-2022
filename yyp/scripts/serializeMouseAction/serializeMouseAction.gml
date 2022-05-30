///@function serializeMouseAction(mouseAction)
///@description Serialize MouseAction to JSON string.
///@param {MouseAction} mouseAction
///@return {String} mouseActionJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.907Z}

function serializeMouseAction(mouseAction) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getMouseActionType(mouseAction));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getMouseActionState(mouseAction));	
	appendFieldToJsonObject(
		jsonObject,
		"handler",
		getMouseActionHandler(mouseAction));	

	var mouseActionJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseActionJsonString;
	
}
