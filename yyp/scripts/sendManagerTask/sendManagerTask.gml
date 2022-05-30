///@function sendManagerTask(manager, task)
///@description Send task to manager.
///@param {T?GenericManager} manager
///@param {any} task
function sendManagerTask(argument0, argument1) {

		var manager = argument0;
		var task = argument1;
	
		var taskPipeline = getInstanceVariable(manager, FieldGenericManager_taskReactor);
		if (isEntity(taskPipeline, Pipeline)) {
	
			addElementToReactor(taskPipeline, task);
		}
	



}
