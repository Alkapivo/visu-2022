///@function isBoolean(boolean)
///@description Validator.
///@param {Object} boolean
///@return {Boolean} isBoolean
function isBoolean(argument0) {

		var boolean = argument0;
	
		if (isHtml5()) {
			return boolean == true || boolean == false;	
		} else {
			return isTJsonBoolean(boolean) ? true : 
				boolean == true || boolean == false;
		}
	



}
