///@function getEntityCreateHandler(entity)
///@description Getter.
///@param {Entity<T>} entity
///@return {Optional<AssetScript> createHandler
///@throws {ClassNotFoundException|EntityImplementationNotFoundException}
function getEntityCreateHandler(argument0) {

		var entity = argument0;
	
		var entityClass = getEntityClass(entity);
	
		return isOptionalPresent(entityClass) ?
			getEntityClassCreateHandler(entityClass) :
			createEmptyOptional();
	



}
