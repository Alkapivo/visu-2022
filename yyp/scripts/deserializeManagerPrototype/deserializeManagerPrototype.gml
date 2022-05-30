///@function deserializeManagerPrototype(jsonString)
///@description Deserialize ManagerPrototype from JSON String to ManagerPrototype entity.
///@param {String} jsonString
///@return {ManagerPrototype} managerPrototype 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function deserializeManagerPrototype(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var beanName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "beanName"));
	var create = getJsonObjectFieldValue(jsonObject, "create", Array, "MethodIntent");
	var step = getJsonObjectFieldValue(jsonObject, "step", Array, "MethodIntent");
	var cleanUp = getJsonObjectFieldValue(jsonObject, "cleanUp", Array, "MethodIntent");
	var eventDispatcher = getJsonObjectFieldValue(jsonObject, "eventDispatcher", Entity, "MethodIntent");
	var taskDispatcher = getJsonObjectFieldValue(jsonObject, "taskDispatcher", Entity, "MethodIntent");

	destroyJsonObject(jsonObject);
	
	return createManagerPrototype(beanName, create, step, cleanUp, eventDispatcher, taskDispatcher);
	
}
