///@function getEntityClassSerializeHandler(entityClass)
///@description Getter.
///@param {Class<Entity<T>>} entityClass
///@return {Optional<AssetScript> serializeHandler
///@throws {EntityImplementationNotFoundException}
function getEntityClassSerializeHandler(argument0) {

		var entityClass = argument0;
	
		var entityClassName = getEntityClassName(entityClass);
		var serializeHandlerName = stringParams("serialize{0}", entityClassName);
		var serializeHandler = getAssetIndex(serializeHandlerName, AssetScript);
	
		if (isScript(serializeHandler)) {
			return serializeHandler;
		} else {
			throwException(
				createException(
					EntityImplementationNotFoundException,
					stringParams(
						"Serialize handler wasn't found. { \"serializeHandlerName\": \"{0}\" }", 
						serializeHandlerName
					)
				)
			);
		}
	
		return createEmptyOptional();
	



}
