///@function deserializeMethodIntent(jsonString)
///@description Deserialize MethodIntent from JSON String to MethodIntent entity.
///@param {String} jsonString
///@return {MethodIntent} methodIntent 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function deserializeMethodIntent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));
	var context = getJsonObjectFieldValue(jsonObject, "context");
	var params = getJsonObjectFieldValue(jsonObject, "params", Array);
	var interval = getJsonObjectFieldValue(jsonObject, "interval");
	var handlerName = getJsonObjectFieldValue(jsonObject, "handlerName");

	destroyJsonObject(jsonObject);
	
	return createMethodIntent(handler, context, params, interval, handlerName);
	
}
