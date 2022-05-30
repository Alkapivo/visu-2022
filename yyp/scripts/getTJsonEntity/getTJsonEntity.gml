///@function getTJsonEntity(tjsonObject, propertyName, entityName) 
///@description Wraper for getTJsonValue and deserialize Entity.
///@param {TJsonObject} tjsonObject
///@param {String} propertyName
///@param {Object} entityName
///@return {?Entity} entity
function getTJsonEntity(argument0, argument1, argument2) {

		var tjsonObject = argument0;
		var propertyName = string(argument1);
		var entityName = string(argument2);
	
		var deserializeScript = getAssetIndex("deserialize" + entityName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(AssetNotFoundException,
				stringParams("Cannot find deserialzie script for entity {0}", entityName),
				runtimeExceptionHandler));
		
		}
	
		var rawEntity = getTJsonValue(tjsonObject, propertyName);
		var entity = script_execute(deserializeScript, tj_encode(rawEntity));
	
		return entity;
	



}
