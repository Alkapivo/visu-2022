///@function convertGMJsonFiedToEntityArray(gmJsonField, entityName)
///@description Converter from json to entity array.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<?Entity[]>} entity[]
///@throws {ParseException}
function convertGMJsonFieldToEntity(argument0, argument1) {

		var gmJsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert gmJsonField to Entity. Cannot find script \"{0}\"", scriptName), 
				runtimeExceptionHandler));
		}
	
		if (isDataStructure(gmJsonField, Map)) {
			var jsonString = json_encode(gmJsonField);
			var entity = runScript(deserializeScript, jsonString);
			return entity;
		} else {
			/*
			throwException(
				createException(
					ParseException, 
					stringParams("Unable to convert entity \"{0}\". GMJson field wasn't recognized", entityName), 
				)
			);
			*/
			return createEmptyOptional();
		}




}
