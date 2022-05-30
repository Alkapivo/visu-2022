///@description 
///@copy

	super();
	
	keysStateUpdated = keysStateUpdated ? false : keysStateUpdated;
	
	for (var schema = mapFirst(keySchema); iteratorFinish(schema); schema = mapNext(keySchema, schema)) {
		var keyboardKey = schema;
		var gmKey = keySchema[? schema];
		
		var keyCheck = keyboard_check(gmKey);
		var keyCheckPressed = keyboard_check_pressed(gmKey);
		var keyCheckReleased = keyboard_check_released(gmKey);
		
		var keyState = keysState[? keyboardKey];
		if (!isArray(keyState)) {
			continue;	
		}
		if ((getKeyStateCheck(keyState) != keyCheck) ||
			(getKeyStatePressed(keyState) != keyCheckPressed) ||
			(getKeyStateReleased(keyState) != keyCheckReleased)) {
				
			keysStateUpdated = true;
			
			setKeyStateCheck(keyState, keyCheck)
			setKeyStatePressed(keyState, keyCheckPressed)
			setKeyStateReleased(keyState, keyCheckReleased)
		}
	}
	
