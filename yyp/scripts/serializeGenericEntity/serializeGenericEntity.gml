///@function serializeGenericEntity(genericEntity)
///@description Serialize GenericEntity to JSON string.
///@param {GenericEntity} genericEntity
///@return {String} genericEntityJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.039Z}
function serializeGenericEntity(argument0) {

		var genericEntity = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getGenericEntityType(genericEntity));	
		appendFieldToJsonObject(
			jsonObject,
			"object",
			getGenericEntityObject(genericEntity));	

		var genericEntityJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return genericEntityJsonString;
	



}
