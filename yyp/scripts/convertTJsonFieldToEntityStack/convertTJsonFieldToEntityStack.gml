///@function convertTJsonFiedToEntityStack(tjsonField, entityName)
///@description Converter from json to entity stack.
///@param {TJsonField} tjsonField
///@param {String} entityName
///@return {Optional<Stack<?Entity>>} entities
///@throws {Exception.ParseException}
function convertTJsonFieldToEntityStack(argument0, argument1) {

		var tjsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
		if (tj_is_array(tjsonField)) {
			var arrayLength = getArrayLength(tjsonField);
			var stack = createStack();
			for (var index = 0; index < arrayLength; index++) {
				var tjsonEntity = tjsonField[@ index];
				if (tj_is_object(tjsonEntity)) {
					var jsonString = tj_encode(tjsonEntity);
					var entity = runScript(deserializeScript, jsonString);
					pushStack(stack, entity);
				} else {
					throwException(createException(ParseException, 
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at index: {1}", entityName, index),
						null));		
				}
			}
			return stack;
		}
	
		return createEmptyOptional();
	



}
