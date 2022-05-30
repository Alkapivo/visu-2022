///@function serializeGenericManager(genericManager)
///@description Serialize GenericManager to JSON string.
///@param {GenericManager} genericManager
///@return {String} genericManagerJsonString 
///@throws {Exception}
///@generated {2021-03-18T21:51:56.750Z}
function serializeGenericManager(argument0) {

		var genericManager = argument0;
	
		var jsonObject = createJsonObject();

		if (isOptionalPresent(getGenericManagerContext(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"context",
				getGenericManagerContext(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerBeanName(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"beanName",
				getGenericManagerBeanName(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerCreate(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"create",
				getGenericManagerCreate(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerStep(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"step",
				getGenericManagerStep(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerCleanUp(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"cleanUp",
				getGenericManagerCleanUp(genericManager));
		}
	
		appendFieldToJsonObject(
			jsonObject,
			"data",
			getGenericManagerData(genericManager),
			Map);
	
		appendEntityToJsonObject(
			jsonObject,
			"eventPipeline",
			getGenericManagerEventPipeline(genericManager),
			"Pipeline");
	
		if (isOptionalPresent(getGenericManagerEventDispatcher(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"eventDispatcher",
				getGenericManagerEventDispatcher(genericManager));
		}
	
		appendEntityToJsonObject(
			jsonObject,
			"taskReactor",
			getGenericManagerTaskReactor(genericManager),
			"Reactor");
	
		if (isOptionalPresent(getGenericManagerTaskDispatcher(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"taskDispatcher",
				getGenericManagerTaskDispatcher(genericManager));
		}
	

		var genericManagerJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return genericManagerJsonString;
	



}
