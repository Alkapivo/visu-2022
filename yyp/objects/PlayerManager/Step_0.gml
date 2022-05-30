///@description 

	super();

	#region Players reactor
	var playersSize = getListSize(players);
	var shrooms = fetchShrooms();
	for (var index = 0; index < playersSize; index++) {
		var player = players[| index];
		var playerState = getSpaacePlayerState(player);
		var playerGridElement = getSpaacePlayerGridElement(player);
		var playerPosition = getGridElementPosition(playerGridElement);
		var inputHandler = getSpaacePlayerInputHandler(player);
		
		#region Movement
		
		var isInverted = false;//getPropertyBoolean("isInvertedKeyboard", false);
		
		if (isInverted) {
			var keyboardCheckRight = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_A))) : false;
			var keyboardCheckLeft = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_D))) : false;
			var keyboardCheckUp = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_S))) : false;
			var keyboardCheckDown = inputHandler != null ? (
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) || 
				getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_W))) : false;
		} else {
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
		}
		///@todo Inverted for ballada-o-dojrzalosci-2
			
		var horizontalFriction = getValueFromMap(playerState, "horizontalFriction", 0.001);
		var horizontalMaxSpeed = getValueFromMap(playerState, "horizontalMaxSpeed", 0.01);
		var horizontalSpeed = ((keyboardCheckLeft) || (keyboardCheckRight)) ?
			getSpaacePlayerHorizontalSpeed(player) + (keyboardCheckLeft ? -1 : 1) * (getValueFromMap(playerState, "horizontalAcceleration", 0.005) * getDeltaTimeValue()) :
			((abs(getSpaacePlayerHorizontalSpeed(player)) - horizontalFriction < 0) ? 0 : getSpaacePlayerHorizontalSpeed(player) - sign(getSpaacePlayerHorizontalSpeed(player)) * horizontalFriction);
		horizontalSpeed = sign(horizontalSpeed) * clamp(abs(horizontalSpeed), 0, horizontalMaxSpeed);
		var horizontalPosition = clamp(getPositionHorizontal(playerPosition) + horizontalSpeed, 0.0, 1.0);
		setPositionHorizontal(playerPosition, horizontalPosition);
		setSpaacePlayerHorizontalSpeed(player, horizontalSpeed);
		
		var veticalProjectionScale = fetchVerticalProjectionScale(playerPosition[1]);
		var verticalFriction = getValueFromMap(playerState, "verticalFriction", 0.001) * veticalProjectionScale; 
		var verticalMaxSpeed = getValueFromMap(playerState, "verticalMaxSpeed", 0.01) * veticalProjectionScale; 
		var verticalSpeed = ((keyboardCheckUp) || (keyboardCheckDown)) ?
			getSpaacePlayerVerticalSpeed(player) + (keyboardCheckUp ? -1 : 1) * (getValueFromMap(playerState, "verticalAcceleration", 0.005) * veticalProjectionScale * getDeltaTimeValue()) :
			((abs(getSpaacePlayerVerticalSpeed(player)) - verticalFriction < 0) ? 0 : getSpaacePlayerVerticalSpeed(player) - sign(getSpaacePlayerVerticalSpeed(player)) * verticalFriction);
		verticalSpeed = sign(verticalSpeed) * clamp(abs(verticalSpeed), 0, verticalMaxSpeed);
		var verticalPosition = clamp(getPositionVertical(playerPosition) + verticalSpeed, 0.0, 1.0);
		setPositionVertical(playerPosition, clamp(verticalPosition, 0.1, 1.0));
		setSpaacePlayerVerticalSpeed(player, verticalSpeed);
		#endregion
		
		#region Shooting
		var keyboardCheckAction = inputHandler != null ? (
			getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE)) || 
			getKeyStateCheck(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_Z))) : false;
		
		if (keyboardCheckAction) {
			var bullets = getValueFromMap(playerState, "bullets", 0);
			if (bullets > 0) || (0 == ziobro) {
				playerState[? "bullets"] = bullets - 1;
				spawnBullet(createPosition(
						getPositionHorizontal(playerPosition), 
						getPositionVertical(playerPosition)),
					BulletProducer.PLAYER
				);
			}
		}
		#endregion

		#region Collision
		var isCollision = false;
		var shroomsSize = getListSize(shrooms);
		for (var shroomIndex = 0; shroomIndex < shroomsSize; shroomIndex++) {
			var shroom = shrooms[| shroomIndex];
			var shroomGridElement = getShroomGridElement(shroom);
			var shroomGridElementPosition = getGridElementPosition(shroomGridElement);
			isCollision = (shroomGridElementPosition[1] < playerPosition[1]) && checkCirclesCollision(
				shroomGridElementPosition,
				getShroomRadius(shroom),
				playerPosition,
				getSpaacePlayerCollisionRadius(player));
			
			// TODO refactor types, delegate to handlers
			if (isCollision) {
				var shroomState = getShroomState(shroom);
				var shroomStatus = shroomState[? "status"];
				if (shroomStatus != "end") {
					
					var shroomTypeName = "good";
					var shroomGridElement = getShroomGridElement(shroom);
					var shroomSprite = getGridElementSprite(shroomGridElement);
					var shroomSpriteIndex = getSpriteAssetIndex(shroomSprite);
					var isShroomBullet = shroomSpriteIndex == global.bulletAsset;
					switch (shroomTypeName) {
						case "good":
							var scoreValue = getValueFromMap(playerState, "scoreValue", 0);
							var bullets = getValueFromMap(playerState, "bullets", 0);
							playerState[? "scoreValue"] = scoreValue + 1;
							playerState[? "bullets"] = bullets + (isShroomBullet ? 1 : 0);
							break;
						case "bad":	
							var scoreValue = getValueFromMap(playerState, "scoreValue", 0);
							playerState[? "scoreValue"] = scoreValue - 1;
							break;
						case "default":
							logger("Detected player collision with shroom of type default", LogType.ERROR);
							break;
					}
				}
				
				shroomState[? "status"] = "end";
				continue;
			}
		}
		#endregion
		
		sendGridElementRenderRequest(playerGridElement);	
	}
	#endregion
		
