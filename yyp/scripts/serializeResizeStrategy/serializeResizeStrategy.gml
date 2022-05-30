///@function serializeResizeStrategy(resizeStrategy)
///@description Serialize ResizeStrategy to JSON string.
///@param {ResizeStrategy} resizeStrategy
///@return {String} resizeStrategyJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.139Z}
function serializeResizeStrategy(argument0) {

		var resizeStrategy = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"realWidth",
			getResizeStrategyRealWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"realHeight",
			getResizeStrategyRealHeight(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"guiWidth",
			getResizeStrategyGuiWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"guiHeight",
			getResizeStrategyGuiHeight(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"viewWidth",
			getResizeStrategyViewWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"viewHeight",
			getResizeStrategyViewHeight(resizeStrategy));	

		var resizeStrategyJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return resizeStrategyJsonString;
	



}
