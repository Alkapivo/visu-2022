///@function shaderShockWaveniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderShockWaveUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformAmplitude, getValueFromMap(state, "amplitude", 17.5));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformRefraction, getValueFromMap(state, "refraction", 1.30));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformWidth, getValueFromMap(state, "width", 30));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformTime, getValueFromMap(state, "time", 0.8));
	



}
