///@function createPlayerManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {PlayerManager} playerManager
function createPlayerManager() {

	var class = PlayerManager;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "PlayerManager", instanceLayer);
	
	return instance;
}

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

///@function deregisterPlayerByPlayer(player)
///@description Remove player from players list.
///@param {Player} player
function deregisterPlayer(argument0) {

	var player = argument0;
	
	var players = fetchPlayers();
	var index = findValueInList(players, player);
	
	if (index == null) {
		logger("Cannot deregister player {0}", LogType.ERROR, getVisuPlayerName(player));
		return;
	}
	
	deleteFromList(players, index);
	reduceList(players, undefined); // guard
	
	logger("Player {0} deregistered", LogType.INFO, getVisuPlayerName(player));
}

///@function deregisterPlayerByIndex(index)
///@description Remove player from players list.
///@param {Integer} index
function deregisterPlayerByIndex(argument0) {

	var index = argument0;
	
	var players = fetchPlayers();
	
	if (getListSize(players) < index) {
		logger("Cannot deregister player by index {0}. (max index: {1})", LogType.ERROR, index, getListSize(players));
		return;
	}
	
	deleteFromList(players, index);
	reduceList(players, undefined); // guard
	
	logger("Player with index {0} deregistered", LogType.INFO, index);
}

///@function deregisterPlayerByName(name)
///@description Remove player from players list.
///@param {String} name
function deregisterPlayerByName(argument0) {

	var playerName = argument0;
	
	var players = fetchPlayers();
	
	var foundIndex = null;
	for (var index = 0; index < getListSize(players); index++) {
		var player = players[| index];
		if (playerName == getVisuPlayerName(player)) {
			foundIndex = index;
			break;
		}
	}
	
	if (foundIndex == null) {
		logger("Cannot deregister player {0}", LogType.ERROR, playerName);
		return;
	}
	
	deleteFromList(players, foundIndex);
	reduceList(players, undefined); // guard
	
	logger("Player {0} deregistered", LogType.INFO, playerName);
}

///@function fetchPlayers()
///@description Return players
///@return {List<Player>} players
function fetchPlayers() {

	return getPlayerManager().players;
}

///@function findPlayerByIndex(index)
///@description Return players
///@return {Optional<Player>} players
function findPlayerByIndex(argument0) {

	var index = argument0;

	var players = getPlayerManager().players;
	
	return (getListSize(players) > index) ? players[| index] : null;
}

///@function getPlayerManager()
///@description Getter.
///@return {Optional<PlayerManager>} playerManager
function getPlayerManager() {

	return global.playerManagerContext;
}

///@function registerPlayer(player)
///@description Add player to players list.
///@param {Player} player
function registerPlayer(argument0) {

	var player = argument0;
	
	var players = fetchPlayers();
	
	addToList(players, player);
	reduceList(players, null); // guard
	
	logger("Player {0} registered with index {1}", LogType.INFO, 
		getVisuPlayerName(player), getListSize(players) - 1);
}

///@param {String} name
///@param {?InputHandler} inputHandler
function spawnVisuPlayer(name, inputHandler) {

	var position = createPosition(0.5, 0.75);
	var spriteIndex = asset_texture_visu_player;
	sprite_set_speed(spriteIndex, 10, spritespeed_framespersecond);
	var sprite = createSprite(spriteIndex, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	var gridElement = createGridElement(
		position,
		sprite,
		createGridElementInfo(false, GridElementInfoType.DEFAULT, "", c_white));
	var status = PlayerStatus.INTRO,
	var state = createVisuPlayerState();
	var horizontalSpeed = 0.0;
	var verticalSpeed = 0.0;
	var collisionRadius = fetchCollisionRadiusFromSprite(sprite) * 0.75;

	var player = createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius);
	
	registerPlayer(player);
}
