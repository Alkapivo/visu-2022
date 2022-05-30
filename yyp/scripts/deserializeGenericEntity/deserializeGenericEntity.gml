///@function deserializeGenericEntity(jsonString)
///@description Deserialize GenericEntity from JSON String to GenericEntity entity.
///@param {String} jsonString
///@return {GenericEntity} genericEntity 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function deserializeGenericEntity(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var object = assertNoOptional(getJsonObjectFieldValue(jsonObject, "object"));

		destroyJsonObject(jsonObject);
	
		return createGenericEntity(type, object);
	



}
