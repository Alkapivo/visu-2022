///@function destroyManagerPrototype(managerPrototype)
///@description Destroy ManagerPrototype entity.
///@param {ManagerPrototype} managerPrototype
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function destroyManagerPrototype(managerPrototype) {


	
	var beanName = getManagerPrototypeBeanName(managerPrototype);
	var create = getManagerPrototypeCreate(managerPrototype);
	var step = getManagerPrototypeStep(managerPrototype);
	var cleanUp = getManagerPrototypeCleanUp(managerPrototype);
	var eventDispatcher = getManagerPrototypeEventDispatcher(managerPrototype);
	var taskDispatcher = getManagerPrototypeTaskDispatcher(managerPrototype);
	
	if (isOptionalPresent(create)) {
		for (var index = 0; index < getArrayLength(create); index++) {
			var entity = create[@ index];
			destroyMethodIntent(entity);
		}
	}
	setManagerPrototypeCreate(managerPrototype, null);
	
	if (isOptionalPresent(step)) {
		for (var index = 0; index < getArrayLength(step); index++) {
			var entity = step[@ index];
			destroyMethodIntent(entity);
		}
	}
	setManagerPrototypeStep(managerPrototype, null);
	
	if (isOptionalPresent(cleanUp)) {
		for (var index = 0; index < getArrayLength(cleanUp); index++) {
			var entity = cleanUp[@ index];
			destroyMethodIntent(entity);
		}
	}
	setManagerPrototypeCleanUp(managerPrototype, null);
	
	if (isOptionalPresent(eventDispatcher)) {
		destroyMethodIntent(eventDispatcher);
	}
	setManagerPrototypeEventDispatcher(managerPrototype, null);
	
	if (isOptionalPresent(taskDispatcher)) {
		destroyMethodIntent(taskDispatcher);
	}
	setManagerPrototypeTaskDispatcher(managerPrototype, null);
	

	
}
