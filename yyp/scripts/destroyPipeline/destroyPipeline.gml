///@function destroyPipeline(pipeline)
///@description Destroy Pipeline entity.
///@param {Pipeline} pipeline
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
///@override
function destroyPipeline(argument0) {

		var pipeline = argument0;
	
		var name = getPipelineName(pipeline);
		var data = getPipelineData(pipeline);
		var type = getPipelineType(pipeline);
		var elementType = getPipelineElementType(pipeline);
	
	#region @override destroy data
		var className = getEntityClassName(elementType);
		var destroyElementScript = getAssetIndex(stringParams("{0}{1}", "destroy", className), AssetScript);	
		switch (type) {
		#region PipelineType_QUEUE
			case PipelineType_QUEUE:
				var queueSize = getQueueSize(data);
				for (var index = 0; index < queueSize; index++) {
					var element = popQueue(data);
					if (isEntity(element, elementType) && isOptionalPresent(destroyElementScript)) {
						runScript(destroyElementScript, element);	
					} else {
						logger("Unable to destroy pipeline {0} element at index {1}", LogType.ERROR, name, index);	
					}
				}
				destroyDataStructure(data, Queue, "Unable to destroy pipeline data: " + string(name));
				break;
		#endregion
		#region PipelineType_STACK
			case PipelineType_STACK:
				var stackSize = getStackSize(data);
				for (var index = 0; index < stackSize; index++) {
					var element = popStack(data);
					if (isEntity(element, elementType) && isOptionalPresent(destroyElementScript)) {
						runScript(destroyElementScript, element);	
					} else {
						logger("Unable to destroy pipeline {0} element at index {1}", LogType.ERROR, name, index);	
					}
				}
				destroyDataStructure(data, Stack, "Unable to destroy pipeline data: " + string(name));
				break;
		#endregion
			default:
				logger("Found unsupported pipeline type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	#endregion
	
	

	



}
