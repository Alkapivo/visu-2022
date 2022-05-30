///@function saveInRepository(repository, entityId, entity)
///@description Save a given entity. Support fluentApi.
///@param {Repository} repository
///@param {String} entityId
///@param {~Entity} entity
///@return {~Entity} entity
function saveInRepository(argument0, argument1, argument2) {

	    var repository = argument0;
		var entityId = argument1;
	    var entity = argument2;

	    var data = getRepositoryData(repository);
	    data[? entityId] = entity;
	
		return entity;
	



}
