///@description

	super();
	
	if (global.demo) {
		
		templateTimer = incrementTimer(templateTimer, 2.66);
		if (timerFinished(templateTimer)) {
			var templateNameIndex = clamp(round(random(getArrayLength(templateNames) - 1)), 0, getArrayLength(templateNames) - 1);								
			currentTemplate = templateNames[templateNameIndex];
			setInstanceVariable(getSceneRenderer(), "__currentTemplate", getInstanceVariable(getShroomManager(), "currentTemplate"));
			logger("Current shroom shader template: {0}", LogType.INFO, currentTemplate);
		}
	}
		
	#region Shroom reactor
	var destroyShrooms = [];
	var shroomsSize = getListSize(shrooms);
	for (var index = 0; index < shroomsSize; index++) {
		var shroom = shrooms[| index];
		var shroomGridElement = getShroomGridElement(shroom);
		var shroomPosition = getGridElementPosition(shroomGridElement);
		
		#region Resovle Status
		var shroomState = getShroomState(shroom);
		var shroomStatus = getValueFromMap(shroomState, "status", "run");
	
		switch (shroomStatus) {
			case "run":
			
				#region Movement
				var speedValue = getShroomSpeedValue(shroom);
				var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
				speedValue = speedValue * (gridSpeed / 0.005);
				
				var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(
					getPositionVertical(shroomPosition), 
	 				speedValue);
				setPositionVertical(shroomPosition, movedVerticalPosition);
				
				
				var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", choose(1, -1) * (random(6.66) / 1000));
				var movedHorizontalPosition = getPositionHorizontal(shroomPosition) + applyDeltaTime(horizontalSpeed);
				setPositionHorizontal(shroomPosition, movedHorizontalPosition);
				
				if ((movedVerticalPosition >= -1.5) &&
					(movedVerticalPosition <= 1.5)) {
						
					sendGridElementRenderRequest(shroomGridElement);
				} else {
					destroyShrooms = pushArray(destroyShrooms, index);
				}
				#endregion
				
				
				if (getPlayerManager().gameplayType == "bullethell") {
				
					var isShooting = getValueFromMap(shroomState, "isShooting", choose(true, false));
					Core.Collections._Map.set(shroomState, "isShooting", isShooting);
					if (isShooting) {
						
						var bulletTimer = getValueFromMap(shroomState, "bulletTimer", 0);
						var bulletTimerDuration = getValueFromMap(shroomState, "bulletTimerDuration", 0.27);
						bulletTimer = incrementTimer(bulletTimer, bulletTimerDuration);
						if (timerFinished(bulletTimer)) {
					
							spawnBullet(
								createPosition(
									getPositionHorizontal(shroomPosition),
									getPositionVertical(shroomPosition)
								), 
								BulletProducer.SHROOM, 
								270 + (choose(1, -1) * random(7)), 
								createSprite(asset_texture_bullet_shroom_01, 0, 1.0, 1.0, 1.0, 0.0, c_white),
								0.01, 
								0.001
							);
						}
				
						Core.Collections._Map.set(shroomState, "bulletTimer", bulletTimer);
					}
				}
				break;
			case "end":
			
				getGameController().gameplayData.shroomCounter++;
			
				var instantKill = getValueFromMap(shroomState, "instantKill", false);
				if (instantKill) {
				
					destroyShrooms = pushArray(destroyShrooms, index);
					break;
				}
			
				var dieTimer = getValueFromMap(shroomState, "dieTimer", 0);
				var dieTimerDuration = getValueFromMap(shroomState, "dieTimerDuration", 0);
				var bulletTaken = shroomState[? "bulletTaken"]
				dieTimer = incrementTimer(dieTimer, dieTimerDuration);
				if ((timerFinished(dieTimer)) ||
					(bulletTaken > 0)) { //3
					
					if (bulletTaken > 0) { //3
						
						destroyShrooms = pushArray(destroyShrooms, index);
						break;
					} else {
					
						setInMap(shroomState, "status", "run");
					}
				}
				shroomState[? "dieTimer"] = dieTimer;
			
				#region Movement
				var speedValue = getShroomSpeedValue(shroom) / (bulletTaken + 1.5);
				var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
				speedValue = speedValue * (gridSpeed / 0.005);
				
				var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(
					getPositionVertical(shroomPosition), 
	 				speedValue);
				setPositionVertical(shroomPosition, movedVerticalPosition);
				
				var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", choose(1, -1) * (random(6.66) / 1000));
				var movedHorizontalPosition = getPositionHorizontal(shroomPosition) + applyDeltaTime(horizontalSpeed);
				setPositionHorizontal(shroomPosition, movedHorizontalPosition);
				
				if ((movedVerticalPosition >= -1.5) &&
					(movedVerticalPosition <= 1.5)) {
						
					sendGridElementRenderRequest(shroomGridElement);
				} else {
					destroyShrooms = pushArray(destroyShrooms, index);
				}
				#endregion
							
				break;
		}

		#endregion
	}
	
	removeItemsFromList(shrooms, destroyShrooms, destroyShroom);
	#endregion
	
