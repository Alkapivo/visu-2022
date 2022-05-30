///@function createGrid(width, height, [defaultValue])
///@description Wrapper for ds_grid_create.
///@param {Integer} width
///@param {Integer} height
///@param {Object} [defaultValue]
///@return {Grid<Object>} grid
function createGrid() {

	    var gridWidth = argument[0];
	    var gridHeight = argument[1];

		var grid = ds_grid_create(gridWidth, gridHeight);
	
		if (argument_count == 3) {

	        var defaultValue = argument[2];
			for (var yIndex = 0; yIndex < argument[1]; yIndex++) {
				for (var xIndex = 0; xIndex < argument[0]; xIndex++) {

					grid[# xIndex, yIndex] = defaultValue;
				}
			}
		}
	
		return grid;




}
