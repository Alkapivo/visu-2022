///@function serializeArrayMap(arrayMap)
///@description Serialize ArrayMap to JSON string.
///@param {ArrayMap<T::S>} arrayMap
///@return {String} arrayMapJsonString 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.819Z}
///@override
function serializeArrayMap(argument0) {

		var arrayMap = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"keys",
			getArrayMapKeys(arrayMap),
			Array);
	
		appendFieldToJsonObject(
			jsonObject,
			"values",
			getArrayMapValues(arrayMap),
			Array);
	
		var arrayMapJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return arrayMapJsonString;
	



}
