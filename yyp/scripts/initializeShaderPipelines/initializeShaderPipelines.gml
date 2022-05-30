///@function initializeShaderPipelines(shaderPipelinesInitializationArray)
///@description Register pipelines from array of tuples, where key is name and value is limit.
///@param {Tuple<String::Integer>[]} shaderPipelinesInitializationArray
function initializeShaderPipelines(argument0) {

		var shaderPipelinesInitializationArray = argument0;
	
		for (var index = 0; index < getArrayLength(shaderPipelinesInitializationArray); index++) {
			var tuple = shaderPipelinesInitializationArray[index];
			var name = getTupleKey(tuple);
			var limit = getTupleValue(tuple);
		
			registerShaderPipeline(name, limit);
		}
	
		logger("Finished ShaderPipelines initialization. Registered {0} ShaderPipelines.", 
			LogType.INFO, index);
	



}
