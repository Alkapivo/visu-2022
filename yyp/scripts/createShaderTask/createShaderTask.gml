///@function createShaderTask(shader, countdown, state, alpha, cooldown)
///@description Constructor for ShaderTask entity.
///@param {AssetShader} shader
///@param {Number} countdown
///@param {Map<String::any>} state
///@param {Number} alpha
///@param {Number} cooldown
///@return {ShaderTask} shaderTask 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function createShaderTask(shader, countdown, state, alpha, cooldown) {

	var shaderTask = createEntity(ShaderTask);

	setShaderTaskShader(shaderTask, assertNoOptional(shader));
	setShaderTaskCountdown(shaderTask, assertNoOptional(countdown));
	setShaderTaskState(shaderTask, assertNoOptional(state));
	setShaderTaskAlpha(shaderTask, assertNoOptional(alpha));
	setShaderTaskCooldown(shaderTask, assertNoOptional(cooldown));

	return shaderTask;
	
}
