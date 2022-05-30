///@function deserializeMouseEvent(jsonString)
///@description Deserialize MouseEvent from JSON String to MouseEvent entity.
///@param {String} jsonString
///@return {MouseEvent} mouseEvent 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function deserializeMouseEvent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var xMouse = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xMouse"));
		var yMouse = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yMouse"));

		destroyJsonObject(jsonObject);
	
		return createMouseEvent(type, xMouse, yMouse);
	



}
