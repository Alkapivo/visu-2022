///@function sendShaderTaskToShaderPipeline(shaderTask, shaderPipelineName)
///@description Add ShaderTask to their ShaderPipeline.
///@param {ShaderTask} shaderTask
///@param {String} shaderPipelineName
function sendShaderTaskToShaderPipeline(argument0, argument1) {

		var shaderTask = argument0;
		var shaderPipelineName = argument1;
	
		var shaderPipeline = fetchShaderPipelineByName(shaderPipelineName);
	
		if (shaderPipeline == null) {
			var defaultLimit = getPropertyReal("gameRenderer.shaderPipeline.defaultLimit", 2)
			logger("ShaderPipeline \"{0}\" wasn't registered. Registering with default limit ({1})", 
				LogType.WARNING, shaderPipelineName, defaultLimit);
			shaderPipeline = registerShaderPipeline(shaderPipelineName, defaultLimit);
			
		}
	
		var pipe = getShaderPipelinePipe(shaderPipeline)
		pushStack(pipe, shaderTask);
	



}
