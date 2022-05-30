///@function recursiveIsTypeChildOf(type, childType)
///@description Recursively find if childType extends type.
///@param {Class<T>} type
///@param {Class<~T>} childType
///@return {Boolean} isTypeChildOf
function recursiveIsTypeChildOf(argument0, argument1) {

		var type = argument0;
		var childType = argument1;
	
		if (type == childType) {
			return true;	
		} else {
			var newChildType = getTypeParent(childType);
			if (isOptionalPresent(newChildType)) {
				return recursiveIsTypeChildOf(type, newChildType);	
			} else {
				return false;	
			}	
		}
	



}
