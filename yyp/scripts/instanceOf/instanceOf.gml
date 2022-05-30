///@function instanceOf(instance, type)
///@description Check if instance class is equal to passed type.
///@param {?Instance} instance
///@param {Class<?>} type
function instanceOf(argument0, argument1) {

		var instance = argument0;
		var type = argument1;

		return instance.object_index == type;
	



}
