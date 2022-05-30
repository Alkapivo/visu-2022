///@function addElementToPipeline(pipeline, element)
///@descripton Add element<S> to pipeline<T::S>.
///@param {Pipeline<T::S>} pipeline
///@param {Entity<S>} element
///@throws {InvalidClassException}
function addElementToPipeline(argument0, argument1) {

		var pipeline = argument0;
		var element = argument1;
	
		if (isEntity(pipeline, Pipeline)) {
			var type = getPipelineType(pipeline);	
			var elementType = getPipelineElementType(pipeline);
			var data = getPipelineData(pipeline);
			if (isEntity(element, elementType)) {
				switch (type) {
					case PipelineType_QUEUE:
						pushQueue(data, element);
						break;
					case PipelineType_STACK:
						pushStack(data, element);
						break;
					default:
						logger("Found unsupported pipeline. Raw: {0}", LogType.ERROR, type);
						break;
				}
			} else {
				throwException(
					createException(
						InvalidClassException,
						stringParams("Trying to add invalid element to pipeline of \"{0}\"", 
							getEntityClassName(type)
						)
					)
				);	
			}
		} else {
			throwException(
				createException(
					InvalidClassException,
					"Trying to add element to non-existsing pipeline"
				)
			);
		}
	



}
