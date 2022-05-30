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
