///@function deserializeResourcePackEntry(jsonString)
///@description Deserialize ResourcePackEntry from JSON String to ResourcePackEntry entity.
///@param {String} jsonString
///@return {ResourcePackEntry} resourcePackEntry 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function deserializeResourcePackEntry(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var path = assertNoOptional(getJsonObjectFieldValue(jsonObject, "path"));
		var options = assertNoOptional(getJsonObjectFieldValue(jsonObject, "options", Map));

		destroyJsonObject(jsonObject);
	
		return createResourcePackEntry(name, path, options);
	



}
