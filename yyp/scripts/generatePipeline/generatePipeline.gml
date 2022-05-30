///@function generatePipeline(name, type, elementType)
///@description Constructor for pipeline<T::S>.
///@param {String} name
///@param {Class<T?DataStructure>} type
///@param {Class<S>} elementType
///@return {Optional<Pipeline<T::S>>} pipeline return optional if type wasn't supported
///@throws {NotImplementedException}
function generatePipeline(argument0, argument1, argument2) {

		var name = argument0;
		var type = argument1;
		var elementType = argument2;
	
		var pipeline = createEmptyOptional();
		switch (type) {
			case PipelineType_QUEUE:
				pipeline = createPipeline(name, createQueue(), type, elementType);
				break;
			case PipelineType_STACK:
				pipeline = createPipeline(name, createStack(), type, elementType);
				break;
			default:
				throwException(
					createException(
						NotImplementedException,
						stringParams("Type \"{0}\" is not implemented.", type)
					)
				);
				break;
		}
	
		return pipeline;
	



}
