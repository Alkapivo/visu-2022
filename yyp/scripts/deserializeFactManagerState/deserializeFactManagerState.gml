///@function deserializeFactManagerState(jsonString)
///@description Deserialize FactManagerState from JSON String to FactManagerState entity.
///@param {String} jsonString
///@return {FactManagerState} factManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function deserializeFactManagerState(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var factIntents = assertNoOptional(getJsonObjectFieldValue(jsonObject, "factIntents", Array, "FactIntent"));

	destroyJsonObject(jsonObject);
	
	return createFactManagerState(factIntents);
	
}
