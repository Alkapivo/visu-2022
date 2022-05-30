///@function initialzieManagers()
///@description Insert ManagerPrototypes here.
function initializeManagers() {

		var managers = [];
	
		for (var index = 0; index < getArrayLength(managers); index++) {
	
			var managerPrototype = managers[@ index];
			if (!isEntity(managerPrototype, ManagerPrototype)) {
		
				throwException(
					createException(
						RuntimeException,
						stringParams("Found invalid ManagerPrototype. { \"index\": {0} }", index),
						runtimeExceptionHandler
					)
				)
				continue;
			}
		
			registerManagerPrototype(managerPrototype);
		
			var exception = catchException();
			if (isOptionalPresent(exception)) {
		
				throwException(
					createException(
						RuntimeException,
						stringParams("Unable to register ManagerPrototype. { \"index\": {0} }", index),
						runtimeExceptionHandler
					)
				)
				continue;
			}
		}
	



}
