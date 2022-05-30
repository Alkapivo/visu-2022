///@function convertTJsonFiedToEntityGrid(tjsonField, entityName)
///@description Converter from json to entity grid.
///@param {TJsonField} tjsonField
///@param {String} entityName
///@return {Optional<Grid<?Entity>>} entities
///@throws {Exception.ParseException}
function convertTJsonFieldToEntityGrid(argument0, argument1) {

		var tjsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
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
