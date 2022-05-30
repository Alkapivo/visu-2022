///@function createSpaacePlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius)
///@description Constructor for SpaacePlayer entity.
///@param {String} name
///@param {GridElement} gridElement
///@param {PlayerStatus} status
///@param {Map<String::any>} state
///@param {Instance} inputHandler
///@param {Number} horizontalSpeed
///@param {Number} verticalSpeed
///@param {Number} collisionRadius
///@return {SpaacePlayer} spaacePlayer 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function createSpaacePlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius) {

	var spaacePlayer = createEntity(SpaacePlayer);

	setSpaacePlayerName(spaacePlayer, assertNoOptional(name));
	setSpaacePlayerGridElement(spaacePlayer, assertNoOptional(gridElement));
	setSpaacePlayerStatus(spaacePlayer, assertNoOptional(status));
	setSpaacePlayerState(spaacePlayer, assertNoOptional(state));
	setSpaacePlayerInputHandler(spaacePlayer, assertNoOptional(inputHandler));
	setSpaacePlayerHorizontalSpeed(spaacePlayer, assertNoOptional(horizontalSpeed));
	setSpaacePlayerVerticalSpeed(spaacePlayer, assertNoOptional(verticalSpeed));
	setSpaacePlayerCollisionRadius(spaacePlayer, assertNoOptional(collisionRadius));

	return spaacePlayer;
	
}
