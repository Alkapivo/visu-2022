///@function convertEntityMapToTJsonObject(entities, entityName)
///@description Wrapper for entity collection and convertEntityToTJsonObject.
///@param {Map<String::Entity} entities
///@param {String} entityName
///@return {TJsonObject} tjsonObject
function convertEntityMapToTJsonObject(argument0, argument1) {

		var entities = argument0;
		var entityName = string(argument1);
	
		if (!isDataStructure(entities, Map)) {
			return tj_object();
		}
	
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript, noone);
		if (serializeScript == noone) {
			return tj_object();
		}
	
		var tjsonMap = tj_object();
		for (var key = mapFirst(entities); iteratorFinish(key); key = mapNext(entities, key)) {
			var entity = entities[? key];
			var serializedEntity = script_execute(serializeScript, entity);
			var tjsonEntity = tj_decode(serializedEntity);
			tj_set(tjsonMap, key, tjsonEntity);
		}
	
		return tjsonMap;


}
