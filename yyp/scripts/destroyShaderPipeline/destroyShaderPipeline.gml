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
