///@function deserializeRepository(jsonString)
///@description Deserialize Repository from JSON String to Repository entity.
///@param {String} jsonString
///@return {Repository} repository 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
///@override 
function deserializeRepository(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	#region @override
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map, type));
	#endregion

		destroyJsonObject(jsonObject);
	
		return createRepository(name, type, data);
	



}
