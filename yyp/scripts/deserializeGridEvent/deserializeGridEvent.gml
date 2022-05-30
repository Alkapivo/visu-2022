///@function deserializeGridEvent(jsonString)
///@description Deserialize GridEvent from JSON String to GridEvent entity.
///@param {String} jsonString
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.575Z}

function deserializeGridEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createGridEvent(fields);
	
}
