///@function registerShaderPipeline(name, limit)
///@description Create new ShaderPipeline and register it on shaderPipelines.
///@param {String} name
///@param {Integer} limit
///@return {ShaderPipeline} shaderPipeline
function registerShaderPipeline(argument0, argument1) {

		var name = argument0;
		var limit = argument1;
	
		if (fetchShaderPipelineByName(name) != null) {
			logger("ShaderPipeline \"{0}\" already registered", LogType.WARNING, name);
			return fetchShaderPipelineByName(name);
		}
	
		// Register to shaderPipelinesNames
		var shaderPipelinesNames = getGameRendererShaderPipelinesNames();
		addToList(shaderPipelinesNames, name);
	
		// Register to shaderPipelines
		var shaderPipelines = getGameRendererShaderPipelines();
		var shaderPipeline = createShaderPipeline(
			createStack(),
			createStack(),
			limit);
		addToMap(shaderPipelines, name, shaderPipeline);
	
		logger("Registered ShaderPipeline {0} with priority {1}", LogType.INFO, 
			name, getListSize(shaderPipelinesNames));
	
		return shaderPipeline;


}
