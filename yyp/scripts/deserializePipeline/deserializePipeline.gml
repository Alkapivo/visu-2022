///@function deserializePipeline(jsonString)
///@description Deserialize Pipeline from JSON String to Pipeline entity.
///@param {String} jsonString
///@return {Pipeline} pipeline 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
///@override
function deserializePipeline(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	
	#region @override
		var data = createEmptyOptional();
		switch (type) {
			case PipelineType_QUEUE:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Queue, getEntityClassName(type)));
				break;
			case PipelineType_STACK:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Stack, getEntityClassName(type)));
				break;
			default:
				logger("Found unsupported type in pipeline. Raw: {0}", LogType.ERROR, type);
				break;
		}
	#endregion
	
		var elementType = assertNoOptional(getJsonObjectFieldValue(jsonObject, "elementType"));

		destroyJsonObject(jsonObject);
	
		return createPipeline(name, data, type, elementType);
	



}
