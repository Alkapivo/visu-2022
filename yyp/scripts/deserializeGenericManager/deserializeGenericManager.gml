///@function deserializeGenericManager(jsonString)
///@description Deserialize GenericManager from JSON String to GenericManager entity.
///@param {String} jsonString
///@return {GenericManager} genericManager 
///@throws {Exception}
///@generated {2021-03-18T21:51:56.750Z}
function deserializeGenericManager(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var context = getJsonObjectFieldValue(jsonObject, "context");
		var beanName = getJsonObjectFieldValue(jsonObject, "beanName");
		var create = getJsonObjectFieldValue(jsonObject, "create");
		var step = getJsonObjectFieldValue(jsonObject, "step");
		var cleanUp = getJsonObjectFieldValue(jsonObject, "cleanUp");
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));
		var eventPipeline = assertNoOptional(getJsonObjectFieldValue(jsonObject, "eventPipeline", Entity, "Pipeline"));
		var eventDispatcher = getJsonObjectFieldValue(jsonObject, "eventDispatcher");
		var taskReactor = assertNoOptional(getJsonObjectFieldValue(jsonObject, "taskReactor", Entity, "Reactor"));
		var taskDispatcher = getJsonObjectFieldValue(jsonObject, "taskDispatcher");

		destroyJsonObject(jsonObject);
	
		return createGenericManager(context, beanName, create, step, cleanUp, data, eventPipeline, eventDispatcher, taskReactor, taskDispatcher);
	



}
