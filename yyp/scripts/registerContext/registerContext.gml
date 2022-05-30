///@function registerContext(instance)
///@description Create global variable that will contain instance reference.
///@param {Instance} instance
function registerContext(argument0) {

	var instance = argument0;
	var contextName = capitalToLowerCase(object_get_name(instance.object_index)) + "Context";
	if (isHtml5()) {
		
		setGlobalVariable(contextName, instance);
		return null;
	}
	
	if (globalVariableExists(contextName)) {
			
		var contextValue = getGlobalVariable(contextName);
		if (contextValue != null) {
				
			throwException(
				createException(
					RuntimeException,
					stringParams("Trying to set context for variable {0} which already exists", contextName), 
					runtimeExceptionHandler
				)
			);
		}
		
		setGlobalVariable(contextName, instance);
		logger("Context {0} was registered", LogType.DEBUG, contextName);
	} else {
			
		throwException(
			createException(
				NullPointerException,
				stringParams("Trying to set context for variable {0} which wasn't defined", contextName),
				runtimeExceptionHandler
			)
		);
	}
}
