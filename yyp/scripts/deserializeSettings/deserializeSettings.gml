///@function deserializeSettings(jsonString)
///@description Deserialize Settings from JSON String to Settings entity.
///@param {String} jsonString
///@return {Settings} settings 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.824Z}
function deserializeSettings(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var attributes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "attributes", Map));

		destroyJsonObject(jsonObject);
	
		return createSettings(name, attributes);
	



}
