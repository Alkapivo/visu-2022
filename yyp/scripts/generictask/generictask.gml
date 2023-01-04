///@description GenericTask entity

///@function createGenericTask(type, data, dispatcher)
///@description Constructor for GenericTask entity.
///@param {String} type
///@param {ArrayMap} data
///@param {Optional<AssetScript>} dispatcher
///@return {GenericTask} genericTask 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.096Z}

function createGenericTask(type, data, dispatcher) {

	var genericTask = createEntity(GenericTask);

	setGenericTaskType(genericTask, assertNoOptional(type));
	setGenericTaskData(genericTask, assertNoOptional(data));
	setGenericTaskDispatcher(genericTask, dispatcher);

	return genericTask;
	
}
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
///@function destroyGenericTask(genericTask)
///@description Destroy GenericTask entity.
///@param {GenericTask} genericTask
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function destroyGenericTask(genericTask) {


	
	var type = getGenericTaskType(genericTask);
	var data = getGenericTaskData(genericTask);
	var dispatcher = getGenericTaskDispatcher(genericTask);
	
	destroyArrayMap(data);
	setGenericTaskData(genericTask, null);
	

	
}
///@function getGenericTaskData(genericTask)
///@description Getter.
///@param {GenericTask} genericTask
///@return {ArrayMap} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function getGenericTaskData(genericTask) {

	return genericTask[@ 1];
	
}
///@function getGenericTaskDispatcher(genericTask)
///@description Getter.
///@param {GenericTask} genericTask
///@return {Optional<AssetScript>} dispatcher 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function getGenericTaskDispatcher(genericTask) {

	return genericTask[@ 2];
	
}
///@function getGenericTaskType(genericTask)
///@description Getter.
///@param {GenericTask} genericTask
///@return {String} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.258Z}

function getGenericTaskType(genericTask) {

	return genericTask[@ 0];
	
}
///@function setGenericTaskData(genericTask, data)
///@description Setter.
///@param {GenericTask} genericTask
///@param {ArrayMap} data
///@throws {Exception}
///@generated {2021-05-01T23:49:42.096Z}

function setGenericTaskData(genericTask, data) {

	genericTask[@ 1] = data;
	
}
///@function setGenericTaskDispatcher(genericTask, dispatcher)
///@description Setter.
///@param {GenericTask} genericTask
///@param {Optional<AssetScript>} dispatcher
///@throws {Exception}
///@generated {2021-05-01T23:49:42.096Z}

function setGenericTaskDispatcher(genericTask, dispatcher) {

	genericTask[@ 2] = dispatcher;
	
}
///@function setGenericTaskType(genericTask, type)
///@description Setter.
///@param {GenericTask} genericTask
///@param {String} type
///@throws {Exception}
///@generated {2021-05-01T23:49:42.096Z}

function setGenericTaskType(genericTask, type) {

	genericTask[@ 0] = type;
	
}
