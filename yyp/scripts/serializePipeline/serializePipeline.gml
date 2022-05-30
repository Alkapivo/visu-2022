///@function serializePipeline(pipeline)
///@description Serialize Pipeline to JSON string.
///@param {Pipeline} pipeline
///@return {String} pipelineJsonString 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
///@override
function serializePipeline(argument0) {

		var pipeline = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getPipelineName(pipeline));
		
	#region @override
		var type = getPipelineType(pipeline);
		switch (type) {
			case PipelineType_STACK:
				appendEntityToJsonObject(
					jsonObject,
					"data",
					getPipelineData(pipeline),
					getPipelineElementType(pipeline),
					Stack
				);
				break;
			case PipelineType_QUEUE:
				appendEntityToJsonObject(
					jsonObject,
					"data",
					getPipelineData(pipeline),
					getPipelineElementType(pipeline),
					Queue
				);
				break;
		}
	#endregion
	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getPipelineType(pipeline));	
		appendFieldToJsonObject(
			jsonObject,
			"elementType",
			getPipelineElementType(pipeline));	

		var pipelineJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return pipelineJsonString;
	



}
