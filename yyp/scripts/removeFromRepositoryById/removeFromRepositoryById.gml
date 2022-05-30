///@function removeFromRepositoryById(repository, entityId)
///@description Remove entity by it's id. Support fluentApi.
///@param {Repository} repository
///@param {String} entityId
function removeFromRepositoryById(argument0, argument1) {

	    var repository = argument0;
		var entityId = argument1;

	    var data = getRepositoryData(repository);
		if (isDataStructure(data, Map)) {
			removeFromMap(data, entityId);
		}
	



}
