///@function serializeFactManagerState(factManagerState)
///@description Serialize FactManagerState to JSON string.
///@param {FactManagerState} factManagerState
///@return {String} factManagerStateJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function serializeFactManagerState(factManagerState) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"factIntents",
		getFactManagerStateFactIntents(factManagerState),
		"FactIntent",
		Array);
	

	var factManagerStateJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return factManagerStateJsonString;
	
}
