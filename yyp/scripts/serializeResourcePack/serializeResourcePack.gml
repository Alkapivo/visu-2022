///@function serializeResourcePack(resourcePack)
///@description Serialize ResourcePack to JSON string.
///@param {ResourcePack} resourcePack
///@return {String} resourcePackJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.373Z}
function serializeResourcePack(argument0) {

		var resourcePack = argument0;
	
		var jsonObject = createJsonObject();

		if (isOptionalPresent(getResourcePackSprites(resourcePack))) {
			appendEntityToJsonObject(
				jsonObject,
				"sprites",
				getResourcePackSprites(resourcePack),
				"ResourcePackEntry",
				Array);
		}
	
		if (isOptionalPresent(getResourcePackSounds(resourcePack))) {
			appendEntityToJsonObject(
				jsonObject,
				"sounds",
				getResourcePackSounds(resourcePack),
				"ResourcePackEntry",
				Array);
		}
	
		if (isOptionalPresent(getResourcePackTimelines(resourcePack))) {
			appendEntityToJsonObject(
				jsonObject,
				"timelines",
				getResourcePackTimelines(resourcePack),
				"ResourcePackEntry",
				Array);
		}
	

		var resourcePackJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return resourcePackJsonString;
	



}
