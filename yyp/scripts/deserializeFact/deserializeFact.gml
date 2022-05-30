///@function deserializeFact(jsonString)
///@description Deserialize Fact from JSON String to Fact entity.
///@param {String} jsonString
///@return {Fact} fact 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function deserializeFact(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var value = assertNoOptional(getJsonObjectFieldValue(jsonObject, "value"));
	var subscribers = getJsonObjectFieldValue(jsonObject, "subscribers", List);

	destroyJsonObject(jsonObject);
	
	return createFact(name, value, subscribers);
	
}
