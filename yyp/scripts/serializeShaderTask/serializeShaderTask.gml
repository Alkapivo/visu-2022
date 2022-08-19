///@function serializeShaderTask(shaderTask)
///@description Serialize ShaderTask to JSON string.
///@param {ShaderTask} shaderTask
///@return {String} shaderTaskJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function serializeShaderTask(shaderTask) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"shader",
		getShaderTaskShader(shaderTask));	
	appendFieldToJsonObject(
		jsonObject,
		"countdown",
		getShaderTaskCountdown(shaderTask));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getShaderTaskState(shaderTask),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"alpha",
		getShaderTaskAlpha(shaderTask));	
	appendFieldToJsonObject(
		jsonObject,
		"cooldown",
		getShaderTaskCooldown(shaderTask));	

	var shaderTaskJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shaderTaskJsonString;
	
}
