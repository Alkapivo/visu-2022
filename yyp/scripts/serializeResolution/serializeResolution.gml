///@function serializeResolution(resolution)
///@description Serialize Resolution to JSON string.
///@param {Resolution} resolution
///@return {String} resolutionJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.714Z}

function serializeResolution(resolution) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getResolutionName(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"realWidth",
		getResolutionRealWidth(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"realHeight",
		getResolutionRealHeight(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"guiWidth",
		getResolutionGuiWidth(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"guiHeight",
		getResolutionGuiHeight(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"viewWidth",
		getResolutionViewWidth(resolution));	
	appendFieldToJsonObject(
		jsonObject,
		"viewHeight",
		getResolutionViewHeight(resolution));	

	var resolutionJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return resolutionJsonString;
	
}
