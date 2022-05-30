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
