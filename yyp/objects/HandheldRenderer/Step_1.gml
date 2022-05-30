///@description Override resize event

	if (isHandheld()) {
					
		if (matchAny(handheldResizeState, RendererResizeState.IDLE, RendererResizeState.RESIZED)) {
			previousHandheldBarWidth = handheldBarWidth;
			previousHandheldBarHeight = handheldBarHeight;
			updateHandheldRenderer(id, global.guiWidth, global.guiHeight);
		}
		
		if (handheldResizeState == RendererResizeState.REQUIRED) {
			
			var inputHandler = getSceneControllerInputHandler();
			if ((isOptionalPresent(inputHandler)) && 
				(instanceOf(inputHandler, TouchInputHandler))) {
			
				switch (handheldOrientation) {
					case ScreenOrientation.HORIZONTAL:
						var joystickXPosition = handheldBarWidth * handheldOrientationHorizontalButtonHorizontalOffset;
						var joystickYPosition = handheldBarHeight * handheldOrientationHorizontalButtonVerticalOffset;
						var joystickPointerMaxDistance = handheldBarWidth * handheldOrientationHorizontalButtonSize;
						var actionKeyXPosition = (global.guiWidth - (handheldBarWidth * handheldOrientationHorizontalButtonHorizontalOffset)) -
							(handheldBarWidth * handheldOrientationHorizontalButtonSize);
						var actionKeyYPosition = (handheldBarHeight * handheldOrientationHorizontalButtonVerticalOffset) -
							(handheldBarWidth * handheldOrientationHorizontalButtonSize);
						var actionKeyWidth = (handheldBarWidth * handheldOrientationHorizontalButtonSize) * 2;
						var actionKeyHeight = (handheldBarWidth * handheldOrientationHorizontalButtonSize) * 2;
					
						updateTouchInputHandler(inputHandler,
							joystickXPosition, joystickYPosition, joystickPointerMaxDistance,
							actionKeyXPosition, actionKeyYPosition, actionKeyWidth, actionKeyHeight);
							
						handheldResizeState = RendererResizeState.RESIZED;
						break;
		
					case ScreenOrientation.VERTICAL:
						// Setup TouchInputHandler
						var joystickXPosition = handheldBarWidth * handheldOrientationVerticalButtonHorizontalOffset;
						var joystickYPosition = global.guiHeight - (handheldBarHeight * handheldOrientationVerticalButtonVerticalOffset);
						var joystickPointerMaxDistance = handheldBarHeight * handheldOrientationVerticalButtonSize;
						var actionKeyXPosition = (global.guiWidth - (handheldBarWidth * handheldOrientationVerticalButtonHorizontalOffset)) -
							(handheldBarHeight * handheldOrientationVerticalButtonSize);
						var actionKeyYPosition = global.guiHeight - (handheldBarHeight * handheldOrientationVerticalButtonVerticalOffset) -
							(handheldBarHeight * handheldOrientationVerticalButtonSize);
						var actionKeyWidth = (handheldBarHeight * handheldOrientationVerticalButtonSize) * 2;
						var actionKeyHeight = (handheldBarHeight * handheldOrientationVerticalButtonSize) * 2;
					
						updateTouchInputHandler(inputHandler,
							joystickXPosition, joystickYPosition, joystickPointerMaxDistance,
							actionKeyXPosition, actionKeyYPosition, actionKeyWidth, actionKeyHeight);
							
						handheldResizeState = RendererResizeState.RESIZED;
						break;
				}
			} else {
				throwException(
					createException(
						RuntimeException,
						"InputHandler should be type of TouchInputHandler in handheldMode",
						runtimeExceptionHandler
					)
				);
			}
		}
	}

