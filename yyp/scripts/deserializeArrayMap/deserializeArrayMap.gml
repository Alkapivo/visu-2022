///@function deserializeArrayMap(jsonString)
///@description Deserialize ArrayMap from JSON String to ArrayMap entity.
///@param {String} jsonString
///@return {ArrayMap<T::S>} arrayMap 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.820Z}
///@override
function deserializeArrayMap(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var keys = getJsonObjectFieldValue(jsonObject, "keys");
		if (!isOptionalPresent(keys)) {
			logger("[deserializeArrayMap] Field \"keys\" is null". LogType.WARNING)
		}
		if (isJsonArray(keys)) {
			keys = cloneArray(getJsonArrayData(keys));
		} else {
			logger("[deserializeArrayMap] Field \"keys\" isn't an JsonArray", LogType.WARNING);
		}
	
		var values = getJsonObjectFieldValue(jsonObject, "values");
		if (!isOptionalPresent(values)) {
			logger("[deserializeArrayMap] Field \"values\" is null". LogType.WARNING)
		}
		if (isJsonArray(values)) {
			values = cloneArray(getJsonArrayData(values));
		} else {
			logger("[deserializeArrayMap] Field \"values\" isn't an JsonArray", LogType.WARNING);
		}
	

		return createArrayMap(keys, values);
	



}
