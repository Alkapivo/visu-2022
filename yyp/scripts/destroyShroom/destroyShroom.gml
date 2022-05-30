///@function destroyShroom(shroom)
///@description Destroy Shroom entity.
///@param {Shroom} shroom
///@throws {Exception}
///@generated {2021-08-25T13:56:53.721Z}

function destroyShroom(shroom) {


	
	var gridElement = getShroomGridElement(shroom);
	var radius = getShroomRadius(shroom);
	var speedValue = getShroomSpeedValue(shroom);
	var state = getShroomState(shroom);
	var text = getShroomText(shroom);
	var updateHandler = getShroomUpdateHandler(shroom);
	var bulletCollisionHandler = getShroomBulletCollisionHandler(shroom);
	var playerCollisionHandler = getShroomPlayerCollisionHandler(shroom);
	
	destroyGridElement(gridElement);
	setShroomGridElement(shroom, null);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in Shroom");
	setShroomState(shroom, null);
	

	
}
