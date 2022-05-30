///@function areKeysStateChanged(inputHandler)
///@description Return if in this step keysState are different than in previous step.
///@param {?InputHandler} inputHandler
///@return {Boolean} areUpdated
function areKeysStateChanged(argument0) {

		var inputHandler = argument0;
	
		var areUpdated = getInstanceVariable(inputHandler, "keysStateUpdated");

		return areUpdated == true;
	



}
