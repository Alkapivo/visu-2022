///@description FactIntent entity

///@function createFactIntent(name, value)
///@description Constructor for FactIntent entity.
///@param {String} name
///@param {Optional<Boolean>} value
///@return {FactIntent} factIntent 
///@throws {Exception}
///@generated {2021-01-04T19:45:18.590Z}
///@override
function createFactIntent(argument0, argument1) {

		var name = argument0;
		var value = argument1;
	
		var factIntent = createEntity(FactIntent);
	
	#region @override
		if (isTJsonBoolean(value)) {
	
			value = convertTJsonBooleanToBoolean(value);
		}
	#endregion

		setFactIntentName(factIntent, assertNoOptional(name));
		setFactIntentValue(factIntent, value);

		return factIntent;
	



}
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
///@function destroyFactIntent(factIntent)
///@description Destroy FactIntent entity.
///@param {FactIntent} factIntent
///@throws {Exception}
///@generated {2021-05-01T23:43:37.652Z}

function destroyFactIntent(factIntent) {


	
	var name = getFactIntentName(factIntent);
	var value = getFactIntentValue(factIntent);
	

	
}
///@function getFactIntentName(factIntent)
///@description Getter.
///@param {FactIntent} factIntent
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.652Z}

function getFactIntentName(factIntent) {

	return factIntent[@ 0];
	
}
///@function getFactIntentValue(factIntent)
///@description Getter.
///@param {FactIntent} factIntent
///@return {Optional<Boolean>} value 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.652Z}

function getFactIntentValue(factIntent) {

	return factIntent[@ 1];
	
}
///@function setFactIntentName(factIntent, name)
///@description Setter.
///@param {FactIntent} factIntent
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:39.359Z}

function setFactIntentName(factIntent, name) {

	factIntent[@ 0] = name;
	
}
///@function setFactIntentValue(factIntent, value)
///@description Setter.
///@param {FactIntent} factIntent
///@param {Optional<Boolean>} value
///@throws {Exception}
///@generated {2021-05-01T23:49:39.359Z}

function setFactIntentValue(factIntent, value) {

	factIntent[@ 1] = value;
	
}
