///@function destroySpaacePlayer(spaacePlayer)
///@description Destroy SpaacePlayer entity.
///@param {SpaacePlayer} spaacePlayer
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function destroySpaacePlayer(spaacePlayer) {


	
	var name = getSpaacePlayerName(spaacePlayer);
	var gridElement = getSpaacePlayerGridElement(spaacePlayer);
	var status = getSpaacePlayerStatus(spaacePlayer);
	var state = getSpaacePlayerState(spaacePlayer);
	var inputHandler = getSpaacePlayerInputHandler(spaacePlayer);
	var horizontalSpeed = getSpaacePlayerHorizontalSpeed(spaacePlayer);
	var verticalSpeed = getSpaacePlayerVerticalSpeed(spaacePlayer);
	var collisionRadius = getSpaacePlayerCollisionRadius(spaacePlayer);
	
	destroyGridElement(gridElement);
	setSpaacePlayerGridElement(spaacePlayer, null);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in SpaacePlayer");
	setSpaacePlayerState(spaacePlayer, null);
	

	
}
