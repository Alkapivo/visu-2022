///@function convertGMJsonFiedToEntityQueue(gmJsonField, entityName)
///@description Converter from json to entity queue.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<Queue<?Entity>>} entities
///@throws {Exception.ParseException}
function convertGMJsonFieldToEntityQueue(argument0, argument1) {

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
			var queue = createQueue();
			for (var index = 0; index < listSize; index++) {
				var gmJsonEntity = gmJsonField[| index];
				if (isDataStructure(gmJsonField, Map)) {
					var jsonString = json_encode(gmJsonEntity);
					var entity = runScript(deserializeScript, jsonString);
					pushQueue(queue, entity);
				} else {
					throwException(createException(ParseException,
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at index: {1}", entityName, index),
						null));		
				}
			}
			return queue;
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(ParseException,
				stringParams("Unable to convert entities queue of \"{0}\". Tjson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}




}
