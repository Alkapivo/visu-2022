///@description 

	super();
	
	var keysSize = getArrayLength(global.keyboardKeyTypeArray);
	
	keysStateUpdated = keysStateUpdated ? false : keysStateUpdated;
	
	for (var index = 0; index < keysSize; index++) {
		var keyboardKey = global.keyboardKeyTypeArray[index];
		var keyCheck = keyboard_check(keyboardKey);
		var keyCheckPressed = keyboard_check_pressed(keyboardKey);
		var keyCheckReleased = keyboard_check_released(keyboardKey);
		
		var keyState = keysState[? keyboardKey];
		if ((getKeyStateCheck(keyState) != keyCheck) ||
			(getKeyStatePressed(keyState) != keyCheckPressed) ||
			(getKeyStateReleased(keyState) != keyCheckReleased)) {
				
			keysStateUpdated = true;
			
			setKeyStateCheck(keyState, keyCheck)
			setKeyStatePressed(keyState, keyCheckPressed)
			setKeyStateReleased(keyState, keyCheckReleased)
		}
	}
	
