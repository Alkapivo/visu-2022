///@function instanceExists(instance)
///@description Wrapper for instance_exists. Return true only, when instance exists and is activated.
///@param {any} instance
function instanceExists(argument0) {

		var instance = argument0;

		return isNumber(instance) ? instance_exists(instance) : false;
	



}
