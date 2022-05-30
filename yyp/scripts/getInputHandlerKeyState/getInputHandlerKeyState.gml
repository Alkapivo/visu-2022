///@function getInputHandlerKeyState(inputHandler, key)
///@description Getter.
///@param {?InputHandler} inputHandler
///@param {KeyboardKeyType} key
///@return {KeysState}
function getInputHandlerKeyState(argument0, argument1) {

		var inputHandler = argument0;
		var key = argument1;
	
		var keysState = getInstanceVariable(inputHandler, "keysState");
	
		var keyState = keysState[? key];
	
		if (keyState == null) {
			logger("KeyState for key \"{0}\" wasn't found", LogType.WARNING, key);
			keyState = createKeyState(false, false, false);	
			keysState[? key] = keyState;
		}
	
		return keyState;
	



}
