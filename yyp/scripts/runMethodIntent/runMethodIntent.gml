///@function runMethodIntent(methodIntent)
///@description Runner for MethodIntent.method AssetScript
///@param {MethodIntent} methodIntent
///@return {any} response
function runMethodIntent(argument0) {

		var methodIntent = argument0;
	
		var response = null;
	
		if (!isEntity(methodIntent, MethodIntent)) {
	
			return response;
		}
	
		var context = getMethodIntentContext(methodIntent);
		var interval = getMethodIntentInterval(methodIntent);
		var isValid = true;
		if (isOptionalPresent(interval)) {
		
			var timerFieldName = stringParams("timer_{0}", getMethodIntentHandlerName(methodIntent));
			var timer = injectInstanceVariable(context, timerFieldName, 0.0);
			timer = incrementTimer(timer, interval);
			if (timerFinished(timer)) {
		
			
			} else {
		
				isValid = false;
			}
			setInstanceVariable(context, timerFieldName, timer);
		}
	
		if (isValid) {
	
			var handler = getMethodIntentHandler(methodIntent);
		
		#region Get {Optional<any[]>} params
			var paramPrototypes = getMethodIntentParams(methodIntent);
			var params = createEmptyOptional();
			if (isArray(paramPrototypes)) {
		
				var paramsLength = getArrayLength(paramPrototypes);
				params = createArray(paramsLength);
				for (var index = 0; index < paramsLength; index++) {
			
					var paramPrototype = paramPrototypes[@ index];
					var paramValue = null;
					if (isString(paramPrototype)) {
				
						var isThis = paramPrototype == "this";
						if (isThis) {
						
							if (stringContains(paramPrototype, ".")) {
							
								var thisFields = splitStringToArray(paramPrototype, ".");
								if (getArrayLength(thisFields) == 2) {
							
									paramValue = getInstanceVariable(context, thisFields[1]);
								}
							} else {
							
								paramValue = context;
							}
						}
					}
				
					params[index] = paramValue;
				}
			}
		#endregion
		
			response = runScript(handler, params);
		}
	
		return response
	



}
