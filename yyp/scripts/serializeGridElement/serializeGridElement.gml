///@function serializeGridElement(gridElement)
///@description Serialize GridElement to JSON string.
///@param {GridElement} gridElement
///@return {String} gridElementJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.545Z}

function serializeGridElement(gridElement) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"position",
		getGridElementPosition(gridElement),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"sprite",
		getGridElementSprite(gridElement),
		"Sprite");
	
	appendEntityToJsonObject(
		jsonObject,
		"info",
		getGridElementInfo(gridElement),
		"GridElementInfo");
	

	var gridElementJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gridElementJsonString;
	
}
