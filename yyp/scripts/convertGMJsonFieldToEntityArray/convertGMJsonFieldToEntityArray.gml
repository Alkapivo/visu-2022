///@function convertGMJsonFiedToEntityArray(gmJsonField, entityName)
///@description Converter from json to entity array.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<?Entity[]>} entity[]
///@throws {ParseException}
function convertGMJsonFieldToEntityArray(argument0, argument1) {

		var gmJsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
		if (isDataStructure(gmJsonField, List)) {
			var listSize = getListSize(gmJsonField);
			var array = createArray(listSize, null);
			for (var index = 0; index < listSize; index++) {
				var gmJsonEntity = gmJsonField[| index];
				if (isDataStructure(gmJsonField, Map)) {
					var jsonString = json_encode(gmJsonEntity);
					var entity = runScript(deserializeScript, jsonString);
					array[index] = entity;
				} else {
					throwException(createException(ParseException,
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at index: {1}", entityName, index),
						null));
				}
			}
			return array;
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert entities array of \"{0}\". Tjson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}




}
