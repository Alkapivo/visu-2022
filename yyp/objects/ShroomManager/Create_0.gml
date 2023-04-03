///@description ShroomManager::GMCreate event 


	#region ///@interface Manager
///@public:

	//@type {List<GridElement>}
	shrooms = createList();
	
	///@type {Map<String::ShaderEvent>}
	shroomShaderEventTemplates = createMap();
	
	///@type {String}
	currentShaderTemplate = ""
	
///@private:

	///@type {Number}
	templateTimer = 0.0;
	
	///@type {String[]}
	templateNames = [];

	#endregion
	
	spawnTimer = -3;
	GMObject = {
		state: getShroomManager,
		create: method(this, function() {
		
			super();
			
			this.shroomTemplateRepository = createRepository("shroomTemplateRepository", Entity, createMap());
			var shroomTemplatesJsonString = Core.File.read({ 
				path: "data", 
				filename: "shroom-templates.json", 
				withDialog: false 
			});
			parseJsonShroomTemplates(shroomTemplatesJsonString)
			
			this.shaderEventEffectEmboss = createShaderEvent(
				"Emboss",
				2.4,
				createMap());
			this.shaderEventEffectLED = createShaderEvent(
				"LED",
				2.2,
				createMap(
					[ "brightness", 1.5 ],
					[ "ledSize", 128 ]
				));
			this.shaderEventEffectMagnifyLeftToRight = createShaderEvent(
				"Magnify",
				3.0,
				createMap(
					[ "positionX", [ 0.3, 0.8, 0.002 ] ],
					[ "positionY", 0.5 ],
					[ "radius", [ 0.25, 0.40, 0.01 ] ],
					[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
					[ "maxZoom", [ 0.60, 0.90, 0.02] ]));
			this.shaderEventEffectMagnifyRightToLeft = createShaderEvent(
				"Magnify",
				3.0,
				createMap(
					[ "positionX", [ 0.8, 0.3, 0.002 ] ],
					[ "positionY", 0.5 ],
					[ "radius", [ 0.25, 0.40, 0.01 ] ],
					[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
					[ "maxZoom", [ 0.60, 0.90, 0.02] ]));
			this.shaderEventEffectMosaic = createShaderEvent(
				"Mosaic",
				2.6,
				createMap(
					[ "amount", [ 80, 512, 2, 0.01 ] ]));
			this.shaderEventEffectWave = createShaderEvent(
				"Wave",
				1.9,
				createMap(
					[ "amount", [ 15, 25, 0.05 ] ],
					[ "distortion", [ 30, 45, 0.05 ] ],
					[ "speed", [ 2 ] ],
					[ "time",  [ 0, 1000, 0.01 ] ]));
			this.shaderEventEffectThermal = createShaderEvent(
				"Thermal",
				2.4,
				createMap());
			this.shaderEventEffectRevert = createShaderEvent(
				"Revert",
				2.4,
				createMap());
			this.shaderEventEffectRipple = createShaderEvent(
				"Ripple",
				4.8,
				createMap(
					[ "positionX", 0.5 ],
		            [ "positionY", [ 0.3, 0.8, 0.002 ] ],
		            [ "amount", [ 30, 40, 0.2 ] ],
		            [ "distortion", 30 ],
		            [ "speed", [ 1, 5, 0.02 ] ],
		            [ "time", [ 0, 1000, 0.1 ] ]
				));
		
			addToMap(this.shroomShaderEventTemplates, "Emboss", this.shaderEventEffectEmboss);
			addToMap(this.shroomShaderEventTemplates, "LED", this.shaderEventEffectLED);
			addToMap(this.shroomShaderEventTemplates, "MagnifyLeftToRight", this.shaderEventEffectMagnifyLeftToRight);
			addToMap(this.shroomShaderEventTemplates, "MagnifyRightToLeft", this.shaderEventEffectMagnifyRightToLeft);
			addToMap(this.shroomShaderEventTemplates, "Mosaic", this.shaderEventEffectMosaic);
			addToMap(this.shroomShaderEventTemplates, "Wave", this.shaderEventEffectWave);
			addToMap(this.shroomShaderEventTemplates, "Thermal", this.shaderEventEffectThermal);
			addToMap(this.shroomShaderEventTemplates, "Revert", this.shaderEventEffectRevert);
			addToMap(this.shroomShaderEventTemplates, "Ripple", this.shaderEventEffectRipple);

			this.templateNames = [
				"Emboss",
				"LED",
				"MagnifyLeftToRight",
				"MagnifyLeftToRight",
				"MagnifyLeftToRight",
				"MagnifyRightToLeft",
				"MagnifyRightToLeft",
				"MagnifyRightToLeft",
				"Mosaic",
				"Mosaic",
				"Mosaic",
				"Wave",
				"Wave",
				"Wave",
				"Thermal",
				"Revert",
				"Ripple",
				"Ripple",
				"Ripple"
			]
	
			var templateNameIndex = clamp(round(random(getArrayLength(this.templateNames) - 1)), 0, getArrayLength(templateNames) - 1);
			this.currentShaderTemplate = this.templateNames[templateNameIndex];	
		}),
		update: method(this, function() {
			super();
			var gameController = fetchGameController()
			var destroyShrooms = [];
			var shroomsSize = getListSize(shrooms);
			for (var index = 0; index < shroomsSize; index++) {
				var shroom = shrooms[| index];
				var shroomGridElement = getShroomGridElement(shroom);
				var shroomPosition = getGridElementPosition(shroomGridElement);
		
				var shroomState = getShroomState(shroom);
				var shroomStatus = getValueFromMap(shroomState, "status", "run");
	
				switch (shroomStatus) {
					case "run":
			
						var sprite = getGridElementSprite(shroomGridElement);
						var alpha = clamp(getSpriteAlpha(sprite) + applyDeltaTime(), 0.0, 1.0);
						setSpriteAlpha(sprite, alpha);
			
						#region Movement
						var isZigzagMovement = getValueFromMap(shroomState, "isZigzagMovement", false);
						if (isZigzagMovement) {
							var verticalSpeed = getValueFromMap(shroomState, "verticalSpeed", 0); 
							var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", 0);
							var spawnPosition = getValueFromMap(shroomState, "spawnPosition", SpawnPosition_TOP);
							var zigzagTimer = getValueFromMap(shroomState, "zigzagTimer", 0);
							var zigzagAmount = getValueFromMap(shroomState, "zigzagAmount", 0.002);
							var zigzagSpeed = getValueFromMap(shroomState, "zigzagSpeed", 0.2);
							zigzagTimer = incrementTimer(zigzagTimer, 6.28, zigzagSpeed);
							Core.Collections.Maps.set(shroomState, "zigzagTimer", zigzagTimer);
							if ((spawnPosition == SpawnPosition_TOP) 
								|| (spawnPosition == SpawnPosition_BOTTOM)) {
								
								horizontalSpeed = sin(zigzagTimer) * zigzagAmount
								Core.Collections.Maps.set(shroomState, "horizontalSpeed", horizontalSpeed);
							}
							
							if ((spawnPosition == SpawnPosition_LEFT) 
								|| (spawnPosition == SpawnPosition_RIGHT)) {
							
								verticalSpeed = sin(zigzagTimer) * zigzagAmount
								Core.Collections.Maps.set(shroomState, "verticalSpeed", verticalSpeed);
							}
							
						}
						
						if (isOptionalPresent(getPlaygroundController())) {
							
							var grid = getPlaygroundController().GMObject.state.grid;
							var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", 0) * grid.speed;
							var verticalSpeed = getValueFromMap(shroomState, "verticalSpeed", 0) * grid.speed
							
							var movedHorizontalPosition = getPositionHorizontal(shroomPosition) + applyDeltaTime(horizontalSpeed) * gameController.separatorSpeed;
							var movedVerticalPosition = getPositionVertical(shroomPosition) + applyDeltaTime(verticalSpeed) * gameController.separatorSpeed;
							
							setPositionHorizontal(shroomPosition, movedHorizontalPosition);
							setPositionVertical(shroomPosition, movedVerticalPosition);
							
							var destroyCurrentShroom = false;
							
							var aliveTimer = getValueFromMap(shroomState, "aliveTimer", 0.0);
							aliveTimer += applyDeltaTime();
							if (aliveTimer > 10.0) {
								
								var horizontalDistance = abs(grid.view.x + (grid.view.width / 2.0) - movedHorizontalPosition);
								if (horizontalDistance > grid.view.width * 1.5) {
									destroyCurrentShroom = true;
								}
							}
							Core.Collections.Maps.set(shroomState, "aliveTimer", aliveTimer);
							var scanMargin = 3.0
							if ((movedVerticalPosition > grid.height + scanMargin)
								|| (movedVerticalPosition < -1 * scanMargin)) {
								
								destroyCurrentShroom = true;
							}
							
							var positionX = getPositionHorizontal(shroomPosition);
							var positionY = getPositionVertical(shroomPosition);
							if (positionX < grid.view.x - grid.view.width - 1.5
								|| positionX > grid.view.x + grid.view.width + grid.view.width + 1.5
								|| positionY < grid.view.y - grid.view.height - 1.5
								|| positionY > grid.view.y + grid.view.height + grid.view.height + 1.5) {
						
								destroyCurrentShroom = true;
							}
							
							if (destroyCurrentShroom) {
								logger("Shroom destroyed", LogType.INFO);
								destroyShrooms = pushArray(destroyShrooms, index);
							} else {
								sendGridElementRenderRequest(shroomGridElement);	
							}
						}
						
						if (isOptionalPresent(getGridRenderer())) {
							var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", 0);
							var verticalSpeed = getValueFromMap(shroomState, "verticalSpeed", 0); 
							var speedValue = getShroomSpeedValue(shroom);
							var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
							speedValue = speedValue * 0.33 * (gridSpeed / 0.005);
							var movedHorizontalPosition = getPositionHorizontal(shroomPosition) + (applyDeltaTime(horizontalSpeed  * (gridSpeed / 0.005)));
							var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(getPositionVertical(shroomPosition), speedValue) + applyDeltaTime(verticalSpeed);
							if ((movedVerticalPosition >= -1.5) &&
								(movedVerticalPosition <= 1.5)) {
						
								sendGridElementRenderRequest(shroomGridElement);
							} else {
								destroyShrooms = pushArray(destroyShrooms, index);
							}
						
							if ((movedHorizontalPosition <= -1.5) &&
								(movedHorizontalPosition >= 1.5)) {
						
								destroyShrooms = pushArray(destroyShrooms, index);
							}
							setPositionHorizontal(shroomPosition, movedHorizontalPosition);
							setPositionVertical(shroomPosition, movedVerticalPosition);
						}
						#endregion
						
						if (getPlayerManager().gameplayType == "bullethell") {
				
							var isShooting = getValueFromMap(shroomState, "isShooting", false);
							Core.Collections.Maps.set(shroomState, "isShooting", isShooting);
							if (isShooting) {
						
								var shootingInterval = getValueFromMap(shroomState, "shootingInterval", 1.0);
								var bulletTimer = getValueFromMap(shroomState, "bulletTimer", shootingInterval);
								bulletTimer = incrementTimer(bulletTimer, shootingInterval);
								if (timerFinished(bulletTimer)) {
					
									var shootDummyBullet = function(shroomState, shroomPosition) {
								
										var bulletAngleRange = getValueFromMap(shroomState, "bulletAngleRange", choose(0.008, 0.009));
										var bulletSpeed = getValueFromMap(shroomState, "bulletSpeed", choose(0.009, 0.016));
										spawnBullet(
											createPosition(
												getPositionHorizontal(shroomPosition),
												getPositionVertical(shroomPosition)
											), 
											BulletProducer.SHROOM, 
											270 + (choose(1, -1) * random(bulletAngleRange)), 
											createSprite(asset_texture_visu_bullet_1, 0, 1.0, 1.0, 1.0, 0.0, c_white),
											bulletSpeed, 
											0.0008
										);
									}
							
									var shootBulletThatWillFollowPlayer = function(shroomState, shroomPosition) {
							
										var playerPosition = getGridElementPosition(getVisuPlayerGridElement(fetchPlayers()[| 0]));
										var bulletSpeed = getValueFromMap(shroomState, "bulletSpeed", choose(0.005, 0.006, 0.007, 0.008));
										spawnBullet(
											createPosition(
												getPositionHorizontal(shroomPosition),
												getPositionVertical(shroomPosition)
											), 
											BulletProducer.SHROOM, 
											180 + getAngleBetweenPoints(playerPosition, shroomPosition), 
											createSprite(asset_texture_visu_bullet_1, 0, 1.0, 1.0, 1.0, 0.0, c_white),
											bulletSpeed, 
											0.0008
										);
									}
					
									var bulletFollowPlayer = getValueFromMap(shroomState, "bulletFollowPlayer", false) == true;
									if (bulletFollowPlayer) {
								
										shootBulletThatWillFollowPlayer(shroomState, shroomPosition);
									} else {
								
										shootDummyBullet(shroomState, shroomPosition);
									}
								}
				
								Core.Collections.Maps.set(shroomState, "bulletTimer", bulletTimer);
							}
						}
				
						if (getPlayerManager().gameplayType == "platformer") {
				
							var isSlidingAwayAfterLanding = function(shroom) {
						
								var shroomState = getShroomState(shroom);
								var isFeatureEnabled = getValueFromMap(shroomState, "slideAwayAfterLanding", false) == true;
								if (isFeatureEnabled) {
							
									var playerLanded = Core.Collections.Maps.get(shroomState, "playerLanded") == true;
									if (playerLanded) {
						
										var horizontalPosition = getPositionHorizontal(getGridElementPosition(getShroomGridElement(shroom)));
										var horizontalDirection = horizontalPosition < 0.5 ? 1 : -1;
								
										Core.Collections.Maps.set(shroomState, "slideAwayAfterLanding", false);
										Core.Collections.Maps.set(shroomState, "horizontalSpeed", getShroomSpeedValue(shroom) * 0.75 * horizontalDirection);
										setShroomSpeedValue(shroom, getShroomSpeedValue(shroom) * 0.66);
									}
								}
							}
					
							isSlidingAwayAfterLanding(shroom);
						}
						break;
					case "end":
			
						if (isOptionalPresent(getGameController())) {
							getGameController().gameplayData.shroomCounter++;
						}
			
						var instantKill = getValueFromMap(shroomState, "instantKill", false);
						if (instantKill) {
				
							destroyShrooms = pushArray(destroyShrooms, index);
							var surfaceWidth = 2048;
							var surfaceHeight = 2048;
							var elementX = getPositionHorizontal(shroomPosition);
							var elementY = getPositionVertical(shroomPosition);	
							if (isOptionalPresent(getPlaygroundController())) {
								var grid = getPlaygroundController().GMObject.state.grid;
								var renderXPosition = (elementX - grid.view.x) * surfaceWidth;
								var renderYPosition = (elementY - grid.view.y) * surfaceHeight;
								var texture = getSpriteAssetIndex(getGridElementSprite(shroomGridElement))
								var textureWidth = Core.Assets.Texture.getWidth(texture)
								var textureHeight = Core.Assets.Texture.getHeight(texture)
								var particleTask = createParticleTask(
									"particle_shroom_explosion",
									ParticleSystems.BACKGROUND,
									40,
									0.0,
									0.1,
									FRAME_MS,
									0.0,
									createPosition(renderXPosition - (textureWidth / 2.0), renderYPosition - (textureHeight / 2.0)),
									createPosition(renderXPosition + (textureWidth / 2.0), renderYPosition + (textureHeight / 2.0))
								);
								sendParticleTask(particleTask);	
							}
							break;
						}
			
						var fadeAway = true;
						if (fadeAway) {
							var dieTimer = getValueFromMap(shroomState, "dieTimer", 0);
							var dieTimerDuration = getValueFromMap(shroomState, "dieTimerDuration", 0.5);
							dieTimer = incrementTimer(dieTimer, dieTimerDuration);
							var sprite = getGridElementSprite(shroomGridElement);
							setSpriteAlpha(sprite, (dieTimerDuration - dieTimer) / dieTimerDuration);
							setSpriteXScale(sprite, 1.0 + 6 * ((dieTimer) / dieTimerDuration))
							setSpriteYScale(sprite, 1.0 + 6 * ((dieTimer) / dieTimerDuration))
							
							var isNotFirstTick = getValueFromMap(shroomState, "isNotFirstTick", false);
							if (!isNotFirstTick) {
								setInMap(shroomState, "isNotFirstTick", true);
								
								var surfaceWidth = 2048;
								var surfaceHeight = 2048;
								var elementX = getPositionHorizontal(shroomPosition);
								var elementY = getPositionVertical(shroomPosition);	
								if (isOptionalPresent(getPlaygroundController())) {
									var grid = getPlaygroundController().GMObject.state.grid;
									var renderXPosition = (elementX - grid.view.x) * surfaceWidth;
									var renderYPosition = (elementY - grid.view.y) * surfaceHeight;
									var texture = getSpriteAssetIndex(getGridElementSprite(shroomGridElement))
									var textureWidth = Core.Assets.Texture.getWidth(texture)
									var textureHeight = Core.Assets.Texture.getHeight(texture)
									var particleTask = createParticleTask(
										"particle_shroom_explosion",
										ParticleSystems.BACKGROUND,
										30,
										0.0,
										0.33,
										FRAME_MS * 2,
										0.0,
										createPosition(renderXPosition - (textureWidth / 2.0), renderYPosition - (textureHeight / 2.0)),
										createPosition(renderXPosition + (textureWidth / 2.0), renderYPosition + (textureHeight / 2.0))
									);
									sendParticleTask(particleTask);	
								}
							}
							
							if (timerFinished(dieTimer)) {
								destroyShrooms = pushArray(destroyShrooms, index);
								var surfaceWidth = 2048;
								var surfaceHeight = 2048;
								var elementX = getPositionHorizontal(shroomPosition);
								var elementY = getPositionVertical(shroomPosition);	
							}
							shroomState[? "dieTimer"] = dieTimer;
							sendGridElementRenderRequest(shroomGridElement);
							break;
						}
				}

			}
	
			removeItemsFromList(shrooms, destroyShrooms, destroyShroom);
			
			this.spawnTimer = incrementTimer(this.spawnTimer, 2.0);
			//if (timerFinished(this.spawnTimer)) {
			if (keyboard_check_pressed(ord("P"))) {
				var templates = [ "shroom-01" ];
				
				var shroomTemplate = Core.Collections.Arrays.getRandomValue(templates);
				actionSpawnShroom(shroomTemplate);
			}
		}),
		cleanUp: method(this, function() {
	
			super();
	
			for (var index = 0; index < getListSize(shrooms); index++) {
				var shroom = shrooms[| index];
				destroyShroom(shroom);
			}
			destroyDataStructure(shrooms, List, "Unable to destroy shrooms");
	
			for (var key = mapFirst(shroomShaderEventTemplates); iteratorFinish(key); key = mapNext(shroomShaderEventTemplates, key)) {
				var shaderEvent = shroomShaderEventTemplates[? key];
				destroyShaderEvent(shaderEvent);
			}
			destroyDataStructure(shroomShaderEventTemplates, Map, "Unable to destroy shroomShaderEventTemplates");
		})			
	}
	
	this.GMObject.create();
	
	