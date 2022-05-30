///@function cloneArray(source)
///@description Return copy of passed array.
///@param {Object[]} source
///@return {Object[]} clonedArray - return empty array if argument wasn't recognized as an array.
function cloneArray(argument0) {

		var source = argument0;
	
		if (isArray(source)) {
			var sourceLength = getArrayLength(source);
			var array = createArray(sourceLength)
			array_copy(array, 0, source, 0, sourceLength);
	
			return array;	
		} else {
			logger("[cloneArray] Unable to clone array. Argument wasn't recognized as an array", LogType.ERROR);
			return [];	
		}
	



}
