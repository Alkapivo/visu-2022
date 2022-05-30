///@function covnertKeysStateToTJsonObject(inputHandler)
///@description Produce tjsonObject with pressed keys
///@param {?InputHandler} inputHandler
///@return {Optional<TJsonObject>} tjsonObject
function convertKeysStateToTJsonObject(argument0) {

		var inputHandler = argument0;
	
		var keysState = getInputHandlerKeysState(inputHandler);
	
		var tjsonObject = tj_object();
		var keysSize = getArrayLength(global.keyboardKeyTypeArray);
		var keysState = getInputHandlerKeysState(inputHandler);
		var isSet = false;
		for (var index = 0; index < keysSize; index++) {
			var keyType = global.keyboardKeyTypeArray[index];
			var keyState = keysState[? keyType];
		
			if ((getKeyStateCheck(keyState)) ||
				(getKeyStatePressed(keyState)) ||
				(getKeyStateReleased(keyState))) {
			
				isSet = true;
				tj_set(tjsonObject, string(keyType), cloneArray(keyState));
			}
		}
	
		return isSet ? tjsonObject : null;
	



}
