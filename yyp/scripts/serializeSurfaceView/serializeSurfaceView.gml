///@function serializeSurfaceView(surfaceView)
///@description Serialize SurfaceView to JSON string.
///@param {SurfaceView} surfaceView
///@return {String} surfaceViewJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function serializeSurfaceView(surfaceView) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"width",
		getSurfaceViewWidth(surfaceView));	
	appendFieldToJsonObject(
		jsonObject,
		"height",
		getSurfaceViewHeight(surfaceView));	
	appendFieldToJsonObject(
		jsonObject,
		"disableDepth",
		getSurfaceViewDisableDepth(surfaceView));	
	if (isOptionalPresent(getSurfaceViewViewElements(surfaceView))) {
		appendEntityToJsonObject(
			jsonObject,
			"viewElements",
			getSurfaceViewViewElements(surfaceView),
			"ViewElement",
			Array);
	}
	

	var surfaceViewJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return surfaceViewJsonString;
	
}
