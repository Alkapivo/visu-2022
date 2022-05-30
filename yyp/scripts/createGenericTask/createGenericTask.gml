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
