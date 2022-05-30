///@function shaderSketchUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderSketchUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderSketchUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderSketchUniformIntensity, getValueFromMap(state, "intensity", 0.6));
	
	


}
