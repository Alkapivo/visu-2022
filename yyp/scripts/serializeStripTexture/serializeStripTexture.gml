///@function serializeStripTexture(stripTexture)
///@description Serialize StripTexture to JSON string.
///@param {StripTexture} stripTexture
///@return {String} stripTextureJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function serializeStripTexture(argument0) {

		var stripTexture = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"asset",
			getStripTextureAsset(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getStripTextureType(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"frames",
			getStripTextureFrames(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"animationSpeed",
			getStripTextureAnimationSpeed(stripTexture));	

		var stripTextureJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return stripTextureJsonString;
	



}
