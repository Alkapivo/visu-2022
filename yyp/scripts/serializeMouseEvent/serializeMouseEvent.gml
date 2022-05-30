///@function serializeMouseEvent(mouseEvent)
///@description Serialize MouseEvent to JSON string.
///@param {MouseEvent} mouseEvent
///@return {String} mouseEventJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.539Z}
function serializeMouseEvent(argument0) {

		var mouseEvent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getMouseEventType(mouseEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"xMouse",
			getMouseEventXMouse(mouseEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"yMouse",
			getMouseEventYMouse(mouseEvent));	

		var mouseEventJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return mouseEventJsonString;
	



}
