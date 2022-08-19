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
