///@function deserializeGenericTask(jsonString)
///@description Deserialize GenericTask from JSON String to GenericTask entity.
///@param {String} jsonString
///@return {GenericTask} genericTask 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function deserializeGenericTask(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap"));
	var dispatcher = getJsonObjectFieldValue(jsonObject, "dispatcher");

	destroyJsonObject(jsonObject);
	
	return createGenericTask(type, data, dispatcher);
	
}
