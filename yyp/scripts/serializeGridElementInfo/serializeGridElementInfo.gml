///@function serializeGridElementInfo(gridElementInfo)
///@description Serialize GridElementInfo to JSON string.
///@param {GridElementInfo} gridElementInfo
///@return {String} gridElementInfoJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function serializeGridElementInfo(gridElementInfo) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"isVisible",
		getGridElementInfoIsVisible(gridElementInfo));	
	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGridElementInfoType(gridElementInfo));	
	appendEntityToJsonObject(
		jsonObject,
		"color",
		getGridElementInfoColor(gridElementInfo),
		"Color");
	
	appendFieldToJsonObject(
		jsonObject,
		"text",
		getGridElementInfoText(gridElementInfo));	

	var gridElementInfoJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gridElementInfoJsonString;
	
}
