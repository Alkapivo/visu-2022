///@function findValueIndexIn(array, value)
///@description Check if array contain specified value and return it index. If not found then return null.
///@param {Object[]} array
///@param {Object} value
///@return {Optional<Integer>} index
function findValueIndexInArray(argument0, argument1) {

		var array = argument0;
		var value = argument1;
	
		for (var index = 0; index < getArrayLength(array); index++) {
			if (array[index] == value) {
				return index;	
			}
		}
	
		return createEmptyOptional();
	



}
