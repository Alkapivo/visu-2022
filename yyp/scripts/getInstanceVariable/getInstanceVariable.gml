///@function getInstanceVariable(instance, name)
///@description Wrapper for variable_instance_get.
///@param {Instance} instance
///@param {String} name
///@return {Optional<Object>} value
function getInstanceVariable(argument0, argument1) {

	var instance = argument0;
	var name = argument1;
	
	if (isNumber(instance)) {
		var value = variable_instance_get(instance, string(name));
		return isUndefined(value) ? createEmptyOptional() : value;	
	} else {
		return createEmptyOptional();	
	}
}