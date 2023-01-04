///@description Resolution entity

///@function createResolution(name, realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight)
///@description Constructor for Resolution entity.
///@param {String} name
///@param {Integer} realWidth
///@param {Integer} realHeight
///@param {Integer} guiWidth
///@param {Integer} guiHeight
///@param {Integer} viewWidth
///@param {Integer} viewHeight
///@return {Resolution} resolution 
///@throws {Exception}
///@generated {2021-05-01T23:49:38.162Z}

function createResolution(name, realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight) {

	var resolution = createEntity(Resolution);

	setResolutionName(resolution, assertNoOptional(name));
	setResolutionRealWidth(resolution, assertNoOptional(realWidth));
	setResolutionRealHeight(resolution, assertNoOptional(realHeight));
	setResolutionGuiWidth(resolution, assertNoOptional(guiWidth));
	setResolutionGuiHeight(resolution, assertNoOptional(guiHeight));
	setResolutionViewWidth(resolution, assertNoOptional(viewWidth));
	setResolutionViewHeight(resolution, assertNoOptional(viewHeight));

	return resolution;
	
}
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
///@function destroyResolution(resolution)
///@description Destroy Resolution entity.
///@param {Resolution} resolution
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function destroyResolution(resolution) {


	
	var name = getResolutionName(resolution);
	var realWidth = getResolutionRealWidth(resolution);
	var realHeight = getResolutionRealHeight(resolution);
	var guiWidth = getResolutionGuiWidth(resolution);
	var guiHeight = getResolutionGuiHeight(resolution);
	var viewWidth = getResolutionViewWidth(resolution);
	var viewHeight = getResolutionViewHeight(resolution);
	

	
}
///@function getResolutionGuiHeight(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} guiHeight 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionGuiHeight(resolution) {

	return resolution[@ 4];
	
}
///@function getResolutionGuiWidth(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} guiWidth 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionGuiWidth(resolution) {

	return resolution[@ 3];
	
}
///@function getResolutionName(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {String} name 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionName(resolution) {

	return resolution[@ 0];
	
}
///@function getResolutionRealHeight(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} realHeight 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionRealHeight(resolution) {

	return resolution[@ 2];
	
}
///@function getResolutionRealWidth(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} realWidth 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionRealWidth(resolution) {

	return resolution[@ 1];
	
}

///@function getResolutionViewHeight(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} viewHeight 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionViewHeight(resolution) {

	return resolution[@ 6];
	
}
///@function getResolutionViewWidth(resolution)
///@description Getter.
///@param {Resolution} resolution
///@return {Integer} viewWidth 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.716Z}

function getResolutionViewWidth(resolution) {

	return resolution[@ 5];
	
}
///@function setResolutionGuiHeight(resolution, guiHeight)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} guiHeight
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionGuiHeight(resolution, guiHeight) {

	resolution[@ 4] = guiHeight;
	
}
///@function setResolutionGuiWidth(resolution, guiWidth)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} guiWidth
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionGuiWidth(resolution, guiWidth) {

	resolution[@ 3] = guiWidth;
	
}
///@function setResolutionName(resolution, name)
///@description Setter.
///@param {Resolution} resolution
///@param {String} name
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionName(resolution, name) {

	resolution[@ 0] = name;
	
}
///@function setResolutionRealHeight(resolution, realHeight)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} realHeight
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionRealHeight(resolution, realHeight) {

	resolution[@ 2] = realHeight;
	
}
///@function setResolutionRealWidth(resolution, realWidth)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} realWidth
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionRealWidth(resolution, realWidth) {

	resolution[@ 1] = realWidth;
	
}

///@function setResolutionViewHeight(resolution, viewHeight)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} viewHeight
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionViewHeight(resolution, viewHeight) {

	resolution[@ 6] = viewHeight;
	
}
///@function setResolutionViewWidth(resolution, viewWidth)
///@description Setter.
///@param {Resolution} resolution
///@param {Integer} viewWidth
///@throws {Exception}
///@generated {2021-05-01T23:49:38.164Z}

function setResolutionViewWidth(resolution, viewWidth) {

	resolution[@ 5] = viewWidth;
	
}
