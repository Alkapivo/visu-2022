///@function convertTJsonFiedToEntity(tjsonField, entityName)
///@description Converter from json to entity.
///@param {TJsonField} tjsonField
///@param {String} entityName
///@return {Optional<?Entity>} entity
///@throws {Exception.ParseException}
function convertTJsonFieldToEntity(argument0, argument1) {

		var tjsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
		
		if (tj_is_object(tjsonField)) {
			var jsonString = tj_encode(tjsonField);
			var entity = runScript(deserializeScript, jsonString);
			return entity;
		}
	
		return createEmptyOptional();
	



}
