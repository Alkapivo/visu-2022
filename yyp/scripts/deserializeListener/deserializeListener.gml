///@function deserializeListener(jsonString)
///@description Deserialize Listener from JSON String to Listener entity.
///@param {String} jsonString
///@return {Listener} listener 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function deserializeListener(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var compareMethod = assertNoOptional(getJsonObjectFieldValue(jsonObject, "compareMethod"));
		var frequency = assertNoOptional(getJsonObjectFieldValue(jsonObject, "frequency"));
		var tick = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tick"));

		destroyJsonObject(jsonObject);
	
		return createListener(compareMethod, frequency, tick);
	



}
