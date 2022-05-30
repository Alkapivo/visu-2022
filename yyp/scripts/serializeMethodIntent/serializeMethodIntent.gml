///@function serializeMethodIntent(methodIntent)
///@description Serialize MethodIntent to JSON string.
///@param {MethodIntent} methodIntent
///@return {String} methodIntentJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function serializeMethodIntent(methodIntent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"handler",
		getMethodIntentHandler(methodIntent));	
	if (isOptionalPresent(getMethodIntentContext(methodIntent))) {
		appendFieldToJsonObject(
			jsonObject,
			"context",
			getMethodIntentContext(methodIntent));
	}
	
	if (isOptionalPresent(getMethodIntentParams(methodIntent))) {
		appendFieldToJsonObject(
			jsonObject,
			"params",
			getMethodIntentParams(methodIntent),
			Array);
	}
	
	if (isOptionalPresent(getMethodIntentInterval(methodIntent))) {
		appendFieldToJsonObject(
			jsonObject,
			"interval",
			getMethodIntentInterval(methodIntent));
	}
	
	if (isOptionalPresent(getMethodIntentHandlerName(methodIntent))) {
		appendFieldToJsonObject(
			jsonObject,
			"handlerName",
			getMethodIntentHandlerName(methodIntent));
	}
	

	var methodIntentJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return methodIntentJsonString;
	
}
