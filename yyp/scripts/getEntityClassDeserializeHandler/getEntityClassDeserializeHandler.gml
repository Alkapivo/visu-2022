///@function getEntityClassDeserializeHandler(entityClass)
///@description Getter.
///@param {Class<Entity<T>>} entityClass
///@return {Optional<AssetScript> deserializeHandler
///@throws {ClassNotFoundException}
function getEntityClassDeserializeHandler(argument0) {

		var entityClass = argument0;
	
		var entityClassName = getEntityClassName(entityClass);
		var deserializeHandlerName = stringParams("deserialize{0}", entityClassName);
		var deserializeHandler = getAssetIndex(deserializeHandlerName, AssetScript);
		if (isScript(deserializeHandler)) {
			return deserializeHandler;
		} else {
			throwException(
				createException(
					EntityImplementationNotFoundException,
					stringParams(
						"Deserialize handler wasn't found. { \"deserializeHandlerName\": \"{0}\" }", 
						deserializeHandlerName
					)
				)
			);
		}
	
		return createEmptyOptional();
	



}
