///@function serializeFact(fact)
///@description Serialize Fact to JSON string.
///@param {Fact} fact
///@return {String} factJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function serializeFact(fact) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getFactName(fact));	
	appendFieldToJsonObject(
		jsonObject,
		"value",
		getFactValue(fact));	
	if (isOptionalPresent(getFactSubscribers(fact))) {
		appendFieldToJsonObject(
			jsonObject,
			"subscribers",
			getFactSubscribers(fact),
			List);
	}
	

	var factJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return factJsonString;
	
}
