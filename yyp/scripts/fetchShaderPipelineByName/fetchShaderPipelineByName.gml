///@function fetchShaderPipelineByName(name)
///@description Getter. Return null if pipeline wasn't found.
///@param {String} name
///@return {Optional<ShaderPipeline>} shaderPipeline
function fetchShaderPipelineByName(argument0) {

		var name = argument0;
	
		var shaderPipelines = getGameRendererShaderPipelines();
		var shaderPipeline = shaderPipelines[? name];
	
		return shaderPipeline == undefined ? null : shaderPipeline;
	
	


}
