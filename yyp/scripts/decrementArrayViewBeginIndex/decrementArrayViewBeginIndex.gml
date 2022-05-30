///@function decrementArrayViewBeginIndex(array, indexOffset, viewSize)
///@description Check if indexOffset can be decremented.
///@param {any[]} array
///@param {Integer} indexOffset
///@param {Integer} viewSize
function decrementArrayViewBeginIndex(argument0, argument1, argument2) {

		var array = argument0;
		var indexOffset = argument1;
		var viewSize = argument2;
	
		return isArrayViewDecrementBeginIndexEnabled(array, indexOffset, viewSize) ? 
			indexOffset - 1 : indexOffset;
	



}
