///@function getValueFromArray(array, index, defaultValue)
///@description Safe array getter.
///@param {Object[]} array
///@param {Integer} index
///@param {Object} [defaultValue] default value is empty optional.
function getValueFromArray() {

		///checkArgumentCount(2, argument_count, getValueFromArray);

		var array = argument[0];
		var index = argument[1];
		var defaultValue = argument_count > 2 ? argument[2] : createEmptyOptional();
	
		if (isArray(array)) {		
		
			if (!isNumber(index)) {
				return defaultValue;
			}
			index = round(index);
		
			if (index < 0) {
				return defaultValue;
			}
		
			if (index < getArrayLength(array)) {
				return array[@ index];
			} else {
				return defaultValue;	
			}
		
		} else {
			return defaultValue;	
		}
	



}
