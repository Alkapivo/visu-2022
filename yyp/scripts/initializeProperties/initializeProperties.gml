///@function initializeProperties()
///@description Initialize global.properties.
///@throws {RuntimeException}
function initializeProperties() {

		if (isDataStructure(global.properties, Map)) {
			var propertiesString = readStringFromFile(working_directory + "system", "properties.json", StorageType.LOCAL);
			if (!isOptionalPresent(propertiesString)) {
				throwException(
					createException(
						RuntimeException, 
						"Cannot boot without properties.json", 
					runtimeExceptionHandler)
				);
				return;
			}
		
			var propertiesJson = decodeJson(propertiesString, JsonDecoderType.GMJSON);
			if (!isOptionalPresent(propertiesJson) || !isJsonObject(propertiesJson)) {
				throwException(
					createException(
						RuntimeException, 
						"Unable to parse properties.json", 
					runtimeExceptionHandler)
				);
				return;
			}
		
			var keys = getJsonObjectKeys(propertiesJson);
			for (var index = 0; index < getArrayLength(keys); index++) {
				var propertyName = keys[index];
				var propertyValue = getJsonObjectFieldValue(propertiesJson, propertyName);
				addProperty(propertyName, propertyValue);
			}		
		} else {
			throwException(
				createException(
					RuntimeException, 
					"global.properties isn't a Map<String::Object>", 
				runtimeExceptionHandler)
			);
			return;
		}
	



}
