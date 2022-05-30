///@function deserializeLoadingIntent(jsonString)
///@description Deserialize LoadingIntent from JSON String to LoadingIntent entity.
///@param {String} jsonString
///@return {LoadingIntent} loadingIntent 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function deserializeLoadingIntent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var scene = assertNoOptional(getJsonObjectFieldValue(jsonObject, "scene"));
		var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

		destroyJsonObject(jsonObject);
	
		return createLoadingIntent(scene, data);
	



}
