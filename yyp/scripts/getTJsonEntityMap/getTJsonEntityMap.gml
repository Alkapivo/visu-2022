///@function getTJsonEntityMap(tjsonObject, propertyName, entityName) 
///@description Wraper for getTJsonValue and serialize Entity collection.
///@param {TJsonObject} tjsonObject
///@param {String} propertyName
///@param {Object} entityName
///@return {Map<String::?Entity} entities
function getTJsonEntityMap(argument0, argument1, argument2) {

		var tjsonObject = argument0;
		var propertyName = string(argument1);
		var entityName = string(argument2);
	
		var deserializeScript = getAssetIndex("deserialize" + entityName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(AssetNotFoundException,
				stringParams("Cannot find deserialzie script for entity {0}", entityName),
				runtimeExceptionHandler));
			exit;
		}
	
		var rawEntities = getTJsonMap(tjsonObject, propertyName);
		if (!isDataStructure(rawEntities, Map)) {
			return createMap();
		}
	
		var entities = createMap();
		for (var key = mapFirst(rawEntities); iteratorFinish(key); key = mapNext(rawEntities, key)) {
			var rawEntity = rawEntities[? key];
			var entity = script_execute(deserializeScript, tj_encode(rawEntity));
			entities[? key] = entity;
		}
	
		destroyDataStructure(rawEntities, Map, "Unable to destroy rawEntities map")
		return entities;



}
