///@function deserializeGridEvent(jsonString)
///@description Deserialize GridEvent from JSON String to GridEvent entity.
///@param {String} jsonString
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function deserializeGridEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createGridEvent(fields);
	
}
