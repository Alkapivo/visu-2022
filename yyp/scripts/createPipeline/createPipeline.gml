///@function createPipeline(name, data, type, elementType)
///@description Constructor for Pipeline entity.
///@param {Integer} name
///@param {Object} data
///@param {PipelineType} type
///@param {Class} elementType
///@return {Pipeline} pipeline 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function createPipeline(argument0, argument1, argument2, argument3) {

		var name = argument0;
		var data = argument1;
		var type = argument2;
		var elementType = argument3;
	
		var pipeline = createEntity(Pipeline);

		setPipelineName(pipeline, assertNoOptional(name));
		setPipelineData(pipeline, assertNoOptional(data));
		setPipelineType(pipeline, assertNoOptional(type));
		setPipelineElementType(pipeline, assertNoOptional(elementType));

		return pipeline;
	



}
