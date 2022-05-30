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
