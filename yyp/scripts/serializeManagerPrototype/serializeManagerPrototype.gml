///@function serializeManagerPrototype(managerPrototype)
///@description Serialize ManagerPrototype to JSON string.
///@param {ManagerPrototype} managerPrototype
///@return {String} managerPrototypeJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function serializeManagerPrototype(managerPrototype) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"beanName",
		getManagerPrototypeBeanName(managerPrototype));	
	if (isOptionalPresent(getManagerPrototypeCreate(managerPrototype))) {
		appendEntityToJsonObject(
			jsonObject,
			"create",
			getManagerPrototypeCreate(managerPrototype),
			"MethodIntent",
			Array);
	}
	
	if (isOptionalPresent(getManagerPrototypeStep(managerPrototype))) {
		appendEntityToJsonObject(
			jsonObject,
			"step",
			getManagerPrototypeStep(managerPrototype),
			"MethodIntent",
			Array);
	}
	
	if (isOptionalPresent(getManagerPrototypeCleanUp(managerPrototype))) {
		appendEntityToJsonObject(
			jsonObject,
			"cleanUp",
			getManagerPrototypeCleanUp(managerPrototype),
			"MethodIntent",
			Array);
	}
	
	if (isOptionalPresent(getManagerPrototypeEventDispatcher(managerPrototype))) {
		appendEntityToJsonObject(
			jsonObject,
			"eventDispatcher",
			getManagerPrototypeEventDispatcher(managerPrototype),
			"MethodIntent");
	}
	
	if (isOptionalPresent(getManagerPrototypeTaskDispatcher(managerPrototype))) {
		appendEntityToJsonObject(
			jsonObject,
			"taskDispatcher",
			getManagerPrototypeTaskDispatcher(managerPrototype),
			"MethodIntent");
	}
	

	var managerPrototypeJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return managerPrototypeJsonString;
	
}
