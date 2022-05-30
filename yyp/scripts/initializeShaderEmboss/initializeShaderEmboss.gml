///@function initializeShaderEmboss(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderEmboss(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderEmbossUniformResolution", shader_get_uniform(shaderEmboss, "resolution"));
	
		///@SuppressWarning
		context.shaderEmbossUniformResolution = context.shaderEmbossUniformResolution;
	



}
