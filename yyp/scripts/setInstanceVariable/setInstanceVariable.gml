///@function setInstanceVariable(instance, name, value)
///@description Wrapper for variable_instance_set.
///@param {Instance} instance
///@param {String} name
///@param {Object} value
function setInstanceVariable(argument0, argument1, argument2) {

		var instance = argument0;
		var name = argument1;
		var value = argument2;
	
		if (!isUndefined(instance)) {
			variable_instance_set(instance, string(name), value);	
		}
	



}
