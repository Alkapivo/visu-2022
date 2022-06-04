///@function createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius)
///@description Constructor for VisuPlayer entity.
///@param {String} name
///@param {GridElement} gridElement
///@param {PlayerStatus} status
///@param {Map<String::any>} state
///@param {Instance} inputHandler
///@param {Number} horizontalSpeed
///@param {Number} verticalSpeed
///@param {Number} collisionRadius
///@return {VisuPlayer} visuPlayer 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius) {

	var visuPlayer = createEntity(VisuPlayer);

	setVisuPlayerName(visuPlayer, assertNoOptional(name));
	setVisuPlayerGridElement(visuPlayer, assertNoOptional(gridElement));
	setVisuPlayerStatus(visuPlayer, assertNoOptional(status));
	setVisuPlayerState(visuPlayer, assertNoOptional(state));
	setVisuPlayerInputHandler(visuPlayer, assertNoOptional(inputHandler));
	setVisuPlayerHorizontalSpeed(visuPlayer, assertNoOptional(horizontalSpeed));
	setVisuPlayerVerticalSpeed(visuPlayer, assertNoOptional(verticalSpeed));
	setVisuPlayerCollisionRadius(visuPlayer, assertNoOptional(collisionRadius));

	return visuPlayer;
	
}
