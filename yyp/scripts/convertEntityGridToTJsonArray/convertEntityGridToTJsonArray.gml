///@function convertEntityGridToTJsonArray(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject.
///@param {Stack<Entity} entities
///@param {String} entityName
///@return {TJsonArray} tjsonArray
function convertEntityGridToTJsonArray(argument0, argument1) {

		var entitiesGrid = cloneGrid(argument0);
		var entityName = string(argument1);
	
		if (!isDataStructure(entitiesGrid, Grid)) {
			return tj_array();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript, noone);
		if (serializeScript == noone) {
			return tj_array();
		}
	
		var entitiesGridWidth = getGridWidth(entitiesGrid);
		var entitiesGridHeight = getGridHeight(entitiesGrid);
		var entitiesGridArray = createArray(entitiesGridHeight, createArray(entitiesGridWidth, 0));
		for (var yIndex = 0; yIndex < entitiesGridHeight; yIndex++) {
			var row = entitiesGridArray[@ yIndex];
			for (var xIndex = 0; xIndex < entitiesGridWidth; xIndex++) {
				var entity = entitiesGrid[# xIndex, yIndex];
				var serializedEntity = script_execute(serializeScript, entity);
				var tjsonEntity = tj_decode(serializedEntity);
				row[xIndex] = tjsonEntity;
			}
		}
	
		return tj_array(entitiesGridArray);


}
