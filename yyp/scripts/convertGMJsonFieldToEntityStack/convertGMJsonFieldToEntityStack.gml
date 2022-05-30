///@function convertGMJsonFiedToEntityStack(gmJsonField, entityName)
///@description Converter from json to entity stack.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<Stack<?Entity>>} entities
///@throws {Exception.ParseException}
function convertGMJsonFieldToEntityStack(argument0, argument1) {

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
			var stack = createStack();
			for (var index = 0; index < listSize; index++) {
				var gmJsonEntity = gmJsonField[| index];
				if (isDataStructure(gmJsonField, Map)) {
					var jsonString = json_encode(gmJsonEntity);
					var entity = runScript(deserializeScript, jsonString);
					pushStack(stack, entity);
				} else {
					throwException(createException(ParseException, 
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at index: {1}", entityName, index),
						runtimeExceptionHandler));
				}
			}
			return stack;
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(ParseException, 
				stringParams("Unable to convert entities stack of \"{0}\". Tjson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}




}
