///@function shaderWaveUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderWaveUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		gpuSetShaderUniformFloat(context.shaderWaveUniformAmount, getValueFromMap(state, "amount", 80));
		gpuSetShaderUniformFloat(context.shaderWaveUniformDistortion, getValueFromMap(state, "distortion", 30));
		gpuSetShaderUniformFloat(context.shaderWaveUniformSpeed, getValueFromMap(state, "speed", 5));
		gpuSetShaderUniformFloat(context.shaderWaveUniformTime, getValueFromMap(state, "time", 0.0));
	



}
