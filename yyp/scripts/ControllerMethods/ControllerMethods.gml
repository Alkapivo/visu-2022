///@export runControllerLoadingIntent(~Controller, ArrayMap<String::any>>)
///@export deregisterSceneController()
///@export getSceneController(): Optional<?Controller>
///@export getSceneControllerInputHandler(): Optional<~InputHandler>
///@export registerSceneController(~Controller)

///@param {ArrayMap<String::Object>} data
///@throws {ScriptNotFoundException|Exception}
function runControllerLoadingIntent(controller, data) {
	
	var handler = getInstanceVariable(controller, "runLoadingHandlerFunction");
	if (isScript(handler)) {
		
		runScript(handler, data);	
	}
}

///@description Deregister current SceneController bean.
function deregisterSceneController() {

	var contextName = "sceneControllerContext";
	
	if (globalVariableExists(contextName)) {
		var contextValue = variable_global_get(contextName);
		if (contextValue == null) {
			throwException(createException(RuntimeException, 
				stringParams("SceneController {0} was already deregistered", contextName), runtimeExceptionHandler));
		}
		setGlobalVariable(contextName, null);
		logger("SceneController {0} was deregistered", LogType.DEBUG, contextName);
	} else {
		throwException(createException(RuntimeException, 
			stringParams("Trying to unregister context {0} that has not been registered", LogType.ERROR, contextName), 
			runtimeExceptionHandler));
	}
}

///@return {Optional<~Controller>} sceneController
function getSceneController() {

	return global.sceneControllerContext;
}

///@return {Optional<?InputHandler>} inputHandler
function getSceneControllerInputHandler() {

	return getInstanceVariable(getSceneController(), "inputHandler");
}

///@description Register passed context as SceneController bean.
///@param {~Controller} controller
function registerSceneController(argument0) {

	var controller = argument0;
	var contextName = "sceneControllerContext";
	
	if (globalVariableExists(contextName)) {
		var contextValue = getGlobalVariable(contextName);
		if (contextValue != null) {
			throwException(createException(RuntimeException, 
				stringParams("Trying to set context for variable {0} which already exists", contextName), 
				runtimeExceptionHandler));
		}
	}
	
	setGlobalVariable(contextName, controller);
	logger("SceneController {0} was registered", LogType.DEBUG, contextName);
}