///@description Fact entity

///@function createFact(name, value, subscribers)
///@description Constructor for Fact entity.
///@param {String} name
///@param {Boolean} value
///@param {Optional<List<Instance>>} subscribers
///@return {Fact} fact 
///@throws {Exception}
///@generated {2021-01-04T19:45:18.507Z}
///@override
function createFact(argument0, argument1, argument2) {

		var name = argument0;
		var value = argument1;
		var subscribers = argument2;
	
		var fact = createEntity(Fact);
	
	#region @override
		if (isTJsonBoolean(value)) {
	
			value = convertTJsonBooleanToBoolean(value);
		}
	#endregion

		setFactName(fact, assertNoOptional(name));
		setFactValue(fact, assertNoOptional(value));
		setFactSubscribers(fact, subscribers);

		return fact;
	



}
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
///@function destroyFact(fact)
///@description Destroy Fact entity.
///@param {Fact} fact
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function destroyFact(fact) {


	
	var name = getFactName(fact);
	var value = getFactValue(fact);
	var subscribers = getFactSubscribers(fact);
	
	if (isOptionalPresent(subscribers)) {
		destroyDataStructure(subscribers, List, "Unable to destroy List subscribers in Fact");
	}
	setFactSubscribers(fact, null);
	

	
}

///@function getFactName(fact)
///@description Getter.
///@param {Fact} fact
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function getFactName(fact) {

	return fact[@ 0];
	
}

///@function getFactSubscribers(fact)
///@description Getter.
///@param {Fact} fact
///@return {Optional<List<Instance>>} subscribers 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function getFactSubscribers(fact) {

	return fact[@ 2];
	
}
///@function getFactValue(fact)
///@description Getter.
///@param {Fact} fact
///@return {Boolean} value 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function getFactValue(fact) {

	return fact[@ 1];
	
}

///@function setFactName(fact, name)
///@description Setter.
///@param {Fact} fact
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:39.327Z}

function setFactName(fact, name) {

	fact[@ 0] = name;
	
}
///@function setFactSubscribers(fact, subscribers)
///@description Setter.
///@param {Fact} fact
///@param {Optional<List<Instance>>} subscribers
///@throws {Exception}
///@generated {2021-05-01T23:49:39.327Z}

function setFactSubscribers(fact, subscribers) {

	fact[@ 2] = subscribers;
	
}
///@function setFactValue(fact, value)
///@description Setter.
///@param {Fact} fact
///@param {Boolean} value
///@throws {Exception}
///@generated {2021-05-01T23:49:39.327Z}

function setFactValue(fact, value) {

	fact[@ 1] = value;
	
}
