///@description ShaderPipeline entity

///@function createShaderPipeline(pipe, buffer, limit)
///@description Constructor for ShaderPipeline entity.
///@param {Stack<ShaderTask>} pipe
///@param {Stack<ShaderTask>} buffer
///@param {Integer} limit
///@return {ShaderPipeline} shaderPipeline 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function createShaderPipeline(pipe, buffer, limit) {

	var shaderPipeline = createEntity(ShaderPipeline);

	setShaderPipelinePipe(shaderPipeline, assertNoOptional(pipe));
	setShaderPipelineBuffer(shaderPipeline, assertNoOptional(buffer));
	setShaderPipelineLimit(shaderPipeline, assertNoOptional(limit));

	return shaderPipeline;
	
}
///@function serializeShaderPipeline(shaderPipeline)
///@description Serialize ShaderPipeline to JSON string.
///@param {ShaderPipeline} shaderPipeline
///@return {String} shaderPipelineJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function serializeShaderPipeline(shaderPipeline) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"pipe",
		getShaderPipelinePipe(shaderPipeline),
		"ShaderTask",
		Stack);
	
	appendEntityToJsonObject(
		jsonObject,
		"buffer",
		getShaderPipelineBuffer(shaderPipeline),
		"ShaderTask",
		Stack);
	
	appendFieldToJsonObject(
		jsonObject,
		"limit",
		getShaderPipelineLimit(shaderPipeline));	

	var shaderPipelineJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shaderPipelineJsonString;
	
}
///@function deserializeShaderPipeline(jsonString)
///@description Deserialize ShaderPipeline from JSON String to ShaderPipeline entity.
///@param {String} jsonString
///@return {ShaderPipeline} shaderPipeline 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function deserializeShaderPipeline(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var pipe = assertNoOptional(getJsonObjectFieldValue(jsonObject, "pipe", Stack, "ShaderTask"));
	var buffer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "buffer", Stack, "ShaderTask"));
	var limit = assertNoOptional(getJsonObjectFieldValue(jsonObject, "limit"));

	destroyJsonObject(jsonObject);
	
	return createShaderPipeline(pipe, buffer, limit);
	
}
///@function destroyShaderPipeline(shaderPipeline)
///@description Destroy ShaderPipeline entity.
///@param {ShaderPipeline} shaderPipeline
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function destroyShaderPipeline(shaderPipeline) {


	
	var pipe = getShaderPipelinePipe(shaderPipeline);
	var buffer = getShaderPipelineBuffer(shaderPipeline);
	var limit = getShaderPipelineLimit(shaderPipeline);
	
	for (var index = 0; index < getStackSize(pipe); index++) {
		var entity = popStack(pipe);
		destroy(entity);
	}
	destroyDataStructure(pipe, Stack, "Unable to destroy Stack pipe in ShaderPipeline");
	setShaderPipelinePipe(shaderPipeline, null);
	
	for (var index = 0; index < getStackSize(buffer); index++) {
		var entity = popStack(buffer);
		destroy(entity);
	}
	destroyDataStructure(buffer, Stack, "Unable to destroy Stack buffer in ShaderPipeline");
	setShaderPipelineBuffer(shaderPipeline, null);
	

	
}
///@function getShaderPipelineBuffer(shaderPipeline)
///@description Getter.
///@param {ShaderPipeline} shaderPipeline
///@return {Stack<ShaderTask>} buffer 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function getShaderPipelineBuffer(shaderPipeline) {

	return shaderPipeline[@ 1];
	
}
///@function getShaderPipelineLimit(shaderPipeline)
///@description Getter.
///@param {ShaderPipeline} shaderPipeline
///@return {Integer} limit 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.743Z}

function getShaderPipelineLimit(shaderPipeline) {

	return shaderPipeline[@ 2];
	
}
///@function getShaderPipelinePipe(shaderPipeline)
///@description Getter.
///@param {ShaderPipeline} shaderPipeline
///@return {Stack<ShaderTask>} pipe 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.742Z}

function getShaderPipelinePipe(shaderPipeline) {

	return shaderPipeline[@ 0];
	
}
///@function setShaderPipelineBuffer(shaderPipeline, buffer)
///@description Setter.
///@param {ShaderPipeline} shaderPipeline
///@param {Stack<ShaderTask>} buffer
///@throws {Exception}
///@generated {2022-08-18T22:24:59.743Z}

function setShaderPipelineBuffer(shaderPipeline, buffer) {

	shaderPipeline[@ 1] = buffer;
	
}
///@function setShaderPipelineLimit(shaderPipeline, limit)
///@description Setter.
///@param {ShaderPipeline} shaderPipeline
///@param {Integer} limit
///@throws {Exception}
///@generated {2022-08-18T22:24:59.743Z}

function setShaderPipelineLimit(shaderPipeline, limit) {

	shaderPipeline[@ 2] = limit;
	
}
///@function setShaderPipelinePipe(shaderPipeline, pipe)
///@description Setter.
///@param {ShaderPipeline} shaderPipeline
///@param {Stack<ShaderTask>} pipe
///@throws {Exception}
///@generated {2022-08-18T22:24:59.743Z}

function setShaderPipelinePipe(shaderPipeline, pipe) {

	shaderPipeline[@ 0] = pipe;
	
}
