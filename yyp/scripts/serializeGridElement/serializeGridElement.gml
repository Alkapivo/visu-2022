///@function serializeGridElement(gridElement)
///@description Serialize GridElement to JSON string.
///@param {GridElement} gridElement
///@return {String} gridElementJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

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
