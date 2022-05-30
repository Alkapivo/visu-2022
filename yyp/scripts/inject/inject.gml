///@function injectContext(injectableClass)
///@description Inject instance of injectableClass.
///@param {Class<T>} injectableClass
///@return {Optional<T>} instance
///@throws {AssetNotFoundException, ClassNotFoundException} 
function inject(injectableClass) {
	
	if (!isClass(injectableClass)) {
		throwException(
			createException(
				ClassNotFoundException,
				stringParams("Class wasn't found. { \"injectableClass\": \"{0}\"}", injectableClass)
			)
		);
		return createEmptyOptional();
	}
	
	var constructorName = stringParams("create{0}", getClassName(injectableClass));
	var constructor = getAssetIndex(constructorName, AssetScript);
	if (!isOptionalPresent(constructor)) {
		throwException(
			createException(
				AssetNotFoundException,
				stringParams("Constructor wasn't found. { \"constructorName\": \"{0}\"}", constructorName)
			)
		);
		return createEmptyOptional();
	}
	
	var instance = runScript(constructor);
	return instance;
}
