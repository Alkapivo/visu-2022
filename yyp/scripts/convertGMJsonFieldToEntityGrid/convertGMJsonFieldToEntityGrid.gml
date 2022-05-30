///@function convertGMJsonFieldToEntityGrid(gmJsonField, entityName)
///@description Converter from json to entity grid.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<Grid<?Entity>>} entities
///@throws {Exception.ParseException}
function convertGMJsonFieldToEntityGrid(argument0, argument1) {

		var gmJsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler);
		}
	
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
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(ParseException,
				stringParams("Unable to convert entities grid of \"{0}\". Tjson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}
	



}
