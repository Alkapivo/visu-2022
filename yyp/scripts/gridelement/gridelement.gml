///@description GridElement entity

///@function createGridElement(position, sprite, info)
///@description Constructor for GridElement entity.
///@param {Position} position
///@param {Sprite} sprite
///@param {GridElementInfo} info
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function createGridElement(position, sprite, info) {

	var gridElement = createEntity(GridElement);

	setGridElementPosition(gridElement, assertNoOptional(position));
	setGridElementSprite(gridElement, assertNoOptional(sprite));
	setGridElementInfo(gridElement, assertNoOptional(info));

	return gridElement;
	
}
///@function serializeGridElement(gridElement)
///@description Serialize GridElement to JSON string.
///@param {GridElement} gridElement
///@return {String} gridElementJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function serializeGridElement(gridElement) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"position",
		getGridElementPosition(gridElement),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"sprite",
		getGridElementSprite(gridElement),
		"Sprite");
	
	appendEntityToJsonObject(
		jsonObject,
		"info",
		getGridElementInfo(gridElement),
		"GridElementInfo");
	

	var gridElementJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gridElementJsonString;
	
}
///@function deserializeGridElement(jsonString)
///@description Deserialize GridElement from JSON String to GridElement entity.
///@param {String} jsonString
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function deserializeGridElement(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var position = assertNoOptional(getJsonObjectFieldValue(jsonObject, "position", Entity, "Position"));
	var sprite = assertNoOptional(getJsonObjectFieldValue(jsonObject, "sprite", Entity, "Sprite"));
	var info = assertNoOptional(getJsonObjectFieldValue(jsonObject, "info", Entity, "GridElementInfo"));

	destroyJsonObject(jsonObject);
	
	return createGridElement(position, sprite, info);
	
}
///@function destroyGridElement(gridElement)
///@description Destroy GridElement entity.
///@param {GridElement} gridElement
///@throws {Exception}
///@generated {2021-01-17T08:31:53.883Z}
///@override
function destroyGridElement(argument0) {

		var gridElement = argument0;
	



}

///@function getGridElementPosition(gridElement)
///@description Getter.
///@param {GridElement} gridElement
///@return {Position} position 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function getGridElementPosition(gridElement) {

	return gridElement[@ 0];
	
}
///@function getGridElementSprite(gridElement)
///@description Getter.
///@param {GridElement} gridElement
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function getGridElementSprite(gridElement) {

	return gridElement[@ 1];
	
}
///@function getGridElementInfo(gridElement)
///@description Getter.
///@param {GridElement} gridElement
///@return {GridElementInfo} gridElementInfo
///@throws {Exception}
///@penerated {2022-08-18T22:24:59.593Z}

function getGridElementInfo(gridElement) {

	return gridElement[@ 2];
	
}

///@function setGridElementPosition(gridElement, position)
///@description Setter.
///@param {GridElement} gridElement
///@param {Position} position
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function setGridElementPosition(gridElement, position) {

	gridElement[@ 0] = position;
	
}
///@function setGridElementSprite(gridElement, sprite)
///@description Setter.
///@param {GridElement} gridElement
///@param {Sprite} sprite
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function setGridElementSprite(gridElement, sprite) {

	gridElement[@ 1] = sprite;
	
}

///@function setGridElementInfo(gridElement, info)
///@description Setter.
///@param {GridElement} gridElement
///@param {GridElementInfo} gridElementInfo
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function setGridElementInfo(gridElement,  gridElementInfo) {

	gridElement[@ 2]=  gridElementInfo;
	
}
