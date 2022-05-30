///@function destroyResourcePack(resourcePack)
///@description Destroy ResourcePack entity.
///@param {ResourcePack} resourcePack
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function destroyResourcePack(argument0) {

		var resourcePack = argument0;
	
		var sprites = getResourcePackSprites(resourcePack);
		var sounds = getResourcePackSounds(resourcePack);
		var timelines = getResourcePackTimelines(resourcePack);
	
		if (isOptionalPresent(sprites)) {
			for (var index = 0; index < getArrayLength(sprites); index++) {
				var entity = sprites[@ index];
				destroyResourcePackEntry(entity);
			}
		}
		setResourcePackSprites(resourcePack, null);
	
		if (isOptionalPresent(sounds)) {
			for (var index = 0; index < getArrayLength(sounds); index++) {
				var entity = sounds[@ index];
				destroyResourcePackEntry(entity);
			}
		}
		setResourcePackSounds(resourcePack, null);
	
		if (isOptionalPresent(timelines)) {
			for (var index = 0; index < getArrayLength(timelines); index++) {
				var entity = timelines[@ index];
				destroyResourcePackEntry(entity);
			}
		}
		setResourcePackTimelines(resourcePack, null);
	

	



}
