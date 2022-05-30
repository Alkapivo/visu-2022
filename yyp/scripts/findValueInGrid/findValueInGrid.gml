///@function findValueInGrid(grid, value)
///@description Find first matching value and get coordinates of that value in grid.
///@param {Grid<Object>} list
///@param {Object} value
///@return {Optional<Tuple<Integer::Integer>>} coords
function findValueInGrid(argument0, argument1) {
	
		var grid = argument0;
		var value = argument1;
	
		var gridWidth = getGridWidth(grid);
		var gridHeight = getGridHeight(grid);

		var foundValue = null;
		for (var rowIndex = 0; rowIndex < gridHeight; rowIndex++) {
			for (var columnIndex = 0; columnIndex < gridWidth; columnIndex++) {
				foundValue = grid[# columnIndex, rowIndex];
				if (foundValue == value) {
					return createTuple(columnIndex, rowIndex);	
				}
			}
		}
	
		return createEmptyOptional();
	



}
