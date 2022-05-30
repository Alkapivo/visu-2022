///@function getEntityDeserializeHandler(entity)
///@description Getter.
///@param {Entity<T>} entity
///@return {Optional<AssetScript> deserializeHandler
///@throws {ClassNotFoundException|EntityImplementationNotFoundException}
function getEntityDeserializeHandler(argument0) {

		var entity = argument0;
	
		var entityClass = getEntityClass(entity);
	
		return isOptionalPresent(entityClass) ?
			getEntityClassDeserializeHandler(entityClass) :
			createEmptyOptional();
	



}
