///@function initializeshaderShockWave(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderShockWave(argument0) {

		var context = argument0;

		variable_instance_set(context, "shaderShockWaveUniformResolution", shader_get_uniform(shaderShockWave, "resolution"));
		variable_instance_set(context, "shaderShockWaveUniformPosition", shader_get_uniform(shaderShockWave, "position"));
		variable_instance_set(context, "shaderShockWaveUniformAmplitude", shader_get_uniform(shaderShockWave, "amplitude"));
		variable_instance_set(context, "shaderShockWaveUniformRefraction", shader_get_uniform(shaderShockWave, "refraction"));
		variable_instance_set(context, "shaderShockWaveUniformWidth", shader_get_uniform(shaderShockWave, "width"));
		variable_instance_set(context, "shaderShockWaveUniformTime", shader_get_uniform(shaderShockWave, "time"));

		///@SuppressWarning
		context.shaderShockWaveUniformResolution = context.shaderShockWaveUniformResolution;
		context.shaderShockWaveUniformPosition = context.shaderShockWaveUniformPosition;
		context.shaderShockWaveUniformAmplitude = context.shaderShockWaveUniformAmplitude;
		context.shaderShockWaveUniformRefraction = context.shaderShockWaveUniformRefraction;
		context.shaderShockWaveUniformWidth = context.shaderShockWaveUniformWidth;
		context.shaderShockWaveUniformTime = context.shaderShockWaveUniformTime;
	



}
