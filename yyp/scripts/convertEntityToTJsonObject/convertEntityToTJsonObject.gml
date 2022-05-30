///@function convertEntityToTJsonObject(entity, entityName)
///@description Serialize entity to TJsonObject
///@param {Entity} entity
///@param {String} entityName
///@return {TJsonObject} tjsonObject
function convertEntityToTJsonObject(argument0, argument1) {

		var entity = argument0;
		var entityName = argument1;
		
		var serializeScript = getAssetIndex("serialize" + entityName, AssetScript);
		if (!isOptionalPresent(serializeScript)) {
			return tj_object();
		}
	
		var serializedEntity = script_execute(serializeScript, entity);
		var tjsonObject = tj_decode(serializedEntity);
	
		return tjsonObject;


}
