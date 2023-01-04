///@description SurfaceView entity

///@function createSurfaceView(width, height, disableDepth, viewElements)
///@description Constructor for SurfaceView entity.
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} disableDepth
///@param {Optional<ViewElement[]>} viewElements
///@return {SurfaceView} surfaceView 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.480Z}

function createSurfaceView(width, height, disableDepth, viewElements) {

	var surfaceView = createEntity(SurfaceView);

	setSurfaceViewWidth(surfaceView, assertNoOptional(width));
	setSurfaceViewHeight(surfaceView, assertNoOptional(height));
	setSurfaceViewDisableDepth(surfaceView, assertNoOptional(disableDepth));
	setSurfaceViewViewElements(surfaceView, viewElements);

	return surfaceView;
	
}
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
///@function destroySurfaceView(surfaceView)
///@description Destroy SurfaceView entity.
///@param {SurfaceView} surfaceView
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function destroySurfaceView(surfaceView) {


	
	var width = getSurfaceViewWidth(surfaceView);
	var height = getSurfaceViewHeight(surfaceView);
	var disableDepth = getSurfaceViewDisableDepth(surfaceView);
	var viewElements = getSurfaceViewViewElements(surfaceView);
	
	if (isOptionalPresent(viewElements)) {
		for (var index = 0; index < getArrayLength(viewElements); index++) {
			var entity = viewElements[@ index];
			destroyViewElement(entity);
		}
	}
	setSurfaceViewViewElements(surfaceView, null);
	

	
}
///@function getSurfaceViewDisableDepth(surfaceView)
///@description Getter.
///@param {SurfaceView} surfaceView
///@return {Boolean} disableDepth 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function getSurfaceViewDisableDepth(surfaceView) {

	return surfaceView[@ 2];
	
}
///@function getSurfaceViewHeight(surfaceView)
///@description Getter.
///@param {SurfaceView} surfaceView
///@return {Integer} height 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function getSurfaceViewHeight(surfaceView) {

	return surfaceView[@ 1];
	
}
///@function getSurfaceViewViewElements(surfaceView)
///@description Getter.
///@param {SurfaceView} surfaceView
///@return {Optional<ViewElement[]>} viewElements 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function getSurfaceViewViewElements(surfaceView) {

	return surfaceView[@ 3];
	
}
///@function getSurfaceViewWidth(surfaceView)
///@description Getter.
///@param {SurfaceView} surfaceView
///@return {Integer} width 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function getSurfaceViewWidth(surfaceView) {

	return surfaceView[@ 0];
	
}
///@function setSurfaceViewDisableDepth(surfaceView, disableDepth)
///@description Setter.
///@param {SurfaceView} surfaceView
///@param {Boolean} disableDepth
///@throws {Exception}
///@generated {2021-05-01T23:49:41.481Z}

function setSurfaceViewDisableDepth(surfaceView, disableDepth) {

	surfaceView[@ 2] = disableDepth;
	
}
///@function setSurfaceViewHeight(surfaceView, height)
///@description Setter.
///@param {SurfaceView} surfaceView
///@param {Integer} height
///@throws {Exception}
///@generated {2021-05-01T23:49:41.481Z}

function setSurfaceViewHeight(surfaceView, height) {

	surfaceView[@ 1] = height;
	
}
///@function setSurfaceViewViewElements(surfaceView, viewElements)
///@description Setter.
///@param {SurfaceView} surfaceView
///@param {Optional<ViewElement[]>} viewElements
///@throws {Exception}
///@generated {2021-05-01T23:49:41.481Z}

function setSurfaceViewViewElements(surfaceView, viewElements) {

	surfaceView[@ 3] = viewElements;
	
}
///@function setSurfaceViewWidth(surfaceView, width)
///@description Setter.
///@param {SurfaceView} surfaceView
///@param {Integer} width
///@throws {Exception}
///@generated {2021-05-01T23:49:41.481Z}

function setSurfaceViewWidth(surfaceView, width) {

	surfaceView[@ 0] = width;
	
}
