///@function convertTJsonFieldToGrid(tjsonField)
///@description Converter. Extracted grid is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<Grid<Object>>} grid
function convertTJsonFieldToGrid(argument0) {

		var tjsonField = argument0;
	
	
		if (tj_is_array(tjsonField)) {
			var grid = createGrid(0, 0);
			var gridWidth = null;
			var gridHeight = getArrayLength(tjsonField);
			grid = resizeGrid(grid, 0, gridHeight);
			for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
				var row = tjsonField[yIndex];
				if (tj_is_array(row)) {
					var rowSize = getArrayLength(row);
					if (gridWidth == null) {
						gridWidth = rowSize;
						resizeGrid(grid, gridWidth, gridHeight);
					}
					if (gridWidth != rowSize) {
						logger("Invalid row found at yIndex: {0}. Expected size: {1}, found: {2}", LogType.WARNING, yIndex, gridWidth, rowSize);
						continue;
					}
					for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
						grid[# xIndex, yIndex] = row[xIndex];
					}
				}
			}
		}
	
		return createEmptyOptional();
	



}
