///@description

	super();
	
	#region Fields
///@public:
	
	///@description Index is player number
	///@type {List<Player>}
	players = createList();
	
	///@type {String<GameplayTypes>}
	gameplayType = "platformer";
	
///@private:

	///@type {Position}
	currentPlayerPosition = createPosition(0.0, 0.0);
	
	///@type {Position}
	mousePosition = createPosition(0, 0);
	
	//@type {Number}
	debugMouseSpeed = 0.1;
	#endregion
	
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
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_D))) : false;
			var keyboardCheckLeft = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_A))) : false;
			var keyboardCheckUp = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_W))) : false;
			var keyboardCheckDown = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_S))) : false;
				
			
			var horizontalFriction = getValueFromMap(playerState, "horizontalFriction", 0.001);
			var horizontalMaxSpeed = getValueFromMap(playerState, "horizontalMaxSpeed", 0.01);
			var horizontalSpeed = ((keyboardCheckLeft) || (keyboardCheckRight)) ?
				getVisuPlayerHorizontalSpeed(player) + (keyboardCheckLeft ? -1 : 1) * (getValueFromMap(playerState, "horizontalAcceleration", 0.005) * getDeltaTimeValue()) :
				((abs(getVisuPlayerHorizontalSpeed(player)) - horizontalFriction < 0) ? 0 : getVisuPlayerHorizontalSpeed(player) - sign(getVisuPlayerHorizontalSpeed(player)) * horizontalFriction);
			horizontalSpeed = sign(horizontalSpeed) * clamp(abs(horizontalSpeed), 0, horizontalMaxSpeed);
			var horizontalPosition = clamp(getPositionHorizontal(playerPosition) + horizontalSpeed, 0.0, 1.0);
			setPositionHorizontal(playerPosition, horizontalPosition);
			setVisuPlayerHorizontalSpeed(player, horizontalSpeed);
		
			var veticalProjectionScale = fetchVerticalProjectionScale(playerPosition[1]);
			var verticalPositionMin = 0.01;
			var verticalPositionMax = 0.87;
			var verticalFriction = getValueFromMap(playerState, "verticalFriction", 0.001) * veticalProjectionScale; 
			var verticalMaxSpeed = getValueFromMap(playerState, "verticalMaxSpeed", 0.01) * veticalProjectionScale; 
			var verticalSpeed = ((keyboardCheckUp) || (keyboardCheckDown)) ?
				getVisuPlayerVerticalSpeed(player) + (keyboardCheckUp ? -1 : 1) * (getValueFromMap(playerState, "verticalAcceleration", 0.005) * veticalProjectionScale * getDeltaTimeValue()) :
				((abs(getVisuPlayerVerticalSpeed(player)) - verticalFriction < 0) ? 0 : getVisuPlayerVerticalSpeed(player) - sign(getVisuPlayerVerticalSpeed(player)) * verticalFriction);
			verticalSpeed = sign(verticalSpeed) * clamp(abs(verticalSpeed), 0, verticalMaxSpeed);
			var verticalPosition = clamp(getPositionVertical(playerPosition) + verticalSpeed, verticalPositionMin, verticalPositionMax);
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
						getPositionHorizontal(playerPosition), 
						getPositionVertical(playerPosition)),
					BulletProducer.PLAYER
				);
			}
			
			bulletsCooldown = clamp(bulletsCooldown - applyDeltaTime(1), 0, MAX_NUMBER);
			Core.Collections._Map.set(playerState, "bulletsCooldown", bulletsCooldown);
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
					Core.Collections._Map.set(shroomState, "status", "end");
					Core.Collections._Map.set(shroomState, "instantKill", true);
					global.__deaths++;
					continue;
				}
			}
			#endregion
			
			sendGridElementRenderRequest(playerGridElement);
		}),
		platformer: method(this, function(player) {
			
			var playerState = getVisuPlayerState(player);
			var playerGridElement = getVisuPlayerGridElement(player);
			var playerPosition = getGridElementPosition(playerGridElement);
			var inputHandler = getVisuPlayerInputHandler(player);
			var shrooms = getShroomManager().shrooms;
			
			#region Movement
			var keyboardCheckRight = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_D))) : false;
			var keyboardCheckLeft = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_A))) : false;
			var keyboardCheckUp = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_W))) : false;
			var keyboardCheckDown = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_S))) : false;
				
			var horizontalPosition = getPositionHorizontal(playerPosition);
			var horizontalFriction = getValueFromMap(playerState, "horizontalFriction", 0.001);
			var horizontalMaxSpeed = getValueFromMap(playerState, "horizontalMaxSpeed", 0.01);
			var horizontalSpeed = ((keyboardCheckLeft) || (keyboardCheckRight)) ?
				getVisuPlayerHorizontalSpeed(player) + (keyboardCheckLeft ? -1 : 1) * (getValueFromMap(playerState, "horizontalAcceleration", 0.005) * getDeltaTimeValue()) :
				((abs(getVisuPlayerHorizontalSpeed(player)) - horizontalFriction < 0) ? 0 : getVisuPlayerHorizontalSpeed(player) - sign(getVisuPlayerHorizontalSpeed(player)) * horizontalFriction);
			horizontalSpeed = sign(horizontalSpeed) * clamp(abs(horizontalSpeed), 0, horizontalMaxSpeed);
			var horizontalPosition = clamp(getPositionHorizontal(playerPosition) + horizontalSpeed, 0.0, 1.0);
			setPositionHorizontal(playerPosition, horizontalPosition);
			setVisuPlayerHorizontalSpeed(player, horizontalSpeed);
			
			var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed") / 0.008; //@todo remove magic number
			
			var verticalPosition = getPositionVertical(playerPosition);
			var verticalSpeed = getVisuPlayerVerticalSpeed(player);
			var verticalSpeedMax = 1.0;
			var gravityFactor = applyDeltaTime(0.0012);
			var jumpFactor = 0.029;
			verticalSpeed += gravityFactor;
			verticalSpeed = sign(verticalSpeed) * clamp(abs(verticalSpeed), 0.0, verticalSpeedMax);
			var verticalPositionMin = -0.12;
			var verticalPositionMax = 0.87;
			verticalPosition = clamp(verticalPosition + verticalSpeed, verticalPositionMin, verticalPositionMax);
			verticalSpeed = verticalPosition == verticalPositionMin ? 0.0 : verticalSpeed;
			verticalSpeed = verticalPosition == verticalPositionMax ? 0.0 : verticalSpeed;
			setVisuPlayerVerticalSpeed(player, verticalSpeed);
			setPositionVertical(playerPosition, verticalPosition);
			
			var keyboardCheckAction = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE))) : false;
			
			
			if ((keyboardCheckAction)
				&& (verticalPosition >= verticalPositionMax)) {

				setVisuPlayerVerticalSpeed(player, -jumpFactor);
				Core.Collections._Map.set(playerState, "doubleJump", true);
				Core.Collections._Map.set(playerState, "doubleJumpReleased", false);
			}
			
			var doubleJump = Core.Collections._Map.get(playerState, "doubleJump");
			var doubleJumpReleased = Core.Collections._Map.get(playerState, "doubleJumpReleased");
			if (doubleJump) {
			
				if (keyboardCheckAction) {
				
					if (doubleJumpReleased) {
					
						setVisuPlayerVerticalSpeed(player, -jumpFactor);
						setInMap(playerState, "doubleJump", false);
					}
				} else {
				
					doubleJumpReleased = true;
					Core.Collections._Map.set(playerState, "doubleJumpReleased", doubleJumpReleased);
				}
			}
			
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
				
				if ((verticalSpeed < -0.85)
					&& (isCollision)) {
					
					var shroomState = getShroomState(shroom);
					Core.Collections._Map.set(shroomState, "status", "end");
					Core.Collections._Map.set(shroomState, "instantKill", true);
				}
					
				if ((verticalSpeed > -0.10) 
					&& (keyboardCheckAction)
					&& (isCollision)) {
				
					var shroomState = getShroomState(shroom);
					Core.Collections._Map.set(shroomState, "status", "end");
					Core.Collections._Map.set(shroomState, "instantKill", true);
					
					setVisuPlayerVerticalSpeed(player, -1.0 * jumpFactor);
					Core.Collections._Map.set(playerState, "doubleJump", true);
					Core.Collections._Map.set(playerState, "doubleJumpReleased", false);
					continue;
				}
			}
			#endregion
			
			sendGridElementRenderRequest(playerGridElement);
		}),
		update: method(this, function() {
			
			super();
			
			var players = this.players;
			var playersSize = getListSize(players);
			for (var index = 0; index < playersSize; index++) {
				
				var player = players[| index];
				var gameplayHandler = getStructVariable(this.GMObject, this.gameplayType);
				if (isOptionalPresent(gameplayHandler)) {
					gameplayHandler(player);
				}
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
		})
	}
	
	this.GMObject.create();
	
