///@function shaderLEDUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderLEDUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		var asd = getValueFromMap(state, "brightness", 1.0);
		var def = getValueFromMap(state, "ledSize", 100);
	
		gpuSetShaderUniformFloat(context.shaderLEDUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderLEDUniformBrightness, getValueFromMap(state, "brightness", 1.0));
		gpuSetShaderUniformFloat(context.shaderLEDUniformLedSize, getValueFromMap(state, "ledSize", 100));
	



}
