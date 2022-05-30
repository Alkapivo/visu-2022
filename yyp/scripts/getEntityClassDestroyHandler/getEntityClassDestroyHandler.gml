///@function getEntityClassDestroyHandler(entityClass)
///@description Getter.
///@param {Class<Entity<T>>} entityClass
///@return {Optional<AssetScript> destroyHandler
///@throws {ClassNotFoundException}
function getEntityClassDestroyHandler(argument0) {

		var entityClass = argument0;

		var entityClassName = getEntityClassName(entityClass);
		var destroyHandlerName = stringParams("destroy{0}", entityClassName);
		var destroyHandler = getAssetIndex(destroyHandlerName, AssetScript);
		if (isScript(destroyHandler)) {
			return destroyHandler;
		} else {
			throwException(
				createException(
					EntityImplementationNotFoundException,
					stringParams(
						"Destroy handler wasn't found. { \"destroyHandlerName\": \"{0}\" }", 
						destroyHandlerName
					)
				)
			);
		}
	
		return createEmptyOptional();
	



}
