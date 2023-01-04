///@description MethodIntent entity

///@function createMethodIntent(handler, context, params, interval, handlerName)
///@description Constructor for MethodIntent entity.
///@param {AssetScript} handler
///@param {Optional<GMInstance>} context
///@param {Optional<any[]>} params
///@param {Optional<Number>} interval
///@param {Optional<String>} handlerName
///@return {MethodIntent} methodIntent 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.113Z}

function createMethodIntent(handler, context, params, interval, handlerName) {

	var methodIntent = createEntity(MethodIntent);

	setMethodIntentHandler(methodIntent, assertNoOptional(handler));
	setMethodIntentContext(methodIntent, context);
	setMethodIntentParams(methodIntent, params);
	setMethodIntentInterval(methodIntent, interval);
	setMethodIntentHandlerName(methodIntent, handlerName);

	return methodIntent;
	
}
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
///@function destroyMethodIntent(methodIntent)
///@description Destroy MethodIntent entity.
///@param {MethodIntent} methodIntent
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function destroyMethodIntent(methodIntent) {


	
	var handler = getMethodIntentHandler(methodIntent);
	var context = getMethodIntentContext(methodIntent);
	var params = getMethodIntentParams(methodIntent);
	var interval = getMethodIntentInterval(methodIntent);
	var handlerName = getMethodIntentHandlerName(methodIntent);
	
	setMethodIntentParams(methodIntent, null);
	

	
}
///@function getMethodIntentContext(methodIntent)
///@description Getter.
///@param {MethodIntent} methodIntent
///@return {Optional<GMInstance>} context 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function getMethodIntentContext(methodIntent) {

	return methodIntent[@ 1];
	
}
///@function getMethodIntentHandler(methodIntent)
///@description Getter.
///@param {MethodIntent} methodIntent
///@return {AssetScript} handler 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function getMethodIntentHandler(methodIntent) {

	return methodIntent[@ 0];
	
}
///@function getMethodIntentHandlerName(methodIntent)
///@description Getter.
///@param {MethodIntent} methodIntent
///@return {Optional<String>} handlerName 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function getMethodIntentHandlerName(methodIntent) {

	return methodIntent[@ 4];
	
}
///@function getMethodIntentInterval(methodIntent)
///@description Getter.
///@param {MethodIntent} methodIntent
///@return {Optional<Number>} interval 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function getMethodIntentInterval(methodIntent) {

	return methodIntent[@ 3];
	
}
///@function getMethodIntentParams(methodIntent)
///@description Getter.
///@param {MethodIntent} methodIntent
///@return {Optional<any[]>} params 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.306Z}

function getMethodIntentParams(methodIntent) {

	return methodIntent[@ 2];
	
}
///@function setMethodIntentContext(methodIntent, context)
///@description Setter.
///@param {MethodIntent} methodIntent
///@param {Optional<GMInstance>} context
///@throws {Exception}
///@generated {2021-05-01T23:49:42.114Z}

function setMethodIntentContext(methodIntent, context) {

	methodIntent[@ 1] = context;
	
}
///@function setMethodIntentHandler(methodIntent, handler)
///@description Setter.
///@param {MethodIntent} methodIntent
///@param {AssetScript} handler
///@throws {Exception}
///@generated {2021-05-01T23:49:42.114Z}

function setMethodIntentHandler(methodIntent, handler) {

	methodIntent[@ 0] = handler;
	
}
///@function setMethodIntentHandlerName(methodIntent, handlerName)
///@description Setter.
///@param {MethodIntent} methodIntent
///@param {Optional<String>} handlerName
///@throws {Exception}
///@generated {2021-05-01T23:49:42.114Z}

function setMethodIntentHandlerName(methodIntent, handlerName) {

	methodIntent[@ 4] = handlerName;
	
}
///@function setMethodIntentInterval(methodIntent, interval)
///@description Setter.
///@param {MethodIntent} methodIntent
///@param {Optional<Number>} interval
///@throws {Exception}
///@generated {2021-05-01T23:49:42.114Z}

function setMethodIntentInterval(methodIntent, interval) {

	methodIntent[@ 3] = interval;
	
}
///@function setMethodIntentParams(methodIntent, params)
///@description Setter.
///@param {MethodIntent} methodIntent
///@param {Optional<any[]>} params
///@throws {Exception}
///@generated {2021-05-01T23:49:42.114Z}

function setMethodIntentParams(methodIntent, params) {

	methodIntent[@ 2] = params;
	
}
