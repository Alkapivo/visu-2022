///@function deserializeResolution(jsonString)
///@description Deserialize Resolution from JSON String to Resolution entity.
///@param {String} jsonString
///@return {Resolution} resolution 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.715Z}

function deserializeResolution(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var realWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realWidth"));
	var realHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realHeight"));
	var guiWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiWidth"));
	var guiHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiHeight"));
	var viewWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewWidth"));
	var viewHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewHeight"));

	destroyJsonObject(jsonObject);
	
	return createResolution(name, realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight);
	
}
