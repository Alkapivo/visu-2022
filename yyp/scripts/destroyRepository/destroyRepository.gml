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
