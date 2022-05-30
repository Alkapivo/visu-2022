///@description 

	guardSurface(id, handheldSurface, "handheldSurface", global.guiWidth, global.guiHeight, true);

	#region Draw to handheldSurface
	gpuSetSurfaceTarget(handheldSurface);
	drawClear(COLOR_TRANSPARENT);
		
	#region Draw handheld background
	switch (handheldOrientation) {
		case ScreenOrientation.HORIZONTAL:
			draw_rectangle_color(
				0, 
				0, 
				handheldBarWidth, 
				global.guiHeight,
				handheldColorBegin, 
				handheldColorEnd, 
				handheldColorEnd, 
				handheldColorBegin, 
				false);
			draw_rectangle_color(
				global.guiWidth - handheldBarWidth, 
				0, 
				global.guiWidth, 
				global.guiHeight,
				handheldColorEnd, 
				handheldColorBegin, 
				handheldColorBegin, 
				handheldColorEnd,
				false);
			break;
		case ScreenOrientation.VERTICAL:
			draw_rectangle_color(
				0, 
				global.guiHeight - handheldBarHeight, 
				global.guiWidth, 
				global.guiHeight,
				handheldColorEnd, 
				handheldColorEnd, 
				handheldColorBegin, 
				handheldColorBegin, 
				false);
			break;
	}
	#endregion
	
	#region Draw handheld buttons
	var inputHandler = getSceneControllerInputHandler();
	if ((isOptionalPresent(inputHandler)) && 
		(instanceOf(inputHandler, TouchInputHandler))) {
		var virtualJoystick = getTouchInputHandlerVirtualJoystick(inputHandler);
				
		var joystickXPosition = getVirtualJoystickXPosition(virtualJoystick);
		var joystickYPosition = getVirtualJoystickYPosition(virtualJoystick);
		var joystickSize = getVirtualJoystickPointerMaxDistance(virtualJoystick);
		var joystickScale = (joystickSize * 2) / sprite_get_width(asset_sprite_joystick_background);
		joystickXPosition = isOptionalPresent(joystickXPosition) ? joystickXPosition : 
			(handheldOrientation == ScreenOrientation.HORIZONTAL ? 
				handheldBarWidth * handheldOrientationHorizontalButtonHorizontalOffset : 
				handheldBarWidth * handheldOrientationVerticalButtonHorizontalOffset);
		joystickYPosition = isOptionalPresent(joystickYPosition) ? joystickYPosition : 
			(handheldOrientation == ScreenOrientation.HORIZONTAL ? 
				handheldBarHeight * handheldOrientationHorizontalButtonVerticalOffset : 
				global.guiHeight - (handheldBarHeight * handheldOrientationVerticalButtonVerticalOffset));
		
		draw_sprite_ext(
			asset_sprite_joystick_background, 0,
			joystickXPosition, joystickYPosition,
			joystickScale, joystickScale,
			0.0, c_white, 1.0);
				
		var joystickPointerXPosition = getVirtualJoystickPointerXPosition(virtualJoystick);
		var joystickPointerYPosition = getVirtualJoystickPointerYPosition(virtualJoystick);
		joystickPointerXPosition = isOptionalPresent(joystickPointerXPosition) ? joystickPointerXPosition : 
			(handheldOrientation == ScreenOrientation.HORIZONTAL ? 
				handheldBarWidth * handheldOrientationHorizontalButtonHorizontalOffset : 
				handheldBarWidth * handheldOrientationVerticalButtonHorizontalOffset);
		joystickPointerYPosition = isOptionalPresent(joystickPointerYPosition) ? joystickPointerYPosition : 
			(handheldOrientation == ScreenOrientation.HORIZONTAL ? 
				handheldBarHeight * handheldOrientationHorizontalButtonVerticalOffset : 
				global.guiHeight - (handheldBarHeight * handheldOrientationVerticalButtonVerticalOffset));
		
		draw_sprite_ext(
			asset_sprite_joystick_pointer, 0,
			joystickPointerXPosition, joystickPointerYPosition, 
			joystickScale, joystickScale,
			0.0, c_white, 1.0);
				
		var actionButtonXPosition = getTouchInputHandlerVirtualActionKeyXPosition(inputHandler);
		var actionButtonYPosition = getTouchInputHandlerVirtualActionKeyYPosition(inputHandler);
		var actionButtonSize = getTouchInputHandlerVirtualActionKeyWidth(inputHandler) / 2.0
		var actionButtonScale = (2 * actionButtonSize) / sprite_get_width(asset_sprite_action_button);
		draw_sprite_ext(
			asset_sprite_action_button, 0,
			actionButtonXPosition + actionButtonSize, 
			actionButtonYPosition + actionButtonSize, 
			actionButtonScale, actionButtonScale,
			0.0, c_white, 1.0);
	}
	#endregion
		
	gpuResetSurfaceTarget();
	#endregion