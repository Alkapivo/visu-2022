///@function initializeShaderTaskParametersInState(state, parameterName)
///@description Initialize [ uniformFloat, *Begin, *End, *Factor, initialized ] parameters in ShaderTask state.
///@param {Map<String::Object>} state
///@param {String} parameterName
function initializeShaderTaskParameterInState(argument0, argument1) {

		var state = argument0;
		var parameterName = argument1;

		// Sanitize
		var parameterObject= state[? parameterName];
		var parameterBegin = 0.0;
		var parameterEnd = parameterBegin;
		var parameterFactor = 1.0;
		var parameterFactorChanger = 0.0;
	
		if (!isUndefined(parameterObject)) {
			if (isArray(parameterObject)) {
				var parameterArrayLength = getArrayLength(parameterObject);
				parameterBegin = parameterArrayLength > 0 ? parameterObject[0] : 1.0;
				parameterEnd = parameterArrayLength > 1 ? parameterObject[1] : parameterBegin;
				parameterFactor = parameterArrayLength > 2 ? parameterObject[2] : 1.0;
				parameterFactorChanger = parameterArrayLength > 3 ? parameterObject[3] : 0.0;
			} else {
				parameterBegin = parameterObject;
				parameterEnd = parameterBegin;
				parameterFactor = 1.0;
				parameterFactorChanger = 0.0;
			}
		} else {
			logger("Cannot find ShaderTask parameter \"{0}\"", LogType.WARNING, parameterName);
		}

		// Store
		state[? parameterName + "Begin"] = parameterBegin;
		state[? parameterName + "End"] = parameterEnd;
		state[? parameterName + "Factor"] = parameterFactor;
		state[? parameterName + "FactorChanger"] = parameterFactorChanger;
		state[? parameterName ] = parameterBegin;
	



}
