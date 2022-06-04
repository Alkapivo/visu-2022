///@function jumbotronScoreboardHandler(state)
///@description Render and resolve logic of jumbotron scoreboard.
///@param {Map<String::Object>} state
function jumbotronScoreboardHandler(argument0) {

		var state = argument0;
	
		var inputHandler = getSceneControllerInputHandler();
	
		if (isOptionalPresent(inputHandler)) {
			var options = getValueFromMap(state, "options", 
				createList(
					createTuple(asset_texture_empty, jumbotronScoreboardOptionRestart),
					createTuple(asset_texture_empty, jumbotronScoreboardOptionShare),
					createTuple(asset_texture_empty, jumbotronScoreboardOptionYoutube)
				)
			);
			var gameFinished = getValueFromMap(state, "gameFinished", false);
			if (!gameFinished) {
				emitTrackingEvent("GameFinished");	
			}
			state[? "gameFinished"] = true;
		
			var optionsSize = getListSize(options);
			var pointer = getValueFromMap(state, "pointer", 0);			
			var elementWidth = sprite_get_width(asset_texture_empty);
			var elementHeight = sprite_get_height(asset_texture_empty);
			var elementMargin = 12;
			var orientation = ScreenOrientation.VERTICAL;
			var cooldown = getValueFromMap(state, "cooldown", 0.0);
			var theta = getValueFromMap(state, "theta", incrementTimer(0.0, 1.0, 1 / GAME_FPS));
		
			var previousOptionKeyPressed = orientation == ScreenOrientation.HORIZONTAL ? (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_A))
			) : (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_W))
			);
			var nextOptionKeyPressed = orientation == ScreenOrientation.HORIZONTAL ? (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_D))
			) : (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_S))
			);
			var actionKeyPressed = 
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_Z)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE));
		
			pointer = clamp(pointer + (previousOptionKeyPressed ? -1 : 0) + (nextOptionKeyPressed ? 1 : 0), 0, optionsSize - 1);
			state[? "pointer"] = pointer;
		
			if (actionKeyPressed) {
				var option = options[| pointer];
				var handler = getTupleValue(option);
				cooldown = 0.7;
				if (isOptionalPresent(handler)) {
					runScript(handler);	
				}
			}
		
			if (cooldown > 0) {
				cooldown -=  0.1 * getDeltaTimeValue();
			}
			state[? "cooldown"] = cooldown;
		
			var screenWidth = isHandheld() ? global.viewWidth : global.guiWidth;
			var screenHeight = isHandheld() ? global.viewHeight : global.guiHeight;
			switch (orientation) {
				case ScreenOrientation.HORIZONTAL:
					var xAnchor = screenWidth * 0.5;
					var yAnchor = screenHeight * 0.6;
					var firstElementX = xAnchor - (((elementWidth + (2 * elementMargin)) * optionsSize) / 2.0)
					var firstElementY = yAnchor + (elementHeight / 2.0);
					var scale = 1.0;
					for (var index = 0; index < optionsSize; index++) {
						var xPosition = firstElementX + ((elementWidth + (2 * elementMargin)) * index);
						var yPosition = firstElementY;
					
						var option = options[| index];
						var spriteAsset = getTupleKey(option);
						var blendMode = index == pointer ? c_lime : c_fuchsia;
						var alpha = index == pointer ? 1.0 - cooldown : 1.0;
					
						draw_sprite_ext(spriteAsset, 0, xPosition, yPosition, scale, scale, 0.0, blendMode, alpha);
					}
					break;
				case ScreenOrientation.VERTICAL:
					var xAnchor = screenWidth * 0.5;
					var yAnchor = screenHeight * 0.7;
					var firstElementX = xAnchor - (elementWidth / 2.0)
					var firstElementY = yAnchor - (((elementHeight + (2 * elementMargin)) * optionsSize) / 2.0);
					var scale = 1.0;
					for (var index = 0; index < optionsSize; index++) {
						var xPosition = firstElementX;
						var yPosition = firstElementY + ((elementHeight + 2 * elementMargin) * index);
					
						var option = options[| index];
						var spriteAsset = getTupleKey(option);
						var blendMode = index == pointer ? c_lime : c_fuchsia;
						var alpha = index == pointer ? 1.0 - cooldown : 1.0;
					
						draw_sprite_ext(spriteAsset, 0, xPosition, yPosition, scale, scale, 0.0, blendMode, alpha);
					}
					break;
			}
		} else {
			logger("InputHandler is null", LogType.ERROR);
		}
	



}
