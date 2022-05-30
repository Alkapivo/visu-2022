///@function deregisterContext(instance)
///@description Set context to null.
///@param {Instance} instance
function deregisterContext(argument0) {

		var instance = argument0;
		var contextName = capitalToLowerCase(object_get_name(instance.object_index)) + "Context";
	
		if (globalVariableExists(contextName)) {
		
			var contextValue = getGlobalVariable(contextName);
			if (contextValue == null) {
			
				throwException(
					createException(
						RuntimeException, 
						stringParams("Context {0} was already deregistered", contextName),
						runtimeExceptionHandler
					)
				);
			}
		
			setGlobalVariable(contextName, createEmptyOptional());
			logger("Context {0} was deregistered", LogType.DEBUG, contextName);
		} else {
		
			throwException(
				createException(
					RuntimeException,  
					stringParams("Trying to unregister context {0} that has not been registered", contextName), 
					runtimeExceptionHandler
				)
			);
		}
	



}
