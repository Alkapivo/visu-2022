///@function serializeListener(listener)
///@description Serialize Listener to JSON string.
///@param {Listener} listener
///@return {String} listenerJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.295Z}
function serializeListener(argument0) {

		var listener = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"compareMethod",
			getListenerCompareMethod(listener));	
		appendFieldToJsonObject(
			jsonObject,
			"frequency",
			getListenerFrequency(listener));	
		appendFieldToJsonObject(
			jsonObject,
			"tick",
			getListenerTick(listener));	

		var listenerJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return listenerJsonString;
	



}
