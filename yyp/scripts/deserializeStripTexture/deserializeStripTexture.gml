///@function deserializeStripTexture(jsonString)
///@description Deserialize StripTexture from JSON String to StripTexture entity.
///@param {String} jsonString
///@return {StripTexture} stripTexture 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function deserializeStripTexture(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var asset = assertNoOptional(getJsonObjectFieldValue(jsonObject, "asset"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var frames = assertNoOptional(getJsonObjectFieldValue(jsonObject, "frames"));
		var animationSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "animationSpeed"));

		destroyJsonObject(jsonObject);
	
		return createStripTexture(asset, type, frames, animationSpeed);
	



}
