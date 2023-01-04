///@description ResourcePackEntry entity

///@function createResourcePackEntry(name, path, options)
///@description Constructor for ResourcePackEntry entity.
///@param {String} name
///@param {String} path
///@param {Map<String::any>} options
///@return {ResourcePackEntry} resourcePackEntry 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function createResourcePackEntry(argument0, argument1, argument2) {

		var name = argument0;
		var path = argument1;
		var options = argument2;
	
		var resourcePackEntry = createEntity(ResourcePackEntry);

		setResourcePackEntryName(resourcePackEntry, assertNoOptional(name));
		setResourcePackEntryPath(resourcePackEntry, assertNoOptional(path));
		setResourcePackEntryOptions(resourcePackEntry, assertNoOptional(options));

		return resourcePackEntry;
	



}
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
///@function destroyResourcePackEntry(resourcePackEntry)
///@description Destroy ResourcePackEntry entity.
///@param {ResourcePackEntry} resourcePackEntry
///@generated {2019-12-03T13:25:31.055Z}
///@override
function destroyResourcePackEntry(argument0) {

		var resourcePackEntry = argument0;
	
		var options = getResourcePackEntryOptions(resourcePackEntry);
	

		if (options != null) {
			destroyDataStructure(options, Map, "Unable to destroy Map options in ResourcePackEntry");
			setResourcePackEntryOptions(resourcePackEntry, null);
		}

	
	



}
///@function getResourcePackEntryName(resourcePackEntry)
///@description Getter.
///@param {ResourcePackEntry} resourcePackEntry
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function getResourcePackEntryName(argument0) {

		return argument0[@ 0];
	



}
///@function getResourcePackEntryOptions(resourcePackEntry)
///@description Getter.
///@param {ResourcePackEntry} resourcePackEntry
///@return {Optional<Map<String::Object>>} options 
///@generated {2019-12-03T13:25:31.056Z}
///@override
function getResourcePackEntryOptions(argument0) {

		return argument0[@ 2];
	



}
///@function getResourcePackEntryPath(resourcePackEntry)
///@description Getter.
///@param {ResourcePackEntry} resourcePackEntry
///@return {String} path 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function getResourcePackEntryPath(argument0) {

		return argument0[@ 1];
	



}
///@function setResourcePackEntryName(resourcePackEntry, name)
///@description Setter.
///@param {ResourcePackEntry} resourcePackEntry
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function setResourcePackEntryName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setResourcePackEntryOptions(resourcePackEntry, options)
///@description Setter.
///@param {ResourcePackEntry} resourcePackEntry
///@param {Optional<Map<String::Object>>} options
///@generated {2019-12-03T13:25:31.057Z}
///@override
function setResourcePackEntryOptions(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setResourcePackEntryPath(resourcePackEntry, path)
///@description Setter.
///@param {ResourcePackEntry} resourcePackEntry
///@param {String} path
///@throws {Exception}
///@generated {2020-09-28T21:11:55.248Z}
function setResourcePackEntryPath(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
