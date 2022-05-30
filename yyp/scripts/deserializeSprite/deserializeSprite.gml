///@function deserializeSprite(jsonString)
///@description Deserialize Sprite from JSON String to Sprite entity.
///@param {String} jsonString
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function deserializeSprite(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var assetIndex = assertNoOptional(getJsonObjectFieldValue(jsonObject, "assetIndex"));
		var currentFrame = assertNoOptional(getJsonObjectFieldValue(jsonObject, "currentFrame"));
		var xScale = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xScale"));
		var yScale = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yScale"));
		var alpha = assertNoOptional(getJsonObjectFieldValue(jsonObject, "alpha"));
		var angle = assertNoOptional(getJsonObjectFieldValue(jsonObject, "angle"));
		var color = assertNoOptional(getJsonObjectFieldValue(jsonObject, "color"));

		destroyJsonObject(jsonObject);
	
		return createSprite(assetIndex, currentFrame, xScale, yScale, alpha, angle, color);
	



}
