///@function initializeShaderLED(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderLED(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderLEDUniformResolution", shader_get_uniform(shaderLED, "resolution"));
		variable_instance_set(context, "shaderLEDUniformLedSize", shader_get_uniform(shaderLED, "ledSize"));
		variable_instance_set(context, "shaderLEDUniformBrightness", shader_get_uniform(shaderLED, "brightness"));
	
		///@SuppressWarning
		context.shaderLEDUniformResolution = context.shaderLEDUniformResolution;
		context.shaderLEDUniformLedSize = context.shaderLEDUniformLedSize;
		context.shaderLEDUniformBrightness = context.shaderLEDUniformBrightness;
	



}
