///@description MouseEvent entity

///@function createMouseEvent(type, xMouse, yMouse)
///@description Constructor for MouseEvent entity.
///@param {MouseEventType} type
///@param {Integer} xMouse
///@param {Integer} yMouse
///@return {MouseEvent} mouseEvent 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function createMouseEvent(argument0, argument1, argument2) {

		var type = argument0;
		var xMouse = argument1;
		var yMouse = argument2;
	
		var mouseEvent = createEntity(MouseEvent);

		setMouseEventType(mouseEvent, assertNoOptional(type));
		setMouseEventXMouse(mouseEvent, assertNoOptional(xMouse));
		setMouseEventYMouse(mouseEvent, assertNoOptional(yMouse));

		return mouseEvent;
	



}
///@function serializeMouseEvent(mouseEvent)
///@description Serialize MouseEvent to JSON string.
///@param {MouseEvent} mouseEvent
///@return {String} mouseEventJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.539Z}
function serializeMouseEvent(argument0) {

		var mouseEvent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getMouseEventType(mouseEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"xMouse",
			getMouseEventXMouse(mouseEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"yMouse",
			getMouseEventYMouse(mouseEvent));	

		var mouseEventJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return mouseEventJsonString;
	



}
///@function deserializeMouseEvent(jsonString)
///@description Deserialize MouseEvent from JSON String to MouseEvent entity.
///@param {String} jsonString
///@return {MouseEvent} mouseEvent 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function deserializeMouseEvent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var xMouse = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xMouse"));
		var yMouse = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yMouse"));

		destroyJsonObject(jsonObject);
	
		return createMouseEvent(type, xMouse, yMouse);
	



}
///@function destroyMouseEvent(mouseEvent)
///@description Destroy MouseEvent entity.
///@param {MouseEvent} mouseEvent
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function destroyMouseEvent(argument0) {

		var mouseEvent = argument0;
	
		var type = getMouseEventType(mouseEvent);
		var xMouse = getMouseEventXMouse(mouseEvent);
		var yMouse = getMouseEventYMouse(mouseEvent);
	

	



}
///@function getMouseEventType(mouseEvent)
///@description Getter.
///@param {MouseEvent} mouseEvent
///@return {MouseEventType} type 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function getMouseEventType(argument0) {

		return argument0[@ 0];
	



}
///@function getMouseEventXMouse(mouseEvent)
///@description Getter.
///@param {MouseEvent} mouseEvent
///@return {Integer} xMouse 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function getMouseEventXMouse(argument0) {

		return argument0[@ 1];
	



}
///@function getMouseEventYMouse(mouseEvent)
///@description Getter.
///@param {MouseEvent} mouseEvent
///@return {Integer} yMouse 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function getMouseEventYMouse(argument0) {

		return argument0[@ 2];
	



}
///@function setMouseEventType(mouseEvent, type)
///@description Setter.
///@param {MouseEvent} mouseEvent
///@param {MouseEventType} type
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function setMouseEventType(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setMouseEventXMouse(mouseEvent, xMouse)
///@description Setter.
///@param {MouseEvent} mouseEvent
///@param {Integer} xMouse
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function setMouseEventXMouse(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setMouseEventYMouse(mouseEvent, yMouse)
///@description Setter.
///@param {MouseEvent} mouseEvent
///@param {Integer} yMouse
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function setMouseEventYMouse(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
