///@function isTJsonBoolean(tjsonValue)
///@description Wrapper for tj_is_bool.
///@param {Object} tjsonValue
///@return {Boolean} isBoolean
function isTJsonBoolean(argument0) {

		var tjsonValue = argument0;

		return isHtml5() ? (tjsonValue == true || tjsonValue == false) : tj_is_bool(tjsonValue);
	



}
