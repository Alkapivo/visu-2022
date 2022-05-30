///@function deserializeLoadingStage(jsonString)
///@description Deserialize LoadingStage from JSON String to LoadingStage entity.
///@param {String} jsonString
///@return {LoadingStage} loadingStage 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function deserializeLoadingStage(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var currentValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "currentValue"));
		var maxValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "maxValue"));
		var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));

		destroyJsonObject(jsonObject);
	
		return createLoadingStage(currentValue, maxValue, state);
	



}
