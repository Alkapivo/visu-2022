///@function initializeShaderTaskParametersInState(state, parameterNames)
///@description Initialize [ uniformFloat, *Begin, *End, *Factor, initialized ] parameters in ShaderTask state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function initializeShaderTaskParametersInState(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		var initialized = getValueFromMap(state, "initialized", false);
		if (initialized != true) {
			var parameterNamesLength = getArrayLength(parameterNames);
			for (var index = 0; index < parameterNamesLength; index++) {
				var parameterName = parameterNames[index];
				initializeShaderTaskParameterInState(state, parameterName);
			}
			state[? "initialized"] = true;	
		}
	



}
