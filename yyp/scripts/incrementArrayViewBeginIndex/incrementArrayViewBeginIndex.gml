///@function incrementArrayViewBeginIndex(array, indexOffset, viewSize)
///@description Return incremented value (guard boundaries).
///@param {any[]} array
///@param {Integer} indexOffset
///@param {Integer} viewSize
function incrementArrayViewBeginIndex(argument0, argument1, argument2) {

		var array = argument0;
		var indexOffset = argument1;
		var viewSize = argument2;
	
		return isArrayViewIncrementBeginIndexEnabled(array, indexOffset, viewSize) ? 
			indexOffset + 1 : indexOffset;
	



}
