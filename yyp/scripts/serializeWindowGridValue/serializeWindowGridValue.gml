///@function serializeWindowGridValue(windowGridValue)
///@description Serialize WindowGridValue to JSON string.
///@param {WindowGridValue} windowGridValue
///@return {String} windowGridValueJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.573Z}
function serializeWindowGridValue(argument0) {

		var windowGridValue = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"data",
			getWindowGridValueData(windowGridValue));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getWindowGridValueType(windowGridValue));	
		appendEntityToJsonObject(
			jsonObject,
			"color",
			getWindowGridValueColor(windowGridValue),
			"Color");
	

		var windowGridValueJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return windowGridValueJsonString;
	



}
