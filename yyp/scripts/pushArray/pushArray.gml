///@function pushArray(array, value)
///@description Push to array
///@param {T[]} array
///@param {T} value
///@return {T[]} array
function pushArray(argument0, argument1) {

	var array = argument0;
	var value = argument1;
	
	array = isArray(array) ? array : createArray(0);
	array[@ getArrayLength(array)] = value;
	
	return array;
}

///@function pushElementsToArray(array, elements)
///@description Push to array
///@param {T[]} array
///@param {T[]} elements
///@return {T[]} array
function pushElementsToArray(array, elements) {

	array = isArray(array) ? array : createArray(0);
	for (var index = 0; index < Core.Collections.Arrays.size(elements); index++) {
	
		var element = elements[@ index];
		array[@ getArrayLength(array)] = element;
	}

	return array;
}
