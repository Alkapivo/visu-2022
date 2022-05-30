///@description cleanUp()

	var __managerPrototype = getGenericManagerPrototype(this);
	if (isEntity(__managerPrototype, ManagerPrototype)) {
	
		var cleanUpMethodIntents = getManagerPrototypeCleanUp(__managerPrototype);
		if (isArray(cleanUpMethodIntents)) {
		
			runMethodIntents(cleanUpMethodIntents);
		}
	}