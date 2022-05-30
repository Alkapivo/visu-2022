///@function initializeContexts()
///@description Define all global contextes.
function initializeContexts() {

	#region Core
	global.cameraContext = null;
	global.consoleContext = null;
	global.deltaTimeContext = null;
	global.systemContext = null;
	global.loggerWriterContext = null;
	global.systemContext = null;
	#endregion
	
	#region Controller
	global.sceneControllerContext = null;
	#endregion
	
	#region Manager
	global.networkManagerContext = null;
	global.windowManagerContext = null;
	global.resourceManagerContext = null;	
	#endregion
	
	#region Renderer
	global.sceneRendererContext = null;
	#endregion
	
}
