///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionTeleportHandler(data) {
	
	var location = getFromMap(data, "location");
	var level = getFromMap(data, "level");
	var xCoord = getFromMap(data, "xCoord");
	var yCoord = getFromMap(data, "yCoord");
	
	location = parseWorldLocationTypeFromString(location);
	
	transportWorldInstanceBetweenWorldLayers(PlayerContext, createEmptyOptional(), xCoord, yCoord, location, level);
	
	return true;
}
