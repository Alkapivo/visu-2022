///@function getTJsonEntityArray(tjsonObject, propertyName, entityName) 
///@description Wraper for getTJsonValue and serialize Entity collection.
///@param {TJsonObject} tjsonObject
///@param {String} propertyName
///@param {Object} entityName
///@return {?Entity[]} entities
function getTJsonEntityArray(argument0, argument1, argument2) {

		var tjsonObject = argument0;
		var propertyName = string(argument1);
		var entityName = string(argument2);
	
		var deserializeScript = getAssetIndex("deserialize" + entityName, AssetScript, null);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(AssetNotFoundException,
				stringParams("Cannot find deserialzie script for entity {0}", entityName),
				runtimeExceptionHandler));
			return [];
		}
	
		var rawEntities = getTJsonValue(tjsonObject, propertyName);
		if (!isArray(rawEntities)) {
			return [];
		}
	
		var rawEntitiesSize = getArrayLength(rawEntities);
		var entities = createArray(rawEntitiesSize);
		for (var index = 0; index < rawEntitiesSize; index++) {
			var rawEntity = rawEntities[index];
			var entity = script_execute(deserializeScript, tj_encode(rawEntity));
			entities[index] = entity;
		}
	
		return entities;	



}
