///@description 

	super();
	
	keysStateUpdated = keysStateUpdated ? false : keysStateUpdated;
	
	#region VirtualJoystick
	var state = getVirtualJoystickState(virtualJoystick);

	switch (state) {
		case VirtualJoystickState.DISABLED:
			var pointerDirection = getVirtualJoystickPointerDirection(virtualJoystick);
			if (pointerDirection == null) {
				break;	
			}
			var keysToCheck = [
				[ 
					KeyboardKeyType.KEY_UP, 
					((pointerDirection >= (45 - virtualJoystickAngleMargin)) && 
					(pointerDirection < (135 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_DOWN, 
					((pointerDirection > (225 - virtualJoystickAngleMargin)) && 
					(pointerDirection <= (315 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_LEFT, 
					((pointerDirection >= (135 - virtualJoystickAngleMargin)) && 
					(pointerDirection < (225 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_RIGHT, 
					((pointerDirection > (315 - virtualJoystickAngleMargin)) || 
					(pointerDirection < (45 + virtualJoystickAngleMargin))) 
				]
			];
			var keysToCheckSize = getArrayLength(keysToCheck);		
			for (var index = 0; index < keysToCheckSize; index++) {
				var keyToCheck = keysToCheck[index];
				var key = keyToCheck[0];
				var keyCheck = keyToCheck[1];
				var keyState = keysState[? key];
				setKeyStateReleased(keyState, getKeyStateCheck(keyState) ? true : false);
				setKeyStateCheck(keyState, false);
				setKeyStatePressed(keyState, false);
			}
			
			
			break;
		case VirtualJoystickState.RUNNING:
		case VirtualJoystickState.START:
			var pointerDirection = getVirtualJoystickPointerDirection(virtualJoystick);
			if (pointerDirection == null) {
				break;	
			}
			var keysToCheck = [
				[ 
					KeyboardKeyType.KEY_UP, 
					((pointerDirection >= (45 - virtualJoystickAngleMargin)) && 
					(pointerDirection < (135 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_DOWN, 
					((pointerDirection > (225 - virtualJoystickAngleMargin)) && 
					(pointerDirection <= (315 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_LEFT, 
					((pointerDirection >= (135 - virtualJoystickAngleMargin)) && 
					(pointerDirection < (225 + virtualJoystickAngleMargin))) 
				],
				[ 
					KeyboardKeyType.KEY_RIGHT, 
					((pointerDirection > (315 - virtualJoystickAngleMargin)) || 
					(pointerDirection < (45 + virtualJoystickAngleMargin))) 
				]
			];
			var keysToCheckSize = getArrayLength(keysToCheck);

			for (var index = 0; index < keysToCheckSize; index++) {
				var keyToCheck = keysToCheck[index];
				var key = keyToCheck[0];
				var keyCheck = keyToCheck[1];
				var keyState = keysState[? key];
				if (keyCheck) {
					if (!getKeyStateCheck(keyState)) {
						setKeyStateCheck(keyState, true);
						setKeyStatePressed(keyState, true);
						setKeyStateReleased(keyState, false)
						keysStateUpdated = true;
					} else {
						if (getKeyStatePressed(keyState)) {
							setKeyStatePressed(keyState, false);
							keysStateUpdated = true;
						}
					}
				} else {
					if (getKeyStateCheck(keyState)) {
						setKeyStateCheck(keyState, false);
						setKeyStatePressed(keyState, false);
						setKeyStateReleased(keyState, true)
						keysStateUpdated = true;	
					} else {
						setKeyStateReleased(keyState, false);
						keysStateUpdated = true;
					}
				}
			}
			break;
	}
	#endregion
	
	#region Action key
	var keyboardKey = KeyboardKeyType.KEY_SPACE;
	
	var deviceSize = 8;
	var isChecked = false;
	for (var index = 0; index < deviceSize; index++) {
		var mouseX = getMouseGuiX(index);
		var mouseY = getMouseGuiY(index);
		if (device_mouse_check_button(index, mb_any)) {
			if (point_in_rectangle(
					mouseX, mouseY,
					virtualActionKeyXPosition,
					virtualActionKeyYPosition,
					virtualActionKeyXPosition + virtualActionKeyWidth,
					virtualActionKeyYPosition + virtualActionKeyHeight)) {
				
				isChecked = true;
				index = deviceSize;			
			}
		}
	}
	
	var keyState = keysState[? keyboardKey];
	
	var keyCheck = isChecked;
	var keyCheckPressed = keyCheck && pressedTimer == 0.0;
	var keyCheckReleased = !keyCheck && !getKeyStateReleased(keyState);
	
	if (isChecked) {
		pressedTimer = incrementTimer(pressedTimer, 1.0, 1 / GAME_FPS);	
	} else {
		pressedTimer = 0.0;	
	}

	if ((getKeyStateCheck(keyState) != keyCheck) ||
		(getKeyStatePressed(keyState) != keyCheckPressed) ||
		(getKeyStateReleased(keyState) != keyCheckReleased)) {
				
		keysStateUpdated = true;
			
		setKeyStateCheck(keyState, keyCheck)
		setKeyStatePressed(keyState, keyCheckPressed)
		setKeyStateReleased(keyState, keyCheckReleased)
		
	}
	#endregion
	
