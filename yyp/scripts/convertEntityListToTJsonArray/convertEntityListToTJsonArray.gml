///@function convertEntityListToTJsonArray(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject
///@param {List<Entity} entities
///@param {String} entityName
///@return {TJsonArray} tjsonArray
function convertEntityListToTJsonArray(argument0, argument1) {

		var entities = argument0;
		var entityName = string(argument1);
	
		if (!isDataStructure(entities, List)) {
			return tj_array();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript);
		if (!isOptionalPresent(serializeScript)) {
			return tj_array();
		}
	
		var entitiesSize = getListSize(entities)
		var tjsonArray = createArray(entitiesSize);
		for (var index = 0; index < entitiesSize; index++) {
			var entity = entities[| index];
			var serializedEntity = script_execute(serializeScript, entity);
			serializedEntity = string(serializedEntity);
			var tjsonEntity = tj_decode(serializedEntity);
			tjsonArray[index] = tjsonEntity;
		}
	
		return tjsonArray;


}
