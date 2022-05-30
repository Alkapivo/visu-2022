///@function convertGMJsonFiedToEntityMap(gmJsonField, entityName)
///@description Converter from json to entity list.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<Map<?Primitive::?Entity>>} entities
///@throws {Exception.ParseException}
///@todo @concept Primitive: integer, number, string, boolean
function convertGMJsonFieldToEntityMap(argument0, argument1) {

		var gmJsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
		if (isDataStructure(gmJsonField, Map)) {
			var map = createMap();
			for (var key = mapFirst(gmJsonField); iteratorFinish(key); key = mapNext(gmJsonField, key)) {
				var gmJsonEntity = gmJsonField[? key];
				if (isDataStructure(gmJsonEntity, Map)) {
					var jsonString = json_encode(gmJsonEntity);
					var entity = runScript(deserializeScript, jsonString);
					map[? key] = entity
				} else {
					throwException(createException(RuntimeException, 
						stringParams("Unable to convert entity {0}. Tjson field wasn't recognized at key: {0}", entityName, key),
						null));
				}
			}
			return map;
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert entities of map \"{0}\". Tjson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}




}
