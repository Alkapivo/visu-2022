///@function pushArray(array, value)
///@description Push to array
///@param {T[]} array
///@param {T} value
function pushArray(argument0, argument1) {

		var array = argument0;
		var value = argument1;
	
		array = isArray(array) ? array : createArray(0);
		array[@ getArrayLength(array)] = value;
	
		return array;
	



}
