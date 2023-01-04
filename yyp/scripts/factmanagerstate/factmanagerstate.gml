///@description FactManagerState entity

///@function createFactManagerState(factIntents)
///@description Constructor for FactManagerState entity.
///@param {FactIntent[]} factIntents
///@return {FactManagerState} factManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function createFactManagerState(factIntents) {

	var factManagerState = createEntity(FactManagerState);

	setFactManagerStateFactIntents(factManagerState, assertNoOptional(factIntents));

	return factManagerState;
	
}
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
///@function destroyFactManagerState(factManagerState)
///@description Destroy FactManagerState entity.
///@param {FactManagerState} factManagerState
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function destroyFactManagerState(factManagerState) {


	
	var factIntents = getFactManagerStateFactIntents(factManagerState);
	
	for (var index = 0; index < getArrayLength(factIntents); index++) {
		var entity = factIntents[@ index];
		destroyFactIntent(entity);
	}
	setFactManagerStateFactIntents(factManagerState, null);
	

	
}
///@function getFactManagerStateFactIntents(factManagerState)
///@description Getter.
///@param {FactManagerState} factManagerState
///@return {FactIntent[]} factIntents 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function getFactManagerStateFactIntents(factManagerState) {

	return factManagerState[@ 0];
	
}
///@function setFactManagerStateFactIntents(factManagerState, factIntents)
///@description Setter.
///@param {FactManagerState} factManagerState
///@param {FactIntent[]} factIntents
///@throws {Exception}
///@generated {2021-05-01T23:49:38.746Z}

function setFactManagerStateFactIntents(factManagerState, factIntents) {

	factManagerState[@ 0] = factIntents;
	
}
