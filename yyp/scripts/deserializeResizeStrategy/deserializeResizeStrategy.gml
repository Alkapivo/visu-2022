///@function deserializeResizeStrategy(jsonString)
///@description Deserialize ResizeStrategy from JSON String to ResizeStrategy entity.
///@param {String} jsonString
///@return {ResizeStrategy} resizeStrategy 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function deserializeResizeStrategy(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var realWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realWidth"));
		var realHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realHeight"));
		var guiWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiWidth"));
		var guiHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiHeight"));
		var viewWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewWidth"));
		var viewHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewHeight"));

		destroyJsonObject(jsonObject);
	
		return createResizeStrategy(realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight);
	



}
