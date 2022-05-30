///@function getInstanceClass(instance)
///@description Getter.
///@param {Instance<T>} instance
///@return {Optional<Class<T>>} instanceClass
function getInstanceClass(argument0) {

		var instance = argument0;
	
		var instanceClass = getInstanceVariable(instance, "object_index");
	
		return isNumber(instanceClass) ? instanceClass : createEmptyOptional();
	



}
