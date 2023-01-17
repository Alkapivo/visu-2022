///@description

	super();
	
	#region Fields
///@public:
	
	///@description Index is player number
	///@type {List<Player>}
	players = createList();
	
	///@type {String<GameplayTypes>}
	gameplayType = "bullethell";
	
///@private:

	///@type {Position}
	currentPlayerPosition = createPosition(0.0, 0.0);
	
	///@type {Position}
	mousePosition = createPosition(0, 0);
	
	//@type {Number}
	debugMouseSpeed = 0.1;
	
	debugTimer = 0.0;
	
	#endregion
	
	jumpFactor = getPropertyReal("player.jumpFactor", 0.029);
	gravityFactor = getPropertyReal("player.gravityFactor", 0.0011);

	GMObject = {
		create: method(this, function() {
			
			spawnVisuPlayer("main", createInputHandler(KeyboardInputHandler));
		}),
		bullethell: method(this, function(player) {
			
			var playerState = getVisuPlayerState(player);
			var playerGridElement = getVisuPlayerGridElement(player);
			var playerPosition = getGridElementPosition(playerGridElement);
			var inputHandler = getVisuPlayerInputHandler(player);
			var shrooms = getShroomManager().shrooms;
			
			#region Movement
			var keyboardCheckRight = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT))) : false;
			var keyboardCheckLeft = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT))) : false;
			var keyboardCheckUp = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP))) : false;
			var keyboardCheckDown = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN))) : false;
			var keyboardCheckBomb = getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_X));
			var keyboardCheckSlow = getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SHIFT));
			
			var horizontalFriction = getValueFromMap(playerState, "horizontalFriction", 0.001);
			var horizontalMaxSpeed = getValueFromMap(playerState, "horizontalMaxSpeed", 0.01);
			var horizontalSpeed = ((keyboardCheckLeft) || (keyboardCheckRight)) ?
				getVisuPlayerHorizontalSpeed(player) + (keyboardCheckLeft ? -1 : 1) * (getValueFromMap(playerState, "horizontalAcceleration", 0.005) * getDeltaTimeValue()) :
				((abs(getVisuPlayerHorizontalSpeed(player)) - horizontalFriction < 0) ? 0 : getVisuPlayerHorizontalSpeed(player) - sign(getVisuPlayerHorizontalSpeed(player)) * horizontalFriction);
			horizontalSpeed = sign(horizontalSpeed) * clamp(abs(horizontalSpeed), 0, horizontalMaxSpeed);
			horizontalSpeed = keyboardCheckSlow == true
				? horizontalSpeed * 0.67
				: horizontalSpeed;
			var horizontalPosition = getPositionHorizontal(playerPosition) + horizontalSpeed;
			
			if (isOptionalPresent(getPlaygroundController())) {
				var grid = getPlaygroundController().GMObject.state.grid;
				
				if (horizontalPosition > grid.width) {
					grid.view.x = grid.view.x - grid.width; // jump camera hack
					horizontalPosition = abs(horizontalPosition) - (floor(abs(horizontalPosition) / grid.width) * grid.width);
				}
					
				if (horizontalPosition < 0.0) {
					grid.view.x = grid.view.x + grid.width; // jump camera hack
					horizontalPosition = grid.width - (abs(horizontalPosition) - (floor(abs(horizontalPosition) / grid.width) * grid.width));
				}
				horizontalPosition = clamp(horizontalPosition, 0.0, grid.width);
			}
			
			if (isOptionalPresent(getGridRenderer())) {
				 horizontalPosition = clamp(getPositionHorizontal(playerPosition) + horizontalSpeed, 0.0, 1.0);
			}
			
			setPositionHorizontal(playerPosition, horizontalPosition);
			setVisuPlayerHorizontalSpeed(player, horizontalSpeed);
		
			var veticalProjectionScale = fetchVerticalProjectionScale(playerPosition[1]);

			var verticalFriction = getValueFromMap(playerState, "verticalFriction", 0.001) * veticalProjectionScale; 
			var verticalMaxSpeed = getValueFromMap(playerState, "verticalMaxSpeed", 0.01) * veticalProjectionScale; 
			var verticalSpeed = ((keyboardCheckUp) || (keyboardCheckDown)) ?
				getVisuPlayerVerticalSpeed(player) + (keyboardCheckUp ? -1 : 1) * (getValueFromMap(playerState, "verticalAcceleration", 0.005) * veticalProjectionScale * getDeltaTimeValue()) :
				((abs(getVisuPlayerVerticalSpeed(player)) - verticalFriction < 0) ? 0 : getVisuPlayerVerticalSpeed(player) - sign(getVisuPlayerVerticalSpeed(player)) * verticalFriction);
			verticalSpeed = sign(verticalSpeed) * clamp(abs(verticalSpeed), 0, verticalMaxSpeed);
			var verticalSpeed = keyboardCheckSlow == true
				? verticalSpeed * 0.69 
				: verticalSpeed;
			var verticalPosition = getPositionVertical(playerPosition) + verticalSpeed 
			
			if (isOptionalPresent(getPlaygroundController())) {
				var grid = getPlaygroundController().GMObject.state.grid;
				verticalPosition = clamp(verticalPosition, 0.1, grid.height - 0.1);
			}
			
			if (isOptionalPresent(getGridRenderer())) {
				
				var verticalPositionMin = 0.01;
				var verticalPositionMax = 0.80;
				verticalPosition = clamp(verticalPosition, verticalPositionMin, verticalPositionMax);
			}
			
			setPositionVertical(playerPosition, verticalPosition);
			setVisuPlayerVerticalSpeed(player, verticalSpeed);
			#endregion
		
			#region Shooting
			var keyboardCheckAction = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_Z))) : false;
		
			var bulletsCooldown = getValueFromMap(playerState, "bulletsCooldown", 0);
			if ((keyboardCheckAction)
				&& (bulletsCooldown == 0)) {

				bulletsCooldown = 9;
				spawnBullet(createPosition(
						getPositionHorizontal(playerPosition) - 0.015, 
						getPositionVertical(playerPosition)),
					BulletProducer.PLAYER,
					90 + 7
				);
				spawnBullet(createPosition(
						getPositionHorizontal(playerPosition), 
						getPositionVertical(playerPosition)),
					BulletProducer.PLAYER
				);
				spawnBullet(createPosition(
						getPositionHorizontal(playerPosition) + 0.015, 
						getPositionVertical(playerPosition)),
					BulletProducer.PLAYER,
					90 - 7
				);
			}
			
			bulletsCooldown = clamp(bulletsCooldown - applyDeltaTime(1), 0, MAX_NUMBER);
			Core.Collections.Maps.set(playerState, "bulletsCooldown", bulletsCooldown);
			#endregion

			#region Collision
			var isCollision = false;
			var shroomsSize = getListSize(shrooms);
			for (var shroomIndex = 0; shroomIndex < shroomsSize; shroomIndex++) {
				var shroom = shrooms[| shroomIndex];
				var shroomGridElement = getShroomGridElement(shroom);
				var shroomGridElementPosition = getGridElementPosition(shroomGridElement);
				isCollision = (shroomGridElementPosition[1] < playerPosition[1]) && checkCirclesCollision( //@todo replace arrays with getters
					shroomGridElementPosition,
					getShroomRadius(shroom),
					playerPosition,
					getVisuPlayerCollisionRadius(player));
				
				if (isCollision) {
					var shroomState = getShroomState(shroom);
					Core.Collections.Maps.set(shroomState, "status", "end");
					Core.Collections.Maps.set(shroomState, "instantKill", true);
					global.__deaths++;
					continue;
				}
			}
			#endregion
			
			#region Bomb
			var bombTimer = getValueFromMap(playerState, "bombTimer", 0.0);
			var bombTimerDuration = getValueFromMap(playerState, "bombTimerDuration", 3.0);
			if (!timerFinished(bombTimer)) {
			
				bombTimer = incrementTimer(bombTimer, bombTimerDuration);
			}
			
			if ((timerFinished(bombTimer))
				&& (keyboardCheckBomb)) {
				
				bombTimer = incrementTimer(bombTimer, bombTimerDuration);
				getGridRenderer().cameraShake = 64;
				clearList(getShroomManager().shrooms);
				
				var gameController = getGameController();
				gameController.godMode = incrementTimer(gameController.godMode, gameController.godModeDuration);
				
				var shaderEvent = createShaderEvent(
					"Magnify",
					bombTimerDuration,
					createMap(
						[ "positionX", [ 0.5 ] ],
						[ "positionY", [ 0.5 ] ],
						[ "radius", [ 0.06, 0.70, 0.007 ] ],
						[ "minZoom", [ 0.16, 0.41, 0.002 ] ],
						[ "maxZoom", [ 0.41, 0.8, 0.002] ]
					)
				);
				logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
				sendShaderEvent(shaderEvent)
			}
			
			Core.Collections.Maps.set(playerState, "bombTimer", bombTimer);
			#endregion
			
			sendGridElementRenderRequest(playerGridElement);
		}),
		platformer: method(this, function(player) {
			
			var playerState = getVisuPlayerState(player);
			var playerGridElement = getVisuPlayerGridElement(player);
			var playerPosition = getGridElementPosition(playerGridElement);
			var inputHandler = getVisuPlayerInputHandler(player);
			var shrooms = getShroomManager().shrooms;
			var input = {
				keyboardCheckRight: inputHandler != null ? (
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) || 
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT))) : false,
				keyboardCheckLeft: inputHandler != null ? (
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) || 
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT))) : false,
				keyboardCheckUp: inputHandler != null ? (
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP))) : false,
				keyboardCheckDown: inputHandler != null ? (
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) || 
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN))) : false,
				keyboardCheckAction: inputHandler != null ? (
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
					getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE))) : false			
			}
					
			var horizontalPosition = getPositionHorizontal(playerPosition);
			var horizontalFriction = getValueFromMap(playerState, "horizontalFriction", 0.001);
			var horizontalMaxSpeed = getValueFromMap(playerState, "horizontalMaxSpeed", 0.01);
			var horizontalSpeed = ((input.keyboardCheckLeft) || (input.keyboardCheckRight)) ?
				getVisuPlayerHorizontalSpeed(player) + (input.keyboardCheckLeft ? -1 : 1) * (getValueFromMap(playerState, "horizontalAcceleration", 0.005) * getDeltaTimeValue()) :
				((abs(getVisuPlayerHorizontalSpeed(player)) - horizontalFriction < 0) ? 0 : getVisuPlayerHorizontalSpeed(player) - sign(getVisuPlayerHorizontalSpeed(player)) * horizontalFriction);
			horizontalSpeed = sign(horizontalSpeed) * clamp(abs(horizontalSpeed), 0, horizontalMaxSpeed);
			var horizontalPosition = horizontalPosition + horizontalSpeed;

			if (isOptionalPresent(getPlaygroundController())) {
				var grid = getPlaygroundController().GMObject.state.grid;
				
				if (horizontalPosition > grid.width) {
					grid.view.x = grid.view.x - grid.width; // jump camera hack
					horizontalPosition = abs(horizontalPosition) - (floor(abs(horizontalPosition) / grid.width) * grid.width);
				}
					
				if (horizontalPosition < 0.0) {
					grid.view.x = grid.view.x + grid.width; // jump camera hack
					horizontalPosition = grid.width - (abs(horizontalPosition) - (floor(abs(horizontalPosition) / grid.width) * grid.width));
				}
				horizontalPosition = clamp(horizontalPosition, 0.0, grid.width);
			}
			
			if (isOptionalPresent(getGridRenderer())) {
				 horizontalPosition = clamp(getPositionHorizontal(playerPosition) + horizontalSpeed, 0.0, 1.0);
			}
			
			setPositionHorizontal(playerPosition, horizontalPosition);
			setVisuPlayerHorizontalSpeed(player, horizontalSpeed);
			
			var verticalPosition = getPositionVertical(playerPosition);
			var verticalSpeed = getVisuPlayerVerticalSpeed(player);
			var verticalSpeedMax = 1.0;
			var _gravityFactor = applyDeltaTime(gravityFactor);
			
			verticalSpeed += _gravityFactor;
			verticalSpeed = sign(verticalSpeed) * clamp(abs(verticalSpeed), 0.0, verticalSpeedMax);
			var verticalPositionMin = -0.12;
			var verticalPositionMax = 0.80;
			verticalPosition = verticalPosition + applyDeltaTime(verticalSpeed);
			
			if (isOptionalPresent(getPlaygroundController())) {
				verticalPositionMax = getPlaygroundController().GMObject.state.grid.height;
			}
			
			if (isOptionalPresent(getGridRenderer())) {
				verticalPositionMax = 0.80;
			}
			
			verticalSpeed = verticalPosition <= verticalPositionMin ? 0.0 : verticalSpeed;
			verticalSpeed = verticalPosition >= verticalPositionMax ? 0.0 : verticalSpeed;
			verticalPosition = clamp(verticalPosition, verticalPositionMin, verticalPositionMax);
			var movedVerticalPosition = clamp(
				fetchMovedVerticalPositionOnGrid(
					verticalPosition, 
	 				verticalSpeed
				),
				verticalPositionMin,
				verticalPositionMax
			);
			
			setVisuPlayerVerticalSpeed(player, verticalSpeed);
			setPositionVertical(playerPosition, movedVerticalPosition);
			
			
			if ((input.keyboardCheckAction)
				&& (verticalPosition >= verticalPositionMax)) {

				setVisuPlayerVerticalSpeed(player, -jumpFactor);
				Core.Collections.Maps.set(playerState, "doubleJump", true);
				Core.Collections.Maps.set(playerState, "doubleJumpReleased", false);
			}
			
			var doubleJump = Core.Collections.Maps.get(playerState, "doubleJump");
			var doubleJumpReleased = Core.Collections.Maps.get(playerState, "doubleJumpReleased");
			if (doubleJump) {
			
				if (input.keyboardCheckAction) {
				
					if (doubleJumpReleased) {
					
						setVisuPlayerVerticalSpeed(player, -jumpFactor);
						setInMap(playerState, "doubleJump", false);
					}
				} else {
				
					doubleJumpReleased = true;
					Core.Collections.Maps.set(playerState, "doubleJumpReleased", doubleJumpReleased);
				}
			}
			
			var isCollision = false;
			var shroomsSize = getListSize(shrooms);
			for (var shroomIndex = shroomsSize - 1; shroomIndex >= 0; shroomIndex--) {
				var shroom = shrooms[| shroomIndex];
				var shroomGridElement = getShroomGridElement(shroom);
				var shroomGridElementPosition = getGridElementPosition(shroomGridElement);
				
				isCollision = checkCirclesCollision(
					shroomGridElementPosition,
					getShroomRadius(shroom),
					playerPosition,
					getVisuPlayerCollisionRadius(player)
				);
				
				var texture = getSpriteAssetIndex(getGridElementSprite(shroomGridElement));
				var shroomTextureWidth = getShroomRadius(shroom) * 1.5;
				var shroomTextureHeight = getShroomRadius(shroom) * 1.5;
				isCollision = point_in_rectangle(
					getPositionHorizontal(playerPosition),
					getPositionVertical(playerPosition),
					getPositionHorizontal(shroomGridElementPosition) - shroomTextureWidth,
					getPositionVertical(shroomGridElementPosition) - shroomTextureHeight,
					getPositionHorizontal(shroomGridElementPosition) + shroomTextureWidth,
					getPositionVertical(shroomGridElementPosition) + shroomTextureHeight
				);
				
				if ((verticalSpeed >= 0.0)
					&& (isCollision)) {
					
					var stayOnShroom = function(player, shroom, playerState, jumpFactor, input) {
						
						var playerGridElement = getVisuPlayerGridElement(player);
						var playerPosition = getGridElementPosition(playerGridElement)
						var speedValue = getShroomSpeedValue(shroom);
						var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
						if (isOptionalPresent(getPlaygroundController())) {
							gridSpeed = 0.004;//getPlaygroundController().GMObject.state.grid.separators.speed;
						}
												
						if (isOptionalPresent(getGridRenderer())) {
							speedValue = speedValue * (gridSpeed / 0.005);
						}
									
						setVisuPlayerVerticalSpeed(player, 0.0);
						Core.Collections.Maps.set(playerState, "landedOnShroom", true);
						
						Core.Collections.Maps.set(getShroomState(shroom), "playerLanded", true);
						
						var shroomHorizontalSpeed = Core.Collections.Maps.get(getShroomState(shroom), "horizontalSpeed");
						var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
						if (isOptionalPresent(getPlaygroundController())) {
							gridSpeed = 0.004;//getPlaygroundController().GMObject.state.grid.separators.speed;
						}
												
						if (isOptionalPresent(getGridRenderer())) {
							shroomHorizontalSpeed = shroomHorizontalSpeed * (gridSpeed / 0.005);
						}
						
						var movedHorizontalPosition = getPositionHorizontal(playerPosition) + shroomHorizontalSpeed;
						setPositionHorizontal(playerPosition, movedHorizontalPosition);
						
						var calcVerticalPosition = getPositionVertical(playerPosition)
							+ ((getPositionVertical(getGridElementPosition(getShroomGridElement(shroom))) - getPositionVertical(playerPosition))
								/ 1.33)
						var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(
							calcVerticalPosition,
				 			speedValue 
						);
						setPositionVertical(playerPosition, movedVerticalPosition);
						
						if (input.keyboardCheckAction) {
							///@todo shroom.kill();
							var shroomState = getShroomState(shroom);
							Core.Collections.Maps.set(shroomState, "status", "end");
							Core.Collections.Maps.set(shroomState, "instantKill", true);
					
							///@todo player.jump(factor);
							setVisuPlayerVerticalSpeed(player, -1.0 * jumpFactor);
							Core.Collections.Maps.set(playerState, "doubleJump", true);
							Core.Collections.Maps.set(playerState, "doubleJumpReleased", false);
							
						}
						
						if (input.keyboardCheckDown) {
							
							///@todo shroom.kill();
							var shroomState = getShroomState(shroom);
							Core.Collections.Maps.set(shroomState, "status", "end");
							Core.Collections.Maps.set(shroomState, "instantKill", true);
						}
						
						if (movedVerticalPosition <= -0.01) {
							
							///@todo shroom.kill();
							var shroomState = getShroomState(shroom);
							Core.Collections.Maps.set(shroomState, "status", "end");
							Core.Collections.Maps.set(shroomState, "instantKill", true);
						}
					}
					
					//killAndDoubleJump(player, shroom, playerState, jumpFactor);
					stayOnShroom(player, shroom, playerState, jumpFactor, input);
					
					break;
				}
				
				if (!isCollision) {
					
					Core.Collections.Maps.get(playerState, "lastPosition", null);
				}
			}

			var landedOnShroom = Core.Collections.Maps.get(playerState, "landedOnShroom") == true;
			if ((movedVerticalPosition >= verticalPositionMax)
				&& (!isCollision)
				&& (landedOnShroom)) {
				
				Core.Collections.Maps.set(playerState, "landedOnShroom", false)
				respawnVisuPlayer();
			}
			
			if ((movedVerticalPosition <= -0.01) && (landedOnShroom)) {
			
				Core.Collections.Maps.set(playerState, "landedOnShroom", false)
			}
			
			sendGridElementRenderRequest(playerGridElement);
		}),
		update: method(this, function() {
			
			super();
			this.GMObject._glow();
			
			var players = this.players;
			var playersSize = getListSize(players);
			for (var index = 0; index < playersSize; index++) {
				
				var player = players[| index];
				var gameplayHandler = getStructVariable(this.GMObject, this.gameplayType);
				if (isOptionalPresent(gameplayHandler)) {
					gameplayHandler(player);
				}
				
				/// hack, only first player will set camera target
				if ((index == 0) && (isOptionalPresent(getPlaygroundController()))) {
					var gridElement = getVisuPlayerGridElement(player);
					var position = getGridElementPosition(gridElement);
					getPlaygroundController().GMObject.state.grid.view.follow.target = {
						x: getPositionHorizontal(position),
						y: getPositionVertical(position),
					}
				}
			}
			
			if (keyboard_check_pressed(ord("N"))) {
			
				this.gameplayType = this.gameplayType == "bullethell"
					? "platformer"
					: "bullethell";
							
				if (isOptionalPresent(getGameRenderer())) {
					
					var jumbotronEvent = createJumbotronEvent(
						stringParams(
							"  GAME  \n\n>> {0} <<\n\n--------\n",
							string_upper(this.gameplayType)
						),
						"message",
						2.66
					);
					getGameRenderer().jumbotronEvent = jumbotronEvent;
					getGameRenderer().jumbotronEventTimer = 0.0;
				}
				
				var baseScaleResolution = this.gameplayType == "bullethell"
					? getPropertyReal("gameRenderer.baseScaleResolution.bullethell", 2048)
					: getPropertyReal("gameRenderer.baseScaleResolution.platformer", 2048)
				global.__baseScaleResolution = baseScaleResolution
			}
			
			this.debugTimer = incrementTimer(this.debugTimer, 0.5);
			if (timerFinished(this.debugTimer)) {
			
				var player = findPlayerByIndex(0);
				var gridElement = getVisuPlayerGridElement(player);
				var gridPosition = getGridElementPosition(gridElement);
				var positions = {
					xStart: getPositionHorizontal(gridPosition),
					yStart: getPositionVertical(gridPosition),
					xEnd: getPositionHorizontal(gridPosition),
					yEnd: getPositionVertical(gridPosition),
				}
				var particleTask = createParticleTask(
					"particle_shroom_explosion",
					ParticleSystems.BACKGROUND,
					64,
					0.0,
					1.0,
					0.1,
					0.0,
					createPosition(positions.xStart, positions.yStart),
					createPosition(positions.xEnd, positions.yEnd)
				);
				//sendParticleTask(particleTask);
			}
		}),
		cleanUp: method(this, function() {
			for (var index = getListSize(this.players) - 1; index >= 0 ; index--) {
				var player = this.players[| index];
				deregisterPlayer(player);
				destroyVisuPlayer(player);
			}
			destroyDataStructure(this.players, List, "Unable to destroy players");
	
			super();
		}),
		_glow: method(this, function() {
			
			try {
				var player = Core.Collections.Lists.get(this.players, 0);
				var state = getVisuPlayerState(player);
				var color = getValueFromMap(state, "blendColor", { red: 0.25, green: 0.0, blue: 1.0 });
				var amount = getValueFromMap(state, "glowAmount", 0.001);
				
				color.red = color.red + amount;
				color.green = color.green + amount;
				color.blue = color.blue + amount;
				
				color.red = color.red > 1.0 ? color.red - 1.0 : color.red + applyDeltaTime(amount);
				color.green = color.green > 1.0 ? color.green - 1.0 : color.green + applyDeltaTime(amount);
				color.blue = color.blue > 1.0 ? color.blue - 1.0 : color.blue + applyDeltaTime(amount);
				Core.Collections.Maps.set(state, "blendColor", color);

				var spriteBlend = make_color_rgb(color.red * 255, color.green * 255, color.blue * 255);
				Core.Collections.Maps.set(state, "spriteBlend", spriteBlend);
				
			} catch (exception) {
				logger(exception.message, LogType.ERROR);
				printStackTrace();
			}
		})
	}
	
	this.GMObject.create();
	
