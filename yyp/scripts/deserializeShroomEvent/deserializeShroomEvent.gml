///@function deserializeShroomEvent(jsonString)
///@description Deserialize ShroomEvent from JSON String to ShroomEvent entity.
///@param {String} jsonString
///@return {ShroomEvent} shroomEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.913Z}

function deserializeShroomEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createShroomEvent(fields);
	
}
