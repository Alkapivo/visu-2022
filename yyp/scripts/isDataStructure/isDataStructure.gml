///@function isDataStructure(dataStructure, type)
///@description Safely check if dataStructure is data structure. Wrapper for ds_exists.
///@param {any} dataStructure
///@param {DataStructureType} type
///@return {Boolean} isValid
function isDataStructure(argument0, argument1) {

		var dataStructure = argument0;
		var type = argument1;
	
		if (!isOptionalPresent(dataStructure)) {
			return false;	
		} else if (type == Array) {
			return isArray(dataStructure)	
		} else if (type == ArrayMap) {
			return isEntity(dataStructure, ArrayMap)
		} else if (isNumber(dataStructure)) {
			return ds_exists(dataStructure, type);	
		}
	
		return false;
	
		


}
