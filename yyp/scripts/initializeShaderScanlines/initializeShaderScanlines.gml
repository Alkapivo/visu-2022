///@function initializeShaderScanlines(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderScanlines(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderScanlinesUniformResolution", shader_get_uniform(shaderScanlines, "resolution"));
		variable_instance_set(context, "shaderScanlinesUniformColor", shader_get_uniform(shaderScanlines, "color"));


}
