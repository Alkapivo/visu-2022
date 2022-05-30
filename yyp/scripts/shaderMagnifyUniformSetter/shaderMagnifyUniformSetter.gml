///@function shaderMagnifyUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderMagnifyUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformRadius, getValueFromMap(state, "radius", 0.25));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformMinZoom, getValueFromMap(state, "minZoom", 0.40));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformMaxZoom, getValueFromMap(state, "maxZoom", 0.60));
	



}
