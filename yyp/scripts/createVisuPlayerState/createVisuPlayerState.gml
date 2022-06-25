///@function createVisuPlayerState() 
///@description Create and initialize state Map<String::Object> with fields and values.
///@return {Map<String::Object>} state
function createVisuPlayerState() {
	
	var state = createMap(
		createTuple("scoreValue", 0.0),
		createTuple("bullets", 0),
		createTuple("godMode", false),
		createTuple("horizontalFriction", 0.0003 * getPropertyReal("player.horizontalFriction", 3.1)),
		createTuple("horizontalMaxSpeed", 0.0100 * getPropertyReal("player.horizontalMaxSpeed", 0.6)),
		createTuple("horizontalAcceleration", 0.0006 * getPropertyReal("player.horizontalAcceleration", 3.2)),
		createTuple("verticalFriction", 0.0003 * getPropertyReal("player.verticalFriction", 3.1)),
		createTuple("verticalMaxSpeed", 0.0100 * getPropertyReal("player.verticalMaxSpeed", 0.6)),
		createTuple("verticalAcceleration", 0.0006 * getPropertyReal("player.verticalAcceleration", 2.1))
	);
		
	return state;
}
