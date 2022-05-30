///@function convertTJsonFiedToEntityMap(tjsonField, entityName)
///@description Converter from json to entity map.
///@param {TJsonField} tjsonField
///@param {String} entityName
///@return {Optional<Map<Object::?Entity>>} entities
///@throws {Exception.ParseException}
function convertTJsonFieldToEntityMap(argument0, argument1) {

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
			var keys = tj_keys(tjsonField);
			var keysLength = getArrayLength(keys);
			var map = createMap();
			for (var index = 0; index < keysLength; index++) {
				var key = keys[index];
				var tjsonObject = tj_get(tjsonField, key);
				if (tj_is_object(tjsonObject)) {
					var jsonString = tj_encode(tjsonObject);
					var entity = runScript(deserializeScript, jsonString);
					map[? key] = entity;
				} else {
					throwException(createException(ParseException, 
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at key: {1}", entityName, key),
						null));
				}
			}
			return map;
		}
	
		return null;
	



}
