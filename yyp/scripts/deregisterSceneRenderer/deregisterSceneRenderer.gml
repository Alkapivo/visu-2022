///@function deregisterSceneRenderer()
///@description Set sceneRenderer context to null.
function deregisterSceneRenderer() {

		var contextName = "sceneRendererContext";
	
		if (globalVariableExists(contextName)) {
			var contextValue = getGlobalVariable(contextName);
			if (contextValue == null) {
				throwException(createException(RuntimeException,
					stringParams("SceneController {0} was already deregistered", contextName),
					runtimeExceptionHandler));
			}
			setGlobalVariable(contextName, null);
			logger("SceneController {0} was deregistered", LogType.DEBUG, contextName);
		} else {
			throwException(createException(RuntimeException,
				stringParams("Trying to unregister context {0} that has not been registered", contextName),
				runtimeExceptionHandler));
		}
	

	


}
