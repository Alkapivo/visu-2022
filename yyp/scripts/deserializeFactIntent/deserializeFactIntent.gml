///@function deserializeFactIntent(jsonString)
///@description Deserialize FactIntent from JSON String to FactIntent entity.
///@param {String} jsonString
///@return {FactIntent} factIntent 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.652Z}

function deserializeFactIntent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var value = getJsonObjectFieldValue(jsonObject, "value");

	destroyJsonObject(jsonObject);
	
	return createFactIntent(name, value);
	
}
