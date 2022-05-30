///@function destroyShaderTask(shaderTask)
///@description Destroy ShaderTask entity.
///@param {ShaderTask} shaderTask
///@throws {Exception}
///@generated {2021-08-25T13:56:53.703Z}

function destroyShaderTask(shaderTask) {


	
	var shader = getShaderTaskShader(shaderTask);
	var countdown = getShaderTaskCountdown(shaderTask);
	var state = getShaderTaskState(shaderTask);
	var alpha = getShaderTaskAlpha(shaderTask);
	var cooldown = getShaderTaskCooldown(shaderTask);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in ShaderTask");
	setShaderTaskState(shaderTask, null);
	

	
}
