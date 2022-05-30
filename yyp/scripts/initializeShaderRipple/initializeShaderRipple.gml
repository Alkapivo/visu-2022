///@function initializeShaderRipple(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderRipple(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderRippleUniformResolution", shader_get_uniform(shaderRipple, "resolution"));
		variable_instance_set(context, "shaderRippleUniformPosition", shader_get_uniform(shaderRipple, "position"));
		variable_instance_set(context, "shaderRippleUniformAmount", shader_get_uniform(shaderRipple, "amount"));
		variable_instance_set(context, "shaderRippleUniformDistortion", shader_get_uniform(shaderRipple, "distortion"));
		variable_instance_set(context, "shaderRippleUniformSpeed", shader_get_uniform(shaderRipple, "speed"));
		variable_instance_set(context, "shaderRippleUniformTime", shader_get_uniform(shaderRipple, "time"));
	


		///@SuppressWarning
		context.shaderRippleUniformResolution = context.shaderRippleUniformResolution;
		context.shaderRippleUniformPosition = context.shaderRippleUniformPosition;
		context.shaderRippleUniformAmount = context.shaderRippleUniformAmount;
		context.shaderRippleUniformDistortion = context.shaderRippleUniformDistortion;
		context.shaderRippleUniformSpeed = context.shaderRippleUniformSpeed;
		context.shaderRippleUniformTime = context.shaderRippleUniformTime;
	



}
