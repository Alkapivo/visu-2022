///@function shaderRippleUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderRippleUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderRippleUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderRippleUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderRippleUniformAmount, getValueFromMap(state, "amount", 80));
		gpuSetShaderUniformFloat(context.shaderRippleUniformDistortion, getValueFromMap(state, "distortion", 30));
		gpuSetShaderUniformFloat(context.shaderRippleUniformSpeed, getValueFromMap(state, "speed", 5));
		gpuSetShaderUniformFloat(context.shaderRippleUniformTime, getValueFromMap(state, "time", 0));
	



}
