///@function deserializeNetResponse(jsonString)
///@description Deserialize NetResponse from JSON String to NetResponse entity.
///@param {String} jsonString
///@return {NetResponse} netResponse 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function deserializeNetResponse(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "GenericEntity"));

		destroyJsonObject(jsonObject);
	
		return createNetResponse(type, data);
	



}
