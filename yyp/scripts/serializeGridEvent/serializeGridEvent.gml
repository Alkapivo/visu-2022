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
