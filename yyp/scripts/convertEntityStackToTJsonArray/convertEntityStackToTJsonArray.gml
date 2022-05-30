///@function convertEntityStackToTJsonArray(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject.
///@param {Stack<Entity} entities
///@param {String} entityName
///@return {TJsonArray} tjsonArray
function convertEntityStackToTJsonArray(argument0, argument1) {

		var entities = cloneStack(argument0);
		var entityName = string(argument1);
	
		if (!isDataStructure(entities, Stack)) {
			return tj_array();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript, noone);
		if (serializeScript == noone) {
			return tj_array();
		}
	
		var entitiesSize = getStackSize(entities);
		var entitiesArray = createArray(entitiesSize, null);
		for (var index = 0; index < entitiesSize; index++) {
			var entity = popStack(entities);
			var serializedEntity = script_execute(serializeScript, entity);
			var tjsonEntity = tj_decode(serializedEntity);
			entitiesArray[index] = tjsonEntity;
		}
	
		return tj_array(entitiesArray);


}
