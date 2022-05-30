///@function initializeShaderMagnify(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderMagnify(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderMagnifyUniformResolution", shader_get_uniform(shaderMagnify, "resolution"));
		variable_instance_set(context, "shaderMagnifyUniformPosition", shader_get_uniform(shaderMagnify, "position"));
		variable_instance_set(context, "shaderMagnifyUniformRadius", shader_get_uniform(shaderMagnify, "radius"));
		variable_instance_set(context, "shaderMagnifyUniformMinZoom", shader_get_uniform(shaderMagnify, "minZoom"));
		variable_instance_set(context, "shaderMagnifyUniformMaxZoom", shader_get_uniform(shaderMagnify, "maxZoom"));

		///@SuppressWarning
		context.shaderMagnifyUniformResolution = context.shaderMagnifyUniformResolution;
		context.shaderMagnifyUniformPosition = context.shaderMagnifyUniformPosition;
		context.shaderMagnifyUniformRadius = context.shaderMagnifyUniformRadius;
		context.shaderMagnifyUniformMinZoom = context.shaderMagnifyUniformMinZoom;
		context.shaderMagnifyUniformMaxZoom = context.shaderMagnifyUniformMaxZoom;
	



}
