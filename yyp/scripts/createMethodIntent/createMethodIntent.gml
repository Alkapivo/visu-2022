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
