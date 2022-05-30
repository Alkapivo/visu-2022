///@function createManagerPrototype(beanName, create, step, cleanUp, eventDispatcher, taskDispatcher)
///@description Constructor for ManagerPrototype entity.
///@param {String} beanName
///@param {Optional<MethodIntent[]>} create
///@param {Optional<MethodIntent[]>} step
///@param {Optional<MethodIntent[]>} cleanUp
///@param {Optional<MethodIntent>} eventDispatcher
///@param {Optional<MethodIntent>} taskDispatcher
///@return {ManagerPrototype} managerPrototype 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function createManagerPrototype(beanName, create, step, cleanUp, eventDispatcher, taskDispatcher) {

	var managerPrototype = createEntity(ManagerPrototype);

	setManagerPrototypeBeanName(managerPrototype, assertNoOptional(beanName));
	setManagerPrototypeCreate(managerPrototype, create);
	setManagerPrototypeStep(managerPrototype, step);
	setManagerPrototypeCleanUp(managerPrototype, cleanUp);
	setManagerPrototypeEventDispatcher(managerPrototype, eventDispatcher);
	setManagerPrototypeTaskDispatcher(managerPrototype, taskDispatcher);

	return managerPrototype;
	
}
