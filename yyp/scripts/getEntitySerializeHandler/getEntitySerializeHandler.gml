///@function getEntitySerializeHandler(entity)
///@description Getter.
///@param {Entity<T>} entity
///@return {Optional<AssetScript> serializeHandler
///@throws {ClassNotFoundException|EntityImplementationNotFoundException}
function getEntitySerializeHandler(argument0) {

		var entity = argument0;
	
		var entityClass = getEntityClass(entity);
	
		return isOptionalPresent(entityClass) ?
			getEntityClassSerializeHandler(entityClass) :
			createEmptyOptional();
	



}
