///@function destroyShaderTask(shaderTask)
///@description Destroy ShaderTask entity.
///@param {ShaderTask} shaderTask
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function destroyShaderTask(shaderTask) {


	
	var shader = getShaderTaskShader(shaderTask);
	var countdown = getShaderTaskCountdown(shaderTask);
	var state = getShaderTaskState(shaderTask);
	var alpha = getShaderTaskAlpha(shaderTask);
	var cooldown = getShaderTaskCooldown(shaderTask);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in ShaderTask");
	setShaderTaskState(shaderTask, null);
}