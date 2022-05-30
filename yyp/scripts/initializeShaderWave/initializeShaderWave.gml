///@function initializeShaderWave(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderWave(argument0) {

		var context = argument0;

		setInstanceVariable(context, "shaderWaveUniformTime", shader_get_uniform(shaderWave, "time"));
		setInstanceVariable(context, "shaderWaveUniformAmount", shader_get_uniform(shaderWave, "amount"));
		setInstanceVariable(context, "shaderWaveUniformDistortion", shader_get_uniform(shaderWave, "distortion"));
		setInstanceVariable(context, "shaderWaveUniformSpeed", shader_get_sampler_index(shaderWave, "speed"));

		///@SuppressWarning
		context.shaderWaveUniformTime = context.shaderWaveUniformTime;
		context.shaderWaveUniformAmount = context.shaderWaveUniformAmount;
		context.shaderWaveUniformDistortion = context.shaderWaveUniformDistortion;
		context.shaderWaveUniformSpeed = context.shaderWaveUniformSpeed;
	



}
