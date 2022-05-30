///@function getNumber(object)
///@description Wrapper for real.
///@param {Object} object
///@return {Optional<Number>} number;
function getNumber(argument0) {

		var object = argument0;

		return isNumber(object) ?
			real(object) : createEmptyOptional();
	



}
