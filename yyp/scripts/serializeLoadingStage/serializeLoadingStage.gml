///@function serializeLoadingStage(loadingStage)
///@description Serialize LoadingStage to JSON string.
///@param {LoadingStage} loadingStage
///@return {String} loadingStageJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.338Z}
function serializeLoadingStage(argument0) {

		var loadingStage = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"currentValue",
			getLoadingStageCurrentValue(loadingStage));	
		appendFieldToJsonObject(
			jsonObject,
			"maxValue",
			getLoadingStageMaxValue(loadingStage));	
		appendFieldToJsonObject(
			jsonObject,
			"state",
			getLoadingStageState(loadingStage),
			Map);
	

		var loadingStageJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return loadingStageJsonString;
	



}
