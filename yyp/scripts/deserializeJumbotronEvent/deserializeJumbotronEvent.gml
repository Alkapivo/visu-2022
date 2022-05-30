///@function deserializeJumbotronEvent(jsonString)
///@description Deserialize JumbotronEvent from JSON String to JumbotronEvent entity.
///@param {String} jsonString
///@return {JumbotronEvent} jumbotronEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.584Z}

function deserializeJumbotronEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var message = assertNoOptional(getJsonObjectFieldValue(jsonObject, "message"));
	var handlerName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handlerName"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createJumbotronEvent(message, handlerName, duration);
	
}
