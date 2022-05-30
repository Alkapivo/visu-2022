///@description create()

	#region Fields
	
	#macro FieldGenericManager_managerPrototype "managerPrototype"
	#macro FieldGenericManager_beanName "beanName"
	#macro FieldGenericManager_eventPipeline "eventPipeline"
	#macro FieldGenericManager_taskReactor "taskReactor"
	
///@public:

	///@type {Optional<managerPrototype>}
	managerPrototype = createEmptyOptional();
	
///@private:

	///@type {Optional<String>}
	beanName = createEmptyOptional();

	///@type {Optional<Reactor<T?GenericEvent>>}
	eventPipeline = createEmptyOptional();
	
	///@type {Optional<Reactor<T?GenericTask>>}
	taskReactor = createEmptyOptional();

	#endregion
	
 