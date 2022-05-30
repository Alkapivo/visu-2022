///@function serializeGridEvent(gridEvent)
///@description Serialize GridEvent to JSON string.
///@param {GridEvent} gridEvent
///@return {String} gridEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.575Z}

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
