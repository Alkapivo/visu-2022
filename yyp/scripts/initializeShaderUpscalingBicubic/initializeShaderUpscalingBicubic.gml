///@function initializeShaderUpscalingBicubic(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderUpscalingBicubic(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderUpscalingBicubicUniformResolution", shader_get_uniform(shaderUpscalingBicubic, "resolution"));
		variable_instance_set(context, "shaderUpscalingBicubicUniformBrightness", shader_get_uniform(shaderUpscalingBicubic, "brightness"));
		variable_instance_set(context, "shaderUpscalingBicubicUniformContrast", shader_get_uniform(shaderUpscalingBicubic, "contrast"));
	
		///@SuppressWarning
		context.shaderUpscalingBicubicUniformResolution = context.shaderUpscalingBicubicUniformResolution;
		context.shaderUpscalingBicubicUniformBrightness = context.shaderUpscalingBicubicUniformBrightness;
		context.shaderUpscalingBicubicUniformContrast = context.shaderUpscalingBicubicUniformContrast;
	



}
