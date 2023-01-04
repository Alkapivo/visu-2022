///@description ResourcePack entity

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

///@function getResourcePackSounds(resourcePack)
///@description Getter.
///@param {ResourcePack} resourcePack
///@return {Optional<ResourcePackEntry[]>} sounds 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function getResourcePackSounds(argument0) {

		return argument0[@ 1];
	



}
///@function getResourcePackSprites(resourcePack)
///@description Getter.
///@param {ResourcePack} resourcePack
///@return {Optional<ResourcePackEntry[]>} sprites 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function getResourcePackSprites(argument0) {

		return argument0[@ 0];
	



}
///@function getResourcePackTimelines(resourcePack)
///@description Getter.
///@param {ResourcePack} resourcePack
///@return {Optional<ResourcePackEntry[]>} timelines 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function getResourcePackTimelines(argument0) {

		return argument0[@ 2];
	



}

///@function setResourcePackSounds(resourcePack, sounds)
///@description Setter.
///@param {ResourcePack} resourcePack
///@param {Optional<ResourcePackEntry[]>} sounds
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function setResourcePackSounds(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setResourcePackSprites(resourcePack, sprites)
///@description Setter.
///@param {ResourcePack} resourcePack
///@param {Optional<ResourcePackEntry[]>} sprites
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function setResourcePackSprites(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setResourcePackTimelines(resourcePack, timelines)
///@description Setter.
///@param {ResourcePack} resourcePack
///@param {Optional<ResourcePackEntry[]>} timelines
///@throws {Exception}
///@generated {2020-09-28T21:11:55.161Z}
function setResourcePackTimelines(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
