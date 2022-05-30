///@function destroyGenericManager(genericManager)
///@description Destroy GenericManager entity.
///@param {GenericManager} genericManager
///@throws {Exception}
///@generated {2021-03-18T21:51:56.750Z}
function destroyGenericManager(argument0) {

		var genericManager = argument0;
	
		var context = getGenericManagerContext(genericManager);
		var beanName = getGenericManagerBeanName(genericManager);
		var create = getGenericManagerCreate(genericManager);
		var step = getGenericManagerStep(genericManager);
		var cleanUp = getGenericManagerCleanUp(genericManager);
		var data = getGenericManagerData(genericManager);
		var eventPipeline = getGenericManagerEventPipeline(genericManager);
		var eventDispatcher = getGenericManagerEventDispatcher(genericManager);
		var taskReactor = getGenericManagerTaskReactor(genericManager);
		var taskDispatcher = getGenericManagerTaskDispatcher(genericManager);
	
		destroyDataStructure(data, Map, "Unable to destroy Map data in GenericManager");
		setGenericManagerData(genericManager, null);
	
		destroyPipeline(eventPipeline);
		setGenericManagerEventPipeline(genericManager, null);
	
		destroyReactor(taskReactor);
		setGenericManagerTaskReactor(genericManager, null);
	

	



}
