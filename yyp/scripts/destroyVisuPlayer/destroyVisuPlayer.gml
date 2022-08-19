///@function destroyVisuPlayer(visuPlayer)
///@description Destroy VisuPlayer entity.
///@param {VisuPlayer} visuPlayer
///@throws {Exception}
///@generated {2022-08-18T22:24:59.694Z}

function destroyVisuPlayer(visuPlayer) {


	
	var name = getVisuPlayerName(visuPlayer);
	var gridElement = getVisuPlayerGridElement(visuPlayer);
	var status = getVisuPlayerStatus(visuPlayer);
	var state = getVisuPlayerState(visuPlayer);
	var inputHandler = getVisuPlayerInputHandler(visuPlayer);
	var horizontalSpeed = getVisuPlayerHorizontalSpeed(visuPlayer);
	var verticalSpeed = getVisuPlayerVerticalSpeed(visuPlayer);
	var collisionRadius = getVisuPlayerCollisionRadius(visuPlayer);
	
	destroyGridElement(gridElement);
	setVisuPlayerGridElement(visuPlayer, null);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in VisuPlayer");
	setVisuPlayerState(visuPlayer, null);
	

	
}
