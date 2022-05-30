///@function deserializeResolutions(jsonString)
///@description Deserialize Resolutions from JSON String to Resolutions entity.
///@param {String} jsonString
///@return {Resolutions} resolutions 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.810Z}

function deserializeResolutions(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Array, "Resolution"));

	destroyJsonObject(jsonObject);
	
	return createResolutions(data);
	
}
