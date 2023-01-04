///@description ShroomEvent entity

///@function createShroomEvent(fields)
///@description Constructor for ShroomEvent entity.
///@param {Map<String::any>} fields
///@return {ShroomEvent} shroomEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.912Z}

function createShroomEvent(fields) {

	var shroomEvent = createEntity(ShroomEvent);

	setShroomEventFields(shroomEvent, assertNoOptional(fields));

	return shroomEvent;
	
}
///@function serializeShroomEvent(shroomEvent)
///@description Serialize ShroomEvent to JSON string.
///@param {ShroomEvent} shroomEvent
///@return {String} shroomEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.912Z}

function serializeShroomEvent(shroomEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getShroomEventFields(shroomEvent),
		Map);
	

	var shroomEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomEventJsonString;
	
}
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
///@function destroyShroomEvent(shroomEvent)
///@description Destroy ShroomEvent entity.
///@param {ShroomEvent} shroomEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.913Z}

function destroyShroomEvent(shroomEvent) {


	
	var fields = getShroomEventFields(shroomEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in ShroomEvent");
	setShroomEventFields(shroomEvent, null);
	

	
}
///@function getShroomEventFields(shroomEvent)
///@description Getter.
///@param {ShroomEvent} shroomEvent
///@return {Map<String::any>} fields 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.913Z}

function getShroomEventFields(shroomEvent) {

	return shroomEvent[@ 0];
	
}
///@function setShroomEventFields(shroomEvent, fields)
///@description Setter.
///@param {ShroomEvent} shroomEvent
///@param {Map<String::any>} fields
///@throws {Exception}
///@generated {2022-08-18T22:24:59.913Z}

function setShroomEventFields(shroomEvent, fields) {

	shroomEvent[@ 0] = fields;
	
}
