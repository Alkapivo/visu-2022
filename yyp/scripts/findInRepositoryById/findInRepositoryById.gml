///@function findInRepositoryById(repository, entityId)
///@description Retrieves an entity by its id.
///@param {Repository} repository
///@param {String} entityId
///@return {Optional<~Entity>} entity
function findInRepositoryById(argument0, argument1) {

		var repository = argument0;
		var entityId = argument1;
	
		var data = getRepositoryData(repository);
		var entity = data[? entityId];
	
		return isUndefined(entity) ? createEmptyOptional() : entity;
	



}
