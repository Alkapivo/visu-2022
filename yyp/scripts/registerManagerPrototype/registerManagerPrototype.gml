///@function registerManagerPrototype(managerPrototype)
///@description Store ManagerPrototype in repository.
///@param {ManagerPrototype} managerPrototype
///@throws {ManagerException}
function registerManagerPrototype(argument0) {
	
		var managerPrototype = argument0;
	
		var beanName = getManagerPrototypeBeanName(managerPrototype);
		var managerPrototypeRepository = getManagerPrototypeRepository();
		var result = findInRepositoryById(managerPrototypeRepository, beanName)
		if (!isUndefined(result)) {
			
			throwException(
				createException(
					ManagerException,
					stringParams("Bean for manager already defined. { \"beanName\": \"{0}\" }", beanName),
					runtimeExceptionHandler
				)
			)
			return;
		}
		
		saveInRepository(managerPrototypeRepository, beanName, managerPrototype);
		logger("Manager {0} registered", LogType.DEBUG, beanName);
	



}
