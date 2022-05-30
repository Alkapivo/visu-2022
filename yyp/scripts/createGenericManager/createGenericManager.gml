///@function createGenericManager(context, beanName, create, step, cleanUp, data, eventPipeline, eventDispatcher, taskReactor, taskDispatcher)
///@description Constructor for GenericManager entity.
///@param {Optional<GMInstance>} context
///@param {Optional<String>} beanName
///@param {Optional<AssetScript>} create
///@param {Optional<AssetScript>} step
///@param {Optional<AssetScript>} cleanUp
///@param {Map<String::any>} data
///@param {Pipeline} eventPipeline
///@param {Optional<AssetScript>} eventDispatcher
///@param {Reactor} taskReactor
///@param {Optional<AssetScript>} taskDispatcher
///@return {GenericManager} genericManager 
///@throws {Exception}
///@generated {2021-03-18T21:52:05.361Z}
function createGenericManager(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

		var context = argument0;
		var beanName = argument1;
		var create = argument2;
		var step = argument3;
		var cleanUp = argument4;
		var data = argument5;
		var eventPipeline = argument6;
		var eventDispatcher = argument7;
		var taskReactor = argument8;
		var taskDispatcher = argument9;
	
		var genericManager = createEntity(GenericManager);

		setGenericManagerContext(genericManager, context);
		setGenericManagerBeanName(genericManager, beanName);
		setGenericManagerCreate(genericManager, create);
		setGenericManagerStep(genericManager, step);
		setGenericManagerCleanUp(genericManager, cleanUp);
		setGenericManagerData(genericManager, assertNoOptional(data));
		setGenericManagerEventPipeline(genericManager, assertNoOptional(eventPipeline));
		setGenericManagerEventDispatcher(genericManager, eventDispatcher);
		setGenericManagerTaskReactor(genericManager, assertNoOptional(taskReactor));
		setGenericManagerTaskDispatcher(genericManager, taskDispatcher);

		return genericManager;
	



}
