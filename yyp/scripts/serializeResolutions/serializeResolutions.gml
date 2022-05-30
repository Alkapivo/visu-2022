///@function serializeResolutions(resolutions)
///@description Serialize Resolutions to JSON string.
///@param {Resolutions} resolutions
///@return {String} resolutionsJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.810Z}

function serializeResolutions(resolutions) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"data",
		getResolutionsData(resolutions),
		"Resolution",
		Array);
	

	var resolutionsJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return resolutionsJsonString;
	
}
