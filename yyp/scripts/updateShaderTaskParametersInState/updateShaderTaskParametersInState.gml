///@function updateShaderTaskParameterInState(state, parameterNames)
///@description Update parameters entries in state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function updateShaderTaskParametersInState(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		var parameterNamesLength = getArrayLength(parameterNames);
		for (var index = 0; index < parameterNamesLength; index++) {
			parameterName = parameterNames[index];
			updateShaderTaskParameterInState(state, parameterName);
		}
	



}
