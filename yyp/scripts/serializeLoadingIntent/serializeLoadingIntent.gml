///@function serializeLoadingIntent(loadingIntent)
///@description Serialize LoadingIntent to JSON string.
///@param {LoadingIntent} loadingIntent
///@return {String} loadingIntentJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.322Z}
function serializeLoadingIntent(argument0) {

		var loadingIntent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"scene",
			getLoadingIntentScene(loadingIntent));	
		if (isOptionalPresent(getLoadingIntentData(loadingIntent))) {
			appendEntityToJsonObject(
				jsonObject,
				"data",
				getLoadingIntentData(loadingIntent),
				"ArrayMap");
		}
	

		var loadingIntentJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return loadingIntentJsonString;
	



}
