///@function deserializeRectangle(jsonString)
///@description Deserialize Rectangle from JSON String to Rectangle entity.
///@param {String} jsonString
///@return {Rectangle} rectangle 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function deserializeRectangle(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var xBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xBegin"));
		var yBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yBegin"));
		var xEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xEnd"));
		var yEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yEnd"));

		destroyJsonObject(jsonObject);
	
		return createRectangle(xBegin, yBegin, xEnd, yEnd);
	



}
