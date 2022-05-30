///@function setInputHandlerKeysState(inputHandler, keysState)
///@description Setter.
///@param {?InputHandler} inputHandler
///@param {Map<KeyboardKeyType::KeysState>} keysState
function setInputHandlerKeysState(argument0, argument1) {

		var inputHandler = argument0;
		var keysState = argument1;
	
		setInstanceVariable(inputHandler, "keysState", keysState);
	



}
