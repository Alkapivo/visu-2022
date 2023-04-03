///@function initializeshaderSketch(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderSketch(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderSketchUniformResolution", shader_get_uniform(shaderSketch, "resolution"));
		variable_instance_set(context, "shaderSketchUniformIntensity", shader_get_uniform(shaderSketch, "intensity"));

}
