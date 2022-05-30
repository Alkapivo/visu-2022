///@function mergeArrays(target, source)
///@description Add unique values from source array to target array. Return target array but also mutate it (function with side-effect).
///@param {Object[]} target
///@param {Object[]} source
function mergeArrays(argument0, argument1) {

		var target = argument0;
		var source = argument1;
	
		for (var index = 0; index < getArrayLength(source); index++) {
			var value = source[index];
			if (!arrayContain(target, value)) {
				pushArray(target, value);	
			}
		}
	



}
