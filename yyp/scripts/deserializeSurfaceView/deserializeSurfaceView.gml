///@function deserializeSurfaceView(jsonString)
///@description Deserialize SurfaceView from JSON String to SurfaceView entity.
///@param {String} jsonString
///@return {SurfaceView} surfaceView 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function deserializeSurfaceView(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var width = assertNoOptional(getJsonObjectFieldValue(jsonObject, "width"));
	var height = assertNoOptional(getJsonObjectFieldValue(jsonObject, "height"));
	var disableDepth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "disableDepth"));
	var viewElements = getJsonObjectFieldValue(jsonObject, "viewElements", Array, "ViewElement");

	destroyJsonObject(jsonObject);
	
	return createSurfaceView(width, height, disableDepth, viewElements);
	
}
