///@function initializeShaderUpscalingHQ4X(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderUpscalingHQ4X(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderUpscalingHQ4XUniformResolution", shader_get_uniform(shaderUpscalingHQ4X, "resolution"));
		variable_instance_set(context, "shaderUpscalingHQ4XUniformBrightness", shader_get_uniform(shaderUpscalingHQ4X, "brightness"));
		variable_instance_set(context, "shaderUpscalingHQ4XUniformContrast", shader_get_uniform(shaderUpscalingHQ4X, "contrast"));
	
		///@SuppressWarning
		context.shaderUpscalingHQ4XUniformResolution = context.shaderUpscalingHQ4XUniformResolution;
		context.shaderUpscalingHQ4XUniformBrightness = context.shaderUpscalingHQ4XUniformBrightness;
		context.shaderUpscalingHQ4XUniformContrast = context.shaderUpscalingHQ4XUniformContrast;
	



}
