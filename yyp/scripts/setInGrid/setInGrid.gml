///@function setInGrid(grid, object, columnIndex, rowIndex)
///@description Safe setter.
///@param {Grid<T>} grid
///@param {T} object
///@param {Integer} columnIndex
///@param {Integer} rowIndex
function setInGrid(argument0, argument1, argument2, argument3) {
	
		var grid = argument0;
		var object = argument1;
		var columnIndex = argument2;
		var rowIndex = argument3;
		
		if ((isNumber(columnIndex)) && 
			(isNumber(rowIndex)) &&
			(columnIndex >= 0) &&
			(rowIndex >= 0) &&
			(isDataStructure(grid, Grid)) &&
			(columnIndex < getGridWidth(grid)) &&
			(rowIndex < getGridHeight(grid))) {
				
			grid[# columnIndex, rowIndex] = object;
		} else {
		
			logger("Unsafe grid access<SET>. { \"grid\": \"{0}\", \"columnIndex\": {1}, \"rowIndex\": {2} }", LogType.ERROR, grid, columnIndex, rowIndex);	
		}
	



}
