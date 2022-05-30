///@function updateShaderTaskParameterInState(state, parameterName)
///@description Update parameter entries in state.
///@param {Map<String::Object>} state
///@param {String} parameterName
function updateShaderTaskParameterInState(argument0, argument1) {

		var state = argument0;
		var parameterName = argument1;
	
		var parameterBegin = state[? parameterName + "Begin"];
		var parameterEnd = state[? parameterName + "End"];
		var parameterFactor = state[? parameterName + "Factor"];
		var parameterFactorChanger = state[? parameterName + "FactorChanger"];
		var parameter = state[? parameterName];
	
		var factorDirection = sign(parameterEnd - parameterBegin);
		var _futureParameterFactor = abs(parameterFactor + parameterFactorChanger)
		var futureParameterFactor = abs(_futureParameterFactor * getDeltaTimeValue()) * factorDirection * getDeltaTimeValue();
		var futureParameter = parameter + futureParameterFactor;
	
		if (factorDirection != 0) {
			if (((factorDirection == -1) && (futureParameter > parameterEnd)) ||
				((factorDirection ==  1) && (futureParameter < parameterEnd))) {
			
				parameterFactor = _futureParameterFactor;
				parameter = futureParameter;	
			} else {
				parameter = parameterEnd;
			}
		} else {
			parameter = parameterEnd;
		}
	
		state[? parameterName + "Factor"] = parameterFactor;
		state[? parameterName] = parameter;
	



}
