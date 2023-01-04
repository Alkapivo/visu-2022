///@description ManagerPrototype entity

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
///@function deserializeManagerPrototype(jsonString)
///@description Deserialize ManagerPrototype from JSON String to ManagerPrototype entity.
///@param {String} jsonString
///@return {ManagerPrototype} managerPrototype 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function deserializeManagerPrototype(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var beanName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "beanName"));
	var create = getJsonObjectFieldValue(jsonObject, "create", Array, "MethodIntent");
	var step = getJsonObjectFieldValue(jsonObject, "step", Array, "MethodIntent");
	var cleanUp = getJsonObjectFieldValue(jsonObject, "cleanUp", Array, "MethodIntent");
	var eventDispatcher = getJsonObjectFieldValue(jsonObject, "eventDispatcher", Entity, "MethodIntent");
	var taskDispatcher = getJsonObjectFieldValue(jsonObject, "taskDispatcher", Entity, "MethodIntent");

	destroyJsonObject(jsonObject);
	
	return createManagerPrototype(beanName, create, step, cleanUp, eventDispatcher, taskDispatcher);
	
}
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
///@function getManagerPrototypeBeanName(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {String} beanName 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeBeanName(managerPrototype) {

	return managerPrototype[@ 0];
	
}
///@function getManagerPrototypeCleanUp(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {Optional<MethodIntent[]>} cleanUp 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeCleanUp(managerPrototype) {

	return managerPrototype[@ 3];
	
}
///@function getManagerPrototypeCreate(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {Optional<MethodIntent[]>} create 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeCreate(managerPrototype) {

	return managerPrototype[@ 1];
	
}
///@function getManagerPrototypeEventDispatcher(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {Optional<MethodIntent>} eventDispatcher 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeEventDispatcher(managerPrototype) {

	return managerPrototype[@ 4];
	
}
///@function getManagerPrototypeStep(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {Optional<MethodIntent[]>} step 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeStep(managerPrototype) {

	return managerPrototype[@ 2];
	
}
///@function getManagerPrototypeTaskDispatcher(managerPrototype)
///@description Getter.
///@param {ManagerPrototype} managerPrototype
///@return {Optional<MethodIntent>} taskDispatcher 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.360Z}

function getManagerPrototypeTaskDispatcher(managerPrototype) {

	return managerPrototype[@ 5];
	
}
///@function setManagerPrototypeBeanName(managerPrototype, beanName)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {String} beanName
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeBeanName(managerPrototype, beanName) {

	managerPrototype[@ 0] = beanName;
	
}
///@function setManagerPrototypeCleanUp(managerPrototype, cleanUp)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {Optional<MethodIntent[]>} cleanUp
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeCleanUp(managerPrototype, cleanUp) {

	managerPrototype[@ 3] = cleanUp;
	
}
///@function setManagerPrototypeCreate(managerPrototype, create)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {Optional<MethodIntent[]>} create
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeCreate(managerPrototype, create) {

	managerPrototype[@ 1] = create;
	
}
///@function setManagerPrototypeEventDispatcher(managerPrototype, eventDispatcher)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {Optional<MethodIntent>} eventDispatcher
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeEventDispatcher(managerPrototype, eventDispatcher) {

	managerPrototype[@ 4] = eventDispatcher;
	
}
///@function setManagerPrototypeStep(managerPrototype, step)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {Optional<MethodIntent[]>} step
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeStep(managerPrototype, step) {

	managerPrototype[@ 2] = step;
	
}
///@function setManagerPrototypeTaskDispatcher(managerPrototype, taskDispatcher)
///@description Setter.
///@param {ManagerPrototype} managerPrototype
///@param {Optional<MethodIntent>} taskDispatcher
///@throws {Exception}
///@generated {2021-05-01T23:49:42.137Z}

function setManagerPrototypeTaskDispatcher(managerPrototype, taskDispatcher) {

	managerPrototype[@ 5] = taskDispatcher;
	
}
