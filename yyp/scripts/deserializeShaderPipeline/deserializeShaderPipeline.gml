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
