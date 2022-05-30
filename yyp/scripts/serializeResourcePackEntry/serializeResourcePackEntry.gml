///@function serializeResourcePackEntry(resourcePackEntry)
///@description Serialize ResourcePackEntry to JSON string.
///@param {ResourcePackEntry} resourcePackEntry
///@return {String} resourcePackEntryJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.389Z}
function serializeResourcePackEntry(argument0) {

		var resourcePackEntry = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getResourcePackEntryName(resourcePackEntry));	
		appendFieldToJsonObject(
			jsonObject,
			"path",
			getResourcePackEntryPath(resourcePackEntry));	
		appendFieldToJsonObject(
			jsonObject,
			"options",
			getResourcePackEntryOptions(resourcePackEntry),
			Map);
	

		var resourcePackEntryJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return resourcePackEntryJsonString;
	



}
