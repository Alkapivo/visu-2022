///@function isInstanceTypeOf(instance, type)
///@description Check if instance is type of.
///@param {Object<T>} instance
///@param {Class<T>} type
///@return {Boolean} isInstanceType
function isInstanceTypeOf(argument0, argument1) {

		var instance = argument0;
		var type = argument1;
	
		return getInstanceVariable(instance, "object_index") == type;
	



}
