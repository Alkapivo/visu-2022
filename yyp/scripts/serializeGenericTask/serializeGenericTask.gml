///@function serializeGenericTask(genericTask)
///@description Serialize GenericTask to JSON string.
///@param {GenericTask} genericTask
///@return {String} genericTaskJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function serializeGenericTask(genericTask) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGenericTaskType(genericTask));	
	appendEntityToJsonObject(
		jsonObject,
		"data",
		getGenericTaskData(genericTask),
		"ArrayMap");
	
	if (isOptionalPresent(getGenericTaskDispatcher(genericTask))) {
		appendFieldToJsonObject(
			jsonObject,
			"dispatcher",
			getGenericTaskDispatcher(genericTask));
	}
	

	var genericTaskJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return genericTaskJsonString;
	
}
