///@function existsInRepository(repository, entityId)
///@description Check if entity with given entityId exists in repository.
///@param {Repository} repository
///@param {String} entityId
///@return {Boolean} exists
function existsInRepositoryById(argument0, argument1) {

		var repository = argument0;
		var entityId = argument1;
	
		return mapContains(getRepositoryData(repository), entityId);
	
	


}
