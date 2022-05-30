///@function isInstanceDirectChildOf(instance, type)
///@descrpiton Check if instance exists and if is child of passed type.
///@param {Object<T>} instance
///@param {Class<T>} type
function isInstanceDirectChildOf(argument0, argument1) {

		var instance = argument0;
		var type = argument1;
	
		return isInstance(instance) ? getTypeParent(instance.object_index) != type : false;
	



}
