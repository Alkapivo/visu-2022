///@description GridElementInfo entity

///@function createGridElementInfo(isVisible, type, color, text)
///@description Constructor for GridElementInfo entity.
///@param {Boolean} isVisible
///@param {GridElementInfoType} type
///@param {Color} color
///@param {String} text
///@return {GridElementInfo} gridElementInfo 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function createGridElementInfo(isVisible, type, color, text) {

	var gridElementInfo = createEntity(GridElementInfo);

	setGridElementInfoIsVisible(gridElementInfo, assertNoOptional(isVisible));
	setGridElementInfoType(gridElementInfo, assertNoOptional(type));
	setGridElementInfoColor(gridElementInfo, assertNoOptional(color));
	setGridElementInfoText(gridElementInfo, assertNoOptional(text));

	return gridElementInfo;
	
}
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
///@function deserializeGridElementInfo(jsonString)
///@description Deserialize GridElementInfo from JSON String to GridElementInfo entity.
///@param {String} jsonString
///@return {GridElementInfo} gridElementInfo 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function deserializeGridElementInfo(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var isVisible = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isVisible"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var color = assertNoOptional(getJsonObjectFieldValue(jsonObject, "color", Entity, "Color"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));

	destroyJsonObject(jsonObject);
	
	return createGridElementInfo(isVisible, type, color, text);
	
}
///@function destroyGridElementInfo(gridElementInfo)
///@description Destroy GridElementInfo entity.
///@param {GridElementInfo} gridElementInfo
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function destroyGridElementInfo(gridElementInfo) {


	
	var isVisible = getGridElementInfoIsVisible(gridElementInfo);
	var type = getGridElementInfoType(gridElementInfo);
	var color = getGridElementInfoColor(gridElementInfo);
	var text = getGridElementInfoText(gridElementInfo);
	
	destroyColor(color);
	setGridElementInfoColor(gridElementInfo, null);
	

	
}

///@function getGridElementInfoColor(gridElementInfo)
///@description Getter.
///@param {GridElementInfo} gridElementInfo
///@return {Color} color 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function getGridElementInfoColor(gridElementInfo) {

	return gridElementInfo[@ 2];
	
}
///@function getGridElementInfoIsVisible(gridElementInfo)
///@description Getter.
///@param {GridElementInfo} gridElementInfo
///@return {Boolean} isVisible 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function getGridElementInfoIsVisible(gridElementInfo) {

	return gridElementInfo[@ 0];
	
}
///@function getGridElementInfoText(gridElementInfo)
///@description Getter.
///@param {GridElementInfo} gridElementInfo
///@return {String} text 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function getGridElementInfoText(gridElementInfo) {

	return gridElementInfo[@ 3];
	
}
///@function getGridElementInfoType(gridElementInfo)
///@description Getter.
///@param {GridElementInfo} gridElementInfo
///@return {GridElementInfoType} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function getGridElementInfoType(gridElementInfo) {

	return gridElementInfo[@ 1];
	
}

///@function setGridElementInfoColor(gridElementInfo, color)
///@description Setter.
///@param {GridElementInfo} gridElementInfo
///@param {Color} color
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function setGridElementInfoColor(gridElementInfo, color) {

	gridElementInfo[@ 2] = color;
	
}
///@function setGridElementInfoIsVisible(gridElementInfo, isVisible)
///@description Setter.
///@param {GridElementInfo} gridElementInfo
///@param {Boolean} isVisible
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function setGridElementInfoIsVisible(gridElementInfo, isVisible) {

	gridElementInfo[@ 0] = isVisible;
	
}
///@function setGridElementInfoText(gridElementInfo, text)
///@description Setter.
///@param {GridElementInfo} gridElementInfo
///@param {String} text
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function setGridElementInfoText(gridElementInfo, text) {

	gridElementInfo[@ 3] = text;
	
}
///@function setGridElementInfoType(gridElementInfo, type)
///@description Setter.
///@param {GridElementInfo} gridElementInfo
///@param {GridElementInfoType} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.618Z}

function setGridElementInfoType(gridElementInfo, type) {

	gridElementInfo[@ 1] = type;
	
}
