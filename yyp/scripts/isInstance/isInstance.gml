///@function isInstance(instance)
///@description Check if instance exists (can be activated or deactivated).
///@param {any} instance
///@return {Boolean} isVaid
function isInstance(argument0) {

		var instance = argument0;
	
		return isOptionalPresent(getInstanceVariable(instance, "object_index"));
	



}
