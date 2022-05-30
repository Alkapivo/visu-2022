///@function loadScene(scene)
///@description Wrapper for room_goto.
///@param {AssetRoom} scene
function loadScene(argument0) {

		var scene = argument0;
	
		var sceneName = getAssetName(scene, AssetRoom);
		if (isOptionalPresent(sceneName)) {
			logger("Load scene {0}", LogType.INFO, sceneName);
			room_goto(scene);		
		} else {
			throwException(createException(RuntimeException,
				stringParams("Cannot load scene {0}", sceneName), 
				runtimeExceptionHandler));	
			exit;
		}
	



}
