///@function isClass(classType)
///@description Validator.
///@param {any} classType
///@return {Boolean} result
function isClass(argument0) {

		var classType = argument0;
	
		return isNumber(classType) ? object_exists(classType) : false;
	



}
