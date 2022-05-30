///@function getInputHandlerKeysState(inputHandler)
///@description Getter.
///@param {?InputHandler} inputHandler
///@return {Map<KeyboardKeyType::KeysState>}
function getInputHandlerKeysState(argument0) {

		var inputHandler = argument0;
	
		var keysState = getInstanceVariable(inputHandler, "keysState");
	
		return keysState;


}
