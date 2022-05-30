///@function getFromGrid(grid, columnIndex, rowIndex)
///@description Safe getter.
///@param {Grid<T>} grid
///@param {Integer} columnIndex
///@param {Integer} rowIndex
///@return {Optional<T>} object
function getFromGrid(argument0, argument1, argument2) {
	
		var grid = argument0;
		var columnIndex = argument1;
		var rowIndex = argument2;
	
		var object = createEmptyOptional();
	
		if ((isNumber(columnIndex)) && 
			(isNumber(rowIndex)) &&
			(columnIndex >= 0) &&
			(rowIndex >= 0) &&
			(isDataStructure(grid, Grid)) &&
			(columnIndex < getGridWidth(grid)) &&
			(rowIndex < getGridHeight(grid))) {
				
			object = grid[# columnIndex, rowIndex];
		} else {
		
			logger("Unsafe grid access<GET>. { \"grid\": \"{0}\", \"columnIndex\": {1}, \"rowIndex\": {2} }", LogType.ERROR, grid, columnIndex, rowIndex);	
		}
	
		return object;
	



}
