///@function shaderMagnifyHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderMagnifyHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ 
			"positionX",
			"positionY",
			"radius",
			"minZoom",
			"maxZoom"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
