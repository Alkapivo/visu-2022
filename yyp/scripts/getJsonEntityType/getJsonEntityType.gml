///@function getJsonEntityType(jsonEntity)
///@description Check if jsonEntity is JsonObject, JsonArray or none of them.
///@param {JsonObject|JsonArray} jsonEntity
///@return {Optional<JsonEntityType>} jsonEntityType - return null if jsonEntity wasn't recognized
function getJsonEntityType(argument0) {
	
		var jsonEntity = argument0;
	
		return isJsonObject(jsonEntity) ? JsonEntityType.OBJECT : 
			(isJsonArray(jsonEntity) ? JsonEntityType.ARRAY : null);
	



}
