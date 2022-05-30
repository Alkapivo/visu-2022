///@function getTypeParent(type)
///@description Wrapper for object_get_parent.
///@param {Class<T>} type
///@return {Optional<Class<~T>>} parentType
function getTypeParent(argument0) {

		var type = argument0;
	
		var parentType = object_get_parent(type);
		return ((parentType == -100) || (parentType == -1)) ? createEmptyOptional() : parentType;
	



}
