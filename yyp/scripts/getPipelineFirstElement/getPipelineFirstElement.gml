///@function getPipelineFirstElement(pipeline)
///@description Return first element of pipeline. Method used in pipeline for-each.
///@param {Pipeline<T::S>} pipeline
///@return {Optional<S>} element
function getPipelineFirstElement(argument0) {

		var pipeline = argument0;
	
		var data = getPipelineData(pipeline);
		var type = getPipelineType(pipeline);
		var element = createEmptyOptional();
	
		switch (type) {
			case PipelineType_QUEUE:
				element = popQueue(data);
				break;
			case PipelineType_STACK:
				element = popStack(data);
				break;
			default:
				logger("Found unsupported pipeline type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	
		return element;
	



}
