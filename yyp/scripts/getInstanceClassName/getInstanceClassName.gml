///@function getInstanceClassName(instance)
///@description Getter.
///@param {Instance<T>} instance
///@return {Optional<String>} instanceClassName
function getInstanceClassName(argument0) {

		var instance = argument0;
	
		var instanceClass = getInstanceClass(instance);
	
		return isOptionalPresent(instanceClass) ? object_get_name(instanceClass) : instanceClass;
	



}
