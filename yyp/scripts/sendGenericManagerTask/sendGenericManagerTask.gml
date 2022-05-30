///@function sendGenericManagerTask(context, task)
///@description Sender.
///@param {T?GenericManager} context
///@param {T?GenericTask} task
function sendGenericManagerTask(argument0, argument1) {

		var context = argument0;
		var task = argument1;
	
		var managerPrototype = getGenericManagerPrototype(context);
		if (isEntity(managerPrototype, ManagerPrototype)) {
	
			var taskReactor = getInstanceVariable(context, FieldGenericManager_taskReactor);
			addElementToReactor(taskReactor, task);
		}
	



}
