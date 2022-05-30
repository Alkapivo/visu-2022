///@function getEntityClassCreateHandler(entityClass)
///@description Getter.
///@param {Class<Entity<T>>} entityClass
///@return {Optional<AssetScript> createHandler
///@throws {EntityImplementationNotFoundException}
function getEntityClassCreateHandler(argument0) {

		var entityClass = argument0;
	
		var entityClassName = getEntityClassName(entityClass);
		var createHandlerName = stringParams("create{0}", entityClassName);
		var createHandler = getAssetIndex(createHandlerName, AssetScript);
	
		if (isScript(createHandler)) {
			return createHandler;
		} else {
			throwException(
				createException(
					EntityImplementationNotFoundException,
					stringParams(
						"Create handler wasn't found. { \"createHandlerName\": \"{0}\" }", 
						createHandlerName
					)
				)
			);
		}
	
		return createEmptyOptional();
	



}
