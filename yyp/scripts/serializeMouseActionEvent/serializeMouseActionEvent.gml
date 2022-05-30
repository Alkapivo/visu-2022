///@function serializeMouseActionEvent(mouseActionEvent)
///@description Serialize MouseActionEvent to JSON string.
///@param {MouseActionEvent} mouseActionEvent
///@return {String} mouseActionEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function serializeMouseActionEvent(mouseActionEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getMouseActionEventType(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getMouseActionEventState(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"viewX",
		getMouseActionEventViewX(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"viewY",
		getMouseActionEventViewY(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"guiX",
		getMouseActionEventGuiX(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"guiY",
		getMouseActionEventGuiY(mouseActionEvent));	

	var mouseActionEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseActionEventJsonString;
	
}
