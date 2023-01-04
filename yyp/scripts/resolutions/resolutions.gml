///@description Resolutions entity

///@function createResolutions(data)
///@description Constructor for Resolutions entity.
///@param {Resolution[]} data
///@return {Resolutions} resolutions 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.810Z}

function createResolutions(data) {

	var resolutions = createEntity(Resolutions);

	setResolutionsData(resolutions, assertNoOptional(data));

	return resolutions;
	
}
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
///@function destroyResolutions(resolutions)
///@description Destroy Resolutions entity.
///@param {Resolutions} resolutions
///@throws {Exception}
///@generated {2021-05-01T23:43:34.811Z}

function destroyResolutions(resolutions) {


	
	var data = getResolutionsData(resolutions);
	
	for (var index = 0; index < getArrayLength(data); index++) {
		var entity = data[@ index];
		destroyResolution(entity);
	}
	setResolutionsData(resolutions, null);
	

	
}
///@function getResolutionsData(resolutions)
///@description Getter.
///@param {Resolutions} resolutions
///@return {Resolution[]} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.811Z}

function getResolutionsData(resolutions) {

	return resolutions[@ 0];
	
}
///@function setResolutionsData(resolutions, data)
///@description Setter.
///@param {Resolutions} resolutions
///@param {Resolution[]} data
///@throws {Exception}
///@generated {2021-05-01T23:49:38.215Z}

function setResolutionsData(resolutions, data) {

	resolutions[@ 0] = data;
	
}
