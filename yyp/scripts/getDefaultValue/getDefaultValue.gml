///@function getDefaultValue(value, defaultValue);
///@description Resolve optionals.
///@param {Object} value
///@param {Object} defaultValue
function getDefaultValue(argument0, argument1) {

		var value = argument0;
		var defaultValue = argument1;
	
		return isOptionalPresent(value) ? value : defaultValue;
	



}
