///@function deserializeBoss(jsonString)
///@description Deserialize Boss from JSON String to Boss entity.
///@param {String} jsonString
///@return {Boss} boss 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.435Z}

function deserializeBoss(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));

	destroyJsonObject(jsonObject);
	
	return createBoss(type, state, handler);
	
}
