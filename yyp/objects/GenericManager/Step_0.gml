///@description step()

	var __managerPrototype = getGenericManagerPrototype(this);
	if (isEntity(__managerPrototype, ManagerPrototype)) {
	
		var stepMethodIntents = getManagerPrototypeStep(__managerPrototype);
		runMethodIntents(stepMethodIntents);
		
		var eventDispatcher = getManagerPrototypeEventDispatcher(__managerPrototype);
		runMethodIntent(eventDispatcher);
		
		var taskDispatcher = getManagerPrototypeTaskDispatcher(__managerPrototype);
		runMethodIntent(taskDispatcher);
	}
	
