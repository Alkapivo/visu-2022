///@function isParent(instance, parentClass)
///@description Check if object extends specified class
///@param {Object} instance
///@param {Class} parentClass
function isParent(argument0, argument1) {

		var instance = argument0;
		var parentClass = argument1;
	
		if (object_get_parent(instance.object_index) != parentClass) {
			logger("Object {0} doesn't extends {1}", LogType.ERROR, object_get_name(instance.object_index), object_get_name(parentClass));
			return false;
		}
		return true;


}
