///@description GridEvent entity

///@function createGridEvent(fields)
///@description Constructor for GridEvent entity.
///@param {Map<String::any>} fields
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function createGridEvent(fields) {

	var gridEvent = createEntity(GridEvent);

	setGridEventFields(gridEvent, assertNoOptional(fields));

	return gridEvent;
	
}
///@function serializeGridEvent(gridEvent)
///@description Serialize GridEvent to JSON string.
///@param {GridEvent} gridEvent
///@return {String} gridEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function serializeGridEvent(gridEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getGridEventFields(gridEvent),
		Map);
	

	var gridEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gridEventJsonString;
	
}
///@function deserializeGridEvent(jsonString)
///@description Deserialize GridEvent from JSON String to GridEvent entity.
///@param {String} jsonString
///@return {GridEvent} gridEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function deserializeGridEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createGridEvent(fields);
	
}
///@function destroyGridEvent(gridEvent)
///@description Destroy GridEvent entity.
///@param {GridEvent} gridEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.634Z}

function destroyGridEvent(gridEvent) {


	
	var fields = getGridEventFields(gridEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in GridEvent");
	setGridEventFields(gridEvent, null);
	

	
}
///@function getGridEventFields(gridEvent)
///@description Getter.
///@param {GridEvent} gridEvent
///@return {Map<String::any>} fields 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.635Z}

function getGridEventFields(gridEvent) {

	return gridEvent[@ 0];
	
}
///@function setGridEventFields(gridEvent, fields)
///@description Setter.
///@param {GridEvent} gridEvent
///@param {Map<String::any>} fields
///@throws {Exception}
///@generated {2022-08-18T22:24:59.635Z}

function setGridEventFields(gridEvent, fields) {

	gridEvent[@ 0] = fields;
	
}
