///@function getManagerTaskReactor(manager)
///@description Safe getter.
///@param {T?GenericManager} manager
///@return {Optional<Reactor<GenericTask>>} taskReactor
function getManagerTaskReactor(argument0) {

		var manager = argument0;
	
		var taskReactor = getInstanceVariable(manager, FieldGenericManager_taskReactor);
	
		return taskReactor;
	



}
