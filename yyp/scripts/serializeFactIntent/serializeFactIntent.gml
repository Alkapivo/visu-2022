///@function serializeFactIntent(factIntent)
///@description Serialize FactIntent to JSON string.
///@param {FactIntent} factIntent
///@return {String} factIntentJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.652Z}

function serializeFactIntent(factIntent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getFactIntentName(factIntent));	
	if (isOptionalPresent(getFactIntentValue(factIntent))) {
		appendFieldToJsonObject(
			jsonObject,
			"value",
			getFactIntentValue(factIntent));
	}
	

	var factIntentJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return factIntentJsonString;
	
}
