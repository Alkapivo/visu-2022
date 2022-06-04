///@function createVisuPlayerState() 
///@description Create and initialize state Map<String::Object> with fields and values.
///@return {Map<String::Object>} state
function createVisuPlayerState() {
	
	var state = createMap(
		createTuple("scoreValue", 0.0),
		createTuple("bullets", 0),
		createTuple("godMode", false),
		createTuple("horizontalFriction", 0.0003 * 3),
		createTuple("horizontalMaxSpeed", 0.0100 * 1.2),
		createTuple("horizontalAcceleration", 0.0006 * 1.1),
		createTuple("verticalFriction", 0.0003 * 3),
		createTuple("verticalMaxSpeed", 0.0100 * 1.2),
		createTuple("verticalAcceleration", 0.0006 * 1.1));
		
	return state;
}
