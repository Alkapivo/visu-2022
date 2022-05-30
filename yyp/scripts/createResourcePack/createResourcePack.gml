///@function createResourcePack(sprites, sounds, timelines)
///@description Constructor for ResourcePack entity.
///@param {Optional<ResourcePackEntry[]>} sprites
///@param {Optional<ResourcePackEntry[]>} sounds
///@param {Optional<ResourcePackEntry[]>} timelines
///@return {ResourcePack} resourcePack 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.160Z}
function createResourcePack(argument0, argument1, argument2) {

		var sprites = argument0;
		var sounds = argument1;
		var timelines = argument2;
	
		var resourcePack = createEntity(ResourcePack);

		setResourcePackSprites(resourcePack, sprites);
		setResourcePackSounds(resourcePack, sounds);
		setResourcePackTimelines(resourcePack, timelines);

		return resourcePack;
	



}
