///@function setInputHandlerKeyState(inputHandler, key, keyState)
///@description Setter.
///@param {?InputHandler} inputHandler
///@param {KeysState} keyState
function setInputHandlerKeyState(argument0, argument1, argument2) {

		var inputHandler = argument0;
		var key = argument1;
		var keyState = argument2;
	
		var keysState = getInputHandlerKeysState(inputHandler);
		keysState[? key] = keyState;
	



}
