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
