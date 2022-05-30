///@function defaultShaderTaskHandler(state, parameterNames)
///@description Wrapper for initialize and update ShaderTask parameters in state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function defaultShaderTaskHandler(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		initializeShaderTaskParametersInState(state, parameterNames);
		updateShaderTaskParametersInState(state, parameterNames);
	



}
