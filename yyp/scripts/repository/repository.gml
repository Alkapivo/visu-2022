///@description Repository entity

///@function createRepository(name, type, data)
///@description Constructor for Repository entity.
///@param {String} name
///@param {String} type
///@param {Map<String::Entity>} data
///@return {Repository} repository 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function createRepository(argument0, argument1, argument2) {

		var name = argument0;
		var type = argument1;
		var data = argument2;
	
		var repository = createEntity(Repository);

		setRepositoryName(repository, assertNoOptional(name));
		setRepositoryType(repository, assertNoOptional(type));
		setRepositoryData(repository, assertNoOptional(data));

		return repository;
	



}
///@function serializeRepository(repository)
///@description Serialize Repository to JSON string.
///@param {Repository} repository
///@return {String} repositoryJsonString 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
///@override
function serializeRepository(argument0) {

		var repository = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getRepositoryName(repository));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getRepositoryType(repository));	
	#region @override
		var entityTypeName = getRepositoryType(repository);
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getRepositoryData(repository),
			entityTypeName,
			Map);
	#endregion
	

		var repositoryJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);
	
		return repositoryJsonString;
	



}
///@function deserializeRepository(jsonString)
///@description Deserialize Repository from JSON String to Repository entity.
///@param {String} jsonString
///@return {Repository} repository 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
///@override 
function deserializeRepository(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	#region @override
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map, type));
	#endregion

		destroyJsonObject(jsonObject);
	
		return createRepository(name, type, data);
	



}
///@function destroyRepository(repository)
///@description Destroy Repository entity.
///@param {Repository} repository
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
///@override
function destroyRepository(argument0) {

		var repository = argument0;
	
		var name = getRepositoryName(repository);
		var type = getRepositoryType(repository);
		var data = getRepositoryData(repository);
	
		for (var key = mapFirst(data); iteratorFinish(key); key = mapNext(data, key)) {
			var entity = data[? key];
		#region @override
			var entityClass = findEntityClassByName(type);
			var destroyHandler = getEntityClassDestroyHandler(entityClass);
			runScript(destroyHandler, entity);
		#endregion
		}
		destroyDataStructure(data, Map, "Unable to destroy Map data in Repository");
		setRepositoryData(repository, null);
	

	



}
///@function getRepositoryData(repository)
///@description Getter.
///@param {Repository} repository
///@return {Map<String::Entity>} data 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function getRepositoryData(argument0) {

		return argument0[@ 2];
	



}
///@function getRepositoryName(repository)
///@description Getter.
///@param {Repository} repository
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function getRepositoryName(argument0) {

		return argument0[@ 0];
	



}
///@function getRepositoryType(repository)
///@description Getter.
///@param {Repository} repository
///@return {String} type 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function getRepositoryType(argument0) {

		return argument0[@ 1];
	



}
///@function setRepositoryData(repository, data)
///@description Setter.
///@param {Repository} repository
///@param {Map<String::Entity>} data
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function setRepositoryData(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setRepositoryName(repository, name)
///@description Setter.
///@param {Repository} repository
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function setRepositoryName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setRepositoryType(repository, type)
///@description Setter.
///@param {Repository} repository
///@param {String} type
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function setRepositoryType(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
