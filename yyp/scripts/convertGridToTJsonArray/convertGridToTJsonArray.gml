///@function convertGridToTJsonArray(grid)
///@description Convert Grid to TJsonArray.
///@param {Grid<?Primitive>} stack
///@return {TJsonArray} tjsonArray
function convertGridToTJsonArray(argument0) {

		var grid = cloneGrid(argument0);
	
		var gridWidth = getGridWidth(grid);
		var gridHeight = getGridHeight(grid);	
		var gridArray = createArray(gridHeight, createArray(gridWidth, 0));
	
		for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
			var row = gridArray[@ yIndex];
			for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
				row[xIndex] = grid[# xIndex, yIndex];
			}
		}
	
		return tj_array(gridArray);


}
