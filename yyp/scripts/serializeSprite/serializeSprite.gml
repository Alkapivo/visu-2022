///@function serializeSprite(sprite)
///@description Serialize Sprite to JSON string.
///@param {Sprite} sprite
///@return {String} spriteJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function serializeSprite(argument0) {

		var sprite = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"assetIndex",
			getSpriteAssetIndex(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"currentFrame",
			getSpriteCurrentFrame(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"xScale",
			getSpriteXScale(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"yScale",
			getSpriteYScale(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"alpha",
			getSpriteAlpha(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"angle",
			getSpriteAngle(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"color",
			getSpriteColor(sprite));	

		var spriteJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return spriteJsonString;
	



}
