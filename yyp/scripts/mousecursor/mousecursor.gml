///@description MouseCursor entity

///@function createMouseCursor(viewPosition, guiPosition, texture, type, data)
///@description Constructor for MouseCursor entity.
///@param {Position} viewPosition
///@param {Position} guiPosition
///@param {Optional<AssetTexture>} texture
///@param {Optional<CursorType>} type
///@param {Optional<MouseCursorData>} data
///@return {MouseCursor} mouseCursor 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.517Z}

function createMouseCursor(viewPosition, guiPosition, texture, type, data) {

	var mouseCursor = createEntity(MouseCursor);

	setMouseCursorViewPosition(mouseCursor, assertNoOptional(viewPosition));
	setMouseCursorGuiPosition(mouseCursor, assertNoOptional(guiPosition));
	setMouseCursorTexture(mouseCursor, texture);
	setMouseCursorType(mouseCursor, type);
	setMouseCursorData(mouseCursor, data);

	return mouseCursor;
	
}
///@function serializeMouseCursor(mouseCursor)
///@description Serialize MouseCursor to JSON string.
///@param {MouseCursor} mouseCursor
///@return {String} mouseCursorJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function serializeMouseCursor(mouseCursor) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"viewPosition",
		getMouseCursorViewPosition(mouseCursor),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"guiPosition",
		getMouseCursorGuiPosition(mouseCursor),
		"Position");
	
	if (isOptionalPresent(getMouseCursorTexture(mouseCursor))) {
		appendFieldToJsonObject(
			jsonObject,
			"texture",
			getMouseCursorTexture(mouseCursor));
	}
	
	if (isOptionalPresent(getMouseCursorType(mouseCursor))) {
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getMouseCursorType(mouseCursor));
	}
	
	if (isOptionalPresent(getMouseCursorData(mouseCursor))) {
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getMouseCursorData(mouseCursor),
			"MouseCursorData");
	}
	

	var mouseCursorJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseCursorJsonString;
	
}
///@function deserializeMouseCursor(jsonString)
///@description Deserialize MouseCursor from JSON String to MouseCursor entity.
///@param {String} jsonString
///@return {MouseCursor} mouseCursor 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function deserializeMouseCursor(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var viewPosition = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewPosition", Entity, "Position"));
	var guiPosition = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiPosition", Entity, "Position"));
	var texture = getJsonObjectFieldValue(jsonObject, "texture");
	var type = getJsonObjectFieldValue(jsonObject, "type");
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "MouseCursorData");

	destroyJsonObject(jsonObject);
	
	return createMouseCursor(viewPosition, guiPosition, texture, type, data);
	
}
///@function destroyMouseCursor(mouseCursor)
///@description Destroy MouseCursor entity.
///@param {MouseCursor} mouseCursor
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function destroyMouseCursor(mouseCursor) {


	
	var viewPosition = getMouseCursorViewPosition(mouseCursor);
	var guiPosition = getMouseCursorGuiPosition(mouseCursor);
	var texture = getMouseCursorTexture(mouseCursor);
	var type = getMouseCursorType(mouseCursor);
	var data = getMouseCursorData(mouseCursor);
	
	destroyPosition(viewPosition);
	setMouseCursorViewPosition(mouseCursor, null);
	
	destroyPosition(guiPosition);
	setMouseCursorGuiPosition(mouseCursor, null);
	
	if (isOptionalPresent(data)) {
		destroyMouseCursorData(data);
	}
	setMouseCursorData(mouseCursor, null);
	

	
}
///@function getMouseCursorData(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
///@return {Optional<MouseCursorData>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function getMouseCursorData(mouseCursor) {

	return mouseCursor[@ 4];
	
}

///@function getMouseCursorGuiPosition(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
///@return {Position} guiPosition 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function getMouseCursorGuiPosition(mouseCursor) {

	return mouseCursor[@ 1];
	
}
///@function getMouseCursorTexture(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
///@return {Optional<AssetTexture>} texture 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function getMouseCursorTexture(mouseCursor) {

	return mouseCursor[@ 2];
	
}
///@function getMouseCursorType(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
///@return {Optional<CursorType>} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function getMouseCursorType(mouseCursor) {

	return mouseCursor[@ 3];
	
}
///@function getMouseCursorViewPosition(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
///@return {Position} viewPosition 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function getMouseCursorViewPosition(mouseCursor) {

	return mouseCursor[@ 0];
	
}
///@function setMouseCursorData(mouseCursor, data)
///@description Setter.
///@param {MouseCursor} mouseCursor
///@param {Optional<MouseCursorData>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:41.518Z}

function setMouseCursorData(mouseCursor, data) {

	mouseCursor[@ 4] = data;
	
}

///@function setMouseCursorGuiPosition(mouseCursor, guiPosition)
///@description Setter.
///@param {MouseCursor} mouseCursor
///@param {Position} guiPosition
///@throws {Exception}
///@generated {2021-05-01T23:49:41.518Z}

function setMouseCursorGuiPosition(mouseCursor, guiPosition) {

	mouseCursor[@ 1] = guiPosition;
	
}
///@function setMouseCursorTexture(mouseCursor, texture)
///@description Setter.
///@param {MouseCursor} mouseCursor
///@param {Optional<AssetTexture>} texture
///@throws {Exception}
///@generated {2021-05-01T23:49:41.518Z}

function setMouseCursorTexture(mouseCursor, texture) {

	mouseCursor[@ 2] = texture;
	
}
///@function setMouseCursorType(mouseCursor, type)
///@description Setter.
///@param {MouseCursor} mouseCursor
///@param {Optional<CursorType>} type
///@throws {Exception}
///@generated {2021-05-01T23:49:41.518Z}

function setMouseCursorType(mouseCursor, type) {

	mouseCursor[@ 3] = type;
	
}
///@function setMouseCursorViewPosition(mouseCursor, viewPosition)
///@description Setter.
///@param {MouseCursor} mouseCursor
///@param {Position} viewPosition
///@throws {Exception}
///@generated {2021-05-01T23:49:41.518Z}

function setMouseCursorViewPosition(mouseCursor, viewPosition) {

	mouseCursor[@ 0] = viewPosition;
	
}
