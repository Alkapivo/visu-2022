///@function convertGMJsonFieldToGrid(gmjsonField)
///@description Converter. Extracted Grid is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<Grid<Object>>} grid
function convertGMJsonFieldToGrid(argument0) {

		var gmJsonField = argument0;

		if (isDataStructure(gmJsonField, List)) {
			var grid = createGrid(0, 0);
			var gridWidth = null;
			var gridHeight = getListSize(gmJsonField);
			grid = resizeGrid(grid, 0, gridHeight);
			for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
				var row = gmJsonField[| yIndex];
				if (isDataStructure(row, List)) {
					var rowSize = getListSize(row);
					if (gridWidth == null) {
						gridWidth = rowSize;
						resizeGrid(grid, gridWidth, gridHeight);
					}
					if (gridWidth != rowSize) {
						logger("Invalid row found at yIndex: {0}. Expected size: {1}, found: {2}", LogType.WARNING, yIndex, gridWidth, rowSize);
						continue;
					}
					for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
						grid[# xIndex, yIndex] = row[| xIndex];	
					}
				}
			}
		}
	
		return createEmptyOptional();
	



}
