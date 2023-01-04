///@description Exception entity

///@function createException(name, message, handler)
///@description Create Exception entity.
///@param {String} name
///@param {String} message
///@param {Optional<AssetScript>} [handler]
///@return {Exception} exception 
///@generated {2020-02-23T13:17:25.524Z}
///@override
function createException() {
	
		///checkArgumentCount(2, argument_count, createException)

		var exception = createArray(3);

		setExceptionName(exception, argument[0]);
		setExceptionMessage(exception, argument[1]);
		setExceptionHandler(exception, argument_count > 2 ? argument[2] : createEmptyOptional());

		return exception;
	



}
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
///@function destroyException(exception)
///@description Destroy Exception entity.
///@param {Exception} exception
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function destroyException(argument0) {

		var exception = argument0;
	
		var name = getExceptionName(exception);
		var message = getExceptionMessage(exception);
		var handler = getExceptionHandler(exception);
	

	



}
///@function getExceptionHandler(exception)
///@description Getter.
///@param {Exception} exception
///@return {AssetScript} handler 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function getExceptionHandler(argument0) {

		return argument0[@ 2];
	



}
///@function getExceptionMessage(exception)
///@description Getter.
///@param {Exception} exception
///@return {String} message 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function getExceptionMessage(argument0) {

		return argument0[@ 1];
	



}
///@function getExceptionName(exception)
///@description Getter.
///@param {Exception} exception
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function getExceptionName(argument0) {

		return argument0[@ 0];
	



}
///@function setExceptionHandler(exception, handler)
///@description Setter.
///@param {Exception} exception
///@param {AssetScript} handler
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function setExceptionHandler(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setExceptionMessage(exception, message)
///@description Setter.
///@param {Exception} exception
///@param {String} message
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function setExceptionMessage(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setExceptionName(exception, name)
///@description Setter.
///@param {Exception} exception
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:54.764Z}
function setExceptionName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
