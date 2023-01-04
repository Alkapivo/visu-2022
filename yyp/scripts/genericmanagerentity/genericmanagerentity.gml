///@description GenericManager entity

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
///@function serializeGenericManager(genericManager)
///@description Serialize GenericManager to JSON string.
///@param {GenericManager} genericManager
///@return {String} genericManagerJsonString 
///@throws {Exception}
///@generated {2021-03-18T21:51:56.750Z}
function serializeGenericManager(argument0) {

		var genericManager = argument0;
	
		var jsonObject = createJsonObject();

		if (isOptionalPresent(getGenericManagerContext(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"context",
				getGenericManagerContext(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerBeanName(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"beanName",
				getGenericManagerBeanName(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerCreate(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"create",
				getGenericManagerCreate(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerStep(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"step",
				getGenericManagerStep(genericManager));
		}
	
		if (isOptionalPresent(getGenericManagerCleanUp(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"cleanUp",
				getGenericManagerCleanUp(genericManager));
		}
	
		appendFieldToJsonObject(
			jsonObject,
			"data",
			getGenericManagerData(genericManager),
			Map);
	
		appendEntityToJsonObject(
			jsonObject,
			"eventPipeline",
			getGenericManagerEventPipeline(genericManager),
			"Pipeline");
	
		if (isOptionalPresent(getGenericManagerEventDispatcher(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"eventDispatcher",
				getGenericManagerEventDispatcher(genericManager));
		}
	
		appendEntityToJsonObject(
			jsonObject,
			"taskReactor",
			getGenericManagerTaskReactor(genericManager),
			"Reactor");
	
		if (isOptionalPresent(getGenericManagerTaskDispatcher(genericManager))) {
			appendFieldToJsonObject(
				jsonObject,
				"taskDispatcher",
				getGenericManagerTaskDispatcher(genericManager));
		}
	

		var genericManagerJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return genericManagerJsonString;
	



}
///@function deserializeGenericManager(jsonString)
///@description Deserialize GenericManager from JSON String to GenericManager entity.
///@param {String} jsonString
///@return {GenericManager} genericManager 
///@throws {Exception}
///@generated {2021-03-18T21:51:56.750Z}
function deserializeGenericManager(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var context = getJsonObjectFieldValue(jsonObject, "context");
		var beanName = getJsonObjectFieldValue(jsonObject, "beanName");
		var create = getJsonObjectFieldValue(jsonObject, "create");
		var step = getJsonObjectFieldValue(jsonObject, "step");
		var cleanUp = getJsonObjectFieldValue(jsonObject, "cleanUp");
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));
		var eventPipeline = assertNoOptional(getJsonObjectFieldValue(jsonObject, "eventPipeline", Entity, "Pipeline"));
		var eventDispatcher = getJsonObjectFieldValue(jsonObject, "eventDispatcher");
		var taskReactor = assertNoOptional(getJsonObjectFieldValue(jsonObject, "taskReactor", Entity, "Reactor"));
		var taskDispatcher = getJsonObjectFieldValue(jsonObject, "taskDispatcher");

		destroyJsonObject(jsonObject);
	
		return createGenericManager(context, beanName, create, step, cleanUp, data, eventPipeline, eventDispatcher, taskReactor, taskDispatcher);
	



}
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
///@function getGenericManagerBeanName(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<String>} beanName 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerBeanName(argument0) {

		return argument0[@ 1];
	



}
///@function getGenericManagerCleanUp(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<AssetScript>} cleanUp 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerCleanUp(argument0) {

		return argument0[@ 4];
	



}
///@function getGenericManagerContext(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<GMInstance>} context 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerContext(argument0) {

		return argument0[@ 0];
	



}
///@function getGenericManagerCreate(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<AssetScript>} create 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerCreate(argument0) {

		return argument0[@ 2];
	



}
///@function getGenericManagerData(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Map<String::any>} data 
///@throws {Exception}
///@generated {2021-03-18T21:52:05.361Z}
function getGenericManagerData(argument0) {

		return argument0[@ 5];
	



}
///@function getGenericManagerEventDispatcher(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<AssetScript>} eventDispatcher 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerEventDispatcher(argument0) {

		return argument0[@ 7];
	



}
///@function getGenericManagerEventPipeline(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Pipeline} eventPipeline 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerEventPipeline(argument0) {

		return argument0[@ 6];
	



}

///@function getGenericManagerStep(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<AssetScript>} step 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerStep(argument0) {

		return argument0[@ 3];
	



}
///@function getGenericManagerTaskDispatcher(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Optional<AssetScript>} taskDispatcher 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerTaskDispatcher(argument0) {

		return argument0[@ 9];
	



}
///@function getGenericManagerTaskReactor(genericManager)
///@description Getter.
///@param {GenericManager} genericManager
///@return {Reactor} taskReactor 
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function getGenericManagerTaskReactor(argument0) {

		return argument0[@ 8];
	



}
///@function setGenericManagerBeanName(genericManager, beanName)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<String>} beanName
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerBeanName(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setGenericManagerCleanUp(genericManager, cleanUp)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<AssetScript>} cleanUp
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerCleanUp(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
///@function setGenericManagerContext(genericManager, context)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<GMInstance>} context
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerContext(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setGenericManagerCreate(genericManager, create)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<AssetScript>} create
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerCreate(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setGenericManagerData(genericManager, data)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Map<String::any>} data
///@throws {Exception}
///@generated {2021-03-18T21:52:05.362Z}
function setGenericManagerData(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setGenericManagerEventDispatcher(genericManager, eventDispatcher)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<AssetScript>} eventDispatcher
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerEventDispatcher(argument0, argument1) {

		argument0[@ 7] = argument1;
	



}
///@function setGenericManagerEventPipeline(genericManager, eventPipeline)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Pipeline} eventPipeline
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerEventPipeline(argument0, argument1) {

		argument0[@ 6] = argument1;
	



}
///@function setGenericManagerStep(genericManager, step)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<AssetScript>} step
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerStep(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setGenericManagerTaskDispatcher(genericManager, taskDispatcher)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Optional<AssetScript>} taskDispatcher
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerTaskDispatcher(argument0, argument1) {

		argument0[@ 9] = argument1;
	



}
///@function setGenericManagerTaskReactor(genericManager, taskReactor)
///@description Setter.
///@param {GenericManager} genericManager
///@param {Reactor} taskReactor
///@throws {Exception}
///@generated {2021-03-16T18:32:30.046Z}
function setGenericManagerTaskReactor(argument0, argument1) {

		argument0[@ 8] = argument1;
	



}
