///@function initializeShaderPosterization(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderPosterization(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderPosterizationUniformGamma", shader_get_uniform(shaderPosterization, "gamma"));
		variable_instance_set(context, "shaderPosterizationUniformColorNumber", shader_get_uniform(shaderPosterization, "colorNumber"));


		///@SuppressWarning
		context.shaderPosterizationUniformGamma = context.shaderPosterizationUniformGamma;
		context.shaderPosterizationUniformColorNumber = context.shaderPosterizationUniformColorNumber;
	



}
