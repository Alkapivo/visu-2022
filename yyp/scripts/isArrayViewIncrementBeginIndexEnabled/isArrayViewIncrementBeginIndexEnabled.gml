///@function isArrayViewIncrementBeginIndexEnabled(array, indexOffset, viewSize)
///@description Check if indexOffset can be incremented.
///@param {any[]} array
///@param {Integer} indexOffset
///@param {Integer} viewSize
function isArrayViewIncrementBeginIndexEnabled(argument0, argument1, argument2) {

		var array = argument0;
		var indexOffset = argument1;
		var viewSize = argument2;
	
		var arrayLength = getArrayLength(array);
		var isEnabled = indexOffset + viewSize < arrayLength;
	
		return isEnabled;
	



}
