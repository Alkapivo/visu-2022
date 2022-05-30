///@function checkListener(listener, value, compareValue)
///@description Check for value change
///@param {Listener} listener
///@param {Object} value
///@param {Object} compareValue
///@return {Boolean} checkResult
function checkListener(argument0, argument1, argument2) {

		var listener = argument0;
		var value = argument1;
		var compareValue = argument2;
	
		var compareMethod = getListenerCompareMethod(listener);
	
		return compareBy(value, compareValue, compareMethod);


}
