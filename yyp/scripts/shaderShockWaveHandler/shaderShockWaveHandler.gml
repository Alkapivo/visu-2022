///@function shaderShockWaveHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderShockWaveHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [
			"positionX",
			"positionY",
			"amplitude",
			"refraction",
			"width",
			"time"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
