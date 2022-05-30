///@function deserializeException(jsonString)
///@description Deserialize Exception from JSON String to Exception entity.
///@param {String} jsonString
///@return {Exception} exception 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function deserializeException(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var message = assertNoOptional(getJsonObjectFieldValue(jsonObject, "message"));
		var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));

		destroyJsonObject(jsonObject);
	
		return createException(name, message, handler);
	



}
