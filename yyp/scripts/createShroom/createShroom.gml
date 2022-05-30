///@function createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler)
///@description Constructor for Shroom entity.
///@param {GridElement} gridElement
///@param {Number} radius
///@param {Number} speedValue
///@param {Map<String::any>} state
///@param {Optional<String>} text
///@param {AssetScript} updateHandler
///@param {Optional<AssetScript>} bulletCollisionHandler
///@param {Optional<AssetScript>} playerCollisionHandler
///@return {Shroom} shroom 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.721Z}

function createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler) {

	var shroom = createEntity(Shroom);

	setShroomGridElement(shroom, assertNoOptional(gridElement));
	setShroomRadius(shroom, assertNoOptional(radius));
	setShroomSpeedValue(shroom, assertNoOptional(speedValue));
	setShroomState(shroom, assertNoOptional(state));
	setShroomText(shroom, text);
	setShroomUpdateHandler(shroom, assertNoOptional(updateHandler));
	setShroomBulletCollisionHandler(shroom, bulletCollisionHandler);
	setShroomPlayerCollisionHandler(shroom, playerCollisionHandler);

	return shroom;
	
}
