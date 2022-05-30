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
