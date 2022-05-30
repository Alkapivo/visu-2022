///@function deserializeKeyState(jsonString)
///@description Deserialize KeyState from JSON String to KeyState entity.
///@param {String} jsonString
///@return {KeyState} keyState 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function deserializeKeyState(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var check = assertNoOptional(getJsonObjectFieldValue(jsonObject, "check"));
		var pressed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "pressed"));
		var released = assertNoOptional(getJsonObjectFieldValue(jsonObject, "released"));

		destroyJsonObject(jsonObject);
	
		return createKeyState(check, pressed, released);
	



}
