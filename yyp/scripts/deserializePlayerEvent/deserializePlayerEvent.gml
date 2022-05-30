///@function deserializePlayerEvent(jsonString)
///@description Deserialize PlayerEvent from JSON String to PlayerEvent entity.
///@param {String} jsonString
///@return {PlayerEvent} playerEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.669Z}

function deserializePlayerEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createPlayerEvent(fields);
	
}
