///@description ShaderTask entity

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
///@function deserializeShaderTask(jsonString)
///@description Deserialize ShaderTask from JSON String to ShaderTask entity.
///@param {String} jsonString
///@return {ShaderTask} shaderTask 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function deserializeShaderTask(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var shader = assertNoOptional(getJsonObjectFieldValue(jsonObject, "shader"));
	var countdown = assertNoOptional(getJsonObjectFieldValue(jsonObject, "countdown"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var alpha = assertNoOptional(getJsonObjectFieldValue(jsonObject, "alpha"));
	var cooldown = assertNoOptional(getJsonObjectFieldValue(jsonObject, "cooldown"));

	destroyJsonObject(jsonObject);
	
	return createShaderTask(shader, countdown, state, alpha, cooldown);
	
}
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
}///@function getShaderTaskAlpha(shaderTask)
///@description Getter.
///@param {ShaderTask} shaderTask
///@return {Number} alpha 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function getShaderTaskAlpha(shaderTask) {

	return shaderTask[@ 3];
	
}
///@function getShaderTaskCooldown(shaderTask)
///@description Getter.
///@param {ShaderTask} shaderTask
///@return {Number} cooldown 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function getShaderTaskCooldown(shaderTask) {

	return shaderTask[@ 4];
	
}
///@function getShaderTaskCountdown(shaderTask)
///@description Getter.
///@param {ShaderTask} shaderTask
///@return {Number} countdown 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function getShaderTaskCountdown(shaderTask) {

	return shaderTask[@ 1];
	
}
///@function getShaderTaskShader(shaderTask)
///@description Getter.
///@param {ShaderTask} shaderTask
///@return {AssetShader} shader 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function getShaderTaskShader(shaderTask) {

	return shaderTask[@ 0];
	
}
///@function getShaderTaskState(shaderTask)
///@description Getter.
///@param {ShaderTask} shaderTask
///@return {Map<String::any>} state 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function getShaderTaskState(shaderTask) {

	return shaderTask[@ 2];
	
}
///@function setShaderTaskAlpha(shaderTask, alpha)
///@description Setter.
///@param {ShaderTask} shaderTask
///@param {Number} alpha
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function setShaderTaskAlpha(shaderTask, alpha) {

	shaderTask[@ 3] = alpha;
	
}
///@function setShaderTaskCooldown(shaderTask, cooldown)
///@description Setter.
///@param {ShaderTask} shaderTask
///@param {Number} cooldown
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function setShaderTaskCooldown(shaderTask, cooldown) {

	shaderTask[@ 4] = cooldown;
	
}
///@function setShaderTaskCountdown(shaderTask, countdown)
///@description Setter.
///@param {ShaderTask} shaderTask
///@param {Number} countdown
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function setShaderTaskCountdown(shaderTask, countdown) {

	shaderTask[@ 1] = countdown;
	
}
///@function setShaderTaskShader(shaderTask, shader)
///@description Setter.
///@param {ShaderTask} shaderTask
///@param {AssetShader} shader
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function setShaderTaskShader(shaderTask, shader) {

	shaderTask[@ 0] = shader;
	
}
///@function setShaderTaskState(shaderTask, state)
///@description Setter.
///@param {ShaderTask} shaderTask
///@param {Map<String::any>} state
///@throws {Exception}
///@generated {2022-08-18T22:24:59.757Z}

function setShaderTaskState(shaderTask, state) {

	shaderTask[@ 2] = state;
	
}
