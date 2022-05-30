///@function serializeException(exception)
///@description Serialize Exception to JSON string.
///@param {Exception} exception
///@return {String} exceptionJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.255Z}
function serializeException(argument0) {

		var exception = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getExceptionName(exception));	
		appendFieldToJsonObject(
			jsonObject,
			"message",
			getExceptionMessage(exception));	
		appendFieldToJsonObject(
			jsonObject,
			"handler",
			getExceptionHandler(exception));	

		var exceptionJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return exceptionJsonString;
	



}
