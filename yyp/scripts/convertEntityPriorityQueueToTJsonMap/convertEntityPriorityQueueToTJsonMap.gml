///@function convertEntityPriorityQueueToTJsonArray(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject.
///@param {Queue<Entity} entities
///@param {String} entityName
///@return {TJsonArray} tjsonArray
function convertEntityPriorityQueueToTJsonMap(argument0, argument1) {

		var entities = clonePriorityQueue(argument0);
		var entityName = string(argument1);
	
		if (!isDataStructure(entities, PriorityQueue)) {
			return tj_object();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript);
		if (!isOptionalPresent(serializeScript)) {
			return tj_object();
		}
	
		var entitiesSize = getPriorityQueueSize(entities);
		var tjsonObject = tj_object();
		for (var index = 0; index < entitiesSize; index++) {
			var key = findMinInPriorityQueue(entities);
			var entity = popMinPriorityQueue(entities);
			var serializedEntity = script_execute(serializeScript, entity);
			var tjsonEntity = tj_decode(serializedEntity);
			tj_set(tjsonObject, key, tjsonEntity);
		}
	
		return tjsonObject;


}
