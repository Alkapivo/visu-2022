///@function shaderRippleUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderScanlinesUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderScanlinesUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderScanlinesUniformColor, 
			getValueFromMap(state, "colorR", 0.0) / 255.0,
			getValueFromMap(state, "colorG", 0.0) / 255.0,
			getValueFromMap(state, "colorB", 0.0) / 255.0,
			getValueFromMap(state, "colorA", 0.0) / 255.0);
	



}
