
///@description 

	#region Fields
	
///@public:

	///@type {Map<KeyboardKey::Boolean}
	keysState = createMap();
	
	///@type {Boolean}
	keysStateUpdated = true;

///@private:

	#endregion
	
	for (var index = 0; index < getArrayLength(global.keyboardKeyTypeArray); index++) {
		var key = global.keyboardKeyTypeArray[index];
		keysState[? key] = createKeyState(false, false, false);
	}