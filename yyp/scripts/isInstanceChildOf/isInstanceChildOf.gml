///@function isInstanceChildOf(instance, type)
///@descrpiton Check if instance exists and if is child of passed type.
///@param {Object<T>} instance
///@param {Class<T>} type
///@return {Boolean} isChildOf
function isInstanceChildOf(argument0, argument1) {

		var instance = argument0;
		var type = argument1;

		var result = false;
	
		if (isInstance(instance)) {
		
			var childType = getTypeParent(getInstanceClass(instance));
			if (isOptionalPresent(childType)) {
			
				result = childType == type ? 
					true : 
					recursiveIsTypeChildOf(type, childType)
			}
		}
	
		return result;
	



}
