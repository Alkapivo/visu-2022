///@function destroyShroom(shroom)
///@description Destroy Shroom entity.
///@param {Shroom} shroom
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

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
