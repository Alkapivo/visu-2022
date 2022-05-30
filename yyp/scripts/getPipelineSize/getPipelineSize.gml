///@function getPipelineSize(pipeline)
///@description Return number of elements in pipeline.
///@param {Pipeline<T::S>} pipeline
///@return {Integer} size
function getPipelineSize(argument0) {

		var pipeline = argument0;
	
		var type = getPipelineType(pipeline);
		var data = getPipelineData(pipeline);
		var size = 0;
	
		switch (type) {
			case PipelineType_QUEUE:
				size = getQueueSize(data);	
				break;
			case PipelineType_STACK:
				size = getStackSize(data);
				break;
			default:
				logger("Found unsupported PipelineType. Raw: {0}", LogType.ERROR, type);
				break;
		}
	
		return size;
	



}
