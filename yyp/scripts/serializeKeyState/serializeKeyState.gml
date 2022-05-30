///@function serializeKeyState(keyState)
///@description Serialize KeyState to JSON string.
///@param {KeyState} keyState
///@return {String} keyStateJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.075Z}
function serializeKeyState(argument0) {

		var keyState = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"check",
			getKeyStateCheck(keyState));	
		appendFieldToJsonObject(
			jsonObject,
			"pressed",
			getKeyStatePressed(keyState));	
		appendFieldToJsonObject(
			jsonObject,
			"released",
			getKeyStateReleased(keyState));	

		var keyStateJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return keyStateJsonString;
	



}
