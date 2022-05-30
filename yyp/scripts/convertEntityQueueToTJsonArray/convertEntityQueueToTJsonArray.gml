///@function convertEntityQueueToTJsonArray(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject.
///@param {Queue<Entity} entities
///@param {String} entityName
///@return {TJsonArray} tjsonArray
function convertEntityQueueToTJsonArray(argument0, argument1) {

		var entities = cloneQueue(argument0);
		var entityName = string(argument1);
	
		if (!isDataStructure(entities, Queue)) {
			return tj_array();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript);
		if (!isOptionalPresent(serializeScript)) {
			return tj_array();
		}
	
		var entitiesSize = getQueueSize(entities);
		var entitiesArray = createArray(entitiesSize, null);
		for (var index = 0; index < entitiesSize; index++) {
			var entity = popQueue(entities);
			var serializedEntity = script_execute(serializeScript, entity);
			var tjsonEntity = tj_decode(serializedEntity);
			entitiesArray[index] = tjsonEntity;
		}
	
		return tj_array(entitiesArray);


}
