///@function shaderMosaicUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderPosterizationUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		gpuSetShaderUniformFloat(context.shaderPosterizationUniformColorNumber, getValueFromMap(state, "colorNumber", 1));
		gpuSetShaderUniformFloat(context.shaderPosterizationUniformGamma, getValueFromMap(state, "gamma", 1));
	



}
