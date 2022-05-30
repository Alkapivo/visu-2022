///@function getRandomValueFromArray(array)
///@description Return random entry from array.
///@param {T[]} array
///@return {Optional<T>} value
function getRandomValueFromArray(argument0) {

		var array = argument0;
	
		var arrayLength = getArrayLength(array);
		return arrayLength > 0 ? array[round(random(arrayLength - 1))] : createEmptyOptional();
	



}
