///@function registerSceneRenderer(renderer)
///@description Create global variable that will contain instance reference.
///@param {?Renderer} renderer
function registerSceneRenderer(argument0) {

		var renderer = argument0;
		var contextName = "sceneRendererContext";
	
		if (globalVariableExists(contextName)) {
			var contextValue = getGlobalVariable(contextName);
			if (contextValue != null) {
				throwException(createException(RuntimeException,
					stringParams("Trying to set context for variable {0} which already exists", contextName),
					runtimeExceptionHandler));
			}
		}
	
		setGlobalVariable(contextName, renderer);
		logger("SceneRenderer for {0} was registered", LogType.DEBUG, object_get_name(renderer.object_index));
	

	


}
