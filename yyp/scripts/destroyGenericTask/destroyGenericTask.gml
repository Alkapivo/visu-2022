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
