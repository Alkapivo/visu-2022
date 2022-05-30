///@function deserializeResourcePack(jsonString)
///@description Deserialize ResourcePack from JSON String to ResourcePack entity.
///@param {String} jsonString
///@return {ResourcePack} resourcePack 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function deserializeResourcePack(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var sprites = getJsonObjectFieldValue(jsonObject, "sprites", Array, "ResourcePackEntry");
		var sounds = getJsonObjectFieldValue(jsonObject, "sounds", Array, "ResourcePackEntry");
		var timelines = getJsonObjectFieldValue(jsonObject, "timelines", Array, "ResourcePackEntry");

		destroyJsonObject(jsonObject);
	
		return createResourcePack(sprites, sounds, timelines);
	



}
