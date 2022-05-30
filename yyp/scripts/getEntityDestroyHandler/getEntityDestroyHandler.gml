///@function getEntityDestroyHandler(entity)
///@description Getter.
///@param {Entity<T>} entity
///@return {Optional<AssetScript> destroyHandler
///@throws {ClassNotFoundException|EntityImplementationNotFoundException}
function getEntityDestroyHandler(argument0) {

		var entity = argument0;
	
		var entityClass = getEntityClass(entity);
	
		return isOptionalPresent(entityClass) ?
			getEntityClassDestroyHandler(entityClass) :
			createEmptyOptional();
	



}
