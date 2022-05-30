///@function deserializeTheme(jsonString)
///@description Deserialize Theme from JSON String to Theme entity.
///@param {String} jsonString
///@return {Theme} theme 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function deserializeTheme(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var attributes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "attributes", Map));

		destroyJsonObject(jsonObject);
	
		return createTheme(name, attributes);
	



}
