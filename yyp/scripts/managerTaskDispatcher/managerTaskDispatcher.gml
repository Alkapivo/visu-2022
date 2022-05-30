///@function audioManagerTaskDispatcher(params)
///@description Handler for ManagerPrototype::taskDispatcher.
///@param {Optional<any[]>} params
function managerTaskDispatcher() {

		var params = argument[0];
	
		if ((isArray(params)) &&
			(getArrayLength(params) >= 1)) {
	
			var context = params[0];
			var taskReactor = getManagerTaskReactor(context); ///@todo inject
			if (isEntity(taskReactor, Reactor)) {
			
				for (var task = getReactorFirstElement(taskReactor);
					 iteratorFinish(task);
					 task = getReactorNextElement(taskReactor)) {
			
					///@safeCast {GenericTask}
					var taskDispatcher = getGenericTaskDispatcher(task);
					if (isScript(taskDispatcher)) {
				
						runScript(taskDispatcher, context, task);
					}
				}
			
				resolveReactor(taskReactor)
			}
		}
	



}
