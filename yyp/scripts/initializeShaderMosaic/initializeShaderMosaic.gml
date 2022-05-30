///@function initializeShaderMosaic(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderMosaic(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderMosaicUniformResolution", shader_get_uniform(shaderMosaic, "resolution"));
		variable_instance_set(context, "shaderMosaicUniformAmount", shader_get_uniform(shaderMosaic, "amount"));


		///@SuppressWarning
		context.shaderMosaicUniformResolution = context.shaderMosaicUniformResolution;
		context.shaderMosaicUniformAmount = context.shaderMosaicUniformAmount;
	



}


///@function shaderMosaicUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderMosaicUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderMosaicUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderMosaicUniformAmount, getValueFromMap(state, "amount", 50));
	
	


}
