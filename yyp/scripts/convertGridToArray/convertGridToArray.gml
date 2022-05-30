///@function convertGridToArray(grid)
///@description Convert grid to 2D array.
///@param {Grid<Object>} stack
///@return {Object[]} array
function convertGridToArray(argument0) {

		var grid = argument0;
	
		if (isDataStructure(grid, Grid)) {
			var gridWidth = getGridWidth(grid);
			var gridHeight = getGridHeight(grid);	
			var gridArray = createArray(gridHeight, createArray(gridWidth, 0));
	
			for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
				var row = gridArray[@ yIndex];
				for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
					row[@ xIndex] = grid[# xIndex, yIndex];
				}
			}
	
			return gridArray;
		} else {
			var exceptionMessage = "[convertGridToArray] Unable to convert grid to array. Argument wasn't recognized as grid";
			throwException(createException(RuntimeException, exceptionMessage, null));
			return [ [] ];
		}
	



}
