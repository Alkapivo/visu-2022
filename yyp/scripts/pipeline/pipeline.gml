///@description Pipeline entity

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
///@function getPipelineData(pipeline)
///@description Getter.
///@param {Pipeline} pipeline
///@return {Object} data 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function getPipelineData(argument0) {

		return argument0[@ 1];
	



}
///@function getPipelineElementType(pipeline)
///@description Getter.
///@param {Pipeline} pipeline
///@return {Class} elementType 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function getPipelineElementType(argument0) {

		return argument0[@ 3];
	



}

///@function getPipelineName(pipeline)
///@description Getter.
///@param {Pipeline} pipeline
///@return {Integer} name 
///@throws {Exception}
///@generated {2020-09-16T10:29:20.726Z}
function getPipelineName(argument0) {

		return argument0[@ 0];
	



}

///@function getPipelineType(pipeline)
///@description Getter.
///@param {Pipeline} pipeline
///@return {PipelineType} type 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function getPipelineType(argument0) {

		return argument0[@ 2];
	



}
///@function setPipelineData(pipeline, data)
///@description Setter.
///@param {Pipeline} pipeline
///@param {Object} data
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function setPipelineData(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setPipelineElementType(pipeline, elementType)
///@description Setter.
///@param {Pipeline} pipeline
///@param {Class} elementType
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function setPipelineElementType(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setPipelineName(pipeline, name)
///@description Setter.
///@param {Pipeline} pipeline
///@param {Integer} name
///@throws {Exception}
///@generated {2020-09-16T10:29:20.726Z}
function setPipelineName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setPipelineType(pipeline, type)
///@description Setter.
///@param {Pipeline} pipeline
///@param {PipelineType} type
///@throws {Exception}
///@generated {2020-09-16T10:38:11.378Z}
function setPipelineType(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
